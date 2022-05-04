Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD06C43219
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345788AbiEDHyP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345784AbiEDHxw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:52 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75D7C1D
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:14 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220504075011epoutp04f7d8ed1b90f0581a388a45a8cb062d51~r13rjbh_A2258122581epoutp04C
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220504075011epoutp04f7d8ed1b90f0581a388a45a8cb062d51~r13rjbh_A2258122581epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650611;
        bh=6ulZYzGXYcij3pr127KtnfVqpi8PIvHnvPBAhYDPXLU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lpWJcpEIUDJSCe0pbJWYjLi6hdgK7rL/vt4Ci5nWjApOI01uhTzUyop8xj+WKIeiO
         FY5Znbl1kpeu0nqjKkmhiweDZhL2fcHWYG7yYASRY2PKI/DQ0aqdrnynWmadr3peLu
         DpLBBPiAg7AonBy6KWqFERclJqP/7zrdsjMw5NOQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220504075010epcas2p36dc11d4b49c438be71e0560753eec6ee~r13qm0FnW2951229512epcas2p3K;
        Wed,  4 May 2022 07:50:10 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4KtTWc4ks9z4x9Qb; Wed,  4 May
        2022 07:50:04 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        06.E4.10069.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220504075003epcas2p3708d1853dae290bc42cfacd318767c8d~r13kly3wm2951229512epcas2p3m;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220504075003epsmtrp29c77fc38f7fb543bc66bd23d20dfc0f6~r13kktNla0402604026epsmtrp2a;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-49-6272302cc481
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C6.EB.08924.B2032726; Wed,  4 May 2022 16:50:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075003epsmtip1a4ffe1a854ee5ffc754b64db85c74e1c~r13kXmjn02352523525epsmtip1d;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
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
Subject: [PATCH v3 01/12] dt-bindings: clock: add clock binding definitions
 for Exynos Auto v9
Date:   Wed,  4 May 2022 16:51:43 +0900
Message-Id: <20220504075154.58819-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmqa6OQVGSwZfXbBYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZL1eeZi5YHFIxZc1J
        1gbG1x5djJwcEgImEis/3GfvYuTiEBLYwSjx5vVuZpCEkMAnRonlZ7IhEp8ZJfas28PUxcgB
        1vH/WSpEfBejxNqta5ghnI9AzpFuRpBuNgFdiS3PXzGCJEQEupglLvbdYwFxmAW2MkocvzGL
        CaRKWCBBYu2EK2wgNouAqsS0V79YQWxeATuJE1NfsUGsk5f4tzgUxOQUsJd4vMECokJQ4uTM
        JywgNjNQRfPW2WBHSAgs5JA4sH8rI8RvLhLfX75ihrCFJV4d38IOYUtJfH63lw3CLpZYOusT
        E0RzA6PE5W2/oBLGErOetTOCLGYW0JRYv0sf4hxliSO3oPbySXQc/ssOEeaV6GgTgmhUlziw
        fToLhC0r0T3nMyuE7SFx8dhyNkhYTWKUuLdoJvMERoVZSN6ZheSdWQiLFzAyr2IUSy0ozk1P
        LTYqMIRHcHJ+7iZGcNrVct3BOPntB71DjEwcjIcYJTiYlUR4nZcWJAnxpiRWVqUW5ccXleak
        Fh9iNAUG9URmKdHkfGDizyuJNzSxNDAxMzM0NzI1MFcS5/VK2ZAoJJCeWJKanZpakFoE08fE
        wSnVwKTlWWGl/OnuXM46/8SXGqcO7GWdwHWmUfjnwx23cmU/eizYmb0291DMwpIOE3N/vt+s
        GsmZrzjmmLYo87Fv8Wt+vmN97fTOpK8z2NZmTJ1obi5zMaEjIPyO3ZJHzKq7Yt+8XawQoX0o
        U+ByMZNJB8vff+Hcqeyc765nsfYsCon0k1yd+CPcV/nbxFkr35WFqR6+FFZ+Z4sSj8X6R7en
        dSwOmnr/yXqNRblXNff1SqlVr2d3uPeska+D8cAh/rTNadKBao8sjA+1McpyzOST811lpKNj
        x9LGN3mr0IScSX/U/A7pabx7+qN6/d+1Opd3Hf8Yd5aHbe8i17J1yxRjFLf/0z92L+At24q7
        s3ee9FViKc5INNRiLipOBAA1jp51RAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSnK62QVGSwbrLKhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALYoLpuU1JzMstQifbsE
        royXK08zFywOqZiy5iRrA+Nrjy5GDg4JAROJ/89Suxi5OIQEdjBKTL7Sw9jFyAkUl5V49m4H
        O4QtLHG/5QgrRNF7RomHXX9ZQRJsAroSW56/YgRJiAhMYJZ4c+UDO4jDLLCTUeLOq1NsIFXC
        AnESfRdegdksAqoS0179AuvmFbCTODEVJA5yhrzEv8WhICangL3E4w0WIKYQUMXRSUUQxYIS
        J2c+YQGxmYGKm7fOZp7AKDALSWoWktQCRqZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5
        mxjB8aGltYNxz6oPeocYmTgYDzFKcDArifA6Ly1IEuJNSaysSi3Kjy8qzUktPsQozcGiJM57
        oetkvJBAemJJanZqakFqEUyWiYNTqoHJsENiicqjp22b5u3jX/hZJL8njf+s76u2PW135/xi
        eb1Va3We6YadDHN4r8/WWzjlNEvfLsGqU7qqnJbFjabX3qpOYfOYIBJXO4nt0gqGDTZuCzkz
        N7id/fpFNKGth+H2hYyQ9QXBbFNVvjbsCw5YsqNpR3zPak5x/0cRfbnnpV4s3DDVwk1ly/Rz
        R2Qnf1xncuxa1ZFzxqxJn6UDhJzk9JqS0nmbpp3P27vwyarre2q2mv+7zXXaWklP5u4SU9P3
        6tOD5k1rZTPIWxPO3ynGmb505vsZ7AcF61+Esrycu85guzizekxM0eNrl76paby8zsd26hl3
        /5swH5UZ+7t7XvDP7V1p+ogzZaqTnGqAEktxRqKhFnNRcSIA7dHiRP4CAAA=
