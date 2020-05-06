Return-Path: <SRS0=uRyq=6U=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B5AC38A2A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 May 2020 13:27:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14F1920746
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 May 2020 13:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iWLB+tr1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgEFN1W (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 May 2020 09:27:22 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36199 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgEFN1W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 May 2020 09:27:22 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200506132719euoutp02c567b9908471f7e695b32f4b90e6fffb~Mc2NqmtgY1699816998euoutp02D
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2020 13:27:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200506132719euoutp02c567b9908471f7e695b32f4b90e6fffb~Mc2NqmtgY1699816998euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1588771639;
        bh=IZ/eaK8BI4Y0eYosEZEnf7wv4hF5vtwpdsqqkNgffFk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=iWLB+tr1z7037WDGh/ZAJQ+bYdy1SGzeyMzLuMRYlDOf+R36aV6ydz9vOG0FAqRYI
         BarCHSYvM+HlZR9RTAx+VubeG+2UiYrtxg3j83ONEUCQhO5h6NAAnxrKxD4QkO8RJ4
         9a/N8TqH7QFZHeff7aTcIB9TKT+OY+GLb7CZwqd8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200506132718eucas1p101fd4dc9faaac77c3ac297f6c40d6c09~Mc2NQ5bAD2972829728eucas1p1s;
        Wed,  6 May 2020 13:27:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 24.02.61286.63BB2BE5; Wed,  6
        May 2020 14:27:18 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200506132718eucas1p27ceb5f9d146beda30723ed99151ef51a~Mc2M5iSkO1503315033eucas1p2P;
        Wed,  6 May 2020 13:27:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200506132718eusmtrp2fe48c18faeb636be31addada513eb28c~Mc2M41Ft22008420084eusmtrp2c;
        Wed,  6 May 2020 13:27:18 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-10-5eb2bb36de7f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 16.8C.07950.63BB2BE5; Wed,  6
        May 2020 14:27:18 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200506132718eusmtip26e4dc390ab2e8e11bdccb4df761e4148~Mc2MY9Ebo1696216962eusmtip2H;
        Wed,  6 May 2020 13:27:17 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 1/2] clk: samsung: Mark top ISP and CAM clocks on Exynos542x
 as critical
Date:   Wed,  6 May 2020 15:26:58 +0200
Message-Id: <20200506132659.17162-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGIsWRmVeSWpSXmKPExsWy7djP87pmuzfFGfy+Y2GxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFv+ubWSxaH/6ktmB02PnrLvsHptWdbJ59G1Z
        xejxeZNcAEsUl01Kak5mWWqRvl0CV8bhG/3sBRPlKnp2T2FrYDwg2cXIySEhYCLx6ncvSxcj
        F4eQwApGiYkHWpkgnC+MEqeunWGEcD4zSvyf0skM0zL7ax9Uy3JGiZ7P/xnhWl7tWsUIUsUm
        YCjR9baLDcQWEXCQ+PzpNVgRs8AmJokra7aAjRIWiJJYePAZK4jNIqAqcfX2ZzCbV8BW4sKa
        5awQ6+QlVm84wAzSLCFwm03iyf45TBAJF4mnf1ewQdjCEq+Ob2GHsGUk/u+czwTR0Mwo8fDc
        WnYIp4dR4nLTDEaIKmuJO+d+AXVzAN2kKbF+lz5E2FFi5rHZYGEJAT6JG28FQcLMQOakbdOZ
        IcK8Eh1tQhDVahKzjq+DW3vwwiVoEHlIXD1yGcwWEoiVeL24h3ECo9wshF0LGBlXMYqnlhbn
        pqcWG+allusVJ+YWl+al6yXn525iBKaG0/+Of9rB+PVS0iFGAQ5GJR7eA8s2xQmxJpYVV+Ye
        YpTgYFYS4eX5sTFOiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/xopexQgLpiSWp2ampBalFMFkm
        Dk6pBsaCjo3Pjm9Otil2zFNYICMctM3o0n1/vhfvdy7SqOpMajLPneg4L/x+TPqj4i2NekbH
        AnIdqg7oN9w89Lrc5OsZn+zpfYb73uuVXP32ROGv0qavBl3pDysr24pCDyr/+c4b8/zEQzuh
        V49XKz44F7PyRPu2EtbHXQdOcSkWvOad+UXhVJcFyxYlluKMREMt5qLiRAAsmFW0CQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsVy+t/xe7pmuzfFGRzaLm+xccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFv+ubWSxaH/6ktmB02PnrLvsHptWdbJ59G1Z
        xejxeZNcAEuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqR
        vl2CXsbhG/3sBRPlKnp2T2FrYDwg2cXIySEhYCIx+2sfSxcjF4eQwFJGid4PF1khEjISJ6c1
        QNnCEn+udbFBFH1ilPg2bSMzSIJNwFCi6y1IgpNDRMBJ4sG6N+wgRcwC25gkdm6/D9YtLBAh
        8XXWdrAGFgFViau3P4PFeQVsJS6sWQ61QV5i9YYDzBMYeRYwMqxiFEktLc5Nzy020itOzC0u
        zUvXS87P3cQIDMhtx35u2cHY9S74EKMAB6MSD++BZZvihFgTy4orcw8xSnAwK4nw8vzYGCfE
        m5JYWZValB9fVJqTWnyI0RRo+URmKdHkfGC05JXEG5oamltYGpobmxubWSiJ83YIHIwREkhP
        LEnNTk0tSC2C6WPi4JRqYMxj1lq+NdX7j2aU4JG51b2c06vbL0drB9078cQnYDdf9lQG1+Sb
        /5yW7ApdKRdevstETPpML89NK9mOaB2lsvUm3umbHEMZJtqxJzyL9FHct//HqUAVe0E/XW/B
        Q1vZ/XSOHUxdFPFz/rrlG+ZwSVa3lIVGzwv3T5S/fSV09ZrNJvzOtxatUmIpzkg01GIuKk4E
        AJfMTPxeAgAA
