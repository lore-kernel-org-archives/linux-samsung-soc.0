Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B94CC43219
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbiECLBZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234602AbiECLBT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:19 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3A127158
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:35 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220503105733epoutp0296371444afe0ce9ba0e8363e02362cbc~rkx-PqhzS0882708827epoutp02Y
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220503105733epoutp0296371444afe0ce9ba0e8363e02362cbc~rkx-PqhzS0882708827epoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575453;
        bh=dkoAq0N3bfWv+v8KNVNIeDRxJliXizBwGwBF1FjjUiM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kcACG0PSA3Kgimbw4c7hEu5WUCjttpe9Ns5KsbaITBdP/JcCqf/aBq9XnVdZ3KXEC
         whhHEnp3vKOIm2Bb5mvQR5KHV+xCA6Nkz4uSr1+LZWTPg/uv2Qhev8/uxtW7j03jFc
         Lcgwi0zpR/HvMYJ+55DuDt8ZMoVPd7SWoIM27c70=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220503105731epcas2p30aeae183178f5ef2cfe748a7434caefa~rkx93NVFu2361523615epcas2p3C;
        Tue,  3 May 2022 10:57:31 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.69]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KsxkL13smz4x9Q2; Tue,  3 May
        2022 10:57:30 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        43.CF.10069.99A01726; Tue,  3 May 2022 19:57:30 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epcas2p3db3b8d5c915ad7e416548399cb3010e2~rkx8BSs1s3115231152epcas2p3J;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220503105729epsmtrp260f3e8602183a282b42b875338e3f822~rkx8AcQQW0978209782epsmtrp2L;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-4d-62710a991d57
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        73.42.08853.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epsmtip26105f6d1a419c52b6eb7a8b0d5af68d1~rkx702NnG0549605496epsmtip29;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 07/12] clk: samsung: exynosautov9: add cmu_fsys2 clock
 support
Date:   Tue,  3 May 2022 19:59:09 +0900
Message-Id: <20220503105914.117625-8-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503105914.117625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmue4srsIkg97DjBYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZPSdusBb8VKrYv38L
        SwPjAbkuRk4OCQETia//l7F2MXJxCAnsYJToutYG5XxilHj0ZjILhPONUWLyhVZGmJbPV6Yy
        QiT2Mko03lsLVfWRUWLShR52kCo2AV2JLc9fgVWJCHQxS1zsuwdWxSywlVHi+I1ZTCBVwgLB
        Ej2LJrOC2CwCqhKPL30G6+YVsJd4uOoQWxcjB9A+eYl/i0NBwpwCDhLXd51jgigRlDg58wkL
        iM0MVNK8dTYzyHwJgYUcEot3zWCHuNVFonHrQihbWOLV8S1QtpTE53d72SDsYomlsz4xQTQ3
        MEpc3vYLKmEsMetZOyPIEcwCmhLrd+lD3KMsceQW1F4+iY7Df9khwrwSHW1CEI3qEge2T2eB
        sGUluud8ZoWwPSTm3VrDDgmsyYwSn89+Yp/AqDALyTuzkLwzC2HxAkbmVYxiqQXFuempxUYF
        hvA4Ts7P3cQITr5arjsYJ7/9oHeIkYmD8RCjBAezkgiv89KCJCHelMTKqtSi/Pii0pzU4kOM
        psCwnsgsJZqcD0z/eSXxhiaWBiZmZobmRqYG5krivF4pGxKFBNITS1KzU1MLUotg+pg4OKUa
        mM74swWI/pu+k2kac2TysmeHTROPzxXV/Vr9qiNAeJltxLpJt/fuuC8SxPV7ptzMguYpU9IZ
        r16wf+onsc1onut9vZ35VW22887OKTilNqV4hhO39Z2fX5nsJ75fOsGtcG25kvTahGOi83Y8
        3ZMgdv2P1pcnDwQM/ltnqjyd1sO4fb92n/T1H1f7WAQ5NLZxG7m9ux5Ruvqmqv+nJTZqNv9v
        53/e3K1t/a56kXNuiugBnlChGz4R5rqKLgr7X7xZef6dW+zqvIOsC0Nv7nzAeTctW8g19eqq
        0H2du06m5G01ylb0Pl1568Vuu9amHydlarPTu11n/rvo7lFbY/yz31l4l+73pH6NQwsEXKYx
        XlJiKc5INNRiLipOBADyozz2RwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkg19P1S0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBk9J26wFvxUqti/fwtLA+MBuS5GTg4JAROJz1emMnYxcnEICexmlFjUfo0FIiEr8ezdDnYI
        W1jifssRVoii94wSa7ZcZQJJsAnoSmx5/gqsW0RgArPEmysf2EEcZoGdjBJ3Xp1iA6kSFgiU
        2HuygRnEZhFQlXh86TPYWF4Be4mHqw4B1XAArZCX+Lc4FCTMKeAgcX3XObAFQkAlO/9uZ4Yo
        F5Q4OfMJ2HXMQOXNW2czT2AUmIUkNQtJagEj0ypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k
        /NxNjOAo0dLcwbh91Qe9Q4xMHIyHGCU4mJVEeJ2XFiQJ8aYkVlalFuXHF5XmpBYfYpTmYFES
        573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwFR0T3uS64R9x2MbT8Zv/rQsqG7+f82AK58XpfG0
        7y++MbXJrMXdXefyjNYlkloSl46FXNPp/tG2v956jVKMley7//Ve7zy8QnWapj7wyQzYlXXd
        pI7R91k7240H4msc36qfVtPc0nYybNcVzwiWtOxK/tffWkVvdR//VZT7cbGos8DX7UXhCtlT
        3v5IfPZQ3YPjE5vKS7mCyO5yzTm1zpOO2TovivvDHqwScv7PGaH1tpPjpq75IO1T9frChauM
        982+eXm7Hz+htPGtpvPNi5Jc3D4XS1f4mhrccjziOlXS+na0xwYDUZUQ3zfpAqs5DUMUf3hP
        aZjDqaHzVDfM6Et2ep7+2tW/oxp2P/y7TImlOCPRUIu5qDgRAKTajCYBAwAA