X-CMS-MailID: 20220504075003epcas2p3708d1853dae290bc42cfacd318767c8d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075003epcas2p3708d1853dae290bc42cfacd318767c8d
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075003epcas2p3708d1853dae290bc42cfacd318767c8d@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add device tree clock binding definitions for below CMU blocks.

- CMU_TOP
- CMU_BUSMC
- CMU_CORE
- CMU_FYS2
- CMU_PERIC0 / C1
- CMU_PERIS

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../dt-bindings/clock/samsung,exynosautov9.h  | 299 ++++++++++++++++++
 1 file changed, 299 insertions(+)
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov9.h

diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
new file mode 100644
index 000000000000..71ec0a955364
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -0,0 +1,299 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022 Samsung Electronics Co., Ltd.
+ * Author: Chanho Park <chanho61.park@samsung.com>
+ *
+ * Device Tree binding constants for Exynos Auto V9 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOSAUTOV9_H
+#define _DT_BINDINGS_CLOCK_EXYNOSAUTOV9_H
+
+/* CMU_TOP */
+#define FOUT_SHARED0_PLL		1
+#define FOUT_SHARED1_PLL		2
+#define FOUT_SHARED2_PLL		3
+#define FOUT_SHARED3_PLL		4
+#define FOUT_SHARED4_PLL		5
+
+/* MUX in CMU_TOP */
+#define MOUT_SHARED0_PLL		6
+#define MOUT_SHARED1_PLL		7
+#define MOUT_SHARED2_PLL		8
+#define MOUT_SHARED3_PLL		9
+#define MOUT_SHARED4_PLL		10
+#define MOUT_CLKCMU_CMU_BOOST		11
+#define MOUT_CLKCMU_CMU_CMUREF		12
+#define MOUT_CLKCMU_ACC_BUS		13
+#define MOUT_CLKCMU_APM_BUS		14
+#define MOUT_CLKCMU_AUD_CPU		15
+#define MOUT_CLKCMU_AUD_BUS		16
+#define MOUT_CLKCMU_BUSC_BUS		17
+#define MOUT_CLKCMU_BUSMC_BUS		19
+#define MOUT_CLKCMU_CORE_BUS		20
+#define MOUT_CLKCMU_CPUCL0_SWITCH	21
+#define MOUT_CLKCMU_CPUCL0_CLUSTER	22
+#define MOUT_CLKCMU_CPUCL1_SWITCH	24
+#define MOUT_CLKCMU_CPUCL1_CLUSTER	25
+#define MOUT_CLKCMU_DPTX_BUS		26
+#define MOUT_CLKCMU_DPTX_DPGTC		27
+#define MOUT_CLKCMU_DPUM_BUS		28
+#define MOUT_CLKCMU_DPUS0_BUS		29
+#define MOUT_CLKCMU_DPUS1_BUS		30
+#define MOUT_CLKCMU_FSYS0_BUS		31
+#define MOUT_CLKCMU_FSYS0_PCIE		32
+#define MOUT_CLKCMU_FSYS1_BUS		33
+#define MOUT_CLKCMU_FSYS1_USBDRD	34
+#define MOUT_CLKCMU_FSYS1_MMC_CARD	35
+#define MOUT_CLKCMU_FSYS2_BUS		36
+#define MOUT_CLKCMU_FSYS2_UFS_EMBD	37
+#define MOUT_CLKCMU_FSYS2_ETHERNET	38
+#define MOUT_CLKCMU_G2D_G2D		39
+#define MOUT_CLKCMU_G2D_MSCL		40
+#define MOUT_CLKCMU_G3D00_SWITCH	41
+#define MOUT_CLKCMU_G3D01_SWITCH	42
+#define MOUT_CLKCMU_G3D1_SWITCH		43
+#define MOUT_CLKCMU_ISPB_BUS		44
+#define MOUT_CLKCMU_MFC_MFC		45
+#define MOUT_CLKCMU_MFC_WFD		46
+#define MOUT_CLKCMU_MIF_SWITCH		47
+#define MOUT_CLKCMU_MIF_BUSP		48
+#define MOUT_CLKCMU_NPU_BUS		49
+#define MOUT_CLKCMU_PERIC0_BUS		50
+#define MOUT_CLKCMU_PERIC0_IP		51
+#define MOUT_CLKCMU_PERIC1_BUS		52
+#define MOUT_CLKCMU_PERIC1_IP		53
+#define MOUT_CLKCMU_PERIS_BUS		54
+
+/* DIV in CMU_TOP */
+#define DOUT_SHARED0_DIV3		101
+#define DOUT_SHARED0_DIV2		102
+#define DOUT_SHARED1_DIV3		103
+#define DOUT_SHARED1_DIV2		104
+#define DOUT_SHARED1_DIV4		105
+#define DOUT_SHARED2_DIV3		106
+#define DOUT_SHARED2_DIV2		107
+#define DOUT_SHARED2_DIV4		108
+#define DOUT_SHARED4_DIV2		109
+#define DOUT_SHARED4_DIV4		110
+#define DOUT_CLKCMU_CMU_BOOST		111
+#define DOUT_CLKCMU_ACC_BUS		112
+#define DOUT_CLKCMU_APM_BUS		113
+#define DOUT_CLKCMU_AUD_CPU		114
+#define DOUT_CLKCMU_AUD_BUS		115
+#define DOUT_CLKCMU_BUSC_BUS		116
+#define DOUT_CLKCMU_BUSMC_BUS		118
+#define DOUT_CLKCMU_CORE_BUS		119
+#define DOUT_CLKCMU_CPUCL0_SWITCH	120
+#define DOUT_CLKCMU_CPUCL0_CLUSTER	121
+#define DOUT_CLKCMU_CPUCL1_SWITCH	123
+#define DOUT_CLKCMU_CPUCL1_CLUSTER	124
+#define DOUT_CLKCMU_DPTX_BUS		125
+#define DOUT_CLKCMU_DPTX_DPGTC		126
+#define DOUT_CLKCMU_DPUM_BUS		127
+#define DOUT_CLKCMU_DPUS0_BUS		128
+#define DOUT_CLKCMU_DPUS1_BUS		129
+#define DOUT_CLKCMU_FSYS0_BUS		130
+#define DOUT_CLKCMU_FSYS0_PCIE		131
+#define DOUT_CLKCMU_FSYS1_BUS		132
+#define DOUT_CLKCMU_FSYS1_USBDRD	133
+#define DOUT_CLKCMU_FSYS2_BUS		134
+#define DOUT_CLKCMU_FSYS2_UFS_EMBD	135
+#define DOUT_CLKCMU_FSYS2_ETHERNET	136
+#define DOUT_CLKCMU_G2D_G2D		137
+#define DOUT_CLKCMU_G2D_MSCL		138
+#define DOUT_CLKCMU_G3D00_SWITCH	139
+#define DOUT_CLKCMU_G3D01_SWITCH	140
+#define DOUT_CLKCMU_G3D1_SWITCH		141
+#define DOUT_CLKCMU_ISPB_BUS		142
+#define DOUT_CLKCMU_MFC_MFC		143
+#define DOUT_CLKCMU_MFC_WFD		144
+#define DOUT_CLKCMU_MIF_SWITCH		145
+#define DOUT_CLKCMU_MIF_BUSP		146
+#define DOUT_CLKCMU_NPU_BUS		147
+#define DOUT_CLKCMU_PERIC0_BUS		148
+#define DOUT_CLKCMU_PERIC0_IP		149
+#define DOUT_CLKCMU_PERIC1_BUS		150
+#define DOUT_CLKCMU_PERIC1_IP		151
+#define DOUT_CLKCMU_PERIS_BUS		152
+
+/* GAT in CMU_TOP */
+#define GOUT_CLKCMU_CMU_BOOST		201
+#define GOUT_CLKCMU_CPUCL0_BOOST	202
+#define GOUT_CLKCMU_CPUCL1_BOOST	203
+#define GOUT_CLKCMU_CORE_BOOST		204
+#define GOUT_CLKCMU_BUSC_BOOST		205
+#define GOUT_CLKCMU_BUSMC_BOOST		206
+#define GOUT_CLKCMU_MIF_BOOST		207
+#define GOUT_CLKCMU_ACC_BUS		208
+#define GOUT_CLKCMU_APM_BUS		209
+#define GOUT_CLKCMU_AUD_CPU		210
+#define GOUT_CLKCMU_AUD_BUS		211
+#define GOUT_CLKCMU_BUSC_BUS		212
+#define GOUT_CLKCMU_BUSMC_BUS		214
+#define GOUT_CLKCMU_CORE_BUS		215
+#define GOUT_CLKCMU_CPUCL0_SWITCH	216
+#define GOUT_CLKCMU_CPUCL0_CLUSTER	217
+#define GOUT_CLKCMU_CPUCL1_SWITCH	219
+#define GOUT_CLKCMU_CPUCL1_CLUSTER	220
+#define GOUT_CLKCMU_DPTX_BUS		221
+#define GOUT_CLKCMU_DPTX_DPGTC		222
+#define GOUT_CLKCMU_DPUM_BUS		223
+#define GOUT_CLKCMU_DPUS0_BUS		224
+#define GOUT_CLKCMU_DPUS1_BUS		225
+#define GOUT_CLKCMU_FSYS0_BUS		226
+#define GOUT_CLKCMU_FSYS0_PCIE		227
+#define GOUT_CLKCMU_FSYS1_BUS		228
+#define GOUT_CLKCMU_FSYS1_USBDRD	229
+#define GOUT_CLKCMU_FSYS1_MMC_CARD	230
+#define GOUT_CLKCMU_FSYS2_BUS		231
+#define GOUT_CLKCMU_FSYS2_UFS_EMBD	232
+#define GOUT_CLKCMU_FSYS2_ETHERNET	233
+#define GOUT_CLKCMU_G2D_G2D		234
+#define GOUT_CLKCMU_G2D_MSCL		235
+#define GOUT_CLKCMU_G3D00_SWITCH	236
+#define GOUT_CLKCMU_G3D01_SWITCH	237
+#define GOUT_CLKCMU_G3D1_SWITCH		238
+#define GOUT_CLKCMU_ISPB_BUS		239
+#define GOUT_CLKCMU_MFC_MFC		240
+#define GOUT_CLKCMU_MFC_WFD		241
+#define GOUT_CLKCMU_MIF_SWITCH		242
+#define GOUT_CLKCMU_MIF_BUSP		243
+#define GOUT_CLKCMU_NPU_BUS		244
+#define GOUT_CLKCMU_PERIC0_BUS		245
+#define GOUT_CLKCMU_PERIC0_IP		246
+#define GOUT_CLKCMU_PERIC1_BUS		247
+#define GOUT_CLKCMU_PERIC1_IP		248
+#define GOUT_CLKCMU_PERIS_BUS		249
+
+#define TOP_NR_CLK			249
+
+/* CMU_BUSMC */
+#define CLK_MOUT_BUSMC_BUS_USER		1
+#define CLK_DOUT_BUSMC_BUSP		2
+#define CLK_GOUT_BUSMC_PDMA0_PCLK	3
+#define CLK_GOUT_BUSMC_SPDMA_PCLK	4
+
+#define BUSMC_NR_CLK			4
+
+/* CMU_CORE */
+#define CLK_MOUT_CORE_BUS_USER		1
+#define CLK_DOUT_CORE_BUSP		2
+#define CLK_GOUT_CORE_CCI_CLK		3
+#define CLK_GOUT_CORE_CCI_PCLK		4
+#define CLK_GOUT_CORE_CMU_CORE_PCLK	5
+
+#define CORE_NR_CLK			5
+
+/* CMU_FSYS2 */
+#define CLK_MOUT_FSYS2_BUS_USER		1
+#define CLK_MOUT_FSYS2_UFS_EMBD_USER	2
+#define CLK_MOUT_FSYS2_ETHERNET_USER	3
+#define CLK_GOUT_FSYS2_UFS_EMBD0_ACLK	4
+#define CLK_GOUT_FSYS2_UFS_EMBD0_UNIPRO	5
+#define CLK_GOUT_FSYS2_UFS_EMBD1_ACLK	6
+#define CLK_GOUT_FSYS2_UFS_EMBD1_UNIPRO	7
+
+#define FSYS2_NR_CLK			7
+
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_BUS_USER	1
+#define CLK_MOUT_PERIC0_IP_USER		2
+#define CLK_MOUT_PERIC0_USI00_USI	3
+#define CLK_MOUT_PERIC0_USI01_USI	4
+#define CLK_MOUT_PERIC0_USI02_USI	5
+#define CLK_MOUT_PERIC0_USI03_USI	6
+#define CLK_MOUT_PERIC0_USI04_USI	7
+#define CLK_MOUT_PERIC0_USI05_USI	8
+#define CLK_MOUT_PERIC0_USI_I2C		9
+
+#define CLK_DOUT_PERIC0_USI00_USI	10
+#define CLK_DOUT_PERIC0_USI01_USI	11
+#define CLK_DOUT_PERIC0_USI02_USI	12
+#define CLK_DOUT_PERIC0_USI03_USI	13
+#define CLK_DOUT_PERIC0_USI04_USI	14
+#define CLK_DOUT_PERIC0_USI05_USI	15
+#define CLK_DOUT_PERIC0_USI_I2C		16
+
+#define CLK_GOUT_PERIC0_IPCLK_0		20
+#define CLK_GOUT_PERIC0_IPCLK_1		21
+#define CLK_GOUT_PERIC0_IPCLK_2		22
+#define CLK_GOUT_PERIC0_IPCLK_3		23
+#define CLK_GOUT_PERIC0_IPCLK_4		24
+#define CLK_GOUT_PERIC0_IPCLK_5		25
+#define CLK_GOUT_PERIC0_IPCLK_6		26
+#define CLK_GOUT_PERIC0_IPCLK_7		27
+#define CLK_GOUT_PERIC0_IPCLK_8		28
+#define CLK_GOUT_PERIC0_IPCLK_9		29
+#define CLK_GOUT_PERIC0_IPCLK_10	30
+#define CLK_GOUT_PERIC0_IPCLK_11	30
+#define CLK_GOUT_PERIC0_PCLK_0		31
+#define CLK_GOUT_PERIC0_PCLK_1		32
+#define CLK_GOUT_PERIC0_PCLK_2		33
+#define CLK_GOUT_PERIC0_PCLK_3		34
+#define CLK_GOUT_PERIC0_PCLK_4		35
+#define CLK_GOUT_PERIC0_PCLK_5		36
+#define CLK_GOUT_PERIC0_PCLK_6		37
+#define CLK_GOUT_PERIC0_PCLK_7		38
+#define CLK_GOUT_PERIC0_PCLK_8		39
+#define CLK_GOUT_PERIC0_PCLK_9		40
+#define CLK_GOUT_PERIC0_PCLK_10		41
+#define CLK_GOUT_PERIC0_PCLK_11		42
+
+#define PERIC0_NR_CLK			42
+
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_BUS_USER	1
+#define CLK_MOUT_PERIC1_IP_USER		2
+#define CLK_MOUT_PERIC1_USI06_USI	3
+#define CLK_MOUT_PERIC1_USI07_USI	4
+#define CLK_MOUT_PERIC1_USI08_USI	5
+#define CLK_MOUT_PERIC1_USI09_USI	6
+#define CLK_MOUT_PERIC1_USI10_USI	7
+#define CLK_MOUT_PERIC1_USI11_USI	8
+#define CLK_MOUT_PERIC1_USI_I2C		9
+
+#define CLK_DOUT_PERIC1_USI06_USI	10
+#define CLK_DOUT_PERIC1_USI07_USI	11
+#define CLK_DOUT_PERIC1_USI08_USI	12
+#define CLK_DOUT_PERIC1_USI09_USI	13
+#define CLK_DOUT_PERIC1_USI10_USI	14
+#define CLK_DOUT_PERIC1_USI11_USI	15
+#define CLK_DOUT_PERIC1_USI_I2C		16
+
+#define CLK_GOUT_PERIC1_IPCLK_0		20
+#define CLK_GOUT_PERIC1_IPCLK_1		21
+#define CLK_GOUT_PERIC1_IPCLK_2		22
+#define CLK_GOUT_PERIC1_IPCLK_3		23
+#define CLK_GOUT_PERIC1_IPCLK_4		24
+#define CLK_GOUT_PERIC1_IPCLK_5		25
+#define CLK_GOUT_PERIC1_IPCLK_6		26
+#define CLK_GOUT_PERIC1_IPCLK_7		27
+#define CLK_GOUT_PERIC1_IPCLK_8		28
+#define CLK_GOUT_PERIC1_IPCLK_9		29
+#define CLK_GOUT_PERIC1_IPCLK_10	30
+#define CLK_GOUT_PERIC1_IPCLK_11	30
+#define CLK_GOUT_PERIC1_PCLK_0		31
+#define CLK_GOUT_PERIC1_PCLK_1		32
+#define CLK_GOUT_PERIC1_PCLK_2		33
+#define CLK_GOUT_PERIC1_PCLK_3		34
+#define CLK_GOUT_PERIC1_PCLK_4		35
+#define CLK_GOUT_PERIC1_PCLK_5		36
+#define CLK_GOUT_PERIC1_PCLK_6		37
+#define CLK_GOUT_PERIC1_PCLK_7		38
+#define CLK_GOUT_PERIC1_PCLK_8		39
+#define CLK_GOUT_PERIC1_PCLK_9		40
+#define CLK_GOUT_PERIC1_PCLK_10		41
+#define CLK_GOUT_PERIC1_PCLK_11		42
+
+#define PERIC1_NR_CLK			42
+
+/* CMU_PERIS */
+#define CLK_MOUT_PERIS_BUS_USER		1
+#define CLK_GOUT_SYSREG_PERIS_PCLK	2
+#define CLK_GOUT_WDT_CLUSTER0		3
+#define CLK_GOUT_WDT_CLUSTER1		4
+
+#define PERIS_NR_CLK			4
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV9_H */
-- 
2.36.0

