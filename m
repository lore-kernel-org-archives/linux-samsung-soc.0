Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E42C43219
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345746AbiEDHyN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345762AbiEDHxw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:52 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4368BBDF
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:13 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220504075009epoutp032ae0898d0add38a319bf7e6abcd03d60~r13p4BthT1244212442epoutp03K
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220504075009epoutp032ae0898d0add38a319bf7e6abcd03d60~r13p4BthT1244212442epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650609;
        bh=dkoAq0N3bfWv+v8KNVNIeDRxJliXizBwGwBF1FjjUiM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cE8POmC0iDs8VB1JTUlxp7sn692byn5vZWD5XFhzSZelgeTL9KJHvzYAwkntAibr5
         Kh3yZT9bKwcmuxlpDDGMxjoIUSaPhFo2RXivP5v2SD7ISWyXJbb9DFtGg+1rD1S67X
         VYe/wSKQYgveOfi+eRDWvbeFbEH6XGaSvV49uorU=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220504075008epcas2p4d06d9b8734f78858255254dd57c64030~r13pQvTlH1669516695epcas2p42;
        Wed,  4 May 2022 07:50:08 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KtTWd0XBFz4x9Q5; Wed,  4 May
        2022 07:50:05 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        69.E4.10069.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epcas2p20f2dca86b740d0ff9471f09a90556a34~r13lMHe2P2949029490epcas2p2k;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220504075004epsmtrp2c2237aaba0f298a7b2db3fa12df9c3c3~r13lLKG7U0425004250epsmtrp2E;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-51-6272302ce371
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        8B.EB.08924.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epsmtip1635522ffdac6a19476e67685327fe837~r13k8Y1k42390523905epsmtip1E;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
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
Subject: [PATCH v3 07/12] clk: samsung: exynosautov9: add cmu_fsys2 clock
 support
Date:   Wed,  4 May 2022 16:51:49 +0900
Message-Id: <20220504075154.58819-8-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmma6OQVGSweVrOhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZPSdusBb8VKrYv38L
        SwPjAbkuRk4OCQETidbrN1i7GLk4hAR2MEqcbn7MBuF8YpT4ef8tM4TzmVHi6vqzrDAts04v
        ALOFBHYxSkyfxg5R9JFRYtOLxSwgCTYBXYktz18xgiREBLqYJS723WMBcZgFtjJKHL8xiwmk
        SlggWGL+423sIDaLgKrEh7fnGUFsXgE7iRfPrwIdwgG0Tl7i3+JQEJNTwF7i8QYLiApBiZMz
        n4DtYgaqaN46G+xSCYG5HBIPpu1hhLjUReLFk/fsELawxKvjW6BsKYnP7/ayQdjFEktnfWKC
        aG5glLi87RdUwlhi1rN2RpDFzAKaEut36UOcoyxx5BbUXj6JjsN/2SHCvBIdbUIQjeoSB7ZP
        Z4GwZSW653xmhSjxkDjyRgISVJOAgfDjD/sERoVZSL6ZheSbWQh7FzAyr2IUSy0ozk1PLTYq
        MIRHcHJ+7iZGcNrVct3BOPntB71DjEwcjIcYJTiYlUR4nZcWJAnxpiRWVqUW5ccXleakFh9i
        NAWG9ERmKdHkfGDizyuJNzSxNDAxMzM0NzI1MFcS5/VK2ZAoJJCeWJKanZpakFoE08fEwSnV
        wHTy7RnLsrZF78oE161eZXWs580ZNsZC/WrlBs9/X5v6fkzMU3GW9532WDzQLkNO7KyIkbHO
        0/7mDg6ey4axPJnXRIMkn6VuvnukPWEvp6zDPW9Tpq3/tab+nJwXaPE/f8ID5d739uodi3NK
        fwvYTc4OOb5y5jzN8qCngvfNFHcWXuTfsiwp5ce/F0wrBYX8tZ/1xswpVWbkC8iv7HiZ4npr
        esjU8zZzF2roH2tmk4s7U2Gd0Ssmv6RN/qLBbZNwfs3QBVrOK8/bqe5frc6kcdRAPuic4onr
        15dUCraUvZfktGbytldoFeXyXpSnPsc5pE+Z00TG/VEEy4m9VcfcN91oOHE16fZFll29q14q
        sRRnJBpqMRcVJwIA1Nb670QEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSnK6OQVGSwZOVfBYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALYoLpuU1JzMstQifbsE
        royeEzdYC34qVezfv4WlgfGAXBcjJ4eEgInErNMLWLsYuTiEBHYwSvzf9pcVIiEr8ezdDnYI
        W1jifssRqKL3jBL3vv5kA0mwCehKbHn+ihEkISIwgVnizZUP7CAOs8BORok7r06BVQkLBEpM
        uHsMbBSLgKrEh7fnGUFsXgE7iRfPrwLVcACtkJf4tzgUxOQUsJd4vMECxBQCqjg6qQiiWFDi
        5MwnLCA2M1Bx89bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93
        EyM4QrS0djDuWfVB7xAjEwfjIUYJDmYlEV7npQVJQrwpiZVVqUX58UWlOanFhxilOViUxHkv
        dJ2MFxJITyxJzU5NLUgtgskycXBKNTDNfp9w6EtF6Ye8B5xhp1dZNE7xbz1pJO6qbu90SiuX
        ky3JYaK/cLPLmixZk8X/vskoxZ06cPmh3AsXJvu8t2uXm4rNCdfx6P15s6hS8EdEvcDm2Jne
        DBuj/3/o4PaVm7zGh21m5aaHnuoXHUUZpk6XXa0xgzda558Hm9ONlsnaGu/ZxMozJtzTqezL
        nK5wa3bNNof82+yaNenzfTSzD7y7V/5JNeKDTrCQtfmKteXixk/T+T4yyjyRl56aXL/xo+Xh
        ouuFTDzxVr+Ot7Y+esJQLDCx6MiDZ+/qWQKXqTTcUWiczsAhZ/BWKebouY71vWsrL6kZlya8
        Mt4puL3iU/Za/W/MWw3VOFYosf/9pcRSnJFoqMVcVJwIAJyWliD/AgAA
X-CMS-MailID: 20220504075004epcas2p20f2dca86b740d0ff9471f09a90556a34
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075004epcas2p20f2dca86b740d0ff9471f09a90556a34
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075004epcas2p20f2dca86b740d0ff9471f09a90556a34@epcas2p2.samsung.com>
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

