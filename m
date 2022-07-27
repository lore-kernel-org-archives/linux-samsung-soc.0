Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598DAC3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 06:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiG0GG2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 02:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiG0GGX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 02:06:23 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256873F319
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 23:06:19 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220727060614epoutp02e05b04c13dd9dd4e0109545f99264466~Fmo5_vi4m0212202122epoutp02D
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 06:06:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220727060614epoutp02e05b04c13dd9dd4e0109545f99264466~Fmo5_vi4m0212202122epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658901974;
        bh=VpgiU84Alg6FF/0XqaIW6Ma6QeMypoi9sMCM0SO9kcA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cj1kpxmP8MUp1HUtslYW6iDvlshBb7W+4Y1XOkbDRvx29coV52w2eawU3gzTFdxOT
         EhdRq/D2iSsEyu7efebuuAxbTq0lsovNTR+1DviuGII4twlbf3OYVPiG+Aa3omExgP
         sfbt1EeE2dF/gVrdwBFNYWmTLckQ/IW3K18NK1OM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220727060613epcas2p45d37ade659385b0a93b6c86310ff9227~Fmo5UUe-Q2914429144epcas2p44;
        Wed, 27 Jul 2022 06:06:13 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Lt3F13kHlz4x9Pv; Wed, 27 Jul
        2022 06:06:13 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        56.6E.09662.5D5D0E26; Wed, 27 Jul 2022 15:06:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epcas2p47e21a2545b686d536de47518f7b5c199~Fmo4dScQF2914429144epcas2p4u;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220727060612epsmtrp1decf6a8fee91f10c28d5730fa6313bc0~Fmo4ZORe50521005210epsmtrp1s;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
