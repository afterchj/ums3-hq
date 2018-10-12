<%@page import="com.tp.utils.Constants" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="<%=Constants.STATIC_SHOW%>"/>


<div id="leftbar" class="well span3" style="padding: 8px 0; margin-top: 15px;">

    <style type="text/css">
        .test ul {
            list-style-type: none;
        }

        .myTp {
            display: none;
        }

        .acTp {
            display: block;
        }
    </style>

    <script type="text/javascript">
        function show(menuId) {
//            $(".myTp").style()
            var menu = document.getElementById(menuId);
            var status = menu.style.display;
            if (status == 'block') {
                menu.style.display = 'none';
            } else {
                menu.style.display = 'block';
            }
        }
    </script>
    <%--<ul class="nav nav-list">--%>

    <div class="test">
        <ul class="nav nav-list">
            <li id="home-tab"><a href="/ums3-hq"><i class="icon-home"></i>首页</a></li>
            <li id="home-test"><a href="test/test.action"><i class="icon-edit"></i>测试</a></li>
            <ul class="nav nav-list">
                <shiro:hasPermission name="user:view">
                    <li class="nav-header" onclick="show('test')"><i class="icon-cog"></i>系统管理</li>
                    <ul class="myTp" id="test">
                        <li id="account-tab"><a href="account/user.action">帐号管理</a></li>
                        <shiro:hasPermission name="group:view">
                            <li id="group-tab"><a href="account/group.action">角色管理</a></li>
                        </shiro:hasPermission>
                        <li id="viewsource-tab"><a href="report/view-source.action">系统工具</a></li>
                    </ul>
                </shiro:hasPermission>
            </ul>
            <ul class="nav nav-list">
                <shiro:hasPermission name="member:view">
                    <li class="nav-header" onclick="show('test0')"><i class="icon-briefcase"></i>会员管理</li>
                    <ul class="myTp" id="test0">
                        <li id="member-tab"><a href="mem/member!list.action">会员列表</a></li>
                        <shiro:hasPermission name="work:view">
                            <li id="work-tab"><a href="mem/work!list.action">作品列表</a></li>
                        </shiro:hasPermission>
                    </ul>
                </shiro:hasPermission>
            </ul>

            <ul class="nav nav-list">
                <li class="nav-header" onclick="show('file')"><i class="icon-book"></i>文件管理</li>
                <ul class="myTp" id="file">
                    <shiro:hasPermission name="file:view">
                        <li id="lock-tab"><a href="file/file.action?filter_EQS_dtype=0">文件列表</a></li>
                        <li id="client-tab"><a href="file/funlocker-client.action">客户端文件</a></li>
                    </shiro:hasPermission>
                </ul>
            </ul>

            <ul class="nav nav-list">
                <shiro:hasPermission name="store:view">
                    <li class="nav-header" onclick="show('test01')"><i class="icon-leaf"></i>货架管理</li>
                    <ul class="myTp" id="test01">
                        <li id="topic-tab"><a href="category/topic.action">专题管理</a></li>
                        <li id="template-tab"><a href="category/template.action">模板管理</a></li>
                    </ul>
                </shiro:hasPermission>
            </ul>

            <ul class="nav nav-list">
                <shiro:hasPermission name="store:view">
                    <li class="nav-header" onclick="show('test02')"><i class="icon-leaf"></i>商店市场管理</li>
                    <ul class="myTp" id="test02">
                        <li id="store-tab"><a href="category/store.action">商店列表</a></li>
                        <li id="market-tab"><a href="category/market.action">市场列表</a></li>
                            <%--<li id="poll-tab"><a href="poll/polling.action">广播列表</a></li>--%>
                        <li id="poll2-tab"><a href="poll/poll2.action?filter_EQS_dtype=0">广播列表</a></li>
                        <li id="advertisement-tab"><a
                                href="poll/advertisement.action?filter_EQS_store=lock&filter_EQS_dtype=store">广告条管理</a>
                        </li>
                        <li id="appAd-tab"><a href="poll/app-ad!list.action?filter_EQS_dtype=hottest">填充广告</a></li>
                    </ul>
                </shiro:hasPermission>
            </ul>
            <ul class="nav nav-list">
                <shiro:hasPermission name="trade:view">
                    <li class="nav-header" onclick="show('test03')"><i class="icon-leaf"></i>交易管理</li>
                    <ul class="myTp" id="test03">
                        <li id="goods-tab"><a href="trade/goods!list.action">商品列表</a></li>
                        <li id="order-tab"><a href="trade/order!list.action">订单列表</a></li>
                        <li id="orderConfig-tab"><a href="trade/order-config!list.action">订单处理配置</a></li>
                    </ul>
                </shiro:hasPermission>
            </ul>
            <ul class="nav nav-list">
                <li class="nav-header" onclick="show('test1')"><i class="icon-tags"></i>文件分类管理</li>
                <ul class="myTp" id="test1">
                    <li id="category-tab"><a href="category/category.action">文件分类</a></li>
                    <li id="ccategory-tab"><a href="category/client-type.action">客户端分类</a></li>
                    <li id="shelf-tab"><a href="category/shelf.action">标签分类</a></li>
                </ul>
            </ul>

            <ul class="nav nav-list">
                <li class="nav-header" onclick="show('test2')"><i class="icon-book"></i>视频管理</li>
                <ul class="myTp" id="test2">
                    <li id="splock-tab"><a href="video/video-file.action">视频列表</a></li>
                    <li id="category-sp"><a href="video/video-type.action">视频分类</a></li>
                    <li id="sptopic-tab"><a href="category/sptopic.action">视频专题</a></li>
                    <li id="spadvertisement-tab"><a
                            href="poll/spadvertisement.action?filter_EQS_store=video&filter_EQS_dtype=top">广告位列表</a>
                    </li>
                </ul>
            </ul>

            <ul class="nav nav-list">
                <shiro:hasPermission name="file:view">
                    <li class="nav-header" onclick="show('test3')"><i class="icon-book"></i>投稿文件管理</li>
                    <ul class="myTp" id="test3">
                        <li id="check-tab"><a href="file/spfile-check-pending.action">待审核列表</a></li>
                        <li id="check-sp"><a href="file/spfile-passed.action">已通过列表</a></li>
                    </ul>
                </shiro:hasPermission>
            </ul>

            <ul class="nav nav-list">
                <li class="nav-header" onclick="show('test4')"><i class="icon-eye-open"></i>基本日报</li>
                <ul class="myTp" id="test4">
                    <shiro:hasPermission name="report:view">
                        <li id="reportc-tab"><a href="report/report-client!list.action">客户端日报</a></li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="report_store:view">
                        <li id="reportcn-tab"><a href="report/report-store!list.action">商店日报</a></li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="report_unzip:view">
                        <li id="report-contentUnzip-tab"><a href="report/report-unzip!list.action">内容安装日报</a></li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="report_install:view">
                        <li id="report-client-install-tab"><a
                                href="report/report-client-install!list.action">客户端安装日报</a></li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="report_install_by_content:view">
                        <li id="report-client-install-wc-tab"><a
                                href="report/report-client-install-from-content!list.action">客户端通过内容安装日报</a></li>
                    </shiro:hasPermission>
                </ul>
            </ul>

            <ul class="nav nav-list">
                <li class="nav-header" onclick="show('dayRp')"><i class="icon-eye-open"></i>3.5日报</li>
                <ul id="dayRp" class="myTp">
                    <li id="report-base-coins-tab"><a href="report/report-base-coins!list.action">总体积分日报</a></li>
                    <li id="report-base-cpa-tab"><a href="report/report-base-cpa!list.action">总体CPA日报</a></li>
                    <li id="report-per-task-tab"><a href="report/report-per-task!list.action">单个任务日报</a></li>
                    <li id="report-task-invitation-tab"><a href="report/report-task-invitation!list.action">邀请任务日报</a></li>
                    <li id="report-user-coins-tab"><a href="report/report-user-coins!list.action">用户积分日报</a></li>
                    <shiro:hasPermission name="feedback:view">
                        <li id="feedback-tab"><a href="report/feedback.action">用户意见反馈</a></li>
                    </shiro:hasPermission>
                </ul>
            </ul>

        </ul>
    </div>
</div>