Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BFAC25B06
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 06:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiG0GGZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 02:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiG0GGW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 02:06:22 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2584B3FA00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 23:06:19 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220727060614epoutp02d1701a8cd64e4585214124668e0ff056~Fmo55JBd70112201122epoutp02y
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 06:06:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220727060614epoutp02d1701a8cd64e4585214124668e0ff056~Fmo55JBd70112201122epoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658901974;
        bh=WVG/Yfuy9FyeGlk4yN28GfGdqKJ8YKAkweORZuwp4xU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cSJAjjwIrjduTwoJc5yzVtzmMKD1hD6WrmEfoDpIDYhPy3RkKWw1KYrn3fthvkqVq
         gJB8HtnctuxzTA+z1G+umAx0Lr7dlIbi+lfpOR+umY16Vb9V5FuBpp5JnICXzcINQd
         8Nnme/EMzhHLkgBYbR1DzrRmshRNtAmoDDI/MOEI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220727060613epcas2p457211e0c782fffc0b2c1ade640f2a438~Fmo5JtYS60671106711epcas2p4E;
        Wed, 27 Jul 2022 06:06:13 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Lt3F11vt5z4x9Q1; Wed, 27 Jul
        2022 06:06:13 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        43.A1.09650.5D5D0E26; Wed, 27 Jul 2022 15:06:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epcas2p1e79b8d8bfb9e8a3ea351c4dbd7c42b7d~Fmo4Wj-JB1715217152epcas2p1P;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220727060612epsmtrp161098261486308528d09ffa2427e44c2~Fmo4VugLO0507005070epsmtrp1V;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
X-AuditID: b6c32a46-0b9ff700000025b2-41-62e0d5d56f6b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        31.EB.08905.4D5D0E26; Wed, 27 Jul 2022 15:06:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epsmtip17ebe1cdd3ac9239002b00faaefca3231~Fmo4JDxlu2961129611epsmtip1O;
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
Subject: [PATCH 5/6] clk: samsung: exynosautov9: add fsys0 clock support
Date:   Wed, 27 Jul 2022 15:01:45 +0900
Message-Id: <20220727060146.9228-6-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727060146.9228-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmue7Vqw+SDM4f4rJ4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2qGyb
        jNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKCrlRTKEnNK
        gUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGR86
        7jMXtGZW/Po5kbGB8XZMFyMnh4SAicS813fYuxi5OIQEdjBKTOxohHI+MUp82H+eFcL5xijR
        8GY7G0zL1h0bmSESexkl/nw/xAbhfGSUeHhjITtIFZuArsSW568YQRIiAo+ZJA4faQOrYhZo
        Y5KY9mwjK0iVsICHxIXWV2A2i4CqxJsb/8G6eQVsJU6da2eG2Ccvcf1mG5jNKWAnsWPNTiaI
        GkGJkzOfsIDYzEA1zVtng90kIbCSQ2J+31WoY10kjty+zwphC0u8Or6FHcKWknjZ3wZlF0ss
        nfWJCaK5gVHi8rZfUM3GErOetQP9wAG0QVNi/S59EFNCQFniyC2ovXwSHYf/skOEeSU62oQg
        GtUlDmyfzgJhy0p0z/kMdYGHRNfHnYyQ0JrIKDFt7h7mCYwKs5C8MwvJO7MQFi9gZF7FKJZa
        UJybnlpsVGAEj+Tk/NxNjOCErOW2g3HK2w96hxiZOBgPMUpwMCuJ8CZE308S4k1JrKxKLcqP
        LyrNSS0+xGgKDOyJzFKiyfnAnJBXEm9oYmlgYmZmaG5kamCuJM7rlbIhUUggPbEkNTs1tSC1
        CKaPiYNTqoFpcU1/As/tx/O2Mv/NYOf7wTt708SC1YHv5bmEmqxyrzXzNiedUHpw/7Pyxkl8
        4c4N7/nmiU3m6JOeXlj37eTvzw6TmJbc5n77v1VGcObHpVqhlV5W0xX2/HLQ8C2s4546l5n3
        Ej9DwqaCOP/pfPdNvdUPMyQobe/6PWeffURCyv6EX9e2cDHaHb6Sa/SJ//ii+dx77nJ+W2Re
        eHdXvQXrj/0lHnk5EyrMmyr1HT5fd2Ca3/1xfYUtH6vp8y0XBTannohes9k5+nuiu5zAigbG
        Vddy3A6smX/ruo7MwRMJx+5Ovz39mXL3+Qm3JjZb9XkcNPqyTfmBtY52SeRuudc3xGPWxqTG
        Be2a/Y03XXaeEktxRqKhFnNRcSIALpH0FlEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWy7bCSnO6Vqw+SDO5f0rZ4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2KC6b
        lNSczLLUIn27BK6MDx33mQtaMyt+/ZzI2MB4O6aLkZNDQsBEYuuOjcxdjFwcQgK7GSUWH7zF
        DpGQlXj2bgeULSxxv+UIK4gtJPCeUWL1ak8Qm01AV2LL81eMIM0iAs+ZJKasOAjmMAt0MUnc
        afsE1i0s4CFxofUVWDeLgKrEmxv/weK8ArYSp861M0NskJe4frMNzOYUsJPYsWYnE8Q2W4mZ
        r5pYIOoFJU7OfAJmMwPVN2+dzTyBUWAWktQsJKkFjEyrGCVTC4pz03OLDQsM81LL9YoTc4tL
        89L1kvNzNzGC40ZLcwfj9lUf9A4xMnEwHmKU4GBWEuFNiL6fJMSbklhZlVqUH19UmpNafIhR
        moNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVAPT6l2+T0oSdRQTGs8/WPQ59PSShSEuUyvY
        jPZE8+y96BQbu8/ITvci27svcgZhOTyLTx7Z8SHG+fC80u+zO6PjrYIKqia2nvn01SfNX+HJ
        zL4TxTzJ7CmB72y3HPYOir7LtWCaQ8trwejnSZJfVbatqhLVn77yhHZ7bMo75o7bRntLJ/7P
        0FCXdt3Rs1hiW9VpbsUj/2JnLp58rPra5V8njJYy5EpfDrs4T1QqNjTjvP2SK/2dea8a0ry1
        mL/7SPO7HEuPzNga9ljfvyviNTtPghHjqyUahg9frF/9KNovqtJ8xtqtJ4MLzoc8FvjzU7LC
        vn639bcnrw0/l2zLvev38NjZuz4WOwze2HfEJJgqsRRnJBpqMRcVJwIARYfnoQoDAAA=
