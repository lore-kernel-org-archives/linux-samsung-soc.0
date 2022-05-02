Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19843C4167E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384012AbiEBJEo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384001AbiEBJEl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:41 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBE8583A8
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:07 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220502090105epoutp04aa578f7430dcb3f09df7107d7adf5cdc~rPjBKzhpp0363303633epoutp04e
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220502090105epoutp04aa578f7430dcb3f09df7107d7adf5cdc~rPjBKzhpp0363303633epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482065;
        bh=9RA62AZpptm+EvortWInAa4wTqPFi00PLiTarMiAx8k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YJHofYJjj/+by9yvq2NUJOi719p8mO+YvIphGV7gi7Lfa4OfBpa5qri7UDKmTJHvz
         qICd+avrhK016WlkMeh8xiyIydiE4WOvRFd6/QJtkQQTSK0i7gH2Y0C7azSxob81Y9
         C4ogL8XAiIefu7GiKrCtaTJDtbzz3OEUrOAZp+Ps=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220502090104epcas2p2f495bea07ce9a0ba6a8124ad866577fc~rPjAQ35Wg0159201592epcas2p2B;
        Mon,  2 May 2022 09:01:04 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.98]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KsHBR1rHLz4x9Q8; Mon,  2 May
        2022 09:01:03 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        89.F8.09694.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epcas2p38ab4e80279915cc14167d4f1c105bb49~rPi84TJx32252022520epcas2p3S;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220502090100epsmtrp29fe02280f0b52e2cf72dfa337754efa8~rPi81_yi53250332503epsmtrp2a;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-8d-626f9dcd2e5b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CB.EB.08853.CCD9F626; Mon,  2 May 2022 18:01:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epsmtip24cb63fe3a7c3e61f1175d908dd7e91ae~rPi8n1VHc1979619796epsmtip2Y;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
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
Subject: [PATCH 04/12] clk: samsung: exynosautov9: add cmu_core clock
 support
Date:   Mon,  2 May 2022 18:02:22 +0900
Message-Id: <20220502090230.12853-5-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmue7ZuflJBq+fiVo8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiism0yUhNTUosUUvOS
        81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgI5VUihLzCkFCgUkFhcr6dvZ
        FOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnfPj5lbHgsmJFbztv
        A+M3mS5GTg4JAROJZ6cOsXUxcnEICexglPj09Q0LhPOJUaLn20FGCOcbo8SSviksMC0/Pn9n
        A7GFBPYySkxeqw9R9JFR4vjPB6wgCTYBXYktz1+BdYsIdDFLXOy7BzaXWWArUNWNWUwgVcIC
        /hLTH58FG8UioCqx89NJMJtXwE7i0u11QDYH0Dp5iX+LQ0HCnAL2Eme2PmeEKBGUODnzCdhF
        zEAlzVtnM4PMlxBYyCFx5/QtVohTXSQ+z7gBZQtLvDq+hR3ClpL4/G4vG4RdLLF01icmiOYG
        RonL235BJYwlZj1rZwQ5gllAU2L9Ln2Ie5QljtyC2ssn0XH4LztEmFeio00IolFd4sD26dDA
        kpXonvMZ6gIPiYl9HdAQncQosfv+MtYJjAqzkLwzC8k7sxAWL2BkXsUollpQnJueWmxUYAKP
        4eT83E2M4MSr5bGDcfbbD3qHGJk4GA8xSnAwK4nwtm3ISRLiTUmsrEotyo8vKs1JLT7EaAoM
        64nMUqLJ+cDUn1cSb2hiaWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1ILUIpo+Jg1OqgWnG
        RT1txSwlL56YEw6zbEtj1R+eShKsZe8Oi13e++/rtakzPFjSxNcJ7Vj21VRD5NBb6+VB4obH
        T90492PN5/7dLozqVtuu5BspFST/vG2pYdFceimAe6ak5tnFL/1OyZq8eJFSyVEvc37Vbcfo
        N3P1+TrF2KOdNvJWfimXSfqVeZ9vldr0h4bPPkaFPD70aNuBllYPB4cc7fVyl28tnmh1Wt/g
        qvF57Xfbgp+01KZESVww3/l+Ucx71j1nXvsYBfH+2nWr3OKrqnT5X3Fpxnkl731u71ER8nru
        IfJaOXrXDnuTVxbBPqqFmU8y7gX8+BJybOuMhLm3wo/Zb5f5KjXri4P2AdVnTCyqXMu33lBi
        Kc5INNRiLipOBACSHc+VRQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO6ZuflJBk+W6Fg8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDI+/PzKWHBZsaK3nbeB8ZtMFyMnh4SAicSPz9/Zuhi5OIQEdjNKHHmzkh0iISvx7N0OKFtY
        4n7LEVaIoveMEk+nrGIESbAJ6Epsef6KESQhIjCBWeLNlQ/sIA6zwE5GiTuvTrGBVAkL+Er0
        bpgLZrMIqErs/HQSzOYVsJO4dHsdkM0BtEJe4t/iUJAwp4C9xJmtz8EWCAGV/DhxnxmiXFDi
        5MwnLCA2M1B589bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93
        EyM4RrQ0dzBuX/VB7xAjEwfjIUYJDmYlEd62DTlJQrwpiZVVqUX58UWlOanFhxilOViUxHkv
        dJ2MFxJITyxJzU5NLUgtgskycXBKNTCdZ1uw4tQ91u0xJVE7686tP3PPwPTG0nkPJU/+4e8z
        quJ7/lSW++Y6tobn+i+9+Av5mHoXmM+sEtDfVqRxV6T20sJlFqc+bhUyjKxZLZjWMmfrinhm
        xt1TlvG5LHNPK4n/5/JIXe/5BPN3pitO7Om+J2K+1j7zy+fDG2bwryqNW5u7/ZFgg9VLpy+a
        W1ZJ/KnIsuLNFTqxVPqpnSpv9aT9X+9I3MkSFC5SL5x6xFFAqmBeMGvJzArB/MlSVn9u5qTs
        0zmyWFVCWPLK1Hl99ZLlb95dV61nFDXkcPDcL6wbuHrv4rctakFBF74YFdzPW+MT1VLYuvuc
        Q8bzxeq/N7pbTn6seeXrB4V9F/h3LXutxFKckWioxVxUnAgAAmmchgADAAA=