X-CMS-MailID: 20220503105729epcas2p3db3b8d5c915ad7e416548399cb3010e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p3db3b8d5c915ad7e416548399cb3010e2
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105729epcas2p3db3b8d5c915ad7e416548399cb3010e2@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_FSYS2 is responsible to control clocks of BLK_FSYS2 which includes
ufs and ethernet IPs. This patch adds some essential clocks to be
controlled by ethernet/ufs drivers instead of listing full clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 69 ++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index aaa78b921fde..8c6ecd3f3eeb 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1067,6 +1067,73 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_core_bus",
 };
 
+/* ---- CMU_FSYS2 ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_FSYS2 (0x17c00000) */
+#define PLL_CON0_MUX_CLKCMU_FSYS2_BUS_USER	0x0600
+#define PLL_CON0_MUX_CLKCMU_FSYS2_UFS_EMBD_USER	0x0620
+#define PLL_CON0_MUX_CLKCMU_FSYS2_ETHERNET_USER	0x0610
+#define CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_ACLK	0x2098
+#define CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_CLK_UNIPRO	0x209c
+#define CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_ACLK	0x20a4
+#define CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_CLK_UNIPRO	0x20a8
+
+static const unsigned long fsys2_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_FSYS2_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_FSYS2_UFS_EMBD_USER,
+	PLL_CON0_MUX_CLKCMU_FSYS2_ETHERNET_USER,
+	CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_CLK_UNIPRO,
+	CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_CLK_UNIPRO,
+};
+
+/* List of parent clocks for Muxes in CMU_FSYS2 */
+PNAME(mout_fsys2_bus_user_p) = { "oscclk", "dout_clkcmu_fsys2_bus" };
+PNAME(mout_fsys2_ufs_embd_user_p) = { "oscclk", "dout_clkcmu_fsys2_ufs_embd" };
+PNAME(mout_fsys2_ethernet_user_p) = { "oscclk", "dout_clkcmu_fsys2_ethernet" };
+
+static const struct samsung_mux_clock fsys2_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_FSYS2_BUS_USER, "mout_fsys2_bus_user",
+	    mout_fsys2_bus_user_p, PLL_CON0_MUX_CLKCMU_FSYS2_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_FSYS2_UFS_EMBD_USER, "mout_fsys2_ufs_embd_user",
+	    mout_fsys2_ufs_embd_user_p,
+	    PLL_CON0_MUX_CLKCMU_FSYS2_UFS_EMBD_USER, 4, 1),
+	MUX(CLK_MOUT_FSYS2_ETHERNET_USER, "mout_fsys2_ethernet_user",
+	    mout_fsys2_ethernet_user_p,
+	    PLL_CON0_MUX_CLKCMU_FSYS2_ETHERNET_USER, 4, 1),
+};
+
+static const struct samsung_gate_clock fsys2_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_FSYS2_UFS_EMBD0_ACLK, "gout_fsys2_ufs_embd0_aclk",
+	     "mout_fsys2_ufs_embd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_ACLK, 21,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS2_UFS_EMBD0_UNIPRO, "gout_fsys2_ufs_embd0_unipro",
+	     "mout_fsys2_ufs_embd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_CLK_UNIPRO,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS2_UFS_EMBD1_ACLK, "gout_fsys2_ufs_embd1_aclk",
+	     "mout_fsys2_ufs_embd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_ACLK, 21,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS2_UFS_EMBD1_UNIPRO, "gout_fsys2_ufs_embd1_unipro",
+	     "mout_fsys2_ufs_embd_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_CLK_UNIPRO,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info fsys2_cmu_info __initconst = {
+	.mux_clks		= fsys2_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(fsys2_mux_clks),
+	.gate_clks		= fsys2_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(fsys2_gate_clks),
+	.nr_clk_ids		= FSYS2_NR_CLK,
+	.clk_regs		= fsys2_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(fsys2_clk_regs),
+	.clk_name		= "dout_clkcmu_fsys2_bus",
+};
+
 /* ---- CMU_PERIS ---------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_PERIS (0x10020000) */
@@ -1133,6 +1200,8 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 		.compatible = "samsung,exynosautov9-cmu-core",
 		.data = &core_cmu_info,
 	}, {
+		.compatible = "samsung,exynosautov9-cmu-fsys2",
+		.data = &fsys2_cmu_info,
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-peris",
 		.data = &peris_cmu_info,
-- 
2.36.0

