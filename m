Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95733C19F2B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Jul 2022 00:36:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233702AbiG2AgU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Jul 2022 20:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbiG2AgS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 20:36:18 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8941277A6E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 17:36:15 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220729003614epoutp02112a3d4b8269b7c57e4938f3dbfc6a86~GJbV0YwAV0513605136epoutp02N
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Jul 2022 00:36:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220729003614epoutp02112a3d4b8269b7c57e4938f3dbfc6a86~GJbV0YwAV0513605136epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1659054974;
        bh=NZbi1R5mScOU9IsiIc2NDSvoSk0KABzd5j6IYyV63rY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u2NG0Ex9GhMeJgCtcilp4DfB5pc7ZbwjMEejJf6te4OmGcgVQSGmu/jFnxDQHWkcG
         XoolHzZG6i/KKa9rnZAnmOtR5dFEgmfBtME+EMdTi7uPS8bUmfVIQvy5e3gdENO7VQ
         fc19d00Gcl0tQRaurIceGTnAjS7SLiO42Lrn3a30=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220729003613epcas2p4a1d38ca859e7628ca198317511577152~GJbVPFCa61918919189epcas2p4s;
        Fri, 29 Jul 2022 00:36:13 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.100]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Lv7qK089Yz4x9Q5; Fri, 29 Jul
        2022 00:36:13 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        75.66.09662.C7B23E26; Fri, 29 Jul 2022 09:36:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220729003612epcas2p4cd006dcd814ff49583aa44921fbbed5a~GJbUd0A1M1916219162epcas2p42;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220729003612epsmtrp16fa748709ceea95b5012e7555a4a2f5e~GJbUa0PT83217232172epsmtrp1p;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
X-AuditID: b6c32a48-20206a80000025be-b3-62e32b7c3e23
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        0D.70.08802.C7B23E26; Fri, 29 Jul 2022 09:36:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220729003612epsmtip205607e011a66850793daff714307df30~GJbUNX2wC0066700667epsmtip2O;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 6/6] clk: samsung: exynosautov9: add fsys1 clock support
Date:   Fri, 29 Jul 2022 09:30:24 +0900
Message-Id: <d4aa967538fed9667e9550a256e545026fc2fa8d.1659054220.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1659054220.git.chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmuW6N9uMkg8d3LC0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9Ktsm
        IzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hqJYWyxJxS
        oFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xvPm
        bvaCM2YVl3o/sDUwTtTvYuTkkBAwkTh5dR1rFyMXh5DADkaJa28OMUE4nxgltr78xQJSJSTw
        mVHi3D3eLkYOsI7Xj1IganYxSqx9dp0FwvnIKDHj+GQmkAY2AV2JLc9fMYIkRAQeM0kcPtLG
        BuIwC7QxSUx7tpEVpEpYwFti4dKjLCBjWQRUJW4ezgMJ8wrESyw8u4gZ4j55ies328BsTgFb
        ia6m7ywQNYISJ2c+AbOZgWqat85mBpkvIbCWQ6J9/UtWiGYXibsH1jFB2MISr45vYYewpSRe
        9rdB2cUSS2d9YoJobmCUuLztFxtEwlhi1rN2RpDjmAU0Jdbv0od4X1niyC2ovXwSHYf/skOE
        eSU62oQgGtUlDmyfzgJhy0p0z/kMdY2HxIEtR9ghgTWBUWLL1jWMExgVZiF5ZxaSd2YhLF7A
        yLyKUSy1oDg3PbXYqMAEHsPJ+bmbGMGpWMtjB+Pstx/0DjEycTAeYpTgYFYS4U2Ivp8kxJuS
        WFmVWpQfX1Sak1p8iNEUGNYTmaVEk/OB2SCvJN7QxNLAxMzM0NzI1MBcSZzXK2VDopBAemJJ
        anZqakFqEUwfEwenVAOT+0bpKXJtRsfl1s59pP2yc6l06/eDj2bvrX78ZdUKpmkFGo0OTgrv
        Vgee+Pi5Zu7XxS/yCpPYzr/fmx0U+Lf669rbjvqNqRGOP76z9RQa+3pnfLlQVCkR1X/Sm39W
        i/Telxo2q9df2Xznw0Ql3dKW5BKB6xVXLkZ330tM4Hl3o06z/sUVIS37bwpy/MYz37O6BsVu
        OsWmoq7S/+ODy3IuU735mysLDr8+kz+leNMM/W8PXFZN61VbtL3osa/99Yd1r5fNn7ZMd1fs
        Id+tsznnW/KfTI585+j5S8Tc7desnb4HV1g7ydz/PoM35fw27kWCFvG7fltNdGQ1Vbtipygj
        LzmX6+6dxPk6E093TXkio8RSnJFoqMVcVJwIAARXEtJOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSvG6N9uMkgzVrpS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9issm
        JTUnsyy1SN8ugSvjeXM3e8EZs4pLvR/YGhgn6ncxcnBICJhIvH6U0sXIxSEksINRYuLuhcxd
        jJxAcVmJZ+92sEPYwhL3W46wQhS9Z5Q41byKCSTBJqArseX5K0aQhIjAcyaJKSsOgjnMAl1M
        EnfaPoG1Cwt4SyxcepQFZB2LgKrEzcN5IGFegXiJhWcXQW2Tl7h+sw3M5hSwlehq+s4CYgsJ
        2EhsWbaIDaJeUOLkzCdgcWag+uats5knMArMQpKahSS1gJFpFaNkakFxbnpusWGBUV5quV5x
        Ym5xaV66XnJ+7iZGcNRoae1g3LPqg94hRiYOxkOMEhzMSiK8CdH3k4R4UxIrq1KL8uOLSnNS
        iw8xSnOwKInzXug6GS8kkJ5YkpqdmlqQWgSTZeLglGpg4nd/0NDdcqv6P9dGvVkFUZcWLp6X
        wPW149QPb44dtd//XFqmFy6TKnenjc3t/bqK1VKLV0uZr91Wuft5wrsbd9cLpaxQ41tmvsh2
        2pa5QgEb9bdvCjjxNz1bsfHjwVygsutTO8KqU36v//Rn4p/EQwvVdn493L38zuN1gmwzN8Xk
        L/k84SfbLm7poAp+8fO7cxva7rxlfh6Zrb9N4ObVhf2zS3fwP9fZcW6Kg94xsYO//Df//JXG
        6m3AznU9irv4SsznQw57xL45v+jhurXq4tuqV3GV0+qEhPI75Nb9Moj/LbQgQfGGopHSeic/
        icraxnPGK3uTbVQ7VzZunvn3tUHy5O9xJrnW2crHG7nYlViKMxINtZiLihMBQs4YTwkDAAA=
