Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF73C19F2D
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 06:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiG0GG0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 02:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiG0GGX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 02:06:23 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257C83F33F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 23:06:19 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220727060614epoutp03cb5cea6713e09e6d0752112c7482a8c9~Fmo5joEnD3152231522epoutp03o
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 06:06:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220727060614epoutp03cb5cea6713e09e6d0752112c7482a8c9~Fmo5joEnD3152231522epoutp03o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658901974;
        bh=u8vXZOehrCiIJwHzkxgkg5b7lEZc52UvAg/pnB7qZOo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KXYNleEe0sd+vcW1etB4Q6wWllk6lyoMYnSIcABb820CkHnsTA0rRIOp+qEK5Fl6N
         UFMv0ekBQnTaZ9dwp6MM4Po1dgJWcMoZWwelB4AAYATbd8CvV+Rt/zbj3JzZKJB7Dl
         ylxM7sqYuYKzlSwRlTbecofuBtOx+xgZXwvvQhjM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220727060613epcas2p22b4ac9517c58cd4527cd36002c1d8146~Fmo43MD2E2397123971epcas2p2W;
        Wed, 27 Jul 2022 06:06:13 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.91]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Lt3F104QDz4x9QM; Wed, 27 Jul
        2022 06:06:13 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        B1.6D.09642.4D5D0E26; Wed, 27 Jul 2022 15:06:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epcas2p355e7f9ca3700cad4778e944cbdbf2d50~Fmo4GIq8a1065410654epcas2p35;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220727060612epsmtrp2afb298f10c3de36e2af79f2c4e5d3bfa~Fmo4EPVt72781327813epsmtrp2z;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
X-AuditID: b6c32a47-5f7ff700000025aa-c3-62e0d5d4f2d2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        41.50.08802.4D5D0E26; Wed, 27 Jul 2022 15:06:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epsmtip192d252485799370b0828d5fb9f19fdea~Fmo32WL6B2680226802epsmtip1S;
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
Subject: [PATCH 1/6] dt-bindings: clk: exynosautov9: add fys0 clock
 definitions
Date:   Wed, 27 Jul 2022 15:01:41 +0900
Message-Id: <20220727060146.9228-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727060146.9228-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRmVeSWpSXmKPExsWy7bCmqe6Vqw+SDM48M7d4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2qGyb
        jNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKCrlRTKEnNK
        gUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGauX
        z2Qq+C5ccXbfIsYGxpeCXYycHBICJhKrTz9m62Lk4hAS2MEocW7eGyYI5xOjxK4l65ghnM+M
        Ev2NU9lhWr6cfscOkdjFKPFiZQ9YQkjgI6PEo3d6IDabgK7EluevGEGKRAQeM0kcPtIGtoRZ
        oI1JYtqzjawgVcICgRI/H59gA7FZBFQlvhxqYQGxeQVsJfre7meBWCcvcf1mGzOIzSlgJ7Fj
        zU4miBpBiZMzn4DVMAPVNG+dDXarhMBaDolTp7ZBNbtIbFt3mxnCFpZ4dXwL1A9SEp/f7WWD
        sIslls76xATR3MAocXnbL6iEscSsZ+1AP3AAbdCUWL9LH8SUEFCWOHILai+fRMfhv+wQYV6J
        jjYhiEZ1iQPbp0NdICvRPeczK4TtIdH2aSULJLAmMkpMehk4gVFhFpJvZiH5ZhbC3gWMzKsY
        xVILinPTU4uNCozhUZycn7uJEZyMtdx3MM54+0HvECMTB+MhRgkOZiUR3oTo+0lCvCmJlVWp
        RfnxRaU5qcWHGE2BYT2RWUo0OR+YD/JK4g1NLA1MzMwMzY1MDcyVxHm9UjYkCgmkJ5akZqem
        FqQWwfQxcXBKNTCJ2wa/N2CQjn85/a/uszKJhIAmeYuu2q2zX5rYbVV6NYd/45of3PdWdzt9
        PsN1kJeJeUniJL7DS5V0pm77+qvsVlmHhuWWSV6h1aXObq9LyyS/Bv69HeQp9NyuYIqA7vNS
        cffHBxyTxNn3q/3/L168dZNtYfW+10J5DoEa+RNTz67k8+laxiWdvKMte/n05erys4qlPHJl
        XrOe+7hjlaLFAfNcp98qSaffvtvVuoFn7o7gjLW8Nqfz5nlGh0w6vdLR7cLF8nescqlPFHbb
        uHj67j+v9ta8aW7Lrxl8fU+LDTwbIp4/vC1R+tgmLVRrQ5Sy2DoLP8NzvexPPkv7X2U+nBlk
        dGgy5ytdPqGCp0osxRmJhlrMRcWJAH670P9PBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSnO6Vqw+SDOb8F7d4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2KC6b
        lNSczLLUIn27BK6M1ctnMhV8F644u28RYwPjS8EuRk4OCQETiS+n37F3MXJxCAnsYJT4+mQV
        M0RCVuLZux3sELawxP2WI6wQRe8ZJdZs3QRWxCagK7Hl+StGkISIwHMmiSkrDoI5zAJdTBJ3
        2j6BtQsL+EtsPP+IDcRmEVCV+HKohQXE5hWwleh7u58FYoW8xPWbbWBTOQXsJHas2ckEYgsB
        1cx81QRVLyhxcuYTMJsZqL5562zmCYwCs5CkZiFJLWBkWsUomVpQnJueW2xYYJSXWq5XnJhb
        XJqXrpecn7uJERw5Wlo7GPes+qB3iJGJg/EQowQHs5IIb0L0/SQh3pTEyqrUovz4otKc1OJD
        jNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUamOxnKOy1ZL/dKl30NVTUqfSzAeuKeQe6
        5sQk2P/8JZ+qdfZj2tfVghf288ftKVbw1P+u9vTqioPff+habl128WZJtbVyQlWzy4aLN7YI
        Fz6ZFX3bM1ro6V/3TAX998F2S0zVJ8/8u2NrzNwVWi+NnVyu3dFat2mjspbuQpuCc3wWTyYL
        GTgVMzJ3zWie2cBxXPtu9NdnLQ5c7wREdcRM8gNn21nmXf6/wdTg9tEvLF9P2/OZB5fzxDE7
        Bx6uvavTeidpgbTxvW8LnBf/7n8kdOLvzWPz734rr5v5yqr5/Y31c2awiaU5u/gan30ac3nG
        5R/S61NPBypdbRHMk55/qai2+tf8lYzqbUKT13xv8FViKc5INNRiLipOBAD7+/LgCwMAAA==
