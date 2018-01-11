package com.tp.utils;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;

public class ExcelUtils2 {
	
	public static void exportExcel(OutputStream out, List<String> fieldNames, Map<Serializable, List<List<Object>>> fieldDataMap)
			throws IOException {
		HSSFWorkbook workBook = createWorkbook(fieldNames, fieldDataMap);
		workBook.write(out);
		out.close();
	}


	private static void createSingleSheet(HSSFWorkbook workBook, List<String> fieldName, List<List<Object>> fieldData, String sheetName) {
		int rows = fieldData.size();
		int sheetNum = generateSheetNum(rows);
		

		for (int i = 1; i <= sheetNum; i++) {
			HSSFSheet sheet = generateSheet(workBook, sheetName + (i == 1 ? "" : i), fieldName.size());
			if(sheet == null){
				continue;
			}
			generateHeader(sheet, fieldName, createHeaderCellStyle(workBook));
			generateContent(sheet, fieldData, i);
			generateFooter(sheet, fieldName.size());
		}
	}

	private static void generateFooter(HSSFSheet sheet, int size) {
		for (int j = 0; j < size; j++) {
			sheet.autoSizeColumn(j);
		}
	}


	private static int generateSheetNum(int rows) {
		int sheetNum = 0;
		if (rows % Constants.ROWS_PER_SHEET == 0) {
			sheetNum = rows / Constants.ROWS_PER_SHEET;
		} else {
			sheetNum = rows / Constants.ROWS_PER_SHEET + 1;
		}
		return sheetNum;
	}

	private static void generateContent(HSSFSheet sheet, List<List<Object>> fieldData, int index) {
		int rows = fieldData.size();
		HSSFWorkbook wb = sheet.getWorkbook();
		for (int k = 0; k < (rows < Constants.ROWS_PER_SHEET ? rows : Constants.ROWS_PER_SHEET); k++) {
			HSSFRow row = sheet.createRow((short) (k + 1));
			// 将数据内容放入excel单元格
			List<Object> rowList = fieldData.get((index - 1) * Constants.ROWS_PER_SHEET + k);
			boolean isRed = false;
			if(rowList != null && rowList.size() > 0){
				if(rowList.get(0).equals("总计")) {
					isRed = true;
				}
			}
			for (int n = 0; n < rowList.size(); n++) {
				HSSFCell cell = row.createCell(n);
				if(isRed) {
					// 将样式添加在单元格上.
					cell.setCellStyle(createTotalCellStyle(wb));
				}
				Object target = rowList.get(n);
				if (target != null) {
					if (target instanceof Number) {
						if(target instanceof Integer || target instanceof Long || target instanceof BigInteger ){
							cell.setCellStyle(createNumberCellStyle(wb, "#,##0"));
							cell.setCellValue(Double.parseDouble(target.toString()));
						}else {
							cell.setCellStyle(createNumberCellStyle(wb, "#,##0.00"));
							cell.setCellValue(Double.parseDouble(target.toString()));
						}
					} else {
						cell.setCellStyle(createNormalCellStyle(wb));
						cell.setCellValue((String) rowList.get(n).toString());
					}
				} else {
					cell.setCellStyle(createNormalCellStyle(wb));
					cell.setCellValue("");
				}
			}
		}
	}

