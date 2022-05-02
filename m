Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A89C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384003AbiEBJEp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383991AbiEBJEm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:42 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC633583BF
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:07 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220502090103epoutp03660e9b62b7167e7971fc0ca4c3c34aae~rPi-rQTNE0307003070epoutp037
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220502090103epoutp03660e9b62b7167e7971fc0ca4c3c34aae~rPi-rQTNE0307003070epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482063;
        bh=EuqNPysQKRh9ZL1vEG/30sm6QJtVQq0KPogKj7u5KfI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YvARbq8+47gry6n9k5QaJS8YrqKba3QG8HfqFKmIjLIEkslLtMYOOerklhj3OaBJ6
         9hi4gzbVsNU/UMAYmuAfTQf7mDY0LkOTT4Tv5itp9Fc7Pno9xMedqjY3k1+I6ajTx8
         tHqUxBKSHj5WhgPBolNoj+mXx2ozNp1H6lQiSbEQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220502090103epcas2p4b8a583d7aeeceb6316b4f5a9e7da2cc3~rPi_8Xttt0489804898epcas2p4i;
        Mon,  2 May 2022 09:01:03 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.92]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4KsHBP5GJ8z4x9Q3; Mon,  2 May
        2022 09:01:01 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        CA.7D.10069.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epcas2p283ed86d6bf1774cd596aff53267e84b8~rPi84INeK0428104281epcas2p2m;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220502090100epsmtrp2d50c3b7305a21d175c972f0da8d0fc41~rPi827YkJ3250332503epsmtrp2b;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-6e-626f9dcd9ef5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        12.FB.08924.CCD9F626; Mon,  2 May 2022 18:01:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epsmtip2b338b7a0b4b3021c2575317dd210dd5d~rPi8r37QF1979719797epsmtip2T;
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
Subject: [PATCH 05/12] clk: samsung: exynosautov9: add cmu_peris clock
 support
Date:   Mon,  2 May 2022 18:02:23 +0900
Message-Id: <20220502090230.12853-6-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmqe7ZuflJBr+vils8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiism0yUhNTUosUUvOS
        81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgI5VUihLzCkFCgUkFhcr6dvZ
        FOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnvPm+ir2gXbLi3o5V
        bA2M50S7GDk5JARMJKZ9Ws/WxcjFISSwg1Hi/OVd7BDOJ0aJWXfXsEA4nxklWl/OZoRpmbrw
        FiNEYhejxL8311khnI+MEmv3LmIGqWIT0JXY8vwVWJWIQBezxMW+e2CzmAW2MkocvzGLCaRK
        WCBAYs3OV2BzWQRUJQ4t7wOzeQXsJPav+gg0lgNon7zEv8WhIGFOAXuJM1ufQ5UISpyc+YQF
        xGYGKmneOpsZZL6EwFIOiX9TmtghbnWR2Hj/GBuELSzx6vgWqLiUxOd3e6HixRJLZ31igmhu
        YJS4vO0XVMJYYtazdkaQI5gFNCXW79KHuEdZ4sgtqL18Eh2H/7JDhHklOtqEIBrVJQ5sn84C
        YctKdM/5DPWJh8T93ipIWE1ilDh44A/LBEaFWUi+mYXkm1kIexcwMq9iFEstKM5NTy02KjCE
        R3Fyfu4mRnDq1XLdwTj57Qe9Q4xMHIyHGCU4mJVEeNs25CQJ8aYkVlalFuXHF5XmpBYfYjQF
        BvVEZinR5Hxg8s8riTc0sTQwMTMzNDcyNTBXEuf1StmQKCSQnliSmp2aWpBaBNPHxMEp1cC0
        OeL317ZDO7Q7TWQ4kzPKjj06a/rPOW9e7atJJYk3OFLMyw703knT4Ty0YY+HKdOBLZ4VIR4n
        fcLdN9h+POeqZXV9Rfxl07TzizKzXN/kTxd6eG6v1fpeJ4akRP2OivnpG7JOTOe1O3N4h87M
        m8uN3vDM2cLeN2nr9Lvy0XKORuf8ea7uvi6+Wdre/fxauSeHbB6eOvfOyF9lad6iL1kdobwF
        zJ0FO05ndmq+Pp3o85pd54/3Y4tLT7MDl1Wy72NbcD2Wm8+o7dnx6bOs2H4YBtiH/yhZYJvC
        cjpm97naf7P+zeHi4mKcXvh4g4Qex16LKTr/jom7vl8lePrF1DaPmHPrmCSE5H69XyE/tcNb
        iaU4I9FQi7moOBEA1jrEwkYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSvO6ZuflJBjdPG1g8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDLefF/FXtAuWXFvxyq2BsZzol2MnBwSAiYSUxfeYuxi5OIQEtjBKDHlyDsmiISsxLN3O9gh
        bGGJ+y1HWCGK3jNK7JmzlgUkwSagK7Hl+SuwbhGBCcwSb658YAdxmAV2MkrceXWKDaRKWMBP
        4sajh8wgNouAqsSh5X2MIDavgJ3E/lUfgcZyAK2Ql/i3OBQkzClgL3Fm63OwEiGgkh8n7jND
        lAtKnJz5BGwxM1B589bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10v
        OT93EyM4SrS0djDuWfVB7xAjEwfjIUYJDmYlEd62DTlJQrwpiZVVqUX58UWlOanFhxilOViU
        xHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTAZbjonOXVqjV1qvkM687rpJ3cc/f7m5f7epSru
        aQlWoQpVJ87w3Ttj+S59k8zU1imv/0yOm6SgljFpzX3P+ek2F3+vj51x1thx4pV19/2KP3mE
        Fu647q8w9eGLrf3xhY6LD+pES3aI833PfPOlQGODjfRXixltpw1mVPQd3HNgwenJ6Qq2nFm9
        2wO9nwUJr2A5svHDsj2sXWx+fmW1dbUbVm/fzuk3RzpxXeq3l1wq81cuPv5S7avTrY0ezleD
        nHdNcdvybf+Wk3wxMSnvtpXxqd/nFvu9s5DR9eprTf0Y/kvmJ9+EyavMb28suLG4YTuDlv1b
        56xdN9fPaZjl8+DiTUPVNcpsZZ/W+G7r3CNkosRSnJFoqMVcVJwIAI/uh84BAwAA
