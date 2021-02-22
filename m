Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9A7C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Feb 2021 10:35:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 678AC64E2E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Feb 2021 10:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhBVKfd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Feb 2021 05:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhBVKfd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Feb 2021 05:35:33 -0500
X-Greylist: delayed 2437 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 Feb 2021 02:34:52 PST
Received: from wp126.webpack.hosteurope.de (wp126.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8485::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FCAC061574;
        Mon, 22 Feb 2021 02:34:52 -0800 (PST)
Received: from [2003:a:659:3f00:1e6f:65ff:fe31:d1d5] (helo=hermes.fivetechno.de); authenticated
        by wp126.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1lE7uq-0003Ko-Vq; Mon, 22 Feb 2021 10:54:09 +0100
X-Virus-Scanned: by amavisd-new 2.11.1 using newest ClamAV at
        linuxbbg.five-lan.de
Received: from odroid.fritz.box (odroid.fritz.box [192.168.34.131])
        (authenticated bits=0)
        by hermes.fivetechno.de (8.16.1/8.14.5/SuSE Linux 0.8) with ESMTPSA id 11M9s7wA004827
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 22 Feb 2021 10:54:08 +0100
From:   Markus Reichl <m.reichl@fivetechno.de>
To:     m.szyprowski@samsung.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Markus Reichl <m.reichl@fivetechno.de>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH]  Revert "ARM: dts: exynos: Remove 'opp-shared' from Exynos4412 bus OPP-tables"
Date:   Mon, 22 Feb 2021 10:54:03 +0100
Message-Id: <20210222095405.3109-1-m.reichl@fivetechno.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;m.reichl@fivetechno.de;1613990093;75b06bb9;
X-HE-SMSGID: 1lE7uq-0003Ko-Vq
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This reverts commit a23beead41a18c3be3ca409cb52f35bc02e601b9.

I'm running an Odroid-X2 as headless 24/7 server.
With plain stable 5.10.1 I had 54 up days without problems.
With opp-shared removed on kernels before and now on 5.11
my system freezes after some days on disk activity to eMMC
(rsync, apt upgrade).

The spontaneous hangs are not easy to reproduce but testing this
for several months now I am quite confident that there is something
wrong with this patch.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
 arch/arm/boot/dts/exynos4412.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index a142fe84010b..6246df278431 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -405,6 +405,7 @@
 
 		bus_dmc_opp_table: opp-table1 {
 			compatible = "operating-points-v2";
+			opp-shared;
 
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
@@ -431,6 +432,7 @@
 
 		bus_acp_opp_table: opp-table2 {
 			compatible = "operating-points-v2";
+			opp-shared;
 
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
@@ -500,6 +502,7 @@
 
 		bus_leftbus_opp_table: opp-table3 {
 			compatible = "operating-points-v2";
+			opp-shared;
 
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
@@ -522,6 +525,7 @@
 
 		bus_display_opp_table: opp-table4 {
 			compatible = "operating-points-v2";
+			opp-shared;
 
 			opp-160000000 {
 				opp-hz = /bits/ 64 <160000000>;
@@ -533,6 +537,7 @@
 
 		bus_fsys_opp_table: opp-table5 {
 			compatible = "operating-points-v2";
+			opp-shared;
 
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
@@ -544,6 +549,7 @@
 
 		bus_peri_opp_table: opp-table6 {
 			compatible = "operating-points-v2";
+			opp-shared;
 
 			opp-50000000 {
 				opp-hz = /bits/ 64 <50000000>;
-- 
2.20.1