X-CMS-MailID: 20220727060612epcas2p355e7f9ca3700cad4778e944cbdbf2d50
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727060612epcas2p355e7f9ca3700cad4778e944cbdbf2d50
References: <20220727060146.9228-1-chanho61.park@samsung.com>
        <CGME20220727060612epcas2p355e7f9ca3700cad4778e944cbdbf2d50@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add fsys0(for PCIe) clock definitions.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../dt-bindings/clock/samsung,exynosautov9.h  | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
index ea9f91b4eb1a..6305a84396ce 100644
--- a/include/dt-bindings/clock/samsung,exynosautov9.h
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -185,6 +185,49 @@
 
 #define CORE_NR_CLK			6
 
+/* CMU_FSYS0 */
+#define CLK_MOUT_FSYS0_BUS_USER		1
+#define CLK_MOUT_FSYS0_PCIE_USER	2
+#define CLK_GOUT_FSYS0_BUS_PCLK		3
+
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_REFCLK		4
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_REFCLK		5
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_DBI_ACLK	6
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_MSTR_ACLK	7
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_SLV_ACLK	8
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_DBI_ACLK	9
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_MSTR_ACLK	10
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_SLV_ACLK	11
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_PIPE_CLK	12
+#define CLK_GOUT_FSYS0_PCIE_GEN3A_2L0_CLK		13
+#define CLK_GOUT_FSYS0_PCIE_GEN3B_2L0_CLK		14
+
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_REFCLK		15
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_REFCLK		16
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_DBI_ACLK	17
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_MSTR_ACLK	18
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_SLV_ACLK	19
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_DBI_ACLK	20
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_MSTR_ACLK	21
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_SLV_ACLK	22
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_PIPE_CLK	23
+#define CLK_GOUT_FSYS0_PCIE_GEN3A_2L1_CLK		24
+#define CLK_GOUT_FSYS0_PCIE_GEN3B_2L1_CLK		25
+
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_REFCLK		26
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_REFCLK		27
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_DBI_ACLK		28
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_MSTR_ACLK	29
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_SLV_ACLK		30
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_DBI_ACLK		31
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_MSTR_ACLK	32
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_SLV_ACLK		33
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_PIPE_CLK		34
+#define CLK_GOUT_FSYS0_PCIE_GEN3A_4L_CLK		35
+#define CLK_GOUT_FSYS0_PCIE_GEN3B_4L_CLK		36
+
+#define FSYS0_NR_CLK			37
+
 /* CMU_FSYS2 */
 #define CLK_MOUT_FSYS2_BUS_USER		1
 #define CLK_MOUT_FSYS2_UFS_EMBD_USER	2
-- 
2.37.1