X-CMS-MailID: 20220502090100epcas2p283ed86d6bf1774cd596aff53267e84b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p283ed86d6bf1774cd596aff53267e84b8
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090100epcas2p283ed86d6bf1774cd596aff53267e84b8@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_PERIS is responsible to control clocks of BLK_PERIS which has
OPT/MCT/WDT and TMU. This patch only supports WDT gate clocks and all
other clocks except WDT will be supported later.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 51 ++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 64ed5e791b8a..78b7366702a6 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1018,6 +1018,53 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_core_bus",
 };
 
+/* ---- CMU_PERIS ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIS (0x10020000) */
+#define PLL_CON0_MUX_CLKCMU_PERIS_BUS_USER	0x0600
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK	0x2058
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER0_IPCLKPORT_PCLK	0x205c
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER1_IPCLKPORT_PCLK	0x2060
+
+static const unsigned long peris_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIS_BUS_USER,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER1_IPCLKPORT_PCLK,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIS */
+PNAME(mout_peris_bus_user_p) = { "oscclk", "dout_clkcmu_peris_bus" };
+
+static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
+	    mout_peris_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIS_BUS_USER, 4, 1),
+};
+
+static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_SYSREG_PERIS_PCLK, "gout_sysreg_peris_pclk",
+	     "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_WDT_CLUSTER0, "gout_wdt_cluster0", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT_CLUSTER1, "gout_wdt_cluster1", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER1_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info peris_cmu_info __initconst = {
+	.mux_clks		= peris_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peris_mux_clks),
+	.gate_clks		= peris_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(peris_gate_clks),
+	.nr_clk_ids		= PERIS_NR_CLK,
+	.clk_regs		= peris_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peris_clk_regs),
+	.clk_name		= "dout_clkcmu_peris_bus",
+};
+
 static int __init exynosautov9_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1034,6 +1081,10 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 		.compatible = "samsung,exynosautov9-cmu-core",
 		.data = &core_cmu_info,
 	}, {
+	}, {
+		.compatible = "samsung,exynosautov9-cmu-peris",
+		.data = &peris_cmu_info,
+	}, {
 	},
 };
 
-- 
2.36.0

