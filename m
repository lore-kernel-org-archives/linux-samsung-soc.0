Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58138C43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383991AbiEBJEq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383944AbiEBJEn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:43 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DAF2B25A
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:07 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220502090105epoutp03aa6c343057892f29006fbea2637589e7~rPjA0Sm620102801028epoutp03j
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220502090105epoutp03aa6c343057892f29006fbea2637589e7~rPjA0Sm620102801028epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482065;
        bh=gRz7WAUrAJaruDRnqFqB9WNp1ZIpaHfYZd6HBS+sIlg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MShz1MKnf9DB8jYzHdcDc0b11Dp3a+O9fAzneQx1VOa2mEpx/bABpsLtHs/k/8nQB
         czwvFp4aPHDTEfH8Xkzw3J96OE16odzSVsjAxx8O747wowDsrLFsAuQUq0G3gZzXbm
         ZRWL8mSqNQJYYS8EcSKasVqaEDSr6rWmEouog0ww=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220502090104epcas2p32586461523fd0300507842ae455f149c~rPjAKXIG_1120311203epcas2p3I;
        Mon,  2 May 2022 09:01:04 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.89]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KsHBP3QtDz4x9QH; Mon,  2 May
        2022 09:01:01 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        E7.53.09764.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epcas2p3b41d4bc4025955f3d731f8d696649018~rPi819spP2252022520epcas2p3R;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220502090100epsmtrp2f188dbcd5a4c913913dd6f19ff7735aa~rPi8ysezF3250332503epsmtrp2Y;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
X-AuditID: b6c32a46-f75ff70000002624-ea-626f9dcd68d8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        AB.EB.08853.CCD9F626; Mon,  2 May 2022 18:01:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epsmtip23c4c0c45dcd0ef18f3bd9d32c7aa56d3~rPi8i6TQ41727017270epsmtip23;
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
Subject: [PATCH 03/12] clk: samsung: add top clock support for Exynos Auto
 v9 SoC
Date:   Mon,  2 May 2022 18:02:21 +0900
Message-Id: <20220502090230.12853-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmme7ZuflJBld3iVs8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiism0yUhNTUosUUvOS
        81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgI5VUihLzCkFCgUkFhcr6dvZ
        FOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnNP7dy1ww4yhTxe7O
        RcwNjHPnMHUxcnJICJhIzJ4wgbGLkYtDSGAHo8T+F+vZIJxPjBLvF7czQTjfGCV2flrJ2sXI
        Adby/TM3RHwvo8Tc3ttQHR8ZJbqfHmEFmcsmoCux5fkrsLkiAl3MEhf77rGAOMwCWxkljt+Y
        BbZdWCBY4nPvXmYQm0VAVeJR0zGwFbwCdhL9i9wgtslL/FscClLBKWAvcWbrc0YQm1dAUOLk
        zCcsIDYzUEnz1tnMIOMlBFZySHRu/Q71nIvEpjd3WCFsYYlXx7ewQ9hSEp/f7WWDsIslls76
        xATR3MAocXnbL6iEscSsZ+2MIEcwC2hKrN+lD3GPssSRW1B7+SQ6Dv9lhwjzSnS0CUE0qksc
        2D6dBcKWleie8xnqAg+J748fMkPCahKjxJvpz1gmMCrMQvLOLCTvzEJYvICReRWjWGpBcW56
        arFRgRE8jpPzczcxgpOvltsOxilvP+gdYmTiYDzEKMHBrCTC27YhJ0mINyWxsiq1KD++qDQn
        tfgQoykwqCcyS4km5wPTf15JvKGJpYGJmZmhuZGpgbmSOK9XyoZEIYH0xJLU7NTUgtQimD4m
        Dk6pBqYtOx75x8nsn32s+rb09M67iVeqTzK5XW16lPWGxZh1sov3LDUn/lyZjNSHPhyOVh7q
        ysfT7US2VqZ/ZZ6y5tLR3rKrV0XPmlpvyS8JklhlNdM+pKLukNCdGRMfROofeBwe+/HwrHti
        hzr9NHUlt3l7vvr8s/h6yYwu4ytXZi4qSNNYFe18efHG3sRSZ62kGc+67jAVP7n9PfFNoOOK
        pFUPvk6V4D9UJKl422KmtpixrtEhBU/RR36nFAVMDrv9XDz7yToHtv//Lsr0r5TMVNhkb77q
        e+iKmRyHrre2xRr5nbi97Iggd5xJgUb7Ja65Ys9LrLdclv7KZ/gvnrFx8yS3lB3zOdKl9p69
        vdPnuqUSS3FGoqEWc1FxIgCtGcIRRwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO6ZuflJBheXaFo8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDIa/+5lLphxlKlid+ci5gbGuXOYuhg5OCQETCS+f+buYuTkEBLYzSix7EIQiC0hICvx7N0O
        dghbWOJ+yxHWLkYuoJr3jBI3G1pZQRJsAroSW56/YgRJiAhMYJZ4c+UDO4jDLLCTUeLOq1Ns
        IFXCAoESh1Z0go1iEVCVeNR0jBVkM6+AnUT/IjeII+Ql/i0OBangFLCXOLP1OSPEQXYSP07c
        ZwaxeQUEJU7OfMICYjMDlTdvnc08gVFgFpLULCSpBYxMqxglUwuKc9Nziw0LDPNSy/WKE3OL
        S/PS9ZLzczcxgmNES3MH4/ZVH/QOMTJxMB5ilOBgVhLhbduQkyTEm5JYWZValB9fVJqTWnyI
        UZqDRUmc90LXyXghgfTEktTs1NSC1CKYLBMHp1QDU0qJ7NVfio5GuqzJU4IO7Kz51DZnccWh
        a6rvUxmCukNEDVPEzHZN9eC9FXDn49Fja5WY6q7lx68O+LPabkGV2q8ZeeWNa/NbryoysVvc
        DneZ7T+Dy0Dt9/N5S5Tu5Kw7s/2p14I1up++POxwyJg3ddJxuaUsX9hepAttXsX0i0GjeNLK
        pukLT6mFhH0/bxZ/PniLVLbbrav1zo5xR54IyMSft/oQc3ujoG1Za7P3PIZrs75FftBVnTLh
        0vxEr2+fttQpRQQ9XPLMRqP9fMD1F08XK3y/vaPL2M9iIg8Xx4uXx/v8Z1w4nTwlsb+htTN4
        h5Drj9h4foGarTo8O9tdIsWWb+7UnKjBKiFtuVfoghJLcUaioRZzUXEiAAiHcKkAAwAA
X-CMS-MailID: 20220502090100epcas2p3b41d4bc4025955f3d731f8d696649018
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p3b41d4bc4025955f3d731f8d696649018
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090100epcas2p3b41d4bc4025955f3d731f8d696649018@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This adds support for CMU_TOP which generates clocks for all the
function blocks such as CORE, FSYS0/1/2, PERIC0/1 and so on. For
CMU_TOP, PLL_SHARED0,1,2,3 and 4 will be the sources of this block
and they will generate bus clocks.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/Makefile           |   1 +
 drivers/clk/samsung/clk-exynosautov9.c | 961 +++++++++++++++++++++++++
 2 files changed, 962 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-exynosautov9.c

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 17e5d1cb9da2..239d9eead77f 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos-arm64.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
 obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
 obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
 obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