	private static HSSFRow generateHeader(HSSFSheet sheet, List<String> fieldName,
			CellStyle cellStyle) {
		// 创建第一行
			HSSFRow headRow = sheet.createRow(0);
			// 设置第一行标题.
			for (int j = 0; j < fieldName.size(); j++) {
				// 将每列宽度设置为6000
				sheet.setColumnWidth(j, 6000);

				HSSFCell cell = headRow.createCell(j);
				// 添加样式
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);

				// 将样式添加在单元格上.
				cell.setCellStyle(cellStyle);

				if (fieldName.get(j) != null) {
					cell.setCellValue((String) fieldName.get(j));
				} else {
					cell.setCellValue("-");
				}
			}
			return headRow;
	}

	private static HSSFSheet generateSheet(HSSFWorkbook workBook, String sheetName, int size) {
		HSSFSheet sheet = null;
		try {
			sheet = workBook.createSheet(sheetName);
			sheet.createFreezePane(1, 1, 1, 1);
		} catch (Exception e) {
			sheet = null;
		}
		return sheet;
	}

	public static HSSFWorkbook createWorkbook(List<String> fieldNames, Map<Serializable, List<List<Object>>> fieldDataMap) {
		
		HSSFWorkbook workBook = null;
		workBook = new HSSFWorkbook();
		if(fieldDataMap != null && fieldDataMap.size() > 0){
			for (Serializable key : fieldDataMap.keySet()) {
				createSingleSheet(workBook, fieldNames, fieldDataMap.get(key), key.toString());
			}
		}
		return workBook;
	}
	
	public static void setBorder(CellStyle style) {
		//设置边框
		style.setBorderRight(CellStyle.BORDER_THIN);
		style.setRightBorderColor(IndexedColors.BLACK.getIndex());

		style.setBorderLeft(CellStyle.BORDER_THIN);
		style.setLeftBorderColor(IndexedColors.BLACK.getIndex());

		style.setBorderTop(CellStyle.BORDER_THIN);
		style.setTopBorderColor(IndexedColors.BLACK.getIndex());

		style.setBorderBottom(CellStyle.BORDER_THIN);
		style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
	}
	
	
	//标题格式
	public static CellStyle createHeaderCellStyle(HSSFWorkbook wb){
		CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFont(createBoldFont(wb));
		return headerStyle;
	}
	
	//日期格式
	public static CellStyle createDateCellStyle(HSSFWorkbook wb, String format){
		DataFormat df = wb.createDataFormat();
		CellStyle dateCellStyle = wb.createCellStyle();
		dateCellStyle.setFont(createNormalFont(wb));
		dateCellStyle.setDataFormat(df.getFormat(format));
		setBorder(dateCellStyle);
		return dateCellStyle;
	}
	
	//数字格式
	//format = "#,##0.00"
	public static CellStyle createNumberCellStyle(HSSFWorkbook wb, String format){
		DataFormat df = wb.createDataFormat();
		CellStyle numberCellStyle = wb.createCellStyle();
		numberCellStyle.setFont(createNormalFont(wb));
		numberCellStyle.setDataFormat(df.getFormat(format));
		setBorder(numberCellStyle);
		return numberCellStyle;
	}
	
	//合计列格式
	public static CellStyle createTotalCellStyle(HSSFWorkbook wb){
		CellStyle totalStyle = wb.createCellStyle();
		totalStyle.setFont(createBlueBoldFont(wb));
		totalStyle.setWrapText(true);
		totalStyle.setAlignment(CellStyle.ALIGN_RIGHT);
		setBorder(totalStyle);
		return totalStyle;
	}
	
	//普通列格式
	public static CellStyle createNormalCellStyle(HSSFWorkbook wb){
		CellStyle normalStyle = wb.createCellStyle();
		normalStyle.setFont(createNormalFont(wb));
		normalStyle.setWrapText(true);
		setBorder(normalStyle);
		return normalStyle;
	}
	
	public static Font createNormalFont(HSSFWorkbook wb){
		//普通字体
		Font normalFont = wb.createFont();
		normalFont.setFontHeightInPoints((short) 10);
		return normalFont;
	}
	
	public static Font createBoldFont(HSSFWorkbook wb){
		//加粗字体
		Font boldFont = wb.createFont();
		boldFont.setFontHeightInPoints((short) 10);
		boldFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
		return boldFont;
	}
	
	public static Font createBlueBoldFont(HSSFWorkbook wb){
		//蓝色加粗字体
		Font blueBoldFont = wb.createFont();
		blueBoldFont.setFontHeightInPoints((short) 10);
		blueBoldFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
		blueBoldFont.setColor(IndexedColors.BLUE.getIndex());
		return blueBoldFont;
	}
}