X-CMS-MailID: 20220729003612epcas2p4cd006dcd814ff49583aa44921fbbed5a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220729003612epcas2p4cd006dcd814ff49583aa44921fbbed5a
References: <cover.1659054220.git.chanho61.park@samsung.com>
        <CGME20220729003612epcas2p4cd006dcd814ff49583aa44921fbbed5a@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1, 2 x USB 2.0) and
mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also supported as a PLL
source clock provider.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 130 +++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 527a6837661e..196d8b023907 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1307,6 +1307,133 @@ static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_fsys0_bus",
 };
 
+/* ---- CMU_FSYS1 ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_FSYS1 (0x17040000) */
+#define PLL_LOCKTIME_PLL_MMC			0x0000
+#define PLL_CON0_PLL_MMC			0x0100
+#define PLL_CON3_PLL_MMC			0x010c
+#define PLL_CON0_MUX_CLKCMU_FSYS1_BUS_USER	0x0600
+#define PLL_CON0_MUX_CLKCMU_FSYS1_MMC_CARD_USER	0x0610
+#define PLL_CON0_MUX_CLKCMU_FSYS1_USBDRD_USER	0x0620
+
+#define CLK_CON_MUX_MUX_CLK_FSYS1_MMC_CARD	0x1000
+#define CLK_CON_DIV_DIV_CLK_FSYS1_MMC_CARD	0x1800
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_FSYS1_CMU_FSYS1_IPCLKPORT_PCLK	0x2018
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_MMC_CARD_IPCLKPORT_SDCLKIN	0x202c
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_MMC_CARD_IPCLKPORT_I_ACLK	0x2028
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB20DRD_0_REF_CLK_40		0x204c
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB20DRD_1_REF_CLK_40		0x2058
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB30DRD_0_REF_CLK_40		0x2064
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB30DRD_1_REF_CLK_40		0x2070
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB2_0_IPCLKPORT_ACLK	0x2074
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB2_1_IPCLKPORT_ACLK	0x2078
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB3_0_IPCLKPORT_ACLK	0x207c
+#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB3_1_IPCLKPORT_ACLK	0x2080
+
+static const unsigned long fsys1_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_FSYS1_BUS_USER,
+};
+
+static const struct samsung_pll_clock fsys1_pll_clks[] __initconst = {
+	PLL(pll_0831x, FOUT_MMC_PLL, "fout_mmc_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, NULL),
+};
+
+/* List of parent clocks for Muxes in CMU_FSYS1 */
+PNAME(mout_fsys1_bus_user_p) = { "oscclk", "dout_clkcmu_fsys1_bus" };
+PNAME(mout_fsys1_mmc_pll_p) = { "oscclk", "fout_mmc_pll" };
+PNAME(mout_fsys1_mmc_card_user_p) = { "oscclk", "gout_clkcmu_fsys1_mmc_card" };
+PNAME(mout_fsys1_usbdrd_user_p) = { "oscclk", "dout_clkcmu_fsys1_usbdrd" };
+PNAME(mout_fsys1_mmc_card_p) = { "mout_fsys1_mmc_card_user",
+				 "mout_fsys1_mmc_pll" };
+
+static const struct samsung_mux_clock fsys1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_FSYS1_BUS_USER, "mout_fsys1_bus_user",
+	    mout_fsys1_bus_user_p, PLL_CON0_MUX_CLKCMU_FSYS1_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_FSYS1_MMC_PLL, "mout_fsys1_mmc_pll", mout_fsys1_mmc_pll_p,
+	    PLL_CON0_PLL_MMC, 4, 1),
+	MUX(CLK_MOUT_FSYS1_MMC_CARD_USER, "mout_fsys1_mmc_card_user",
+	    mout_fsys1_mmc_card_user_p, PLL_CON0_MUX_CLKCMU_FSYS1_MMC_CARD_USER,
+	    4, 1),
+	MUX(CLK_MOUT_FSYS1_USBDRD_USER, "mout_fsys1_usbdrd_user",
+	    mout_fsys1_usbdrd_user_p, PLL_CON0_MUX_CLKCMU_FSYS1_USBDRD_USER,
+	    4, 1),
+	MUX(CLK_MOUT_FSYS1_MMC_CARD, "mout_fsys1_mmc_card",
+	    mout_fsys1_mmc_card_p, CLK_CON_MUX_MUX_CLK_FSYS1_MMC_CARD,
+	    0, 1),
+};
+
+static const struct samsung_div_clock fsys1_div_clks[] __initconst = {
+	DIV(CLK_DOUT_FSYS1_MMC_CARD, "dout_fsys1_mmc_card",
+	    "mout_fsys1_mmc_card",
+	    CLK_CON_DIV_DIV_CLK_FSYS1_MMC_CARD, 0, 9),
+};
+
+static const struct samsung_gate_clock fsys1_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_FSYS1_PCLK, "gout_fsys1_pclk", "mout_fsys1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_FSYS1_CMU_FSYS1_IPCLKPORT_PCLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS1_MMC_CARD_SDCLKIN, "gout_fsys1_mmc_card_sdclkin",
+	     "dout_fsys1_mmc_card",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_MMC_CARD_IPCLKPORT_SDCLKIN,
+	     21, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_GOUT_FSYS1_MMC_CARD_ACLK, "gout_fsys1_mmc_card_aclk",
+	     "dout_fsys1_mmc_card",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_MMC_CARD_IPCLKPORT_I_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS1_USB20DRD_0_REFCLK, "gout_fsys1_usb20drd_0_refclk",
+	     "mout_fsys1_usbdrd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB20DRD_0_REF_CLK_40,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS1_USB20DRD_1_REFCLK, "gout_fsys1_usb20drd_1_refclk",
+	     "mout_fsys1_usbdrd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB20DRD_1_REF_CLK_40,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS1_USB30DRD_0_REFCLK, "gout_fsys1_usb30drd_0_refclk",
+	     "mout_fsys1_usbdrd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB30DRD_0_REF_CLK_40,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS1_USB30DRD_1_REFCLK, "gout_fsys1_usb30drd_1_refclk",
+	     "mout_fsys1_usbdrd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB30DRD_1_REF_CLK_40,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS1_USB20_0_ACLK, "gout_fsys1_usb20_0_aclk",
+	     "mout_fsys1_usbdrd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB2_0_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS1_USB20_1_ACLK, "gout_fsys1_usb20_1_aclk",
+	     "mout_fsys1_usbdrd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB2_1_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS1_USB30_0_ACLK, "gout_fsys1_usb30_0_aclk",
+	     "mout_fsys1_usbdrd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB3_0_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS1_USB30_1_ACLK, "gout_fsys1_usb30_1_aclk",
+	     "mout_fsys1_usbdrd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB3_1_IPCLKPORT_ACLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info fsys1_cmu_info __initconst = {
+	.pll_clks		= fsys1_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(fsys1_pll_clks),
+	.mux_clks		= fsys1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(fsys1_mux_clks),
+	.div_clks		= fsys1_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(fsys1_div_clks),
+	.gate_clks		= fsys1_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(fsys1_gate_clks),
+	.nr_clk_ids		= FSYS1_NR_CLK,
+	.clk_regs		= fsys1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(fsys1_clk_regs),
+	.clk_name		= "dout_clkcmu_fsys1_bus",
+};
+
 /* ---- CMU_FSYS2 ---------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_FSYS2 (0x17c00000) */
@@ -1944,6 +2071,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-fsys0",
 		.data = &fsys0_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov9-cmu-fsys1",
+		.data = &fsys1_cmu_info,
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-fsys2",
 		.data = &fsys2_cmu_info,
-- 
2.37.1