X-CMS-MailID: 20200506132718eucas1p27ceb5f9d146beda30723ed99151ef51a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200506132718eucas1p27ceb5f9d146beda30723ed99151ef51a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200506132718eucas1p27ceb5f9d146beda30723ed99151ef51a
References: <CGME20200506132718eucas1p27ceb5f9d146beda30723ed99151ef51a@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The TOP 'aclk*_isp', 'aclk550_cam', 'gscl_wa' and 'gscl_wb' clocks must
be kept enabled all the time to allow proper access to power management
control for the ISP and CAM power domains. The last two clocks, although
related to GScaler device and GSCL power domain, provides also the
I_WRAP_CLK signal to MIPI CSIS0/1 devices, which are a part of CAM power
domain and are needed for proper power on/off sequence.

Currently there are no drivers for the devices, which are part of CAM and
ISP power domains yet. This patch only fixes the race between disabling
the unused power domains and disabling unused clocks, which randomly
resulted in the following error during boot:

Power domain CAM disable failed
Power domain ISP disable failed

Fixes: 318fa46cc60d ("clk/samsung: exynos542x: mark some clocks as critical")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index c9e5a1fb6653..edb2363c735a 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -540,7 +540,7 @@ static const struct samsung_div_clock exynos5800_div_clks[] __initconst = {
 
 static const struct samsung_gate_clock exynos5800_gate_clks[] __initconst = {
 	GATE(CLK_ACLK550_CAM, "aclk550_cam", "mout_user_aclk550_cam",
-				GATE_BUS_TOP, 24, 0, 0),
+				GATE_BUS_TOP, 24, CLK_IS_CRITICAL, 0),
 	GATE(CLK_ACLK432_SCALER, "aclk432_scaler", "mout_user_aclk432_scaler",
 				GATE_BUS_TOP, 27, CLK_IS_CRITICAL, 0),
 };
@@ -943,25 +943,25 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 	GATE(0, "aclk300_jpeg", "mout_user_aclk300_jpeg",
 			GATE_BUS_TOP, 4, CLK_IGNORE_UNUSED, 0),
 	GATE(0, "aclk333_432_isp0", "mout_user_aclk333_432_isp0",
-			GATE_BUS_TOP, 5, 0, 0),
+			GATE_BUS_TOP, 5, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk300_gscl", "mout_user_aclk300_gscl",
 			GATE_BUS_TOP, 6, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk333_432_gscl", "mout_user_aclk333_432_gscl",
 			GATE_BUS_TOP, 7, CLK_IGNORE_UNUSED, 0),
 	GATE(0, "aclk333_432_isp", "mout_user_aclk333_432_isp",
-			GATE_BUS_TOP, 8, 0, 0),
+			GATE_BUS_TOP, 8, CLK_IS_CRITICAL, 0),
 	GATE(CLK_PCLK66_GPIO, "pclk66_gpio", "mout_user_pclk66_gpio",
 			GATE_BUS_TOP, 9, CLK_IGNORE_UNUSED, 0),
 	GATE(0, "aclk66_psgen", "mout_user_aclk66_psgen",
 			GATE_BUS_TOP, 10, CLK_IGNORE_UNUSED, 0),
 	GATE(0, "aclk266_isp", "mout_user_aclk266_isp",
-			GATE_BUS_TOP, 13, 0, 0),
+			GATE_BUS_TOP, 13, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk166", "mout_user_aclk166",
 			GATE_BUS_TOP, 14, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK333, "aclk333", "mout_user_aclk333",
 			GATE_BUS_TOP, 15, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk400_isp", "mout_user_aclk400_isp",
-			GATE_BUS_TOP, 16, 0, 0),
+			GATE_BUS_TOP, 16, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk400_mscl", "mout_user_aclk400_mscl",
 			GATE_BUS_TOP, 17, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk200_disp1", "mout_user_aclk200_disp1",
@@ -1161,8 +1161,10 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 			GATE_IP_GSCL1, 3, 0, 0),
 	GATE(CLK_SMMU_FIMCL1, "smmu_fimcl1", "dout_gscl_blk_333",
 			GATE_IP_GSCL1, 4, 0, 0),
-	GATE(CLK_GSCL_WA, "gscl_wa", "sclk_gscl_wa", GATE_IP_GSCL1, 12, 0, 0),
-	GATE(CLK_GSCL_WB, "gscl_wb", "sclk_gscl_wb", GATE_IP_GSCL1, 13, 0, 0),
+	GATE(CLK_GSCL_WA, "gscl_wa", "sclk_gscl_wa", GATE_IP_GSCL1, 12,
+			CLK_IS_CRITICAL, 0),
+	GATE(CLK_GSCL_WB, "gscl_wb", "sclk_gscl_wb", GATE_IP_GSCL1, 13,
+			CLK_IS_CRITICAL, 0),
 	GATE(CLK_SMMU_FIMCL3, "smmu_fimcl3,", "dout_gscl_blk_333",
 			GATE_IP_GSCL1, 16, 0, 0),
 	GATE(CLK_FIMC_LITE3, "fimc_lite3", "aclk333_432_gscl",
-- 
2.17.1