X-AuditID: b6c32a48-9f7ff700000025be-50-62e0d5d51367
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        41.EB.08905.4D5D0E26; Wed, 27 Jul 2022 15:06:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epsmtip13635d045e510301425adf80aae590188~Fmo4N7sJm2961429614epsmtip1G;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
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
Subject: [PATCH 6/6] clk: samsung: exynosautov9: add fsys1 clock support
Date:   Wed, 27 Jul 2022 15:01:46 +0900
Message-Id: <20220727060146.9228-7-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727060146.9228-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmqe7Vqw+SDLb/EbF4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2qGyb
        jNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKCrlRTKEnNK
        gUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGY82
        ixYsN6u4snUdWwPjJ70uRk4OCQETiad35jF2MXJxCAnsYJRo2bQIyvnEKNH/YT0TSJWQwDdG
        iSvLymE69hy/zwZRtJdR4tbU28wQzkegjgd3wDrYBHQltjx/BTZKROAxk8ThI21gLcwCbUwS
        055tZAWpEhbwkOhbf4sdxGYRUJX4fu0ImM0rYCsxe+YyVoh98hLXb7Yxg9icAnYSO9bsZIKo
        EZQ4OfMJC4jNDFTTvHU22BkSAis5JF6u+coC0ewicW73HEYIW1ji1fEt7BC2lMTL/jYou1hi
        6axPTBDNDYwSl7f9YoNIGEvMetYO1MwBtEFTYv0ufRBTQkBZ4sgtqL18Eh2H/7JDhHklOtqE
        IBrVJQ5snw51gaxE95zPrBAlHhJPrxRBAmsio8Tq0y/ZJjAqzELyzSwk38xC2LuAkXkVo1hq
        QXFuemqxUYEJPIaT83M3MYJTsZbHDsbZbz/oHWJk4mA8xCjBwawkwpsQfT9JiDclsbIqtSg/
        vqg0J7X4EKMpMKwnMkuJJucDs0FeSbyhiaWBiZmZobmRqYG5kjivV8qGRCGB9MSS1OzU1ILU
        Ipg+Jg5OqQamqj81x4+ZNWyPuRWrf3xumbFszI1qv0XBTfsC9n15pRFzxZhn0VrlkyoOzx+z
        +RdGrlHiN5Zc8ENy+Z/f+80KTxm05ISpL265Ue507RXT/+Wyn0vu3xbgtGmqipnVlHj6TdNL
        bvm7sxsXCpWv9ds4R7Ke9cVi7qKQyinpNktdkpcnli/Z8qZC7LvDmbTA/xP+Ft2Le+mzJGFx
        WnFXksBjr191bPY/omWf7jo7xffcCvNnP1dmnz5QuueBW6h2Uoa5wtblnqLXixqE35v+X/fi
        ttuXq89cyuaIxUc+sV46rbVBVHbdp9X7GJIv3z2uqq5bdjlXoVpXXsqrkFk/w7rx4Ou1p+7P
        ml8dkjFlbUCjEktxRqKhFnNRcSIAVCt2/E4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWy7bCSnO6Vqw+SDB5uNLB4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2KC6b
        lNSczLLUIn27BK6MR5tFC5abVVzZuo6tgfGTXhcjJ4eEgInEnuP32boYuTiEBHYzSjxsnskG
        kZCVePZuBzuELSxxv+UIK0TRe0aJGYuvMoEk2AR0JbY8f8UIkhAReM4kMWXFQTCHWaCLSeJO
        2yewdmEBD4m+9bfAbBYBVYnv146A2bwCthKzZy5jhVghL3H9ZhsziM0pYCexY81OsA1CQDUz
        XzWxQNQLSpyc+QTMZgaqb946m3kCo8AsJKlZSFILGJlWMUqmFhTnpucWGxYY5qWW6xUn5haX
        5qXrJefnbmIEx42W5g7G7as+6B1iZOJgPMQowcGsJMKbEH0/SYg3JbGyKrUoP76oNCe1+BCj
        NAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5OqQam0qXCS2unyvcl8Pvv91TYFHas8HXeUueF
        XBPLfBe+1ZUrDrhpXXZvruOHBL3k+AY9pveMn0tmvk3p9U16uJ5rwf4JTNzbrYXzDrrlye3M
        Vs38HHVBo7Zxxnkx0TmpjbMeivkW2Vo911qUqCaY3fii+cMacwGPf29jGhSKu9LrtGaYPQm6
        6Dtv1rHTbolz+Q/d3fi5pTjxQo3Gd90YLfM9K6L+nHtmJjrx/wy9Y16CUp/P3kt8zlYal757
        R8+MkoRfGy+IqNpcPVueXV1+7VzkV/38PTJpDqmFu9ZW21Xsc98gYnN4jjPfyXATpqrUPuYH
        8f6+cY/uPTe5vtAq20p/WQ+HaI1S0vyJC1UvVyixFGckGmoxFxUnAgCi7u1zCgMAAA==
X-CMS-MailID: 20220727060612epcas2p47e21a2545b686d536de47518f7b5c199
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727060612epcas2p47e21a2545b686d536de47518f7b5c199
References: <20220727060146.9228-1-chanho61.park@samsung.com>
        <CGME20220727060612epcas2p47e21a2545b686d536de47518f7b5c199@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1, 2 x USB 2.0) and
mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also supported as a PLL
source clock provider.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 129 +++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 527a6837661e..b61eec1244cc 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1307,6 +1307,132 @@ static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
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
+PNAME(mout_mmc_pll_p) = { "oscclk", "fout_mmc_pll" };
+PNAME(mout_fsys1_mmc_card_user_p) = { "oscclk", "gout_clkcmu_fsys1_mmc_card" };
+PNAME(mout_fsys1_usbdrd_user_p) = { "oscclk", "dout_clkcmu_fsys1_usbdrd" };
+PNAME(mout_fsys1_mmc_card_p) = { "mout_fsys1_mmc_card_user", "mout_mmc_pll" };
+
+static const struct samsung_mux_clock fsys1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_FSYS1_BUS_USER, "mout_fsys1_bus_user",
+	    mout_fsys1_bus_user_p, PLL_CON0_MUX_CLKCMU_FSYS1_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_MMC_PLL, "mout_mmc_pll", mout_mmc_pll_p,
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
@@ -1944,6 +2070,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
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