X-CMS-MailID: 20220727060612epcas2p1e79b8d8bfb9e8a3ea351c4dbd7c42b7d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727060612epcas2p1e79b8d8bfb9e8a3ea351c4dbd7c42b7d
References: <20220727060146.9228-1-chanho61.park@samsung.com>
        <CGME20220727060612epcas2p1e79b8d8bfb9e8a3ea351c4dbd7c42b7d@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_FSYS0 block provides clocks for PCIe Gen3 1 x 4Lanes and 2 x 2
Lanes.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 243 +++++++++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index d9e1f8e4a7b4..527a6837661e 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1067,6 +1067,246 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_core_bus",
 };
 
+/* ---- CMU_FSYS0 ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_FSYS2 (0x17700000) */
+#define PLL_CON0_MUX_CLKCMU_FSYS0_BUS_USER	0x0600
+#define PLL_CON0_MUX_CLKCMU_FSYS0_PCIE_USER	0x0610
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_FSYS0_CMU_FSYS0_IPCLKPORT_PCLK	0x2000
+
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_PHY_REFCLK_IN	0x2004
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PHY_REFCLK_IN	0x2008
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_PHY_REFCLK_IN	0x200c
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PHY_REFCLK_IN	0x2010
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_PHY_REFCLK_IN	0x2014
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PHY_REFCLK_IN	0x2018
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_DBI_ACLK	0x205c
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_MSTR_ACLK	0x2060
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_SLV_ACLK	0x2064
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_DBI_ACLK	0x206c
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_MSTR_ACLK	0x2070
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_SLV_ACLK	0x2074
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PIPE_CLK	0x207c
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_DBI_ACLK	0x2084
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_MSTR_ACLK	0x2088
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_SLV_ACLK	0x208c
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_DBI_ACLK	0x2094
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_MSTR_ACLK	0x2098
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_SLV_ACLK	0x209c
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PIPE_CLK	0x20a4
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_DBI_ACLK		0x20ac
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_MSTR_ACLK	0x20b0
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_SLV_ACLK		0x20b4
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_DBI_ACLK		0x20bc
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_MSTR_ACLK	0x20c0
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_SLV_ACLK		0x20c4
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PIPE_CLK		0x20cc
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L0_CLK		0x20d4
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L1_CLK		0x20d8
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_4L_CLK		0x20dc
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L0_CLK		0x20e0
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L1_CLK		0x20e4
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_4L_CLK		0x20e8
+
+
+static const unsigned long fsys0_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_FSYS0_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_FSYS0_PCIE_USER,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_FSYS0_CMU_FSYS0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_PHY_REFCLK_IN,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PHY_REFCLK_IN,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_PHY_REFCLK_IN,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PHY_REFCLK_IN,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_PHY_REFCLK_IN,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PHY_REFCLK_IN,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PIPE_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PIPE_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PIPE_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L0_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L1_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_4L_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L0_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L1_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_4L_CLK,
+};
+
+/* List of parent clocks for Muxes in CMU_FSYS0 */
+PNAME(mout_fsys0_bus_user_p) = { "oscclk", "dout_clkcmu_fsys0_bus" };
+PNAME(mout_fsys0_pcie_user_p) = { "oscclk", "dout_clkcmu_fsys0_pcie" };
+
+static const struct samsung_mux_clock fsys0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_FSYS0_BUS_USER, "mout_fsys0_bus_user",
+	    mout_fsys0_bus_user_p, PLL_CON0_MUX_CLKCMU_FSYS0_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_FSYS0_PCIE_USER, "mout_fsys0_pcie_user",
+	    mout_fsys0_pcie_user_p, PLL_CON0_MUX_CLKCMU_FSYS0_PCIE_USER, 4, 1),
+};
+
+static const struct samsung_gate_clock fsys0_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_FSYS0_BUS_PCLK, "gout_fsys0_bus_pclk",
+	     "mout_fsys0_bus_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_FSYS0_CMU_FSYS0_IPCLKPORT_PCLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+
+	/* Gen3 2L0 */
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_REFCLK,
+	     "gout_fsys0_pcie_gen3_2l0_x1_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_REFCLK,
+	     "gout_fsys0_pcie_gen3_2l0_x2_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x1_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x1_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x1_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x2_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x2_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x2_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3A_2L0_CLK,
+	     "gout_fsys0_pcie_gen3a_2l0_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L0_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3B_2L0_CLK,
+	     "gout_fsys0_pcie_gen3b_2l0_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L0_CLK,
+	     21, 0, 0),
+
+	/* Gen3 2L1 */
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_REFCLK,
+	     "gout_fsys0_pcie_gen3_2l1_x1_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_REFCLK,
+	     "gout_fsys0_pcie_gen3_2l1_x2_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x1_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x1_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x1_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x2_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x2_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x2_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3A_2L1_CLK,
+	     "gout_fsys0_pcie_gen3a_2l1_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L1_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3B_2L1_CLK,
+	     "gout_fsys0_pcie_gen3b_2l1_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L1_CLK,
+	     21, 0, 0),
+
+	/* Gen3 4L */
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_REFCLK,
+	     "gout_fsys0_pcie_gen3_4l_x2_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_REFCLK,
+	     "gout_fsys0_pcie_gen3_4l_x4_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x2_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x2_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x2_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x4_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x4_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x4_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3A_4L_CLK,
+	     "gout_fsys0_pcie_gen3a_4l_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_4L_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3B_4L_CLK,
+	     "gout_fsys0_pcie_gen3b_4l_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_4L_CLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
+	.mux_clks		= fsys0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(fsys0_mux_clks),
+	.gate_clks		= fsys0_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(fsys0_gate_clks),
+	.nr_clk_ids		= FSYS0_NR_CLK,
+	.clk_regs		= fsys0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(fsys0_clk_regs),
+	.clk_name		= "dout_clkcmu_fsys0_bus",
+};
+
 /* ---- CMU_FSYS2 ---------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_FSYS2 (0x17c00000) */
@@ -1701,6 +1941,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-core",
 		.data = &core_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov9-cmu-fsys0",
+		.data = &fsys0_cmu_info,
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-fsys2",
 		.data = &fsys2_cmu_info,
-- 
2.37.1