X-CMS-MailID: 20220502090100epcas2p38ab4e80279915cc14167d4f1c105bb49
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p38ab4e80279915cc14167d4f1c105bb49
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090100epcas2p38ab4e80279915cc14167d4f1c105bb49@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add CMU_CORE clock which represents Core BUS clocks. The source clocks
of this CMU block are oscclk or dout_clkcmu_core_bus. Thus, two source
clocks should be provided via device tree. All the gate clocks are
defined as CLK_IS_CRITICAL because they control(gate/ungate) core bus
clocks but not been assigned to any drivers.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 92 ++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index b52073b1dd3d..64ed5e791b8a 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -959,3 +959,95 @@ static void __init exynosautov9_cmu_top_init(struct device_node *np)
 /* Register CMU_TOP early, as it's a dependency for other early domains */
 CLK_OF_DECLARE(exynosautov9_cmu_top, "samsung,exynosautov9-cmu-top",
 	       exynosautov9_cmu_top_init);
+
+/* ---- CMU_CORE ----------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_CORE (0x1b030000) */
+#define PLL_CON0_MUX_CLKCMU_CORE_BUS_USER				0x0600
+#define CLK_CON_MUX_MUX_CORE_CMUREF					0x1000
+#define CLK_CON_DIV_DIV_CLK_CORE_BUSP					0x1800
+#define CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_CLK			0x2000
+#define CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_PCLK			0x2004
+#define CLK_CON_GAT_CLK_BLK_CORE_UID_CORE_CMU_CORE_IPCLKPORT_PCLK	0x2008
+
+static const unsigned long core_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_CORE_BUS_USER,
+	CLK_CON_MUX_MUX_CORE_CMUREF,
+	CLK_CON_DIV_DIV_CLK_CORE_BUSP,
+	CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_CLK,
+	CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_CORE_UID_CORE_CMU_CORE_IPCLKPORT_PCLK,
+};
+
+/* List of parent clocks for Muxes in CMU_CORE */
+PNAME(mout_core_bus_user_p) = { "oscclk", "dout_clkcmu_core_bus" };
+
+static const struct samsung_mux_clock core_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_CORE_BUS_USER, "mout_core_bus_user", mout_core_bus_user_p,
+	    PLL_CON0_MUX_CLKCMU_CORE_BUS_USER, 4, 1),
+};
+
+static const struct samsung_div_clock core_div_clks[] __initconst = {
+	DIV(CLK_DOUT_CORE_BUSP, "dout_core_busp", "mout_core_bus_user",
+	    CLK_CON_DIV_DIV_CLK_CORE_BUSP, 0, 3),
+};
+
+static const struct samsung_gate_clock core_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_CORE_CCI_CLK, "gout_core_cci_clk", "mout_core_bus_user",
+	     CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_CLK, 21,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CORE_CCI_PCLK, "gout_core_cci_pclk", "dout_core_busp",
+	     CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_PCLK, 21,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CORE_CMU_CORE_PCLK, "gout_core_cmu_core_pclk",
+	     "dout_core_busp",
+	     CLK_CON_GAT_CLK_BLK_CORE_UID_CORE_CMU_CORE_IPCLKPORT_PCLK, 21,
+	     CLK_IS_CRITICAL, 0),
+};
+
+static const struct samsung_cmu_info core_cmu_info __initconst = {
+	.mux_clks		= core_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(core_mux_clks),
+	.div_clks		= core_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(core_div_clks),
+	.gate_clks		= core_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(core_gate_clks),
+	.nr_clk_ids		= CORE_NR_CLK,
+	.clk_regs		= core_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(core_clk_regs),
+	.clk_name		= "dout_clkcmu_core_bus",
+};
+
+static int __init exynosautov9_cmu_probe(struct platform_device *pdev)
+{
+	const struct samsung_cmu_info *info;
+	struct device *dev = &pdev->dev;
+
+	info = of_device_get_match_data(dev);
+	exynos_arm64_register_cmu(dev, dev->of_node, info);
+
+	return 0;
+}
+
+static const struct of_device_id exynosautov9_cmu_of_match[] = {
+	{
+		.compatible = "samsung,exynosautov9-cmu-core",
+		.data = &core_cmu_info,
+	}, {
+	},
+};
+
+static struct platform_driver exynosautov9_cmu_driver __refdata = {
+	.driver = {
+		.name = "exynosautov9-cmu",
+		.of_match_table = exynosautov9_cmu_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = exynosautov9_cmu_probe,
+};
+
+static int __init exynosautov9_cmu_init(void)
+{
+	return platform_driver_register(&exynosautov9_cmu_driver);
+}
+core_initcall(exynosautov9_cmu_init);
-- 
2.36.0

