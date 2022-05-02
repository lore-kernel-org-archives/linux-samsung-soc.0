Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B37AC43219
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384006AbiEBJEm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383944AbiEBJEk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:40 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE73583AC
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:07 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220502090104epoutp031b4c063786f345bfb74a8a36b4292f4a~rPi-5Gtq-0216702167epoutp03P
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220502090104epoutp031b4c063786f345bfb74a8a36b4292f4a~rPi-5Gtq-0216702167epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482064;
        bh=pjFzBdFi01VfUXiw+yEOBKOKMpsHXeUQRQCdRjMeAAs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ivuaJk29Zlw7lDZMAnHJ7wQ/olSVu8jTPQzj7hgfSyXAejEenbQMBjZ6fp5tERQbs
         raFO/P/OnsQhZxVP0weUHa5HMgF7G3WbncJbsAfllSu1+Ggz/Tyecz3LyE3u3/yB/4
         Zn7Mka3S8YLVConFv/DIg1H/H/AQ+b537/fSS598=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220502090103epcas2p309e87b7cc2d679fe121c74ab87fb8906~rPi-Tkv8y1205712057epcas2p3B;
        Mon,  2 May 2022 09:01:03 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.92]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4KsHBP0cvmz4x9Q0; Mon,  2 May
        2022 09:01:01 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        44.F8.09694.CCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epcas2p128ced14c2463dc64de3571d542614fda~rPi8tBGIB1926119261epcas2p1M;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220502090100epsmtrp2409e7334a4f716810cf61c788411ffa0~rPi8sJza23250332503epsmtrp2X;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-8b-626f9dccb7e0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        21.FB.08924.CCD9F626; Mon,  2 May 2022 18:01:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epsmtip22136d56e1b6d881f87f86bae33cc1147~rPi8bud8t1656816568epsmtip2R;
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
Subject: [PATCH 02/12] dt-bindings: clock: add clock binding definitions for
 Exynos Auto v9
Date:   Mon,  2 May 2022 18:02:20 +0900
Message-Id: <20220502090230.12853-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmme7ZuflJBp8OMFo8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiism0yUhNTUosUUvOS
        81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgI5VUihLzCkFCgUkFhcr6dvZ
        FOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnTNq/i63gQHDF2+kP
        2RoY+zy6GDk5JARMJPZd3MzaxcjFISSwg1Fi6aNtUM4nRol9P1qZIJzPjBJNpw8xwrRce3eR
        GSKxi1Hi9NlWRgjnI6PE4u0tzCBVbAK6EluevwJLiAh0MUtc7LvHAuIwC2xllDh+YxYTSJWw
        QKzE863f2EFsFgFViW9PD7OA2LwCdhIPLixg62LkANonL/FvcShImFPAXuLM1ueMECWCEidn
        PgErZwYqad46G+wkCYGlHBLPz79lhbjVReLw78VQtrDEq+Nb2CFsKYnP7/ayQdjFEktnfWKC
        aG5glLi87RdUwlhi1rN2RpAjmAU0Jdbv0oe4R1niyC2ovXwSHYf/skOEeSU62oQgGtUlDmyf
        zgJhy0p0z/nMClHiIbGw2RASVpMYJR5Pa2ecwKgwC8k3s5B8Mwth7wJG5lWMYqkFxbnpqcVG
        BSbwKE7Oz93ECE69Wh47GGe//aB3iJGJg/EQowQHs5IIb9uGnCQh3pTEyqrUovz4otKc1OJD
        jKbAoJ7ILCWanA9M/nkl8YYmlgYmZmaG5kamBuZK4rxeKRsShQTSE0tSs1NTC1KLYPqYODil
        GphidvW7sC94zj07Z9qkPyrh8n3vuSLLBH2ay57IuxbKSEVf+bKz7+t1wbIzlQs+3eCa9HOu
        UZnYrGsnd6nXz917VtZFMaggLrzxobfIn3snCp9nPr7hWiG2Our+zMoCoSinmxP+qk+qUPTa
        +yBvQQ5fjtSJN9t1gsq+eLnyGnkVvuWe93iNX7VTkBbv89nnD27+Z/humfD7uHcPq8SOLu9l
        m1y4aVNhxZJ32YHWu79/1940Z8c6fiur0EXlt35eutTkxb9O5EGU7LoX/1w27VfkP1ugcujM
        xWfX2Y/frZt0XOFkyzm/q+rP1tXySQqy6xiyHlyxeZq18ledDtd9DPqL/sTw5bi6dGT8mZce
        v+6mEktxRqKhFnNRcSIAaNCX30YEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSvO6ZuflJBrc+KFk8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDIm7d/FVnAguOLt9IdsDYx9Hl2MnBwSAiYS195dZO5i5OIQEtjBKLF55UtWiISsxLN3O9gh
        bGGJ+y1HWCGK3jNKdPX9YgJJsAnoSmx5/ooRJCEiMIFZ4s2VD+wgDrPATkaJO69OsYFUCQtE
        S8zqPgk2ikVAVeLb08MsIDavgJ3EgwsLgGo4gFbIS/xbHAoS5hSwlziz9TkjiC0EVPLjxH1m
        iHJBiZMzn4C1MgOVN2+dzTyBUWAWktQsJKkFjEyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1
        kvNzNzGCo0RLawfjnlUf9A4xMnEwHmKU4GBWEuFt25CTJMSbklhZlVqUH19UmpNafIhRmoNF
        SZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVANTjqvmoabTTCnVJs8vXHJXz9H+svlxp+ju3DXr
        53fGMdl+2jDtb6CA/1m3fCXf/pA/jwvOGa5gTbh97apAtGP+v6acgxERfFm/d4Zs7l6xVHXG
        lscfWLhKfMtLVsq265VvVPs7WdFK7cGVezcEph+df+HnrCbR3I3PV/ZMC6peftDW5IIYn150
        r2JpscrmxE9zKsN79+5gfHJUjfVyWPcetsOm3Jv1dutGBwUeWbxeb/PuQxle2itWPrLJ5LHX
        tQk/vemih3CNpxb/0czYxZd2NNftW/BhhQmDnuqHnmQHlp8PjoS0r00vOC7issXwZFqao/X+
        Hcubz82e8yuV8cXaSctXF01tj1u7q+MjB+ttJZbijERDLeai4kQAjTIYNAEDAAA=
X-CMS-MailID: 20220502090100epcas2p128ced14c2463dc64de3571d542614fda
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p128ced14c2463dc64de3571d542614fda
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090100epcas2p128ced14c2463dc64de3571d542614fda@epcas2p1.samsung.com>
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

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 include/dt-bindings/clock/exynosautov9.h | 299 +++++++++++++++++++++++
 1 file changed, 299 insertions(+)
 create mode 100644 include/dt-bindings/clock/exynosautov9.h

diff --git a/include/dt-bindings/clock/exynosautov9.h b/include/dt-bindings/clock/exynosautov9.h
new file mode 100644
index 000000000000..4f14fdda26a6
--- /dev/null
+++ b/include/dt-bindings/clock/exynosautov9.h
@@ -0,0 +1,299 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
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