new file mode 100644
index 000000000000..b52073b1dd3d
--- /dev/null
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -0,0 +1,961 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Samsung Electronics Co., Ltd.
+ * Author: Chanho Park <chanho61.park@samsung.com>
+ *
+ * Common Clock Framework support for ExynosAuto V9 SoC.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/exynosautov9.h>
+
+#include "clk.h"
+#include "clk-exynos-arm64.h"
+
+/* ---- CMU_TOP ------------------------------------------------------------ */
+
+/* Register Offset definitions for CMU_TOP (0x1b240000) */
+#define PLL_LOCKTIME_PLL_SHARED0		0x0000
+#define PLL_LOCKTIME_PLL_SHARED1		0x0004
+#define PLL_LOCKTIME_PLL_SHARED2		0x0008
+#define PLL_LOCKTIME_PLL_SHARED3		0x000c
+#define PLL_LOCKTIME_PLL_SHARED4		0x0010
+#define PLL_CON0_PLL_SHARED0			0x0100
+#define PLL_CON3_PLL_SHARED0			0x010c
+#define PLL_CON0_PLL_SHARED1			0x0140
+#define PLL_CON3_PLL_SHARED1			0x014c
+#define PLL_CON0_PLL_SHARED2			0x0180
+#define PLL_CON3_PLL_SHARED2			0x018c
+#define PLL_CON0_PLL_SHARED3			0x01c0
+#define PLL_CON3_PLL_SHARED3			0x01cc
+#define PLL_CON0_PLL_SHARED4			0x0200
+#define PLL_CON3_PLL_SHARED4			0x020c
+
+/* MUX */
+#define CLK_CON_MUX_MUX_CLKCMU_ACC_BUS		0x1000
+#define CLK_CON_MUX_MUX_CLKCMU_APM_BUS		0x1004
+#define CLK_CON_MUX_MUX_CLKCMU_AUD_BUS		0x1008
+#define CLK_CON_MUX_MUX_CLKCMU_AUD_CPU		0x100c
+#define CLK_CON_MUX_MUX_CLKCMU_BUSC_BUS		0x1010
+#define CLK_CON_MUX_MUX_CLKCMU_BUSMC_BUS	0x1018
+#define CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST	0x101c
+#define CLK_CON_MUX_MUX_CLKCMU_CORE_BUS		0x1020
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_CLUSTER	0x1024
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH	0x102c
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL1_CLUSTER	0x1030
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH	0x1034
+#define CLK_CON_MUX_MUX_CLKCMU_DPTX_BUS		0x1040
+#define CLK_CON_MUX_MUX_CLKCMU_DPTX_DPGTC	0x1044
+#define CLK_CON_MUX_MUX_CLKCMU_DPUM_BUS		0x1048
+#define CLK_CON_MUX_MUX_CLKCMU_DPUS0_BUS	0x104c
+#define CLK_CON_MUX_MUX_CLKCMU_DPUS1_BUS	0x1050
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS0_BUS	0x1054
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS0_PCIE	0x1058
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS1_BUS	0x105c
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS1_MMC_CARD	0x1060
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS1_USBDRD	0x1064
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS2_BUS	0x1068
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS2_ETHERNET	0x106c
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS2_UFS_EMBD	0x1070
+#define CLK_CON_MUX_MUX_CLKCMU_G2D_G2D		0x1074
+#define CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL		0x1078
+#define CLK_CON_MUX_MUX_CLKCMU_G3D00_SWITCH	0x107c
+#define CLK_CON_MUX_MUX_CLKCMU_G3D01_SWITCH	0x1080
+#define CLK_CON_MUX_MUX_CLKCMU_G3D1_SWITCH	0x1084
+#define CLK_CON_MUX_MUX_CLKCMU_ISPB_BUS		0x108c
+#define CLK_CON_MUX_MUX_CLKCMU_MFC_MFC		0x1090
+#define CLK_CON_MUX_MUX_CLKCMU_MFC_WFD		0x1094
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH	0x109c
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP		0x1098
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH	0x109c
+#define CLK_CON_MUX_MUX_CLKCMU_NPU_BUS		0x10a0
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS	0x10a4
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP	0x10a8
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_BUS	0x10ac
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP	0x10b0
+#define CLK_CON_MUX_MUX_CLKCMU_PERIS_BUS	0x10b4
+#define CLK_CON_MUX_MUX_CMU_CMUREF		0x10c0
+
+/* DIV */
+#define CLK_CON_DIV_CLKCMU_ACC_BUS		0x1800
+#define CLK_CON_DIV_CLKCMU_APM_BUS		0x1804
+#define CLK_CON_DIV_CLKCMU_AUD_BUS		0x1808
+#define CLK_CON_DIV_CLKCMU_AUD_CPU		0x180c
+#define CLK_CON_DIV_CLKCMU_BUSC_BUS		0x1810
+#define CLK_CON_DIV_CLKCMU_BUSMC_BUS		0x1818
+#define CLK_CON_DIV_CLKCMU_CORE_BUS		0x181c
+#define CLK_CON_DIV_CLKCMU_CPUCL0_CLUSTER	0x1820
+#define CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH	0x1828
+#define CLK_CON_DIV_CLKCMU_CPUCL1_CLUSTER	0x182c
+#define CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH	0x1830
+#define CLK_CON_DIV_CLKCMU_DPTX_BUS		0x183c
+#define CLK_CON_DIV_CLKCMU_DPTX_DPGTC		0x1840
+#define CLK_CON_DIV_CLKCMU_DPUM_BUS		0x1844
+#define CLK_CON_DIV_CLKCMU_DPUS0_BUS		0x1848
+#define CLK_CON_DIV_CLKCMU_DPUS1_BUS		0x184c
+#define CLK_CON_DIV_CLKCMU_FSYS0_BUS		0x1850
+#define CLK_CON_DIV_CLKCMU_FSYS0_PCIE		0x1854
+#define CLK_CON_DIV_CLKCMU_FSYS1_BUS		0x1858
+#define CLK_CON_DIV_CLKCMU_FSYS1_USBDRD		0x185c
+#define CLK_CON_DIV_CLKCMU_FSYS2_BUS		0x1860
+#define CLK_CON_DIV_CLKCMU_FSYS2_ETHERNET	0x1864
+#define CLK_CON_DIV_CLKCMU_FSYS2_UFS_EMBD	0x1868
+#define CLK_CON_DIV_CLKCMU_G2D_G2D		0x186c
+#define CLK_CON_DIV_CLKCMU_G2D_MSCL		0x1870
+#define CLK_CON_DIV_CLKCMU_G3D00_SWITCH		0x1874
+#define CLK_CON_DIV_CLKCMU_G3D01_SWITCH		0x1878
+#define CLK_CON_DIV_CLKCMU_G3D1_SWITCH		0x187c
+#define CLK_CON_DIV_CLKCMU_ISPB_BUS		0x1884
+#define CLK_CON_DIV_CLKCMU_MFC_MFC		0x1888
+#define CLK_CON_DIV_CLKCMU_MFC_WFD		0x188c
+#define CLK_CON_DIV_CLKCMU_MIF_BUSP		0x1890
+#define CLK_CON_DIV_CLKCMU_NPU_BUS		0x1894
+#define CLK_CON_DIV_CLKCMU_PERIC0_BUS		0x1898
+#define CLK_CON_DIV_CLKCMU_PERIC0_IP		0x189c
+#define CLK_CON_DIV_CLKCMU_PERIC1_BUS		0x18a0
+#define CLK_CON_DIV_CLKCMU_PERIC1_IP		0x18a4
+#define CLK_CON_DIV_CLKCMU_PERIS_BUS		0x18a8
+#define CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST	0x18b4
+
+#define CLK_CON_DIV_PLL_SHARED0_DIV2		0x18b8
+#define CLK_CON_DIV_PLL_SHARED0_DIV3		0x18bc
+#define CLK_CON_DIV_PLL_SHARED1_DIV2		0x18c0
+#define CLK_CON_DIV_PLL_SHARED1_DIV3		0x18c4
+#define CLK_CON_DIV_PLL_SHARED1_DIV4		0x18c8
+#define CLK_CON_DIV_PLL_SHARED2_DIV2		0x18cc
+#define CLK_CON_DIV_PLL_SHARED2_DIV3		0x18d0
+#define CLK_CON_DIV_PLL_SHARED2_DIV4		0x18d4
+#define CLK_CON_DIV_PLL_SHARED4_DIV2		0x18d4
+#define CLK_CON_DIV_PLL_SHARED4_DIV4		0x18d8
+
+/* GATE */
+#define CLK_CON_GAT_CLKCMU_CMU_BUSC_BOOST	0x2000
+#define CLK_CON_GAT_CLKCMU_CMU_BUSMC_BOOST	0x2004
+#define CLK_CON_GAT_CLKCMU_CMU_CORE_BOOST	0x2008
+#define CLK_CON_GAT_CLKCMU_CMU_CPUCL0_BOOST	0x2010
+#define CLK_CON_GAT_CLKCMU_CMU_CPUCL1_BOOST	0x2018
+#define CLK_CON_GAT_CLKCMU_CMU_MIF_BOOST	0x2020
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS1_MMC_CARD	0x2024
+#define CLK_CON_GAT_GATE_CLKCMU_MIF_SWITCH	0x2028
+#define CLK_CON_GAT_GATE_CLKCMU_ACC_BUS		0x202c
+#define CLK_CON_GAT_GATE_CLKCMU_APM_BUS		0x2030
+#define CLK_CON_GAT_GATE_CLKCMU_AUD_BUS		0x2034
+#define CLK_CON_GAT_GATE_CLKCMU_AUD_CPU		0x2038
+#define CLK_CON_GAT_GATE_CLKCMU_BUSC_BUS	0x203c
+#define CLK_CON_GAT_GATE_CLKCMU_BUSMC_BUS	0x2044
+#define CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST	0x2048
+#define CLK_CON_GAT_GATE_CLKCMU_CORE_BUS	0x204c
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL0_CLUSTER	0x2050
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH	0x2058
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL1_CLUSTER	0x205c
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH	0x2060
+#define CLK_CON_GAT_GATE_CLKCMU_DPTX_BUS	0x206c
+#define CLK_CON_GAT_GATE_CLKCMU_DPTX_DPGTC	0x2070
+#define CLK_CON_GAT_GATE_CLKCMU_DPUM_BUS	0x2060
+#define CLK_CON_GAT_GATE_CLKCMU_DPUS0_BUS	0x2064
+#define CLK_CON_GAT_GATE_CLKCMU_DPUS1_BUS	0x207c
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS0_BUS	0x2080
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS0_PCIE	0x2084
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS1_BUS	0x2088
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS1_USBDRD	0x208c
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS2_BUS	0x2090
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS2_ETHERNET	0x2094
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS2_UFS_EMBD	0x2098
+#define CLK_CON_GAT_GATE_CLKCMU_G2D_G2D		0x209c
+#define CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL	0x20a0
+#define CLK_CON_GAT_GATE_CLKCMU_G3D00_SWITCH	0x20a4
+#define CLK_CON_GAT_GATE_CLKCMU_G3D01_SWITCH	0x20a8
+#define CLK_CON_GAT_GATE_CLKCMU_G3D1_SWITCH	0x20ac
+#define CLK_CON_GAT_GATE_CLKCMU_ISPB_BUS	0x20b4
+#define CLK_CON_GAT_GATE_CLKCMU_MFC_MFC		0x20b8
+#define CLK_CON_GAT_GATE_CLKCMU_MFC_WFD		0x20bc
+#define CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP	0x20c0
+#define CLK_CON_GAT_GATE_CLKCMU_NPU_BUS		0x20c4
+#define CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS	0x20c8
+#define CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP	0x20cc
+#define CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS	0x20d0
+#define CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP	0x20d4
+#define CLK_CON_GAT_GATE_CLKCMU_PERIS_BUS	0x20d8
+
+static const unsigned long top_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_SHARED0,
+	PLL_LOCKTIME_PLL_SHARED1,
+	PLL_LOCKTIME_PLL_SHARED2,
+	PLL_LOCKTIME_PLL_SHARED3,
+	PLL_LOCKTIME_PLL_SHARED4,
+	PLL_CON0_PLL_SHARED0,
+	PLL_CON3_PLL_SHARED0,
+	PLL_CON0_PLL_SHARED1,
+	PLL_CON3_PLL_SHARED1,
+	PLL_CON0_PLL_SHARED2,
+	PLL_CON3_PLL_SHARED2,
+	PLL_CON0_PLL_SHARED3,
+	PLL_CON3_PLL_SHARED3,
+	PLL_CON0_PLL_SHARED4,
+	PLL_CON3_PLL_SHARED4,
+	CLK_CON_MUX_MUX_CLKCMU_ACC_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_AUD_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_AUD_CPU,
+	CLK_CON_MUX_MUX_CLKCMU_BUSC_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST,
+	CLK_CON_MUX_MUX_CLKCMU_CORE_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_CLUSTER,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL1_CLUSTER,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_DPTX_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_DPTX_DPGTC,
+	CLK_CON_MUX_MUX_CLKCMU_DPUM_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_DPUS0_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_DPUS1_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_FSYS0_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_FSYS0_PCIE,
+	CLK_CON_MUX_MUX_CLKCMU_FSYS1_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_FSYS1_MMC_CARD,
+	CLK_CON_MUX_MUX_CLKCMU_FSYS1_USBDRD,
+	CLK_CON_MUX_MUX_CLKCMU_FSYS2_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_FSYS2_ETHERNET,
+	CLK_CON_MUX_MUX_CLKCMU_FSYS2_UFS_EMBD,
+	CLK_CON_MUX_MUX_CLKCMU_G2D_G2D,
+	CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL,
+	CLK_CON_MUX_MUX_CLKCMU_G3D00_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_G3D01_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_G3D1_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_ISPB_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_MFC_MFC,
+	CLK_CON_MUX_MUX_CLKCMU_MFC_WFD,
+	CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP,
+	CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_NPU_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC1_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP,
+	CLK_CON_MUX_MUX_CLKCMU_PERIS_BUS,
+	CLK_CON_MUX_MUX_CMU_CMUREF,
+	CLK_CON_DIV_CLKCMU_ACC_BUS,
+	CLK_CON_DIV_CLKCMU_APM_BUS,
+	CLK_CON_DIV_CLKCMU_AUD_BUS,
+	CLK_CON_DIV_CLKCMU_AUD_CPU,
+	CLK_CON_DIV_CLKCMU_BUSC_BUS,
+	CLK_CON_DIV_CLKCMU_BUSMC_BUS,
+	CLK_CON_DIV_CLKCMU_CORE_BUS,
+	CLK_CON_DIV_CLKCMU_CPUCL0_CLUSTER,
+	CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH,
+	CLK_CON_DIV_CLKCMU_CPUCL1_CLUSTER,
+	CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH,
+	CLK_CON_DIV_CLKCMU_DPTX_BUS,
+	CLK_CON_DIV_CLKCMU_DPTX_DPGTC,
+	CLK_CON_DIV_CLKCMU_DPUM_BUS,
+	CLK_CON_DIV_CLKCMU_DPUS0_BUS,
+	CLK_CON_DIV_CLKCMU_DPUS1_BUS,
+	CLK_CON_DIV_CLKCMU_FSYS0_BUS,
+	CLK_CON_DIV_CLKCMU_FSYS0_PCIE,
+	CLK_CON_DIV_CLKCMU_FSYS1_BUS,
+	CLK_CON_DIV_CLKCMU_FSYS1_USBDRD,
+	CLK_CON_DIV_CLKCMU_FSYS2_BUS,
+	CLK_CON_DIV_CLKCMU_FSYS2_ETHERNET,
+	CLK_CON_DIV_CLKCMU_FSYS2_UFS_EMBD,
+	CLK_CON_DIV_CLKCMU_G2D_G2D,
+	CLK_CON_DIV_CLKCMU_G2D_MSCL,
+	CLK_CON_DIV_CLKCMU_G3D00_SWITCH,
+	CLK_CON_DIV_CLKCMU_G3D01_SWITCH,
+	CLK_CON_DIV_CLKCMU_G3D1_SWITCH,
+	CLK_CON_DIV_CLKCMU_ISPB_BUS,
+	CLK_CON_DIV_CLKCMU_MFC_MFC,
+	CLK_CON_DIV_CLKCMU_MFC_WFD,
+	CLK_CON_DIV_CLKCMU_MIF_BUSP,
+	CLK_CON_DIV_CLKCMU_NPU_BUS,
+	CLK_CON_DIV_CLKCMU_PERIC0_BUS,
+	CLK_CON_DIV_CLKCMU_PERIC0_IP,
+	CLK_CON_DIV_CLKCMU_PERIC1_BUS,
+	CLK_CON_DIV_CLKCMU_PERIC1_IP,
+	CLK_CON_DIV_CLKCMU_PERIS_BUS,
+	CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST,
+	CLK_CON_DIV_PLL_SHARED0_DIV2,
+	CLK_CON_DIV_PLL_SHARED0_DIV3,
+	CLK_CON_DIV_PLL_SHARED1_DIV2,
+	CLK_CON_DIV_PLL_SHARED1_DIV3,
+	CLK_CON_DIV_PLL_SHARED1_DIV4,
+	CLK_CON_DIV_PLL_SHARED2_DIV2,
+	CLK_CON_DIV_PLL_SHARED2_DIV3,
+	CLK_CON_DIV_PLL_SHARED2_DIV4,
+	CLK_CON_DIV_PLL_SHARED4_DIV2,
+	CLK_CON_DIV_PLL_SHARED4_DIV4,
+	CLK_CON_GAT_CLKCMU_CMU_BUSC_BOOST,
+	CLK_CON_GAT_CLKCMU_CMU_BUSMC_BOOST,
+	CLK_CON_GAT_CLKCMU_CMU_CORE_BOOST,
+	CLK_CON_GAT_CLKCMU_CMU_CPUCL0_BOOST,
+	CLK_CON_GAT_CLKCMU_CMU_CPUCL1_BOOST,
+	CLK_CON_GAT_CLKCMU_CMU_MIF_BOOST,
+	CLK_CON_GAT_GATE_CLKCMU_FSYS1_MMC_CARD,
+	CLK_CON_GAT_GATE_CLKCMU_MIF_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_ACC_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_APM_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_AUD_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_AUD_CPU,
+	CLK_CON_GAT_GATE_CLKCMU_BUSC_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_BUSMC_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST,
+	CLK_CON_GAT_GATE_CLKCMU_CORE_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_CPUCL0_CLUSTER,
+	CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_CPUCL1_CLUSTER,
+	CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_DPTX_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_DPTX_DPGTC,
+	CLK_CON_GAT_GATE_CLKCMU_DPUM_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_DPUS0_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_DPUS1_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_FSYS0_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_FSYS0_PCIE,
+	CLK_CON_GAT_GATE_CLKCMU_FSYS1_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_FSYS1_USBDRD,
+	CLK_CON_GAT_GATE_CLKCMU_FSYS2_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_FSYS2_ETHERNET,
+	CLK_CON_GAT_GATE_CLKCMU_FSYS2_UFS_EMBD,
+	CLK_CON_GAT_GATE_CLKCMU_G2D_G2D,
+	CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL,
+	CLK_CON_GAT_GATE_CLKCMU_G3D00_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_G3D01_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_G3D1_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_ISPB_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_MFC_MFC,
+	CLK_CON_GAT_GATE_CLKCMU_MFC_WFD,
+	CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP,
+	CLK_CON_GAT_GATE_CLKCMU_NPU_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP,
+	CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP,
+	CLK_CON_GAT_GATE_CLKCMU_PERIS_BUS,
+};
+
+static const struct samsung_pll_clock top_pll_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+	PLL(pll_0822x, FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0, NULL),
+	PLL(pll_0822x, FOUT_SHARED0_PLL, "fout_shared1_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED1, PLL_CON3_PLL_SHARED1, NULL),
+	PLL(pll_0822x, FOUT_SHARED0_PLL, "fout_shared2_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED2, PLL_CON3_PLL_SHARED2, NULL),
+	PLL(pll_0822x, FOUT_SHARED0_PLL, "fout_shared3_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED3, PLL_CON3_PLL_SHARED3, NULL),
+	PLL(pll_0822x, FOUT_SHARED0_PLL, "fout_shared4_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED4, PLL_CON3_PLL_SHARED4, NULL),
+};
+
+/* List of parent clocks for Muxes in CMU_TOP */
+PNAME(mout_shared0_pll_p) = { "oscclk", "fout_shared0_pll" };
+PNAME(mout_shared1_pll_p) = { "oscclk", "fout_shared1_pll" };
+PNAME(mout_shared2_pll_p) = { "oscclk", "fout_shared2_pll" };
+PNAME(mout_shared3_pll_p) = { "oscclk", "fout_shared3_pll" };
+PNAME(mout_shared4_pll_p) = { "oscclk", "fout_shared4_pll" };
+
+PNAME(mout_clkcmu_cmu_boost_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				   "dout_shared2_div4", "dout_shared4_div4" };
+PNAME(mout_clkcmu_cmu_cmuref_p) = { "oscclk", "dout_cmu_boost" };
+PNAME(mout_clkcmu_acc_bus_p) = { "dout_shared1_div3", "dout_shared2_div3",
+				 "dout_shared1_div4", "dout_shared2_div4" };
+PNAME(mout_clkcmu_apm_bus_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				 "dout_shared2_div4", "dout_shared4_div4" };
+PNAME(mout_clkcmu_aud_cpu_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				 "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "fout_shared3_pll" };
+PNAME(mout_clkcmu_aud_bus_p) = { "dout_shared4_div2", "dout_shared1_div3",
+				  "dout_shared2_div3", "dout_shared1_div4" };
+PNAME(mout_clkcmu_busc_bus_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				  "dout_shared2_div4", "dout_shared4_div4" };
+PNAME(mout_clkcmu_core_bus_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				  "dout_shared2_div2", "dout_shared0_div3",
+				  "dout_shared4_div2", "dout_shared1_div3",
+				  "dout_shared2_div3", "fout_shared3_pll" };
+PNAME(mout_clkcmu_cpucl0_switch_p) = {
+	"dout_shared0_div2", "dout_shared1_div2",
+	"dout_shared2_div2", "dout_shared4_div2" };
+PNAME(mout_clkcmu_cpucl0_cluster_p) = {
+	"fout_shared2_pll", "fout_shared4_pll",
+	"dout_shared0_div2", "dout_shared1_div2",
+	"dout_shared2_div2", "dout_shared4_div2",
+	"dout_shared2_div3", "fout_shared3_pll" };
+PNAME(mout_clkcmu_dptx_bus_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				  "dout_shared1_div4", "dout_shared2_div4" };
+PNAME(mout_clkcmu_dptx_dpgtc_p) = { "oscclk", "dout_shared2_div3",
+				    "dout_shared2_div4", "dout_shared4_div4" };
+PNAME(mout_clkcmu_dpum_bus_p) = { "dout_shared1_div3", "dout_shared2_div3",
+				  "dout_shared1_div4", "dout_shared2_div4",
+				  "dout_shared4_div4", "fout_shared3_pll" };
+PNAME(mout_clkcmu_fsys0_bus_p)	= {
+	"dout_shared4_div2", "dout_shared2_div3",
+	"dout_shared1_div4", "dout_shared2_div4" };
+PNAME(mout_clkcmu_fsys0_pcie_p) = { "oscclk", "dout_shared2_div4" };
+PNAME(mout_clkcmu_fsys1_bus_p)	= { "dout_shared2_div3", "dout_shared1_div4",
+				    "dout_shared2_div4", "dout_shared4_div4" };
+PNAME(mout_clkcmu_fsys1_usbdrd_p) = {
+	"oscclk", "dout_shared2_div3",
+	"dout_shared2_div4", "dout_shared4_div4" };
+PNAME(mout_clkcmu_fsys1_mmc_card_p) = {
+	"oscclk", "dout_shared2_div2",
+	"dout_shared4_div2", "dout_shared2_div3" };
+PNAME(mout_clkcmu_fsys2_ethernet_p) = {
+	"oscclk", "dout_shared2_div2",
+	"dout_shared0_div3", "dout_shared2_div3",
+	"dout_shared1_div4", "fout_shared3_pll" };
+PNAME(mout_clkcmu_g2d_g2d_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "dout_shared1_div4",
+				 "dout_shared2_div4", "dout_shared4_div4" };
+PNAME(mout_clkcmu_g3d0_switch_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				     "dout_shared2_div2", "dout_shared4_div2" };
+PNAME(mout_clkcmu_g3d1_switch_p) = { "dout_shared2_div2", "dout_shared4_div2",
+				     "dout_shared2_div3", "dout_shared1_div4" };
+PNAME(mout_clkcmu_mif_switch_p) = { "fout_shared0_pll", "fout_shared1_pll",
+				    "fout_shared2_pll", "fout_shared4_pll",
+				    "dout_shared0_div2", "dout_shared1_div2",
+				    "dout_shared2_div2", "fout_shared3_pll" };
+PNAME(mout_clkcmu_npu_bus_p) = { "dout_shared1_div2", "dout_shared2_div2",
+				 "dout_shared0_div3", "dout_shared4_div2",
+				 "dout_shared1_div3", "dout_shared2_div3",
+				 "dout_shared1_div4", "fout_shared3_pll" };
+PNAME(mout_clkcmu_peric0_bus_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+static const struct samsung_mux_clock top_mux_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+	MUX(MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
+	    PLL_CON0_PLL_SHARED0, 4, 1),
+	MUX(MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_p,
+	    PLL_CON0_PLL_SHARED1, 4, 1),
+	MUX(MOUT_SHARED2_PLL, "mout_shared2_pll", mout_shared2_pll_p,
+	    PLL_CON0_PLL_SHARED2, 4, 1),
+	MUX(MOUT_SHARED3_PLL, "mout_shared3_pll", mout_shared3_pll_p,
+	    PLL_CON0_PLL_SHARED3, 4, 1),
+	MUX(MOUT_SHARED4_PLL, "mout_shared4_pll", mout_shared4_pll_p,
+	    PLL_CON0_PLL_SHARED4, 4, 1),
+
+	/* BOOST */
+	MUX(MOUT_CLKCMU_CMU_BOOST, "mout_clkcmu_cmu_boost",
+	    mout_clkcmu_cmu_boost_p, CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST, 0, 2),
+	MUX(MOUT_CLKCMU_CMU_CMUREF, "mout_clkcmu_cmu_cmuref",
+	    mout_clkcmu_cmu_cmuref_p, CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
+
+	/* ACC */
+	MUX(MOUT_CLKCMU_ACC_BUS, "mout_clkcmu_acc_bus", mout_clkcmu_acc_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_ACC_BUS, 0, 2),
+
+	/* APM */
+	MUX(MOUT_CLKCMU_APM_BUS, "mout_clkcmu_apm_bus", mout_clkcmu_apm_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_APM_BUS, 0, 2),
+
+	/* AUD */
+	MUX(MOUT_CLKCMU_AUD_CPU, "mout_clkcmu_aud_cpu", mout_clkcmu_aud_cpu_p,
+	    CLK_CON_MUX_MUX_CLKCMU_AUD_CPU, 0, 3),
+	MUX(MOUT_CLKCMU_AUD_BUS, "mout_clkcmu_aud_bus", mout_clkcmu_aud_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_AUD_BUS, 0, 2),
+
+	/* BUSC */
+	MUX(MOUT_CLKCMU_BUSC_BUS, "mout_clkcmu_busc_bus",
+	    mout_clkcmu_busc_bus_p, CLK_CON_MUX_MUX_CLKCMU_BUSC_BUS, 0, 2),
+
+	/* BUSMC */
+	MUX(MOUT_CLKCMU_BUSMC_BUS, "mout_clkcmu_busmc_bus",
+	    mout_clkcmu_busc_bus_p, CLK_CON_MUX_MUX_CLKCMU_BUSMC_BUS, 0, 2),
+
+	/* CORE */
+	MUX(MOUT_CLKCMU_CORE_BUS, "mout_clkcmu_core_bus",
+	    mout_clkcmu_core_bus_p, CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 3),
+
+	/* CPUCL0 */
+	MUX(MOUT_CLKCMU_CPUCL0_SWITCH, "mout_clkcmu_cpucl0_switch",
+	    mout_clkcmu_cpucl0_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
+	    0, 2),
+	MUX(MOUT_CLKCMU_CPUCL0_CLUSTER, "mout_clkcmu_cpucl0_cluster",
+	    mout_clkcmu_cpucl0_cluster_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CPUCL0_CLUSTER, 0, 3),
+
+	/* CPUCL1 */
+	MUX(MOUT_CLKCMU_CPUCL1_SWITCH, "mout_clkcmu_cpucl1_switch",
+	    mout_clkcmu_cpucl0_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
+	    0, 2),
+	MUX(MOUT_CLKCMU_CPUCL1_CLUSTER, "mout_clkcmu_cpucl1_cluster",
+	    mout_clkcmu_cpucl0_cluster_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CPUCL1_CLUSTER, 0, 3),
+
+	/* DPTX */
+	MUX(MOUT_CLKCMU_DPTX_BUS, "mout_clkcmu_dptx_bus",
+	    mout_clkcmu_dptx_bus_p, CLK_CON_MUX_MUX_CLKCMU_DPTX_BUS, 0, 2),
+	MUX(MOUT_CLKCMU_DPTX_DPGTC, "mout_clkcmu_dptx_dpgtc",
+	    mout_clkcmu_dptx_dpgtc_p, CLK_CON_MUX_MUX_CLKCMU_DPTX_DPGTC, 0, 2),
+
+	/* DPUM */
+	MUX(MOUT_CLKCMU_DPUM_BUS, "mout_clkcmu_dpum_bus",
+	    mout_clkcmu_dpum_bus_p, CLK_CON_MUX_MUX_CLKCMU_DPUM_BUS, 0, 3),
+
+	/* DPUS */
+	MUX(MOUT_CLKCMU_DPUS0_BUS, "mout_clkcmu_dpus0_bus",
+	    mout_clkcmu_dpum_bus_p, CLK_CON_MUX_MUX_CLKCMU_DPUS0_BUS, 0, 3),
+	MUX(MOUT_CLKCMU_DPUS1_BUS, "mout_clkcmu_dpus1_bus",
+	    mout_clkcmu_dpum_bus_p, CLK_CON_MUX_MUX_CLKCMU_DPUS1_BUS, 0, 3),
+
+	/* FSYS0 */
+	MUX(MOUT_CLKCMU_FSYS0_BUS, "mout_clkcmu_fsys0_bus",
+	    mout_clkcmu_fsys0_bus_p, CLK_CON_MUX_MUX_CLKCMU_FSYS0_BUS, 0, 2),
+	MUX(MOUT_CLKCMU_FSYS0_PCIE, "mout_clkcmu_fsys0_pcie",
+	    mout_clkcmu_fsys0_pcie_p, CLK_CON_MUX_MUX_CLKCMU_FSYS0_PCIE, 0, 1),
+
+	/* FSYS1 */
+	MUX(MOUT_CLKCMU_FSYS1_BUS, "mout_clkcmu_fsys1_bus",
+	    mout_clkcmu_fsys1_bus_p, CLK_CON_MUX_MUX_CLKCMU_FSYS1_BUS, 0, 2),
+	MUX(MOUT_CLKCMU_FSYS1_USBDRD, "mout_clkcmu_fsys1_usbdrd",
+	    mout_clkcmu_fsys1_usbdrd_p, CLK_CON_MUX_MUX_CLKCMU_FSYS1_USBDRD,
+	    0, 2),
+	MUX(MOUT_CLKCMU_FSYS1_MMC_CARD, "mout_clkcmu_fsys1_mmc_card",
+	    mout_clkcmu_fsys1_mmc_card_p,
+	    CLK_CON_MUX_MUX_CLKCMU_FSYS1_MMC_CARD, 0, 2),
+
+	/* FSYS2 */
+	MUX(MOUT_CLKCMU_FSYS2_BUS, "mout_clkcmu_fsys2_bus",
+	    mout_clkcmu_fsys0_bus_p, CLK_CON_MUX_MUX_CLKCMU_FSYS2_BUS, 0, 2),
+	MUX(MOUT_CLKCMU_FSYS2_UFS_EMBD, "mout_clkcmu_fsys2_ufs_embd",
+	    mout_clkcmu_fsys1_usbdrd_p, CLK_CON_MUX_MUX_CLKCMU_FSYS2_UFS_EMBD,
+	    0, 2),
+	MUX(MOUT_CLKCMU_FSYS2_ETHERNET, "mout_clkcmu_fsys2_ethernet",
+	    mout_clkcmu_fsys2_ethernet_p,
+	    CLK_CON_MUX_MUX_CLKCMU_FSYS2_ETHERNET, 0, 3),
+
+	/* G2D */
+	MUX(MOUT_CLKCMU_G2D_G2D, "mout_clkcmu_g2d_g2d", mout_clkcmu_g2d_g2d_p,
+	    CLK_CON_MUX_MUX_CLKCMU_G2D_G2D, 0, 3),
+	MUX(MOUT_CLKCMU_G2D_MSCL, "mout_clkcmu_g2d_mscl",
+	    mout_clkcmu_fsys1_bus_p, CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 2),
+
+	/* G3D0 */
+	MUX(MOUT_CLKCMU_G3D00_SWITCH, "mout_clkcmu_g3d00_switch",
+	    mout_clkcmu_g3d0_switch_p, CLK_CON_MUX_MUX_CLKCMU_G3D00_SWITCH,
+	    0, 2),
+	MUX(MOUT_CLKCMU_G3D01_SWITCH, "mout_clkcmu_g3d01_switch",
+	    mout_clkcmu_g3d0_switch_p, CLK_CON_MUX_MUX_CLKCMU_G3D01_SWITCH,
+	    0, 2),
+
+	/* G3D1 */
+	MUX(MOUT_CLKCMU_G3D1_SWITCH, "mout_clkcmu_g3d1_switch",
+	    mout_clkcmu_g3d1_switch_p, CLK_CON_MUX_MUX_CLKCMU_G3D1_SWITCH,
+	    0, 2),
+
+	/* ISPB */
+	MUX(MOUT_CLKCMU_ISPB_BUS, "mout_clkcmu_ispb_bus",
+	    mout_clkcmu_acc_bus_p, CLK_CON_MUX_MUX_CLKCMU_ISPB_BUS, 0, 2),
+
+	/* MFC */
+	MUX(MOUT_CLKCMU_MFC_MFC, "mout_clkcmu_mfc_mfc",
+	    mout_clkcmu_g3d1_switch_p, CLK_CON_MUX_MUX_CLKCMU_MFC_MFC, 0, 2),
+	MUX(MOUT_CLKCMU_MFC_WFD, "mout_clkcmu_mfc_wfd",
+	    mout_clkcmu_fsys0_bus_p, CLK_CON_MUX_MUX_CLKCMU_MFC_WFD, 0, 2),
+
+	/* MIF */
+	MUX(MOUT_CLKCMU_MIF_SWITCH, "mout_clkcmu_mif_switch",
+	    mout_clkcmu_mif_switch_p, CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH, 0, 3),
+	MUX(MOUT_CLKCMU_MIF_BUSP, "mout_clkcmu_mif_busp",
+	    mout_clkcmu_fsys1_bus_p, CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP, 0, 2),
+
+	/* NPU */
+	MUX(MOUT_CLKCMU_NPU_BUS, "mout_clkcmu_npu_bus", mout_clkcmu_npu_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_NPU_BUS, 0, 3),
+
+	/* PERIC0 */
+	MUX(MOUT_CLKCMU_PERIC0_BUS, "mout_clkcmu_peric0_bus",
+	    mout_clkcmu_peric0_bus_p, CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 1),
+	MUX(MOUT_CLKCMU_PERIC0_IP, "mout_clkcmu_peric0_ip",
+	    mout_clkcmu_peric0_bus_p, CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 1),
+
+	/* PERIC1 */
+	MUX(MOUT_CLKCMU_PERIC1_BUS, "mout_clkcmu_peric1_bus",
+	    mout_clkcmu_peric0_bus_p, CLK_CON_MUX_MUX_CLKCMU_PERIC1_BUS, 0, 1),
+	MUX(MOUT_CLKCMU_PERIC1_IP, "mout_clkcmu_peric1_ip",
+	    mout_clkcmu_peric0_bus_p, CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP, 0, 1),
+
+	/* PERIS */
+	MUX(MOUT_CLKCMU_PERIS_BUS, "mout_clkcmu_peris_bus",
+	    mout_clkcmu_peric0_bus_p, CLK_CON_MUX_MUX_CLKCMU_PERIS_BUS, 0, 1),
+
+};
+
+static const struct samsung_div_clock top_div_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+	DIV(DOUT_SHARED0_DIV3, "dout_shared0_div3", "mout_shared0_pll",
+	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
+	DIV(DOUT_SHARED0_DIV2, "dout_shared0_div2", "mout_shared0_pll",
+	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
+
+	DIV(DOUT_SHARED1_DIV3, "dout_shared1_div3", "mout_shared1_pll",
+	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
+	DIV(DOUT_SHARED1_DIV2, "dout_shared1_div2", "mout_shared1_pll",
+	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
+	DIV(DOUT_SHARED1_DIV4, "dout_shared1_div4", "dout_shared1_div2",
+	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
+
+	DIV(DOUT_SHARED2_DIV3, "dout_shared2_div3", "mout_shared2_pll",
+	    CLK_CON_DIV_PLL_SHARED2_DIV3, 0, 2),
+	DIV(DOUT_SHARED2_DIV2, "dout_shared2_div2", "mout_shared2_pll",
+	    CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
+	DIV(DOUT_SHARED2_DIV4, "dout_shared2_div4", "dout_shared2_div2",
+	    CLK_CON_DIV_PLL_SHARED2_DIV4, 0, 1),
+
+	DIV(DOUT_SHARED4_DIV2, "dout_shared4_div2", "mout_shared4_pll",
+	    CLK_CON_DIV_PLL_SHARED4_DIV2, 0, 1),
+	DIV(DOUT_SHARED4_DIV4, "dout_shared4_div4", "dout_shared4_div2",
+	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
+
+	/* BOOST */
+	DIV(DOUT_CLKCMU_CMU_BOOST, "dout_clkcmu_cmu_boost",
+	    "gout_clkcmu_cmu_boost", CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST, 0, 2),
+
+	/* ACC */
+	DIV(DOUT_CLKCMU_ACC_BUS, "dout_clkcmu_acc_bus", "gout_clkcmu_acc_bus",
+	    CLK_CON_DIV_CLKCMU_ACC_BUS, 0, 4),
+
+	/* APM */
+	DIV(DOUT_CLKCMU_APM_BUS, "dout_clkcmu_apm_bus", "gout_clkcmu_apm_bus",
+	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
+
+	/* AUD */
+	DIV(DOUT_CLKCMU_AUD_CPU, "dout_clkcmu_aud_cpu", "gout_clkcmu_aud_cpu",
+	    CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
+	DIV(DOUT_CLKCMU_AUD_BUS, "dout_clkcmu_aud_bus", "gout_clkcmu_aud_bus",
+	    CLK_CON_DIV_CLKCMU_AUD_BUS, 0, 4),
+
+	/* BUSC */
+	DIV(DOUT_CLKCMU_BUSC_BUS, "dout_clkcmu_busc_bus",
+	    "gout_clkcmu_busc_bus", CLK_CON_DIV_CLKCMU_BUSC_BUS, 0, 4),
+
+	/* BUSMC */
+	DIV(DOUT_CLKCMU_BUSMC_BUS, "dout_clkcmu_busmc_bus",
+	    "gout_clkcmu_busmc_bus", CLK_CON_DIV_CLKCMU_BUSMC_BUS, 0, 4),
+
+	/* CORE */
+	DIV(DOUT_CLKCMU_CORE_BUS, "dout_clkcmu_core_bus",
+	    "gout_clkcmu_core_bus", CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
+
+	/* CPUCL0 */
+	DIV(DOUT_CLKCMU_CPUCL0_SWITCH, "dout_clkcmu_cpucl0_switch",
+	    "gout_clkcmu_cpucl0_switch", CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH,
+	    0, 3),
+	DIV(DOUT_CLKCMU_CPUCL0_CLUSTER, "dout_clkcmu_cpucl0_cluster",
+	    "gout_clkcmu_cpucl0_cluster", CLK_CON_DIV_CLKCMU_CPUCL0_CLUSTER,
+	    0, 3),
+
+	/* CPUCL1 */
+	DIV(DOUT_CLKCMU_CPUCL1_SWITCH, "dout_clkcmu_cpucl1_switch",
+	    "gout_clkcmu_cpucl1_switch", CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH,
+	    0, 3),
+	DIV(DOUT_CLKCMU_CPUCL1_CLUSTER, "dout_clkcmu_cpucl1_cluster",
+	    "gout_clkcmu_cpucl1_cluster", CLK_CON_DIV_CLKCMU_CPUCL1_CLUSTER,
+	    0, 3),
+
+	/* DPTX */
+	DIV(DOUT_CLKCMU_DPTX_BUS, "dout_clkcmu_dptx_bus",
+	    "gout_clkcmu_dptx_bus", CLK_CON_DIV_CLKCMU_DPTX_BUS, 0, 4),
+	DIV(DOUT_CLKCMU_DPTX_DPGTC, "dout_clkcmu_dptx_dpgtc",
+	    "gout_clkcmu_dptx_dpgtc", CLK_CON_DIV_CLKCMU_DPTX_DPGTC, 0, 3),
+
+	/* DPUM */
+	DIV(DOUT_CLKCMU_DPUM_BUS, "dout_clkcmu_dpum_bus",
+	    "gout_clkcmu_dpum_bus", CLK_CON_DIV_CLKCMU_DPUM_BUS, 0, 4),
+
+	/* DPUS */
+	DIV(DOUT_CLKCMU_DPUS0_BUS, "dout_clkcmu_dpus0_bus",
+	    "gout_clkcmu_dpus0_bus", CLK_CON_DIV_CLKCMU_DPUS0_BUS, 0, 4),
+	DIV(DOUT_CLKCMU_DPUS1_BUS, "dout_clkcmu_dpus1_bus",
+	    "gout_clkcmu_dpus1_bus", CLK_CON_DIV_CLKCMU_DPUS1_BUS, 0, 4),
+
+	/* FSYS0 */
+	DIV(DOUT_CLKCMU_FSYS0_BUS, "dout_clkcmu_fsys0_bus",
+	    "gout_clkcmu_fsys0_bus", CLK_CON_DIV_CLKCMU_FSYS0_BUS, 0, 4),
+
+	/* FSYS1 */
+	DIV(DOUT_CLKCMU_FSYS1_BUS, "dout_clkcmu_fsys1_bus",
+	    "gout_clkcmu_fsys1_bus", CLK_CON_DIV_CLKCMU_FSYS1_BUS, 0, 4),
+	DIV(DOUT_CLKCMU_FSYS1_USBDRD, "dout_clkcmu_fsys1_usbdrd",
+	    "gout_clkcmu_fsys1_usbdrd", CLK_CON_DIV_CLKCMU_FSYS1_USBDRD, 0, 4),
+
+	/* FSYS2 */
+	DIV(DOUT_CLKCMU_FSYS2_BUS, "dout_clkcmu_fsys2_bus",
+	    "gout_clkcmu_fsys2_bus", CLK_CON_DIV_CLKCMU_FSYS2_BUS, 0, 4),
+	DIV(DOUT_CLKCMU_FSYS2_UFS_EMBD, "dout_clkcmu_fsys2_ufs_embd",
+	    "gout_clkcmu_fsys2_ufs_embd", CLK_CON_DIV_CLKCMU_FSYS2_UFS_EMBD,
+	    0, 3),
+	DIV(DOUT_CLKCMU_FSYS2_ETHERNET, "dout_clkcmu_fsys2_ethernet",
+	    "gout_clkcmu_fsys2_ethernet", CLK_CON_DIV_CLKCMU_FSYS2_ETHERNET,
+	    0, 3),
+
+	/* G2D */
+	DIV(DOUT_CLKCMU_G2D_G2D, "dout_clkcmu_g2d_g2d", "gout_clkcmu_g2d_g2d",
+	    CLK_CON_DIV_CLKCMU_G2D_G2D, 0, 4),
+	DIV(DOUT_CLKCMU_G2D_MSCL, "dout_clkcmu_g2d_mscl",
+	    "gout_clkcmu_g2d_mscl", CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
+
+	/* G3D0 */
+	DIV(DOUT_CLKCMU_G3D00_SWITCH, "dout_clkcmu_g3d00_switch",
+	    "gout_clkcmu_g3d00_switch", CLK_CON_DIV_CLKCMU_G3D00_SWITCH, 0, 3),
+	DIV(DOUT_CLKCMU_G3D01_SWITCH, "dout_clkcmu_g3d01_switch",
+	    "gout_clkcmu_g3d01_switch", CLK_CON_DIV_CLKCMU_G3D01_SWITCH, 0, 3),
+
+	/* G3D1 */
+	DIV(DOUT_CLKCMU_G3D1_SWITCH, "dout_clkcmu_g3d1_switch",
+	    "gout_clkcmu_g3d1_switch", CLK_CON_DIV_CLKCMU_G3D1_SWITCH, 0, 3),
+
+	/* ISPB */
+	DIV(DOUT_CLKCMU_ISPB_BUS, "dout_clkcmu_ispb_bus",
+	    "gout_clkcmu_ispb_bus", CLK_CON_DIV_CLKCMU_ISPB_BUS, 0, 4),
+
+	/* MFC */
+	DIV(DOUT_CLKCMU_MFC_MFC, "dout_clkcmu_mfc_mfc", "gout_clkcmu_mfc_mfc",
+	    CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
+	DIV(DOUT_CLKCMU_MFC_WFD, "dout_clkcmu_mfc_wfd", "gout_clkcmu_mfc_wfd",
+	    CLK_CON_DIV_CLKCMU_MFC_WFD, 0, 4),
+
+	/* MIF */
+	DIV(DOUT_CLKCMU_MIF_BUSP, "dout_clkcmu_mif_busp",
+	    "gout_clkcmu_mif_busp", CLK_CON_DIV_CLKCMU_MIF_BUSP, 0, 4),
+
+	/* NPU */
+	DIV(DOUT_CLKCMU_NPU_BUS, "dout_clkcmu_npu_bus", "gout_clkcmu_npu_bus",
+	    CLK_CON_DIV_CLKCMU_NPU_BUS, 0, 4),
+
+	/* PERIC0 */
+	DIV(DOUT_CLKCMU_PERIC0_BUS, "dout_clkcmu_peric0_bus",
+	    "gout_clkcmu_peric0_bus", CLK_CON_DIV_CLKCMU_PERIC0_BUS, 0, 4),
+	DIV(DOUT_CLKCMU_PERIC0_IP, "dout_clkcmu_peric0_ip",
+	    "gout_clkcmu_peric0_ip", CLK_CON_DIV_CLKCMU_PERIC0_IP, 0, 4),
+
+	/* PERIC1 */
+	DIV(DOUT_CLKCMU_PERIC1_BUS, "dout_clkcmu_peric1_bus",
+	    "gout_clkcmu_peric1_bus", CLK_CON_DIV_CLKCMU_PERIC1_BUS, 0, 4),
+	DIV(DOUT_CLKCMU_PERIC1_IP, "dout_clkcmu_peric1_ip",
+	    "gout_clkcmu_peric1_ip", CLK_CON_DIV_CLKCMU_PERIC1_IP, 0, 4),
+
+	/* PERIS */
+	DIV(DOUT_CLKCMU_PERIS_BUS, "dout_clkcmu_peris_bus",
+	    "gout_clkcmu_peris_bus", CLK_CON_DIV_CLKCMU_PERIS_BUS, 0, 4),
+};
+
+static
+const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
+	FFACTOR(DOUT_CLKCMU_FSYS0_PCIE, "dout_clkcmu_fsys0_pcie",
+		"gout_clkcmu_fsys0_pcie", 1, 4, 0),
+};
+
+static const struct samsung_gate_clock top_gate_clks[] __initconst = {
+	/* BOOST */
+	GATE(GOUT_CLKCMU_CMU_BOOST, "gout_clkcmu_cmu_boost",
+	     "mout_clkcmu_cmu_boost", CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST,
+	     21, 0, 0),
+
+	GATE(GOUT_CLKCMU_CPUCL0_BOOST, "gout_clkcmu_cpucl0_boost",
+	     "dout_cmu_boost", CLK_CON_GAT_CLKCMU_CMU_CPUCL0_BOOST, 21, 0, 0),
+	GATE(GOUT_CLKCMU_CPUCL1_BOOST, "gout_clkcmu_cpucl1_boost",
+	     "dout_cmu_boost", CLK_CON_GAT_CLKCMU_CMU_CPUCL1_BOOST, 21, 0, 0),
+	GATE(GOUT_CLKCMU_CORE_BOOST, "gout_clkcmu_core_boost",
+	     "dout_cmu_boost", CLK_CON_GAT_CLKCMU_CMU_CORE_BOOST, 21, 0, 0),
+	GATE(GOUT_CLKCMU_BUSC_BOOST, "gout_clkcmu_busc_boost",
+	     "dout_cmu_boost", CLK_CON_GAT_CLKCMU_CMU_BUSC_BOOST, 21, 0, 0),
+
+	GATE(GOUT_CLKCMU_BUSMC_BOOST, "gout_clkcmu_busmc_boost",
+	     "dout_cmu_boost", CLK_CON_GAT_CLKCMU_CMU_BUSMC_BOOST, 21, 0, 0),
+	GATE(GOUT_CLKCMU_MIF_BOOST, "gout_clkcmu_mif_boost", "dout_cmu_boost",
+	     CLK_CON_GAT_CLKCMU_CMU_MIF_BOOST, 21, 0, 0),
+
+	/* ACC */
+	GATE(GOUT_CLKCMU_ACC_BUS, "gout_clkcmu_acc_bus", "mout_clkcmu_acc_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_ACC_BUS, 21, 0, 0),
+
+	/* APM */
+	GATE(GOUT_CLKCMU_APM_BUS, "gout_clkcmu_apm_bus", "mout_clkcmu_apm_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_APM_BUS, 21, CLK_IGNORE_UNUSED, 0),
+
+	/* AUD */
+	GATE(GOUT_CLKCMU_AUD_CPU, "gout_clkcmu_aud_cpu", "mout_clkcmu_aud_cpu",
+	     CLK_CON_GAT_GATE_CLKCMU_AUD_CPU, 21, 0, 0),
+	GATE(GOUT_CLKCMU_AUD_BUS, "gout_clkcmu_aud_bus", "mout_clkcmu_aud_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_AUD_BUS, 21, 0, 0),
+
+	/* BUSC */
+	GATE(GOUT_CLKCMU_BUSC_BUS, "gout_clkcmu_busc_bus",
+	     "mout_clkcmu_busc_bus", CLK_CON_GAT_GATE_CLKCMU_BUSC_BUS, 21,
+	     CLK_IS_CRITICAL, 0),
+
+	/* BUSMC */
+	GATE(GOUT_CLKCMU_BUSMC_BUS, "gout_clkcmu_busmc_bus",
+	     "mout_clkcmu_busmc_bus", CLK_CON_GAT_GATE_CLKCMU_BUSMC_BUS, 21,
+	     CLK_IS_CRITICAL, 0),
+
+	/* CORE */
+	GATE(GOUT_CLKCMU_CORE_BUS, "gout_clkcmu_core_bus",
+	     "mout_clkcmu_core_bus", CLK_CON_GAT_GATE_CLKCMU_CORE_BUS,
+	     21, 0, 0),
+
+	/* CPUCL0 */
+	GATE(GOUT_CLKCMU_CPUCL0_SWITCH, "gout_clkcmu_cpucl0_switch",
+	     "mout_clkcmu_cpucl0_switch",
+	     CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(GOUT_CLKCMU_CPUCL0_CLUSTER, "gout_clkcmu_cpucl0_cluster",
+	     "mout_clkcmu_cpucl0_cluster",
+	     CLK_CON_GAT_GATE_CLKCMU_CPUCL0_CLUSTER, 21, CLK_IGNORE_UNUSED, 0),
+
+	/* CPUCL1 */
+	GATE(GOUT_CLKCMU_CPUCL1_SWITCH, "gout_clkcmu_cpucl1_switch",
+	     "mout_clkcmu_cpucl1_switch",
+	     CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(GOUT_CLKCMU_CPUCL1_CLUSTER, "gout_clkcmu_cpucl1_cluster",
+	     "mout_clkcmu_cpucl1_cluster",
+	     CLK_CON_GAT_GATE_CLKCMU_CPUCL1_CLUSTER, 21, CLK_IGNORE_UNUSED, 0),
+
+	/* DPTX */
+	GATE(GOUT_CLKCMU_DPTX_BUS, "gout_clkcmu_dptx_bus",
+	     "mout_clkcmu_dptx_bus", CLK_CON_GAT_GATE_CLKCMU_DPTX_BUS,
+	     21, 0, 0),
+	GATE(GOUT_CLKCMU_DPTX_DPGTC, "gout_clkcmu_dptx_dpgtc",
+	     "mout_clkcmu_dptx_dpgtc", CLK_CON_GAT_GATE_CLKCMU_DPTX_DPGTC,
+	     21, 0, 0),
+
+	/* DPUM */
+	GATE(GOUT_CLKCMU_DPUM_BUS, "gout_clkcmu_dpum_bus",
+	     "mout_clkcmu_dpum_bus", CLK_CON_GAT_GATE_CLKCMU_DPUM_BUS,
+	     21, 0, 0),
+
+	/* DPUS */
+	GATE(GOUT_CLKCMU_DPUS0_BUS, "gout_clkcmu_dpus0_bus",
+	     "mout_clkcmu_dpus0_bus", CLK_CON_GAT_GATE_CLKCMU_DPUS0_BUS,
+	     21, 0, 0),
+	GATE(GOUT_CLKCMU_DPUS1_BUS, "gout_clkcmu_dpus1_bus",
+	     "mout_clkcmu_dpus1_bus", CLK_CON_GAT_GATE_CLKCMU_DPUS1_BUS,
+	     21, 0, 0),
+
+	/* FSYS0 */
+	GATE(GOUT_CLKCMU_FSYS0_BUS, "gout_clkcmu_fsys0_bus",
+	     "mout_clkcmu_fsys0_bus", CLK_CON_GAT_GATE_CLKCMU_FSYS0_BUS,
+	     21, 0, 0),
+	GATE(GOUT_CLKCMU_FSYS0_PCIE, "gout_clkcmu_fsys0_pcie",
+	     "mout_clkcmu_fsys0_pcie", CLK_CON_GAT_GATE_CLKCMU_FSYS0_PCIE,
+	     21, 0, 0),
+
+	/* FSYS1 */
+	GATE(GOUT_CLKCMU_FSYS1_BUS, "gout_clkcmu_fsys1_bus",
+	     "mout_clkcmu_fsys1_bus", CLK_CON_GAT_GATE_CLKCMU_FSYS1_BUS,
+	     21, 0, 0),
+	GATE(GOUT_CLKCMU_FSYS1_USBDRD, "gout_clkcmu_fsys1_usbdrd",
+	     "mout_clkcmu_fsys1_usbdrd", CLK_CON_GAT_GATE_CLKCMU_FSYS1_USBDRD,
+	     21, 0, 0),
+	GATE(GOUT_CLKCMU_FSYS1_MMC_CARD, "gout_clkcmu_fsys1_mmc_card",
+	     "mout_clkcmu_fsys1_mmc_card",
+	     CLK_CON_GAT_GATE_CLKCMU_FSYS1_MMC_CARD, 21, 0, 0),
+
+	/* FSYS2 */
+	GATE(GOUT_CLKCMU_FSYS2_BUS, "gout_clkcmu_fsys2_bus",
+	     "mout_clkcmu_fsys2_bus", CLK_CON_GAT_GATE_CLKCMU_FSYS2_BUS,
+	     21, 0, 0),
+	GATE(GOUT_CLKCMU_FSYS2_UFS_EMBD, "gout_clkcmu_fsys2_ufs_embd",
+	     "mout_clkcmu_fsys2_ufs_embd",
+	     CLK_CON_GAT_GATE_CLKCMU_FSYS2_UFS_EMBD, 21, 0, 0),
+	GATE(GOUT_CLKCMU_FSYS2_ETHERNET, "gout_clkcmu_fsys2_ethernet",
+	     "mout_clkcmu_fsys2_ethernet",
+	     CLK_CON_GAT_GATE_CLKCMU_FSYS2_ETHERNET, 21, 0, 0),
+
+	/* G2D */
+	GATE(GOUT_CLKCMU_G2D_G2D, "gout_clkcmu_g2d_g2d",
+	     "mout_clkcmu_g2d_g2d", CLK_CON_GAT_GATE_CLKCMU_G2D_G2D, 21, 0, 0),
+	GATE(GOUT_CLKCMU_G2D_MSCL, "gout_clkcmu_g2d_mscl",
+	     "mout_clkcmu_g2d_mscl", CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL,
+	     21, 0, 0),
+
+	/* G3D0 */
+	GATE(GOUT_CLKCMU_G3D00_SWITCH, "gout_clkcmu_g3d00_switch",
+	     "mout_clkcmu_g3d00_switch", CLK_CON_GAT_GATE_CLKCMU_G3D00_SWITCH,
+	     21, 0, 0),
+	GATE(GOUT_CLKCMU_G3D01_SWITCH, "gout_clkcmu_g3d01_switch",
+	     "mout_clkcmu_g3d01_switch", CLK_CON_GAT_GATE_CLKCMU_G3D01_SWITCH,
+	     21, 0, 0),
+
+	/* G3D1 */
+	GATE(GOUT_CLKCMU_G3D1_SWITCH, "gout_clkcmu_g3d1_switch",
+	     "mout_clkcmu_g3d1_switch", CLK_CON_GAT_GATE_CLKCMU_G3D1_SWITCH,
+	     21, 0, 0),
+
+	/* ISPB */
+	GATE(GOUT_CLKCMU_ISPB_BUS, "gout_clkcmu_ispb_bus",
+	     "mout_clkcmu_ispb_bus", CLK_CON_GAT_GATE_CLKCMU_ISPB_BUS,
+	     21, 0, 0),
+
+	/* MFC */
+	GATE(GOUT_CLKCMU_MFC_MFC, "gout_clkcmu_mfc_mfc", "mout_clkcmu_mfc_mfc",
+	     CLK_CON_GAT_GATE_CLKCMU_MFC_MFC, 21, 0, 0),
+	GATE(GOUT_CLKCMU_MFC_WFD, "gout_clkcmu_mfc_wfd", "mout_clkcmu_mfc_wfd",
+	     CLK_CON_GAT_GATE_CLKCMU_MFC_WFD, 21, 0, 0),
+
+	/* MIF */
+	GATE(GOUT_CLKCMU_MIF_SWITCH, "gout_clkcmu_mif_switch",
+	     "mout_clkcmu_mif_switch", CLK_CON_GAT_GATE_CLKCMU_MIF_SWITCH,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(GOUT_CLKCMU_MIF_BUSP, "gout_clkcmu_mif_busp",
+	     "mout_clkcmu_mif_busp", CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP,
+	     21, CLK_IGNORE_UNUSED, 0),
+
+	/* NPU */
+	GATE(GOUT_CLKCMU_NPU_BUS, "gout_clkcmu_npu_bus", "mout_clkcmu_npu_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_NPU_BUS, 21, 0, 0),
+
+	/* PERIC0 */
+	GATE(GOUT_CLKCMU_PERIC0_BUS, "gout_clkcmu_peric0_bus",
+	     "mout_clkcmu_peric0_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
+	     21, 0, 0),
+	GATE(GOUT_CLKCMU_PERIC0_IP, "gout_clkcmu_peric0_ip",
+	     "mout_clkcmu_peric0_ip", CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP,
+	     21, 0, 0),
+
+	/* PERIC1 */
+	GATE(GOUT_CLKCMU_PERIC1_BUS, "gout_clkcmu_peric1_bus",
+	     "mout_clkcmu_peric1_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS,
+	     21, 0, 0),
+	GATE(GOUT_CLKCMU_PERIC1_IP, "gout_clkcmu_peric1_ip",
+	     "mout_clkcmu_peric1_ip", CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP,
+	     21, 0, 0),
+
+	/* PERIS */
+	GATE(GOUT_CLKCMU_PERIS_BUS, "gout_clkcmu_peris_bus",
+	     "mout_clkcmu_peris_bus", CLK_CON_GAT_GATE_CLKCMU_PERIS_BUS,
+	     21, CLK_IGNORE_UNUSED, 0),
+
+};
+
+static const struct samsung_cmu_info top_cmu_info __initconst = {
+	.pll_clks		= top_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(top_pll_clks),
+	.mux_clks		= top_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(top_mux_clks),
+	.div_clks		= top_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(top_div_clks),
+	.fixed_factor_clks	= top_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(top_fixed_factor_clks),
+	.gate_clks		= top_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(top_gate_clks),
+	.nr_clk_ids		= TOP_NR_CLK,
+	.clk_regs		= top_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(top_clk_regs),
+};
+
+static void __init exynosautov9_cmu_top_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &top_cmu_info);
+}
+
+/* Register CMU_TOP early, as it's a dependency for other early domains */
+CLK_OF_DECLARE(exynosautov9_cmu_top, "samsung,exynosautov9-cmu-top",
+	       exynosautov9_cmu_top_init);
-- 
2.36.0

