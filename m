Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356BFC43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380986AbiEBJE4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384019AbiEBJEp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:45 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69C858E46
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:14 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220502090105epoutp036d8f8130943af2e9f7b0983ada3d8ffe~rPjBSVjz80334603346epoutp03y
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220502090105epoutp036d8f8130943af2e9f7b0983ada3d8ffe~rPjBSVjz80334603346epoutp03y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482065;
        bh=tVcrsOt7ba+76kaATj9MwwrV3KgtdbQec82KjR1jH6o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PYtDnCZpCNAw4EP6FaID5huz9b0bduIHsBnp7MWPb1Sb4OH75XqQ5U3eG5Y+CEiXC
         G4gc75pMDVgkTweDb33/XZwTj7irWriSBrDKIXpgVTQKkim1ITJtf2drAOerbvDdT5
         uCxyoHo/WAhCESzi1A8EYv5SUA0tadkgckUuFPIM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220502090104epcas2p193586a484556d22ac13aa0043d075473~rPjAbAcDc1926119261epcas2p1Y;
        Mon,  2 May 2022 09:01:04 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.91]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KsHBP3QNmz4x9QC; Mon,  2 May
        2022 09:01:01 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        F7.53.09764.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090101epcas2p259f09e3ca3ba6361c47d39a66d9fd172~rPi8-AXym0159201592epcas2p2w;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220502090100epsmtrp15d9b78a2373faa30ad8c0e2fd53a978d~rPi8_MOJN2529725297epsmtrp1d;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-eb-626f9dcdb301
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        13.FB.08924.CCD9F626; Mon,  2 May 2022 18:01:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epsmtip20dcd6dbe368d800b0a978db1b1c4e922~rPi8z29PD1979719797epsmtip2U;
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
Subject: [PATCH 07/12] clk: samsung: exynosautov9: add cmu_fsys2 clock
 support
Date:   Mon,  2 May 2022 18:02:25 +0900
Message-Id: <20220502090230.12853-8-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmme7ZuflJBstaxS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Iz5s02LtimVLHg8lvm
        BsYmuS5GTg4JAROJZctnsXUxcnEICexglHi5dQYzSEJI4BOjxM+lBhD2Z0aJDyeMYRpOd01i
        hmjYxSjxZv9EFgjnI6PE5bVd7CBVbAK6Eluev2IESYgIdDFLXOy7B1bFLLCVUeL4jVlMIFXC
        AgESa37/BrNZBFQltrw4wQpi8wrYSbx/sRjI5gDaJy/xb3EoSJhTwF7izNbnjBAlghInZz5h
        AbGZgUqat84GO0lCYCGHRH/vXnaIW10kpl1+ywZhC0u8Or4FKi4l8bK/Dcoullg66xMTRHMD
        0AvbfkE1GEvMetbOCHIEs4CmxPpd+hD3KEscuQW1l0+i4/Bfdogwr0RHmxBEo7rEge3TWSBs
        WYnuOZ9ZIWwPicOrbkJDbhKjxMXbS1knMCrMQvLOLCTvzEJYvICReRWjWGpBcW56arFRgRE8
        gpPzczcxgtOultsOxilvP+gdYmTiYDzEKMHBrCTC27YhJ0mINyWxsiq1KD++qDQntfgQoykw
        rCcyS4km5wMTf15JvKGJpYGJmZmhuZGpgbmSOK9XyoZEIYH0xJLU7NTUgtQimD4mDk6pBqZ1
        Pyf++/LuuMqe+cwxEwpXh27Su/LwWV7exyMSAednX8/ZveiRbqCVa/TqrPd9WtOm8LBvN7zu
        ffom38Tz3QHN501zDaf48xruUopp3vd1pXliccr9NW5Mt2/NEGaYbbjD35Q1Oy04tKY+avdE
        Bacq/pql4jmmi0/8ZXjCu6nvzYu1HEabVpZ/ZxN1aT2p8/2P4/Y/VqEqqVUXFrFXv/qt9vvA
        8xfLO55tin1z1nGDQyJn8L3UKSx80tW3Utx3LPsmactYfH36GaF7Hg/ZOTzfedwJ688zmXXP
        /t50seWnLtumbHFRi9CfvtR/WuaCnyd5BMR/fKmL5AvaIsy6JXwZ21frwHkFqtccZmQ4VpxV
        YinOSDTUYi4qTgQAYVU1zUQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO6ZuflJBuseWVg8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDLmzTYu2KZUseDyW+YGxia5LkZODgkBE4nTXZOYuxi5OIQEdjBK/Ht7jQ0iISvx7N0Odghb
        WOJ+yxFWiKL3jBKn381hBUmwCehKbHn+ihEkISIwgVnizZUP7CAOs8BORok7r06BjRIW8JOY
        vnIOE4jNIqAqseXFCbBuXgE7ifcvFgPZHEAr5CX+LQ4FCXMK2Euc2fqcEcQWAir5ceI+M0S5
        oMTJmU9YQGxmoPLmrbOZJzAKzEKSmoUktYCRaRWjZGpBcW56brFhgVFearlecWJucWleul5y
        fu4mRnCMaGntYNyz6oPeIUYmDsZDjBIczEoivG0bcpKEeFMSK6tSi/Lji0pzUosPMUpzsCiJ
        817oOhkvJJCeWJKanZpakFoEk2Xi4JRqYGItLRSqm54Q03nktuKbkx0GR/2tdRQnsae6GbT9
        9fTenv9DuiSkzavia97TXUrxrHMWpEk2pu3KbXD1uGoUVV8dc7XBjW3rsema2s97/s9Rbsy8
        a7T8743pkuFibKdadk5vWaIvxM73MWjHernQ6C2C/BrbdBwjzZ+t+2XKfXjeW+8v6s1HhHWt
        lMxW20/fUs4lW+ewnfsQ9+7ohVKT0q9r2m4UDtp1+eh3zX26JWopqfzP0zbvMvzx902cgd/6
        xq6Cqms/zPdc/dTKsCaNfevd0E2Cc4+dfOfmysN39ZzYe0FH6d62k5l6gl8CLzT9aj99tEc8
        8kbN0gWZZtZPembu7ZBZJ8B0gi9f+tlmJZbijERDLeai4kQA8QcyNAADAAA=
X-CMS-MailID: 20220502090101epcas2p259f09e3ca3ba6361c47d39a66d9fd172
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090101epcas2p259f09e3ca3ba6361c47d39a66d9fd172
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090101epcas2p259f09e3ca3ba6361c47d39a66d9fd172@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_FSYS2 is responsible to control clocks of BLK_FSYS2 which includes
ufs and ethernet IPs. This patch adds some essential clocks to be
controlled by ethernet/ufs drivers instead of listing full clocks.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 69 ++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 65d769875297..ebc759c18e19 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1070,6 +1070,73 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
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
@@ -1136,6 +1203,8 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
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

