Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0532E5B02;
	Sun, 14 Sep 2025 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757884801; cv=none; b=sq4gsdGN2kalPbByMRX1ZTwGH30ze4QuR9jC9fTRVKSg2S9v+kDfr32YGgkR3zwFv/WSSvzf+sbw4nGHEHuDfZq9Vhve8x0S72O99XeaOPLc4VMYT2xFrbGntN2ZX2CKaKMj+QhFTV3UN+e7qtJj+d8UUUHEFbL1eTvfSF8jIYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757884801; c=relaxed/simple;
	bh=kCp1jexKQekPbdZCBSC1Iiv0b4wjfXOzqDr8I/plKQw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLS332SxkmuCYETUxULbYD39DsZhU/LDwiGVkaNR4hnblr/E81kqSkTJ0c3tkvvBtesGBuzldVQnDsIX8+sZ9L/y8w7hUoMPQlNGzOx+Qz3REwAfWHcgZcePEYNECrU1Vbo9boHGrbXyST3HpOXUEl2Pez3LsoHmC/eogU/GXXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=NJQ/nM4w; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="NJQ/nM4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757884790; x=1758143990;
	bh=//QYeo4QFAh6KpfWxWsMkuoRuLgv9YqHLbs8vwoikmc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NJQ/nM4wf1tspAdQ3T+LoOMD92GZ6FZ5IRw7IIc8pptD54VVfXDsMmdc9Sxot6W1B
	 4udHZ4+Nf1joZV0tYRLuLAJFKpPP1Kn5rJC7M1EKQUeYkV3RE+Dz+w98h+JvevdSCx
	 Vc5VZalaDKm+rMNQqxH8PCfoBsZonqAt/h8v2C8i0s/L0sQstoNgOx3mojtEBdqv0J
	 h/RWvIid7ssXG38O/hq9eKeixXYWMZ/mJHp6dnlhCjZ0/pUuZ2sOv/tOH/0kUVJKZU
	 mK3NMvDRNwOQVf+HJnUDwmVQRPTVTCPDu8tL9pHbpsrBpmac8ZE2zflRBKyVx9V8Ci
	 PGOXtCv9AILmg==
Date: Sun, 14 Sep 2025 21:19:44 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandru Chimac <alexchimac@protonmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 3/8] clk: samsung: Introduce Exynos9610 clock controller driver
Message-ID: <20250915-exynos9610-clocks-v1-3-3f615022b178@chimac.ro>
In-Reply-To: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: cb4470e6a6601082a7601f3084bd2c2564521a13
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The current implementation contains support for:
- CMU_TOP - which generates clocks for other blocks
- CMU_APM - which generates clocks for APM and CMU_CMGP
- CMU_CAM
- CMU_CMGP
- CMU_CORE
- CMU_CPUCL0/1
- CMU_DISPAUD - which generates clocks for display and ABOX
- CMU_FSYS - which generates clocks for MMC/UFS
- CMU_G2D, G3D
- CMU_PERI - which generates clocks for peripherals

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 drivers/clk/samsung/Makefile         |    1 +
 drivers/clk/samsung/clk-exynos9610.c | 3652 ++++++++++++++++++++++++++++++=
++++
 2 files changed, 3653 insertions(+)

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index ef464f434740f96623f9df62f94e2903e14e2226..2605bdecb5fff6b5a8f73cad50e=
8c1a618cfba63 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)=09+=3D clk-exynos78=
70.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)=09+=3D clk-exynos7885.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)=09+=3D clk-exynos850.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)=09+=3D clk-exynos8895.o
+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)=09+=3D clk-exynos9610.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)=09+=3D clk-exynos990.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)=09+=3D clk-exynosautov9.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)=09+=3D clk-exynosautov920.o
diff --git a/drivers/clk/samsung/clk-exynos9610.c b/drivers/clk/samsung/clk=
-exynos9610.c
new file mode 100644
index 0000000000000000000000000000000000000000..637daae1e4969dba15518f73da7=
4648981351dcb
--- /dev/null
+++ b/drivers/clk/samsung/clk-exynos9610.c
@@ -0,0 +1,3652 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common clock framework for Exynos9610
+ *
+ * Copyright (c) 2025, Alexandru Chimac <alex@chimac.ro>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/samsung,exynos9610.h>
+
+#include "clk.h"
+#include "clk-exynos-arm64.h"
+#include "clk-pll.h"
+
+#define CLKS_NR_TOP=09(CLK_GOUT_CMU_VIPX2_BUS + 1)
+#define CLKS_NR_APM=09(CLK_GOUT_APM_XIU_DP_ACLK + 1)
+#define CLKS_NR_CAM=09(CLK_GOUT_CAM_SYSREG_PCLK + 1)
+#define CLKS_NR_CMGP=09(CLK_GOUT_CMGP_USI_CMGP04_PCLK + 1)
+#define CLKS_NR_CORE=09(CLK_GOUT_CORE_XIU_D_ACLK + 1)
+#define CLKS_NR_CPUCL0=09(CLK_GOUT_CPUCL0_SYSREG_PCLK + 1)
+#define CLKS_NR_CPUCL1=09(CLK_GOUT_CPUCL1_SYSREG_PCLK + 1)
+#define CLKS_NR_DISPAUD=09(CLK_GOUT_DISPAUD_WDT_AUD_PCLK + 1)
+#define CLKS_NR_FSYS=09(CLK_GOUT_FSYS_XIU_D_ACLK + 1)
+#define CLKS_NR_G2D=09(CLK_GOUT_G2D_XIU_D_MSCL_ACLK + 1)
+#define CLKS_NR_G3D=09(CLK_GOUT_G3D_SYSREG_PCLK + 1)
+#define CLKS_NR_PERI=09(CLK_GOUT_PERI_WDT_CLUSTER1_PCLK + 1)
+
+/* TOP (0x12100000) */
+#define PLL_LOCKTIME_PLL_MMC=09=09=09=090x0000
+#define PLL_LOCKTIME_PLL_SHARED0=09=09=090x0004
+#define PLL_LOCKTIME_PLL_SHARED1=09=09=090x0008
+#define PLL_CON0_PLL_MMC=09=09=09=090x0100
+#define PLL_CON3_PLL_MMC=09=09=09=090x010c
+#define PLL_CON0_PLL_SHARED0=09=09=09=090x0120
+#define PLL_CON0_PLL_SHARED1=09=09=09=090x0140
+#define CLK_CON_MUX_MUX_CLKCMU_APM_BUS=09=09=090x1000
+#define CLK_CON_MUX_MUX_CLKCMU_CAM_BUS=09=09=090x1004
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK0=09=09=090x1008
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK1=09=09=090x100c
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK2=09=09=090x1010
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK3=09=09=090x1014
+#define CLK_CON_MUX_MUX_CLKCMU_CORE_BUS=09=09=090x1018
+#define CLK_CON_MUX_MUX_CLKCMU_CORE_CCI=09=09=090x101c
+#define CLK_CON_MUX_MUX_CLKCMU_CORE_G3D=09=09=090x1020
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG=09=090x1024
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH=09=090x1028
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH=09=090x102c
+#define CLK_CON_MUX_MUX_CLKCMU_DISPAUD_AUD=09=090x1030
+#define CLK_CON_MUX_MUX_CLKCMU_DISPAUD_CPU=09=090x1034
+#define CLK_CON_MUX_MUX_CLKCMU_DISPAUD_DISP=09=090x1038
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS_BUS=09=09=090x103c
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS_MMC_CARD=09=090x1040
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS_MMC_EMBD=09=090x1044
+#define CLK_CON_MUX_MUX_CLKCMU_FSYS_UFS_EMBD=09=090x1048
+#define CLK_CON_MUX_MUX_CLKCMU_G2D_G2D=09=09=090x104c
+#define CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL=09=09=090x1050
+#define CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH=09=090x1054
+#define CLK_CON_MUX_MUX_CLKCMU_HPM=09=09=090x1058
+#define CLK_CON_MUX_MUX_CLKCMU_ISP_BUS=09=09=090x105c
+#define CLK_CON_MUX_MUX_CLKCMU_ISP_GDC=09=09=090x1060
+#define CLK_CON_MUX_MUX_CLKCMU_ISP_VRA=09=09=090x1064
+#define CLK_CON_MUX_MUX_CLKCMU_MFC_MFC=09=09=090x1068
+#define CLK_CON_MUX_MUX_CLKCMU_MFC_WFD=09=09=090x106c
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP=09=09=090x1070
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH=09=090x1074
+#define CLK_CON_MUX_MUX_CLKCMU_PERI_BUS=09=09=090x1078
+#define CLK_CON_MUX_MUX_CLKCMU_PERI_IP=09=09=090x107c
+#define CLK_CON_MUX_MUX_CLKCMU_PERI_UART=09=090x1080
+#define CLK_CON_MUX_MUX_CLKCMU_USB_BUS=09=09=090x1084
+#define CLK_CON_MUX_MUX_CLKCMU_USB_DPGTC=09=090x1088
+#define CLK_CON_MUX_MUX_CLKCMU_USB_USB30DRD=09=090x108c
+#define CLK_CON_MUX_MUX_CLKCMU_VIPX1_BUS=09=090x1090
+#define CLK_CON_MUX_MUX_CLKCMU_VIPX2_BUS=09=090x1094
+#define CLK_CON_MUX_MUX_CLK_CMU_CMUREF=09=09=090x1098
+#define CLK_CON_MUX_MUX_CMU_CMUREF=09=09=090x109c
+#define CLK_CON_DIV_AP2CP_SHARED0_PLL_CLK=09=090x1800
+#define CLK_CON_DIV_AP2CP_SHARED1_PLL_CLK=09=090x1804
+#define CLK_CON_DIV_CLKCMU_APM_BUS=09=09=090x1808
+#define CLK_CON_DIV_CLKCMU_CAM_BUS=09=09=090x180c
+#define CLK_CON_DIV_CLKCMU_CIS_CLK0=09=09=090x1810
+#define CLK_CON_DIV_CLKCMU_CIS_CLK1=09=09=090x1814
+#define CLK_CON_DIV_CLKCMU_CIS_CLK2=09=09=090x1818
+#define CLK_CON_DIV_CLKCMU_CIS_CLK3=09=09=090x181c
+#define CLK_CON_DIV_CLKCMU_CORE_BUS=09=09=090x1820
+#define CLK_CON_DIV_CLKCMU_CORE_CCI=09=09=090x1824
+#define CLK_CON_DIV_CLKCMU_CORE_G3D=09=09=090x1828
+#define CLK_CON_DIV_CLKCMU_CPUCL0_DBG=09=09=090x182c
+#define CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH=09=090x1830
+#define CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH=09=090x1834
+#define CLK_CON_DIV_CLKCMU_DISPAUD_AUD=09=09=090x1838
+#define CLK_CON_DIV_CLKCMU_DISPAUD_CPU=09=09=090x183c
+#define CLK_CON_DIV_CLKCMU_DISPAUD_DISP=09=09=090x1840
+#define CLK_CON_DIV_CLKCMU_FSYS_BUS=09=09=090x1844
+#define CLK_CON_DIV_CLKCMU_FSYS_MMC_CARD=09=090x1848
+#define CLK_CON_DIV_CLKCMU_FSYS_MMC_EMBD=09=090x184c
+#define CLK_CON_DIV_CLKCMU_FSYS_UFS_EMBD=09=090x1850
+#define CLK_CON_DIV_CLKCMU_G2D_G2D=09=09=090x1854
+#define CLK_CON_DIV_CLKCMU_G2D_MSCL=09=09=090x1858
+#define CLK_CON_DIV_CLKCMU_G3D_SWITCH=09=09=090x185c
+#define CLK_CON_DIV_CLKCMU_HPM=09=09=09=090x1860
+#define CLK_CON_DIV_CLKCMU_ISP_BUS=09=09=090x1864
+#define CLK_CON_DIV_CLKCMU_ISP_GDC=09=09=090x1868
+#define CLK_CON_DIV_CLKCMU_ISP_VRA=09=09=090x186c
+#define CLK_CON_DIV_CLKCMU_MFC_MFC=09=09=090x1870
+#define CLK_CON_DIV_CLKCMU_MFC_WFD=09=09=090x1874
+#define CLK_CON_DIV_CLKCMU_MIF_BUSP=09=09=090x1878
+#define CLK_CON_DIV_CLKCMU_OTP=09=09=09=090x187c
+#define CLK_CON_DIV_CLKCMU_PERI_BUS=09=09=090x1880
+#define CLK_CON_DIV_CLKCMU_PERI_IP=09=09=090x1884
+#define CLK_CON_DIV_CLKCMU_PERI_UART=09=09=090x1888
+#define CLK_CON_DIV_CLKCMU_USB_BUS=09=09=090x188c
+#define CLK_CON_DIV_CLKCMU_USB_DPGTC=09=09=090x1890
+#define CLK_CON_DIV_CLKCMU_USB_USB30DRD=09=09=090x1894
+#define CLK_CON_DIV_CLKCMU_VIPX1_BUS=09=09=090x1898
+#define CLK_CON_DIV_CLKCMU_VIPX2_BUS=09=09=090x189c
+#define CLK_CON_DIV_DIV_CLK_CMU_CMUREF=09=09=090x18a0
+#define CLK_CON_DIV_PLL_MMC_DIV2=09=09=090x18a4
+#define CLK_CON_DIV_PLL_SHARED0_DIV2=09=09=090x18a8
+#define CLK_CON_DIV_PLL_SHARED0_DIV3=09=09=090x18ac
+#define CLK_CON_DIV_PLL_SHARED0_DIV4=09=09=090x18b0
+#define CLK_CON_DIV_PLL_SHARED1_DIV2=09=09=090x18b4
+#define CLK_CON_DIV_PLL_SHARED1_DIV3=09=09=090x18b8
+#define CLK_CON_DIV_PLL_SHARED1_DIV4=09=09=090x18bc
+#define CLK_CON_GAT_CLKCMU_MIF_SWITCH=09=09=090x2000
+#define CLK_CON_GAT_CLK_CMU_OTP_CLK=09=09=090x2004
+#define CLK_CON_GAT_GATE_CLKCMU_APM_BUS=09=09=090x2008
+#define CLK_CON_GAT_GATE_CLKCMU_CAM_BUS=09=09=090x200c
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0=09=090x2010
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1=09=090x2014
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2=09=090x2018
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3=09=090x201c
+#define CLK_CON_GAT_GATE_CLKCMU_CORE_BUS=09=090x2020
+#define CLK_CON_GAT_GATE_CLKCMU_CORE_CCI=09=090x2024
+#define CLK_CON_GAT_GATE_CLKCMU_CORE_G3D=09=090x2028
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG=09=090x202c
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH=09=090x2030
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH=09=090x2034
+#define CLK_CON_GAT_GATE_CLKCMU_DISPAUD_AUD=09=090x2038
+#define CLK_CON_GAT_GATE_CLKCMU_DISPAUD_CPU=09=090x203c
+#define CLK_CON_GAT_GATE_CLKCMU_DISPAUD_DISP=09=090x2040
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS_BUS=09=090x2044
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS_MMC_CARD=09=090x2048
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS_MMC_EMBD=09=090x204c
+#define CLK_CON_GAT_GATE_CLKCMU_FSYS_UFS_EMBD=09=090x2050
+#define CLK_CON_GAT_GATE_CLKCMU_G2D_G2D=09=09=090x2054
+#define CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL=09=090x2058
+#define CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH=09=090x205c
+#define CLK_CON_GAT_GATE_CLKCMU_HPM=09=09=090x2060
+#define CLK_CON_GAT_GATE_CLKCMU_ISP_BUS=09=09=090x2064
+#define CLK_CON_GAT_GATE_CLKCMU_ISP_GDC=09=09=090x2068
+#define CLK_CON_GAT_GATE_CLKCMU_ISP_VRA=09=09=090x206c
+#define CLK_CON_GAT_GATE_CLKCMU_MFC_MFC=09=09=090x2070
+#define CLK_CON_GAT_GATE_CLKCMU_MFC_WFD=09=09=090x2074
+#define CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP=09=090x2078
+#define CLK_CON_GAT_GATE_CLKCMU_MODEM_SHARED0=09=090x207c
+#define CLK_CON_GAT_GATE_CLKCMU_MODEM_SHARED1=09=090x2080
+#define CLK_CON_GAT_GATE_CLKCMU_PERI_BUS=09=090x2084
+#define CLK_CON_GAT_GATE_CLKCMU_PERI_IP=09=09=090x2088
+#define CLK_CON_GAT_GATE_CLKCMU_PERI_UART=09=090x208c
+#define CLK_CON_GAT_GATE_CLKCMU_USB_BUS=09=09=090x2090
+#define CLK_CON_GAT_GATE_CLKCMU_USB_DPGTC=09=090x2094
+#define CLK_CON_GAT_GATE_CLKCMU_USB_USB30DRD=09=090x2098
+#define CLK_CON_GAT_GATE_CLKCMU_VIPX1_BUS=09=090x209c
+#define CLK_CON_GAT_GATE_CLKCMU_VIPX2_BUS=09=090x20a0
+
+static const unsigned long top_clk_regs[] __initconst =3D {
+=09PLL_LOCKTIME_PLL_MMC,
+=09PLL_LOCKTIME_PLL_SHARED0,
+=09PLL_LOCKTIME_PLL_SHARED1,
+=09PLL_CON0_PLL_MMC,
+=09PLL_CON3_PLL_MMC,
+=09PLL_CON0_PLL_SHARED0,
+=09PLL_CON0_PLL_SHARED1,
+=09CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
+=09CLK_CON_MUX_MUX_CLKCMU_CAM_BUS,
+=09CLK_CON_MUX_MUX_CLKCMU_CIS_CLK0,
+=09CLK_CON_MUX_MUX_CLKCMU_CIS_CLK1,
+=09CLK_CON_MUX_MUX_CLKCMU_CIS_CLK2,
+=09CLK_CON_MUX_MUX_CLKCMU_CIS_CLK3,
+=09CLK_CON_MUX_MUX_CLKCMU_CORE_BUS,
+=09CLK_CON_MUX_MUX_CLKCMU_CORE_CCI,
+=09CLK_CON_MUX_MUX_CLKCMU_CORE_G3D,
+=09CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG,
+=09CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
+=09CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
+=09CLK_CON_MUX_MUX_CLKCMU_DISPAUD_AUD,
+=09CLK_CON_MUX_MUX_CLKCMU_DISPAUD_CPU,
+=09CLK_CON_MUX_MUX_CLKCMU_DISPAUD_DISP,
+=09CLK_CON_MUX_MUX_CLKCMU_FSYS_BUS,
+=09CLK_CON_MUX_MUX_CLKCMU_FSYS_MMC_CARD,
+=09CLK_CON_MUX_MUX_CLKCMU_FSYS_MMC_EMBD,
+=09CLK_CON_MUX_MUX_CLKCMU_FSYS_UFS_EMBD,
+=09CLK_CON_MUX_MUX_CLKCMU_G2D_G2D,
+=09CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL,
+=09CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH,
+=09CLK_CON_MUX_MUX_CLKCMU_HPM,
+=09CLK_CON_MUX_MUX_CLKCMU_ISP_BUS,
+=09CLK_CON_MUX_MUX_CLKCMU_ISP_GDC,
+=09CLK_CON_MUX_MUX_CLKCMU_ISP_VRA,
+=09CLK_CON_MUX_MUX_CLKCMU_MFC_MFC,
+=09CLK_CON_MUX_MUX_CLKCMU_MFC_WFD,
+=09CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP,
+=09CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH,
+=09CLK_CON_MUX_MUX_CLKCMU_PERI_BUS,
+=09CLK_CON_MUX_MUX_CLKCMU_PERI_IP,
+=09CLK_CON_MUX_MUX_CLKCMU_PERI_UART,
+=09CLK_CON_MUX_MUX_CLKCMU_USB_BUS,
+=09CLK_CON_MUX_MUX_CLKCMU_USB_DPGTC,
+=09CLK_CON_MUX_MUX_CLKCMU_USB_USB30DRD,
+=09CLK_CON_MUX_MUX_CLKCMU_VIPX1_BUS,
+=09CLK_CON_MUX_MUX_CLKCMU_VIPX2_BUS,
+=09CLK_CON_MUX_MUX_CLK_CMU_CMUREF,
+=09CLK_CON_MUX_MUX_CMU_CMUREF,
+=09CLK_CON_DIV_AP2CP_SHARED0_PLL_CLK,
+=09CLK_CON_DIV_AP2CP_SHARED1_PLL_CLK,
+=09CLK_CON_DIV_CLKCMU_APM_BUS,
+=09CLK_CON_DIV_CLKCMU_CAM_BUS,
+=09CLK_CON_DIV_CLKCMU_CORE_BUS,
+=09CLK_CON_DIV_CLKCMU_CORE_CCI,
+=09CLK_CON_DIV_CLKCMU_CORE_G3D,
+=09CLK_CON_DIV_CLKCMU_CPUCL0_DBG,
+=09CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH,
+=09CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH,
+=09CLK_CON_DIV_CLKCMU_DISPAUD_AUD,
+=09CLK_CON_DIV_CLKCMU_DISPAUD_CPU,
+=09CLK_CON_DIV_CLKCMU_DISPAUD_DISP,
+=09CLK_CON_DIV_CLKCMU_FSYS_BUS,
+=09CLK_CON_DIV_CLKCMU_FSYS_MMC_CARD,
+=09CLK_CON_DIV_CLKCMU_FSYS_MMC_EMBD,
+=09CLK_CON_DIV_CLKCMU_FSYS_UFS_EMBD,
+=09CLK_CON_DIV_CLKCMU_G2D_G2D,
+=09CLK_CON_DIV_CLKCMU_G2D_MSCL,
+=09CLK_CON_DIV_CLKCMU_G3D_SWITCH,
+=09CLK_CON_DIV_CLKCMU_HPM,
+=09CLK_CON_DIV_CLKCMU_ISP_BUS,
+=09CLK_CON_DIV_CLKCMU_ISP_GDC,
+=09CLK_CON_DIV_CLKCMU_ISP_VRA,
+=09CLK_CON_DIV_CLKCMU_MFC_MFC,
+=09CLK_CON_DIV_CLKCMU_MFC_WFD,
+=09CLK_CON_DIV_CLKCMU_MIF_BUSP,
+=09CLK_CON_DIV_CLKCMU_OTP,
+=09CLK_CON_DIV_CLKCMU_PERI_BUS,
+=09CLK_CON_DIV_CLKCMU_PERI_IP,
+=09CLK_CON_DIV_CLKCMU_PERI_UART,
+=09CLK_CON_DIV_CLKCMU_USB_BUS,
+=09CLK_CON_DIV_CLKCMU_USB_DPGTC,
+=09CLK_CON_DIV_CLKCMU_USB_USB30DRD,
+=09CLK_CON_DIV_CLKCMU_VIPX1_BUS,
+=09CLK_CON_DIV_CLKCMU_VIPX2_BUS,
+=09CLK_CON_DIV_DIV_CLK_CMU_CMUREF,
+=09CLK_CON_DIV_PLL_SHARED0_DIV2,
+=09CLK_CON_DIV_PLL_SHARED0_DIV3,
+=09CLK_CON_DIV_PLL_SHARED0_DIV4,
+=09CLK_CON_DIV_PLL_SHARED1_DIV2,
+=09CLK_CON_DIV_PLL_SHARED1_DIV3,
+=09CLK_CON_DIV_PLL_SHARED1_DIV4,
+=09CLK_CON_GAT_CLKCMU_MIF_SWITCH,
+=09CLK_CON_GAT_CLK_CMU_OTP_CLK,
+=09CLK_CON_GAT_GATE_CLKCMU_APM_BUS,
+=09CLK_CON_GAT_GATE_CLKCMU_CAM_BUS,
+=09CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0,
+=09CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1,
+=09CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2,
+=09CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3,
+=09CLK_CON_GAT_GATE_CLKCMU_CORE_BUS,
+=09CLK_CON_GAT_GATE_CLKCMU_CORE_CCI,
+=09CLK_CON_GAT_GATE_CLKCMU_CORE_G3D,
+=09CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG,
+=09CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH,
+=09CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH,
+=09CLK_CON_GAT_GATE_CLKCMU_DISPAUD_AUD,
+=09CLK_CON_GAT_GATE_CLKCMU_DISPAUD_CPU,
+=09CLK_CON_GAT_GATE_CLKCMU_DISPAUD_DISP,
+=09CLK_CON_GAT_GATE_CLKCMU_FSYS_BUS,
+=09CLK_CON_GAT_GATE_CLKCMU_FSYS_MMC_CARD,
+=09CLK_CON_GAT_GATE_CLKCMU_FSYS_MMC_EMBD,
+=09CLK_CON_GAT_GATE_CLKCMU_FSYS_UFS_EMBD,
+=09CLK_CON_GAT_GATE_CLKCMU_G2D_G2D,
+=09CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL,
+=09CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH,
+=09CLK_CON_GAT_GATE_CLKCMU_HPM,
+=09CLK_CON_GAT_GATE_CLKCMU_ISP_BUS,
+=09CLK_CON_GAT_GATE_CLKCMU_ISP_GDC,
+=09CLK_CON_GAT_GATE_CLKCMU_ISP_VRA,
+=09CLK_CON_GAT_GATE_CLKCMU_MFC_MFC,
+=09CLK_CON_GAT_GATE_CLKCMU_MFC_WFD,
+=09CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP,
+=09CLK_CON_GAT_GATE_CLKCMU_MODEM_SHARED0,
+=09CLK_CON_GAT_GATE_CLKCMU_MODEM_SHARED1,
+=09CLK_CON_GAT_GATE_CLKCMU_PERI_BUS,
+=09CLK_CON_GAT_GATE_CLKCMU_PERI_IP,
+=09CLK_CON_GAT_GATE_CLKCMU_PERI_UART,
+=09CLK_CON_GAT_GATE_CLKCMU_USB_BUS,
+=09CLK_CON_GAT_GATE_CLKCMU_USB_DPGTC,
+=09CLK_CON_GAT_GATE_CLKCMU_USB_USB30DRD,
+=09CLK_CON_GAT_GATE_CLKCMU_VIPX1_BUS,
+=09CLK_CON_GAT_GATE_CLKCMU_VIPX2_BUS,
+};
+
+static const struct samsung_pll_rate_table pll_shared0_rate_table[] __init=
const =3D {
+=09PLL_35XX_RATE(26 * MHZ, 1599000000U, 246, 4, 0),
+};
+
+static const struct samsung_pll_rate_table pll_shared1_rate_table[] __init=
const =3D {
+=09PLL_35XX_RATE(26 * MHZ, 1332500000U, 205, 4, 0),
+};
+
+static const struct samsung_pll_rate_table pll_mmc_rate_table[] __initcons=
t =3D {
+=09PLL_36XX_RATE(26 * MHZ, 799999877, 31, 1, 0, -15124),
+};
+
+static const struct samsung_pll_clock top_pll_clks[] __initconst =3D {
+=09PLL(pll_1051x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
+=09    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0, pll_shared0_rate_ta=
ble),
+=09PLL(pll_1051x, CLK_FOUT_SHARED1_PLL, "fout_shared1_pll", "oscclk",
+=09    PLL_LOCKTIME_PLL_SHARED1, PLL_CON0_PLL_SHARED1, pll_shared1_rate_ta=
ble),
+=09PLL(pll_1061x, CLK_FOUT_MMC_PLL, "fout_mmc_pll", "oscclk",
+=09    PLL_LOCKTIME_PLL_MMC, PLL_CON0_PLL_MMC, pll_mmc_rate_table),
+};
+
+/* Parent clock list for TOP muxes */
+PNAME(mout_pll_shared0_p)=09=3D { "oscclk", "fout_shared0_pll" };
+PNAME(mout_pll_shared1_p)=09=3D { "oscclk", "fout_shared1_pll" };
+PNAME(mout_pll_mmc_p)=09=09=3D { "oscclk", "fout_mmc_pll" };
+PNAME(mout_cmu_apm_bus_p)=09=3D { "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4" };
+PNAME(mout_cmu_cam_bus_p)=09=3D { "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_cis_clk0_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_cis_clk1_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_cis_clk2_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_cis_clk3_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_core_bus_p)=09=3D { "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_mmc_div2" };
+PNAME(mout_cmu_core_cci_p)=09=3D { "dout_cmu_shared0_div2",
+=09=09=09=09    "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_mmc_div2" };
+PNAME(mout_cmu_core_g3d_p)=09=3D { "dout_cmu_shared0_div2",
+=09=09=09=09    "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_mmc_div2" };
+PNAME(mout_cmu_cpucl0_dbg_p)=09=3D { "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4" };
+PNAME(mout_cmu_cpucl0_switch_p)=09=3D { "dout_cmu_shared0_div2",
+=09=09=09=09    "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3" };
+PNAME(mout_cmu_cpucl1_switch_p)=09=3D { "dout_cmu_shared0_div2",
+=09=09=09=09    "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3" };
+PNAME(mout_cmu_dispaud_aud_p)=09=3D { "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_dispaud_cpu_p)=09=3D { "fout_shared1_pll",
+=09=09=09=09    "dout_cmu_shared0_div2",
+=09=09=09=09    "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "fout_mmc_pll",
+=09=09=09=09    "oscclk", "oscclk" };
+PNAME(mout_cmu_dispaud_disp_p)=09=3D { "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_fsys_bus_p)=09=3D { "dout_cmu_shared0_div2",
+=09=09=09=09    "dout_cmu_shared1_div2" };
+PNAME(mout_cmu_fsys_mmc_card_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div2",
+=09=09=09=09    "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "fout_mmc_pll",
+=09=09=09=09    "oscclk", "oscclk" };
+PNAME(mout_cmu_fsys_mmc_embd_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div2",
+=09=09=09=09    "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "fout_mmc_pll",
+=09=09=09=09    "oscclk", "oscclk" };
+PNAME(mout_cmu_fsys_ufs_embd_p) =3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4",
+=09=09=09=09    "oscclk" };
+PNAME(mout_cmu_g2d_g2d_p)=09=3D { "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_g2d_mscl_p)=09=3D { "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4" };
+PNAME(mout_cmu_g3d_switch_p)=09=3D { "dout_cmu_shared0_div2",
+=09=09=09=09    "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3" };
+PNAME(mout_cmu_hpm_p)=09=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div2",
+=09=09=09=09    "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_mmc_div2",
+=09=09=09=09    "oscclk", "oscclk", "oscclk" };
+PNAME(mout_cmu_isp_bus_p)=09=3D { "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_isp_gdc_p)=09=3D { "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4" };
+PNAME(mout_cmu_isp_vra_p)=09=3D { "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4" };
+PNAME(mout_cmu_mfc_mfc_p)=09=3D { "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_mfc_wfd_p)=09=3D { "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4" };
+PNAME(mout_cmu_mif_busp_p)=09=3D { "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4",
+=09=09=09=09    "dout_cmu_mmc_div2",
+=09=09=09=09    "oscclk" };
+PNAME(mout_cmu_mif_switch_p)=09=3D { "fout_shared0_pll",
+=09=09=09=09    "fout_shared1_pll",
+=09=09=09=09    "dout_cmu_shared0_div2",
+=09=09=09=09    "fout_mmc_pll",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4" };
+PNAME(mout_cmu_peri_bus_p)=09=3D { "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4" };
+PNAME(mout_cmu_peri_ip_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4",
+=09=09=09=09    "oscclk" };
+PNAME(mout_cmu_peri_uart_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4",
+=09=09=09=09    "oscclk" };
+PNAME(mout_cmu_usb_bus_p)=09=3D { "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4" };
+PNAME(mout_cmu_usb_dpgtc_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4",
+=09=09=09=09    "oscclk" };
+PNAME(mout_cmu_usb_usb30drd_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4",
+=09=09=09=09    "oscclk" };
+PNAME(mout_cmu_vipx1_bus_p)=09=3D { "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_cmu_vipx2_bus_p)=09=3D { "dout_cmu_shared1_div2",
+=09=09=09=09    "dout_cmu_shared0_div3",
+=09=09=09=09    "dout_cmu_shared1_div3",
+=09=09=09=09    "dout_cmu_shared0_div4" };
+PNAME(mout_clk_cmu_cmuref_p)=09=3D { "dout_cmu_shared0_div4",
+=09=09=09=09    "dout_cmu_shared1_div4" };
+PNAME(mout_cmu_cmuref_p)=09=3D { "oscclk",
+=09=09=09=09    "dout_clk_cmu_cmuref" };
+
+/*
+ * Register name to clock name mangling strategy used in this file
+ *
+ * Replace PLL_CON{0,3}_PLL=09   with CLK_MOUT_PLL and mout_pll
+ * Replace CLK_CON_MUX_MUX_CLKCMU  with CLK_MOUT_CMU and mout_cmu
+ * Replace CLK_CON_DIV_CLKCMU      with CLK_DOUT_CMU_CMU and dout_cmu_cmu
+ * Replace CLK_CON_DIV_DIV_CLKCMU  with CLK_DOUT_CMU_CMU and dout_cmu_cmu
+ * Replace CLK_CON_DIV_PLL_CLKCMU  with CLK_DOUT_CMU_CMU and dout_cmu_cmu
+ * Replace CLK_CON_GAT_CLKCMU      with CLK_GOUT_CMU and gout_cmu
+ * Replace CLK_CON_GAT_GATE_CLKCMU with CLK_GOUT_CMU and gout_cmu
+ *
+ * For gates remove _UID _BLK _IPCLKPORT, _I and _RSTNSYNC
+ */
+
+static const struct samsung_mux_clock top_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_PLL_SHARED0, "mout_pll_shared0", mout_pll_shared0_p,
+=09    PLL_CON0_PLL_SHARED0, 4, 1),
+=09MUX(CLK_MOUT_PLL_SHARED1, "mout_pll_shared1", mout_pll_shared1_p,
+=09    PLL_CON0_PLL_SHARED1, 4, 1),
+=09MUX(CLK_MOUT_PLL_MMC, "mout_pll_mmc", mout_pll_mmc_p,
+=09    PLL_CON0_PLL_MMC, 4, 1),
+
+=09MUX(CLK_MOUT_CMU_APM_BUS, "mout_cmu_apm_bus", mout_cmu_apm_bus_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_APM_BUS, 0, 1),
+=09MUX(CLK_MOUT_CMU_CAM_BUS, "mout_cmu_cam_bus", mout_cmu_cam_bus_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CAM_BUS, 0, 2),
+=09MUX(CLK_MOUT_CMU_CIS_CLK0, "mout_cmu_cis_clk0", mout_cmu_cis_clk0_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK0, 0, 1),
+=09MUX(CLK_MOUT_CMU_CIS_CLK1, "mout_cmu_cis_clk1", mout_cmu_cis_clk1_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK1, 0, 1),
+=09MUX(CLK_MOUT_CMU_CIS_CLK2, "mout_cmu_cis_clk2", mout_cmu_cis_clk2_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK2, 0, 1),
+=09MUX(CLK_MOUT_CMU_CIS_CLK3, "mout_cmu_cis_clk3", mout_cmu_cis_clk2_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK3, 0, 1),
+=09MUX(CLK_MOUT_CMU_CORE_BUS, "mout_cmu_core_bus", mout_cmu_core_bus_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
+=09MUX(CLK_MOUT_CMU_CORE_CCI, "mout_cmu_core_cci", mout_cmu_core_cci_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CORE_CCI, 0, 2),
+=09MUX(CLK_MOUT_CMU_CORE_G3D, "mout_cmu_core_g3d", mout_cmu_core_g3d_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CORE_G3D, 0, 2),
+=09MUX(CLK_MOUT_CMU_CPUCL0_DBG, "mout_cmu_cpucl0_dbg", mout_cmu_cpucl0_dbg=
_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG, 0, 1),
+=09MUX(CLK_MOUT_CMU_CPUCL0_SWITCH, "mout_cmu_cpucl0_switch", mout_cmu_cpuc=
l0_switch_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH, 0, 1),
+=09MUX(CLK_MOUT_CMU_CPUCL1_SWITCH, "mout_cmu_cpucl1_switch", mout_cmu_cpuc=
l1_switch_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH, 0, 2),
+=09MUX(CLK_MOUT_CMU_DISPAUD_AUD, "mout_cmu_dispaud_aud", mout_cmu_dispaud_=
aud_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_DISPAUD_AUD, 0, 2),
+=09MUX(CLK_MOUT_CMU_DISPAUD_CPU, "mout_cmu_dispaud_cpu", mout_cmu_dispaud_=
cpu_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_DISPAUD_CPU, 0, 3),
+=09MUX(CLK_MOUT_CMU_DISPAUD_DISP, "mout_cmu_dispaud_disp", mout_cmu_dispau=
d_disp_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_DISPAUD_DISP, 0, 2),
+=09MUX(CLK_MOUT_CMU_FSYS_BUS, "mout_cmu_fsys_bus", mout_cmu_fsys_bus_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_FSYS_BUS, 0, 1),
+=09MUX(CLK_MOUT_CMU_FSYS_MMC_CARD, "mout_cmu_fsys_mmc_card", mout_cmu_fsys=
_mmc_card_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_FSYS_MMC_CARD, 0, 3),
+=09MUX(CLK_MOUT_CMU_FSYS_MMC_EMBD, "mout_cmu_fsys_mmc_embd", mout_cmu_fsys=
_mmc_embd_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_FSYS_MMC_EMBD, 0, 3),
+=09MUX(CLK_MOUT_CMU_FSYS_UFS_EMBD, "mout_cmu_fsys_ufs_embd", mout_cmu_fsys=
_ufs_embd_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_FSYS_UFS_EMBD, 0, 2),
+=09MUX(CLK_MOUT_CMU_G2D_G2D, "mout_cmu_g2d_g2d", mout_cmu_g2d_g2d_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_G2D_G2D, 0, 2),
+=09MUX(CLK_MOUT_CMU_G2D_MSCL, "mout_cmu_g2d_mscl", mout_cmu_g2d_mscl_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 2),
+=09MUX(CLK_MOUT_CMU_G3D_SWITCH, "mout_cmu_g3d_SWITCH", mout_cmu_g3d_switch=
_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH, 0, 2),
+=09MUX(CLK_MOUT_CMU_HPM, "mout_cmu_hpm", mout_cmu_hpm_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_HPM, 0, 3),
+=09MUX(CLK_MOUT_CMU_ISP_BUS, "mout_cmu_isp_bus", mout_cmu_isp_bus_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_ISP_BUS, 0, 2),
+=09MUX(CLK_MOUT_CMU_ISP_GDC, "mout_cmu_isp_gdc", mout_cmu_isp_gdc_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_ISP_GDC, 0, 2),
+=09MUX(CLK_MOUT_CMU_ISP_VRA, "mout_cmu_isp_vra", mout_cmu_isp_vra_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_ISP_VRA, 0, 2),
+=09MUX(CLK_MOUT_CMU_MFC_MFC, "mout_cmu_mfc_mfc", mout_cmu_mfc_mfc_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_MFC_MFC, 0, 2),
+=09MUX(CLK_MOUT_CMU_MFC_WFD, "mout_cmu_mfc_wfd", mout_cmu_mfc_wfd_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_MFC_WFD, 0, 2),
+=09MUX(CLK_MOUT_CMU_MIF_BUSP, "mout_cmu_mif_busp", mout_cmu_mif_busp_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP, 0, 2),
+=09MUX(CLK_MOUT_CMU_MIF_SWITCH, "mout_cmu_mif_switch", mout_cmu_mif_switch=
_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH, 0, 3),
+=09MUX(CLK_MOUT_CMU_PERI_BUS, "mout_cmu_peri_bus", mout_cmu_peri_bus_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_PERI_BUS, 0, 1),
+=09MUX(CLK_MOUT_CMU_PERI_IP, "mout_cmu_peri_ip", mout_cmu_peri_ip_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_PERI_IP, 0, 2),
+=09MUX(CLK_MOUT_CMU_PERI_UART, "mout_cmu_peri_uart", mout_cmu_peri_uart_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_PERI_UART, 0, 2),
+=09MUX(CLK_MOUT_CMU_USB_BUS, "mout_cmu_usb_bus", mout_cmu_usb_bus_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_USB_BUS, 0, 2),
+=09MUX(CLK_MOUT_CMU_USB_DPGTC, "mout_cmu_usb_dpgtc", mout_cmu_usb_dpgtc_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_USB_DPGTC, 0, 2),
+=09MUX(CLK_MOUT_CMU_USB_USB30DRD, "mout_cmu_usb_usb30drd", mout_cmu_usb_us=
b30drd_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_USB_USB30DRD, 0, 2),
+=09MUX(CLK_MOUT_CMU_VIPX1_BUS, "mout_cmu_vipx1_bus", mout_cmu_vipx1_bus_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_VIPX1_BUS, 0, 2),
+=09MUX(CLK_MOUT_CMU_VIPX2_BUS, "mout_cmu_vipx2_bus", mout_cmu_vipx2_bus_p,
+=09    CLK_CON_MUX_MUX_CLKCMU_VIPX2_BUS, 0, 2),
+=09MUX(CLK_MOUT_CLK_CMU_CMUREF, "mout_clk_cmu_cmuref", mout_clk_cmu_cmuref=
_p,
+=09    CLK_CON_MUX_MUX_CLK_CMU_CMUREF, 0, 1),
+=09MUX(CLK_MOUT_CMU_CMUREF, "mout_cmu_cmuref", mout_cmu_cmuref_p,
+=09    CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
+};
+
+static const struct samsung_div_clock top_div_clks[] __initconst =3D {
+=09/* shared0 */
+=09DIV(CLK_DOUT_CMU_SHARED0_DIV2, "dout_cmu_shared0_div2", "mout_pll_share=
d0",
+=09    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
+=09DIV(CLK_DOUT_CMU_SHARED0_DIV3, "dout_cmu_shared0_div3", "mout_pll_share=
d0",
+=09    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
+=09DIV(CLK_DOUT_CMU_SHARED0_DIV4, "dout_cmu_shared0_div4", "dout_cmu_share=
d0_div2",
+=09    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
+
+=09/* shared1 */
+=09DIV(CLK_DOUT_CMU_SHARED1_DIV2, "dout_cmu_shared1_div2", "mout_pll_share=
d1",
+=09    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
+=09DIV(CLK_DOUT_CMU_SHARED1_DIV3, "dout_cmu_shared1_div3", "mout_pll_share=
d1",
+=09    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
+=09DIV(CLK_DOUT_CMU_SHARED1_DIV4, "dout_cmu_shared1_div4", "dout_cmu_share=
d1_div2",
+=09    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
+
+=09/* mmc */
+=09DIV(CLK_DOUT_CMU_MMC_DIV2, "dout_cmu_mmc_div2", "mout_pll_mmc",
+=09    CLK_CON_DIV_PLL_MMC_DIV2, 0, 1),
+
+=09DIV(CLK_DOUT_AP2CP_SHARED0_PLL_CLK, "dout_ap2cp_shared0_pll_clk",
+=09    "gout_cmu_modem_shared0", CLK_CON_DIV_AP2CP_SHARED0_PLL_CLK,
+=09    0, 4),
+=09DIV(CLK_DOUT_AP2CP_SHARED1_PLL_CLK, "dout_ap2cp_shared1_pll_clk",
+=09    "gout_cmu_modem_shared1", CLK_CON_DIV_AP2CP_SHARED1_PLL_CLK,
+=09    0, 4),
+=09DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
+=09    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
+=09DIV(CLK_DOUT_CMU_CAM_BUS, "dout_cmu_cam_bus", "gout_cmu_cam_bus",
+=09    CLK_CON_DIV_CLKCMU_CAM_BUS, 0, 4),
+=09DIV(CLK_DOUT_CMU_CIS_CLK0, "dout_cmu_cis_clk0", "gout_cmu_cis_clk0",
+=09    CLK_CON_DIV_CLKCMU_CIS_CLK0, 0, 5),
+=09DIV(CLK_DOUT_CMU_CIS_CLK1, "dout_cmu_cis_clk1", "gout_cmu_cis_clk1",
+=09    CLK_CON_DIV_CLKCMU_CIS_CLK1, 0, 5),
+=09DIV(CLK_DOUT_CMU_CIS_CLK2, "dout_cmu_cis_clk2", "gout_cmu_cis_clk2",
+=09    CLK_CON_DIV_CLKCMU_CIS_CLK2, 0, 5),
+=09DIV(CLK_DOUT_CMU_CIS_CLK3, "dout_cmu_cis_clk3", "gout_cmu_cis_clk3",
+=09    CLK_CON_DIV_CLKCMU_CIS_CLK3, 0, 5),
+=09DIV(CLK_DOUT_CMU_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
+=09    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
+=09DIV(CLK_DOUT_CMU_CORE_CCI, "dout_cmu_core_cci", "gout_cmu_core_cci",
+=09    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
+=09DIV(CLK_DOUT_CMU_CORE_G3D, "dout_cmu_core_g3d", "gout_cmu_core_g3d",
+=09    CLK_CON_DIV_CLKCMU_CORE_G3D, 0, 4),
+=09DIV(CLK_DOUT_CMU_CPUCL0_DBG, "dout_cmu_cpucl0_dbg", "gout_cmu_cpucl0_db=
g",
+=09    CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 3),
+=09DIV(CLK_DOUT_CMU_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch", "gout_cmu_cpu=
cl1_switch",
+=09    CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0, 3),
+=09DIV(CLK_DOUT_CMU_CPUCL1_SWITCH, "dout_cmu_cpucl1_switch", "gout_cmu_cpu=
cl1_switch",
+=09    CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH, 0, 3),
+=09DIV(CLK_DOUT_CMU_DISPAUD_AUD, "dout_cmu_dispaud_aud", "gout_cmu_dispaud=
_aud",
+=09    CLK_CON_DIV_CLKCMU_DISPAUD_AUD, 0, 4),
+=09DIV(CLK_DOUT_CMU_DISPAUD_CPU, "dout_cmu_dispaud_cpu", "gout_cmu_dispaud=
_cpu",
+=09    CLK_CON_DIV_CLKCMU_DISPAUD_CPU, 0, 4),
+=09DIV(CLK_DOUT_CMU_DISPAUD_DISP, "dout_cmu_dispaud_disp", "gout_cmu_dispa=
ud_disp",
+=09    CLK_CON_DIV_CLKCMU_DISPAUD_DISP, 0, 4),
+=09DIV(CLK_DOUT_CMU_FSYS_BUS, "dout_cmu_fsys_bus", "gout_cmu_fsys_bus",
+=09    CLK_CON_DIV_CLKCMU_FSYS_BUS, 0, 4),
+=09DIV(CLK_DOUT_CMU_FSYS_MMC_CARD, "dout_cmu_fsys_mmc_card", "gout_cmu_fsy=
s_mmc_card",
+=09    CLK_CON_DIV_CLKCMU_FSYS_MMC_CARD, 0, 9),
+=09DIV(CLK_DOUT_CMU_FSYS_MMC_EMBD, "dout_cmu_fsys_mmc_embd", "gout_cmu_fsy=
s_mmc_embd",
+=09    CLK_CON_DIV_CLKCMU_FSYS_MMC_EMBD, 0, 9),
+=09DIV(CLK_DOUT_CMU_G2D_G2D, "dout_cmu_g2d_g2d", "gout_cmu_g2d_g2d",
+=09    CLK_CON_DIV_CLKCMU_G2D_G2D, 0, 4),
+=09DIV(CLK_DOUT_CMU_G2D_MSCL, "dout_cmu_g2d_mscl", "gout_cmu_g2d_mscl",
+=09    CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
+=09DIV(CLK_DOUT_CMU_G3D_SWITCH, "dout_cmu_g3d_switch", "gout_cmu_g3d_switc=
h",
+=09    CLK_CON_DIV_CLKCMU_G3D_SWITCH, 0, 3),
+=09DIV(CLK_DOUT_CMU_HPM, "dout_cmu_hpm", "gout_cmu_hpm",
+=09    CLK_CON_DIV_CLKCMU_HPM, 0, 2),
+=09DIV(CLK_DOUT_CMU_ISP_BUS, "dout_cmu_isp_bus", "gout_cmu_isp_bus",
+=09    CLK_CON_DIV_CLKCMU_ISP_BUS, 0, 4),
+=09DIV(CLK_DOUT_CMU_ISP_GDC, "dout_cmu_isp_gdc", "gout_cmu_isp_gdc",
+=09    CLK_CON_DIV_CLKCMU_ISP_GDC, 0, 4),
+=09DIV(CLK_DOUT_CMU_ISP_VRA, "dout_cmu_isp_vra", "gout_cmu_isp_vra",
+=09    CLK_CON_DIV_CLKCMU_ISP_VRA, 0, 4),
+=09DIV(CLK_DOUT_CMU_MFD_MFC, "dout_cmu_mfc_mfc", "gout_cmu_mfc_mfc",
+=09    CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
+=09DIV(CLK_DOUT_CMU_MFD_WFD, "dout_cmu_mfc_wfd", "gout_cmu_mfc_wfd",
+=09    CLK_CON_DIV_CLKCMU_MFC_WFD, 0, 4),
+=09DIV(CLK_DOUT_CMU_MIF_BUSP, "dout_cmu_mif_busp", "gout_cmu_mif_busp",
+=09    CLK_CON_DIV_CLKCMU_MIF_BUSP, 0, 3),
+=09DIV(CLK_DOUT_CMU_PERI_BUS, "dout_cmu_peri_bus", "gout_cmu_peri_bus",
+=09    CLK_CON_DIV_CLKCMU_PERI_BUS, 0, 4),
+=09DIV(CLK_DOUT_CMU_PERI_IP, "dout_cmu_peri_ip", "gout_cmu_peri_ip",
+=09    CLK_CON_DIV_CLKCMU_PERI_IP, 0, 4),
+=09DIV(CLK_DOUT_CMU_PERI_UART, "dout_cmu_peri_uart", "gout_cmu_peri_uart",
+=09    CLK_CON_DIV_CLKCMU_PERI_UART, 0, 4),
+=09DIV(CLK_DOUT_CMU_USB_BUS, "dout_cmu_usb_bus", "gout_cmu_usb_bus",
+=09    CLK_CON_DIV_CLKCMU_USB_BUS, 0, 4),
+=09DIV(CLK_DOUT_CMU_USB_DPGTC, "dout_cmu_usb_dpgtc", "gout_cmu_usb_dpgtc",
+=09    CLK_CON_DIV_CLKCMU_USB_DPGTC, 0, 4),
+=09DIV(CLK_DOUT_CMU_USB_BUS, "dout_cmu_usb_usb30drd", "gout_cmu_usb_usb30d=
rd",
+=09    CLK_CON_DIV_CLKCMU_USB_USB30DRD, 0, 4),
+=09DIV(CLK_DOUT_CMU_VIPX1_BUS, "dout_cmu_vipx1_bus", "gout_cmu_vipx1_bus",
+=09    CLK_CON_DIV_CLKCMU_VIPX1_BUS, 0, 4),
+=09DIV(CLK_DOUT_CMU_VIPX2_BUS, "dout_cmu_vipx2_bus", "gout_cmu_vipx2_bus",
+=09    CLK_CON_DIV_CLKCMU_VIPX2_BUS, 0, 4),
+=09DIV(CLK_DOUT_CLK_CMU_CMUREF, "dout_clk_cmu_cmuref", "mout_clk_cmu_cmure=
f",
+=09    CLK_CON_DIV_DIV_CLK_CMU_CMUREF, 0, 2),
+};
+
+static const struct samsung_fixed_factor_clock top_ffactor_clks[] __initco=
nst =3D {
+=09FFACTOR(CLK_DOUT_CMU_OTP, "dout_cmu_otp", "oscclk", 1, 7, 0),
+};
+
+static const struct samsung_gate_clock top_gate_clks[] __initconst =3D {
+=09GATE(CLK_GOUT_CMU_MIF_SWITCH, "gout_cmu_mif_switch",
+=09     "mux_cmu_mif_switch", CLK_CON_GAT_CLKCMU_MIF_SWITCH,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_CMU_OTP_CLK, "gout_clk_cmu_otp_clk", "dout_cmu_otp",
+=09     CLK_CON_GAT_CLK_CMU_OTP_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_APM_BUS, "gout_cmu_apm_bus", "mout_cmu_apm_bus",
+=09     CLK_CON_GAT_GATE_CLKCMU_APM_BUS, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_CAM_BUS, "gout_cmu_cam_bus", "mout_cmu_cam_bus",
+=09     CLK_CON_GAT_GATE_CLKCMU_CAM_BUS, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_CIS_CLK0, "gout_cmu_cis_clk0", "mout_cmu_cis_clk0",
+=09     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_CIS_CLK1, "gout_cmu_cis_clk1", "mout_cmu_cis_clk1",
+=09     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_CIS_CLK2, "gout_cmu_cis_clk2", "mout_cmu_cis_clk2",
+=09     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_CIS_CLK3, "gout_cmu_cis_clk3", "mout_cmu_cis_clk3",
+=09     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_CORE_BUS, "gout_cmu_core_bus", "mout_cmu_core_bus",
+=09     CLK_CON_GAT_GATE_CLKCMU_CORE_BUS, 21, CLK_IS_CRITICAL, 0),
+=09GATE(CLK_GOUT_CMU_CORE_CCI, "gout_cmu_core_cci", "mout_cmu_core_cci",
+=09     CLK_CON_GAT_GATE_CLKCMU_CORE_CCI, 21, CLK_IS_CRITICAL, 0),
+=09GATE(CLK_GOUT_CMU_CORE_G3D, "gout_cmu_core_g3d", "mout_cmu_core_g3d",
+=09     CLK_CON_GAT_GATE_CLKCMU_CORE_G3D, 21, CLK_IS_CRITICAL, 0),
+=09GATE(CLK_GOUT_CMU_CPUCL0_DBG, "gout_cmu_cpucl0_dbg", "mout_cmu_cpucl0_d=
bg",
+=09     CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_CPUCL0_SWITCH, "gout_cmu_cpucl0_switch", "mout_cmu_cp=
ucl0_switch",
+=09     CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_CPUCL1_SWITCH, "gout_cmu_cpucl1_switch", "mout_cmu_cp=
ucl1_switch",
+=09     CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_DISPAUD_AUD, "gout_cmu_dispaud_aud", "mout_cmu_dispau=
d_aud",
+=09     CLK_CON_GAT_GATE_CLKCMU_DISPAUD_AUD, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_DISPAUD_CPU, "gout_cmu_dispaud_cpu", "mout_cmu_dispau=
d_cpu",
+=09     CLK_CON_GAT_GATE_CLKCMU_DISPAUD_CPU, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_DISPAUD_DISP, "gout_cmu_dispaud_disp", "mout_cmu_disp=
aud_disp",
+=09     CLK_CON_GAT_GATE_CLKCMU_DISPAUD_DISP, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_FSYS_BUS, "gout_cmu_fsys_bus", "mout_cmu_fsys_bus",
+=09     CLK_CON_GAT_GATE_CLKCMU_FSYS_BUS, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_FSYS_MMC_CARD, "gout_cmu_fsys_mmc_card", "mout_cmu_fs=
ys_mmc_card",
+=09     CLK_CON_GAT_GATE_CLKCMU_FSYS_MMC_CARD, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_FSYS_MMC_EMBD, "gout_cmu_fsys_mmc_embd", "mout_cmu_fs=
ys_mmc_embd",
+=09     CLK_CON_GAT_GATE_CLKCMU_FSYS_MMC_EMBD, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_FSYS_UFS_EMBD, "gout_cmu_fsys_ufs_embd", "mout_cmu_fs=
ys_ufs_embd",
+=09     CLK_CON_GAT_GATE_CLKCMU_FSYS_UFS_EMBD, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_G2D_G2D, "gout_cmu_g2d_g2d", "mout_cmu_g2d_g2d",
+=09     CLK_CON_GAT_GATE_CLKCMU_G2D_G2D, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_G2D_MSCL, "gout_cmu_g2d_mscl", "mout_cmu_g2d_mscl",
+=09     CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_G3D_SWITCH, "gout_cmu_g3d_switch", "mout_cmu_g3d_swit=
ch",
+=09     CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_HPM, "gout_cmu_hpm", "mout_cmu_hpm",
+=09     CLK_CON_GAT_GATE_CLKCMU_HPM, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_ISP_BUS, "gout_cmu_isp_bus", "mout_cmu_isp_bus",
+=09     CLK_CON_GAT_GATE_CLKCMU_ISP_BUS, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_ISP_GDC, "gout_cmu_isp_gdc", "mout_cmu_isp_gdc",
+=09     CLK_CON_GAT_GATE_CLKCMU_ISP_GDC, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_ISP_VRA, "gout_cmu_isp_vra", "mout_cmu_isp_vra",
+=09     CLK_CON_GAT_GATE_CLKCMU_ISP_VRA, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_MFC_MFC, "gout_cmu_mfc_mfc", "mout_cmu_mfc_mfc",
+=09     CLK_CON_GAT_GATE_CLKCMU_MFC_MFC, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_MFC_WFD, "gout_cmu_mfc_wfd", "mout_cmu_mfc_wfd",
+=09     CLK_CON_GAT_GATE_CLKCMU_MFC_WFD, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_MIF_BUSP, "gout_cmu_mif_busp", "mout_cmu_mif_busp",
+=09     CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_MODEM_SHARED0, "gout_cmu_modem_shared0", "dout_cmu_sh=
ared0_div2",
+=09     CLK_CON_GAT_GATE_CLKCMU_MODEM_SHARED0, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_MODEM_SHARED1, "gout_cmu_modem_shared1", "dout_cmu_sh=
ared1_div2",
+=09     CLK_CON_GAT_GATE_CLKCMU_MODEM_SHARED1, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_PERI_BUS, "gout_cmu_peri_bus", "mout_cmu_peri_bus",
+=09     CLK_CON_GAT_GATE_CLKCMU_PERI_BUS, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_PERI_IP, "gout_cmu_peri_ip", "mout_cmu_peri_ip",
+=09     CLK_CON_GAT_GATE_CLKCMU_PERI_IP, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_PERI_UART, "gout_cmu_peri_uart", "mout_cmu_peri_uart"=
,
+=09     CLK_CON_GAT_GATE_CLKCMU_PERI_UART, 21, 0, 0),
+=09GATE(CLK_GOUT_CMU_USB_BUS, "gout_cmu_usb_bus", "mout_cmu_usb_bus",
+=09     CLK_CON_GAT_GATE_CLKCMU_USB_BUS, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_USB_DPGTC, "gout_cmu_usb_dpgtc", "mout_cmu_usb_dpgtc"=
,
+=09     CLK_CON_GAT_GATE_CLKCMU_USB_DPGTC, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_USB_USB30DRD, "gout_cmu_usb_usb30drd", "mout_cmu_usb_=
usb30drd",
+=09     CLK_CON_GAT_GATE_CLKCMU_USB_USB30DRD, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_VIPX1_BUS, "gout_cmu_vipx1_bus", "mout_cmu_vipx1_bus"=
,
+=09     CLK_CON_GAT_GATE_CLKCMU_VIPX1_BUS, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMU_VIPX2_BUS, "gout_cmu_vipx2_bus", "mout_cmu_vipx2_bus"=
,
+=09     CLK_CON_GAT_GATE_CLKCMU_VIPX2_BUS, 21, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info top_cmu_info __initconst =3D {
+=09.pll_clks =3D top_pll_clks,
+=09.nr_pll_clks =3D ARRAY_SIZE(top_pll_clks),
+=09.mux_clks =3D top_mux_clks,
+=09.nr_mux_clks =3D ARRAY_SIZE(top_mux_clks),
+=09.div_clks =3D top_div_clks,
+=09.nr_div_clks =3D ARRAY_SIZE(top_div_clks),
+=09.fixed_factor_clks =3D top_ffactor_clks,
+=09.nr_fixed_factor_clks =3D ARRAY_SIZE(top_ffactor_clks),
+=09.gate_clks =3D top_gate_clks,
+=09.nr_gate_clks =3D ARRAY_SIZE(top_gate_clks),
+=09.nr_clk_ids =3D CLKS_NR_TOP,
+=09.clk_regs =3D top_clk_regs,
+=09.nr_clk_regs =3D ARRAY_SIZE(top_clk_regs),
+};
+
+static void __init exynos9610_cmu_top_init(struct device_node *np)
+{
+=09exynos_arm64_register_cmu(NULL, np, &top_cmu_info);
+}
+
+/* Register CMU_TOP early, as it's a dependency for other early domains */
+CLK_OF_DECLARE(exynos9610_cmu_top, "samsung,exynos9610-cmu-top",
+=09       exynos9610_cmu_top_init);
+
+/* CMU_CPUCL0 */
+#define PLL_LOCKTIME_PLL_CPUCL0=09=09=09=09=090x0000
+#define PLL_CON0_MUX_CLKCMU_CPUCL0_DBG_USER=09=09=090x0100
+#define PLL_CON2_MUX_CLKCMU_CPUCL0_DBG_USER=09=09=090x0108
+#define PLL_CON0_MUX_CLKCMU_CPUCL0_SWITCH_USER=09=09=090x0120
+#define PLL_CON2_MUX_CLKCMU_CPUCL0_SWITCH_USER=09=09=090x0128
+#define PLL_CON0_PLL_CPUCL0=09=09=09=09=090x0140
+#define CLK_CON_MUX_MUX_CLK_CPUCL0_PLL=09=09=09=090x1000
+#define CLK_CON_DIV_DIV_CLK_CLUSTER0_ACLK=09=09=090x1800
+#define CLK_CON_DIV_DIV_CLK_CLUSTER0_CNTCLK=09=09=090x1804
+#define CLK_CON_DIV_DIV_CLK_CLUSTER0_PCLKDBG=09=09=090x1808
+#define CLK_CON_DIV_DIV_CLK_CPUCL0_CMUREF=09=09=090x180c
+#define CLK_CON_DIV_DIV_CLK_CPUCL0_CPU=09=09=09=090x1810
+#define CLK_CON_DIV_DIV_CLK_CPUCL0_PCLK=09=09=09=090x1814
+#define CLK_CON_GAT_CLK_CPUCL0_CMU_PCLK=09=09=09=090x2000
+#define CLK_CON_GAT_CLK_CPUCL0_HPM_TARGETCLK_C=09=09=090x2004
+#define CLK_CON_GAT_CLK_CPUCL0_OSCCLK_CLK=09=09=090x2008
+#define CLK_CON_GAT_GATE_CLK_CLUSTER0_CPU=09=09=090x2010
+#define CLK_CON_GAT_GOUT_CPUCL0_ADM_APB_G_CSSYS_CORE_PCLKM=090x2014
+#define CLK_CON_GAT_GOUT_CPUCL0_ADS_AHB_G_CSSYS_FSYS_HCLKS=090x2018
+#define CLK_CON_GAT_GOUT_CPUCL0_ADS_APB_G_CSSYS_CPUCL1_PCLKS=090x201c
+#define CLK_CON_GAT_GOUT_CPUCL0_ADS_APB_G_P8Q_PCLKS=09=090x2020
+#define CLK_CON_GAT_GOUT_CPUCL0_AD_APB_P_DUMP_PC_CPUCL0_PCLKM=090x2024
+#define CLK_CON_GAT_GOUT_CPUCL0_AD_APB_P_DUMP_PC_CPUCL1_PCLKM=090x2028
+#define CLK_CON_GAT_GOUT_CPUCL0_BUSIF_HPMCPUCL0_PCLK=09=090x202c
+#define CLK_CON_GAT_GOUT_CPUCL0_CSSYS_DBG_PCLKDBG=09=090x2030
+#define CLK_CON_GAT_GOUT_CPUCL0_DUMP_PC_CPUCL0_PCLK=09=090x2034
+#define CLK_CON_GAT_GOUT_CPUCL0_DUMP_PC_CPUCL1_PCLK=09=090x2038
+#define CLK_CON_GAT_GOUT_CPUCL0_LHM_AXI_P_CPUCL0_CLK=09=090x203c
+#define CLK_CON_GAT_GOUT_CPUCL0_LHS_AXI_D_CSSYS_CLK=09=090x2040
+#define CLK_CON_GAT_GOUT_CPUCL0_DBG_CLK=09=09=09=090x2044
+#define CLK_CON_GAT_GOUT_CPUCL0_PCLK_CLK=09=09=090x2048
+#define CLK_CON_GAT_GOUT_CPUCL0_SECJTAG_CLK=09=09=090x204c
+#define CLK_CON_GAT_GOUT_CPUCL0_SYSREG_PCLK=09=09=090x2050
+
+static const unsigned long cpucl0_clk_regs[] __initconst =3D {
+=09PLL_LOCKTIME_PLL_CPUCL0,
+=09PLL_CON0_MUX_CLKCMU_CPUCL0_DBG_USER,
+=09PLL_CON2_MUX_CLKCMU_CPUCL0_DBG_USER,
+=09PLL_CON0_MUX_CLKCMU_CPUCL0_SWITCH_USER,
+=09PLL_CON2_MUX_CLKCMU_CPUCL0_SWITCH_USER,
+=09PLL_CON0_PLL_CPUCL0,
+=09CLK_CON_MUX_MUX_CLK_CPUCL0_PLL,
+=09CLK_CON_DIV_DIV_CLK_CLUSTER0_ACLK,
+=09CLK_CON_DIV_DIV_CLK_CLUSTER0_CNTCLK,
+=09CLK_CON_DIV_DIV_CLK_CLUSTER0_PCLKDBG,
+=09CLK_CON_DIV_DIV_CLK_CPUCL0_CMUREF,
+=09CLK_CON_DIV_DIV_CLK_CPUCL0_CPU,
+=09CLK_CON_DIV_DIV_CLK_CPUCL0_PCLK,
+=09CLK_CON_GAT_CLK_CPUCL0_CMU_PCLK,
+=09CLK_CON_GAT_CLK_CPUCL0_HPM_TARGETCLK_C,
+=09CLK_CON_GAT_CLK_CPUCL0_OSCCLK_CLK,
+=09CLK_CON_GAT_GATE_CLK_CLUSTER0_CPU,
+=09CLK_CON_GAT_GOUT_CPUCL0_ADM_APB_G_CSSYS_CORE_PCLKM,
+=09CLK_CON_GAT_GOUT_CPUCL0_ADS_AHB_G_CSSYS_FSYS_HCLKS,
+=09CLK_CON_GAT_GOUT_CPUCL0_ADS_APB_G_CSSYS_CPUCL1_PCLKS,
+=09CLK_CON_GAT_GOUT_CPUCL0_ADS_APB_G_P8Q_PCLKS,
+=09CLK_CON_GAT_GOUT_CPUCL0_AD_APB_P_DUMP_PC_CPUCL0_PCLKM,
+=09CLK_CON_GAT_GOUT_CPUCL0_AD_APB_P_DUMP_PC_CPUCL1_PCLKM,
+=09CLK_CON_GAT_GOUT_CPUCL0_BUSIF_HPMCPUCL0_PCLK,
+=09CLK_CON_GAT_GOUT_CPUCL0_CSSYS_DBG_PCLKDBG,
+=09CLK_CON_GAT_GOUT_CPUCL0_DUMP_PC_CPUCL0_PCLK,
+=09CLK_CON_GAT_GOUT_CPUCL0_DUMP_PC_CPUCL1_PCLK,
+=09CLK_CON_GAT_GOUT_CPUCL0_LHM_AXI_P_CPUCL0_CLK,
+=09CLK_CON_GAT_GOUT_CPUCL0_LHS_AXI_D_CSSYS_CLK,
+=09CLK_CON_GAT_GOUT_CPUCL0_DBG_CLK,
+=09CLK_CON_GAT_GOUT_CPUCL0_PCLK_CLK,
+=09CLK_CON_GAT_GOUT_CPUCL0_SECJTAG_CLK,
+=09CLK_CON_GAT_GOUT_CPUCL0_SYSREG_PCLK,
+};
+
+static const struct samsung_pll_rate_table pll_cpucl0_rate_table[] __initc=
onst =3D {
+=09PLL_35XX_RATE(26 * MHZ, 1049750000U, 323, 4, 1),
+=09PLL_35XX_RATE(26 * MHZ, 1449500000U, 223, 4, 0),
+=09PLL_35XX_RATE(26 * MHZ, 1850333333U, 427, 6, 0),
+=09PLL_35XX_RATE(26 * MHZ, 300083333U, 277, 6, 2),
+=09PLL_35XX_RATE(26 * MHZ, 600166666U, 277, 6, 1),
+};
+
+static const struct samsung_pll_clock cpucl0_pll_clks[] __initconst =3D {
+=09PLL(pll_1051x, CLK_FOUT_CPUCL0_PLL, "fout_cpucl0_pll", "oscclk",
+=09    PLL_LOCKTIME_PLL_CPUCL0, PLL_CON0_PLL_CPUCL0, pll_cpucl0_rate_table=
),
+};
+
+PNAME(mout_pll_cpucl0_dbg_user_p)=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_cpucl0_dbg" };
+PNAME(mout_pll_cpucl0_switch_user_p)=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_cpucl0_switch" };
+PNAME(mout_clk_cpucl0_pll_p)=09=09=3D { "fout_cpucl0_pll",
+=09=09=09=09=09    "mout_pll_cpucl0_switch_user" };
+
+static const struct samsung_mux_clock cpucl0_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_PLL_CPUCL0_DBG_USER, "mout_pll_cpucl0_dbg_user", mout_pll_=
cpucl0_dbg_user_p,
+=09    PLL_CON0_MUX_CLKCMU_CPUCL0_DBG_USER, 4, 1),
+=09MUX(CLK_MOUT_PLL_CPUCL0_SWITCH_USER, "mout_pll_cpucl0_switch_user",
+=09    mout_pll_cpucl0_switch_user_p, PLL_CON0_MUX_CLKCMU_CPUCL0_SWITCH_US=
ER, 4, 1),
+=09MUX(CLK_MOUT_CLK_CPUCL0_PLL, "mout_clk_cpucl0_pll", mout_clk_cpucl0_pll=
_p,
+=09    CLK_CON_MUX_MUX_CLK_CPUCL0_PLL, 0, 1),
+};
+
+static const struct samsung_div_clock cpucl0_div_clks[] __initconst =3D {
+=09DIV(CLK_DOUT_CLK_CLUSTER0_ACLK, "dout_clk_cluster0_aclk", "gout_clk_clu=
ster0_cpu",
+=09    CLK_CON_DIV_DIV_CLK_CLUSTER0_ACLK, 0, 4),
+=09DIV(CLK_DOUT_CLK_CLUSTER0_CNTCLK, "dout_clk_cluster0_cntclk", "gout_clk=
_cluster0_cpu",
+=09    CLK_CON_DIV_DIV_CLK_CLUSTER0_CNTCLK, 0, 4),
+=09DIV(CLK_DOUT_CLK_CLUSTER0_PCLKDBG, "dout_clk_cluster0_pclkdbg", "gout_c=
lk_cluster0_cpu",
+=09    CLK_CON_DIV_DIV_CLK_CLUSTER0_PCLKDBG, 0, 4),
+=09DIV(CLK_DOUT_CLK_CPUCL0_CMUREF, "dout_clk_cpucl0_cmuref", "dout_clk_cpu=
cl0_cpu",
+=09    CLK_CON_DIV_DIV_CLK_CPUCL0_CMUREF, 0, 3),
+=09DIV(CLK_DOUT_CLK_CPUCL0_CPU, "dout_clk_cpucl0_cpu", "mout_clk_cpucl0_pl=
l",
+=09    CLK_CON_DIV_DIV_CLK_CPUCL0_CPU, 0, 0),
+=09DIV(CLK_DOUT_CLK_CPUCL0_PCLK, "dout_clk_cpucl0_pclk", "dout_clk_cpucl0_=
cpu",
+=09    CLK_CON_DIV_DIV_CLK_CPUCL0_PCLK, 0, 4),
+};
+
+static const struct samsung_gate_clock cpucl0_gate_clks[] __initconst =3D =
{
+=09GATE(CLK_GOUT_CLK_CPUCL0_CMU_PCLK, "gout_clk_cpucl0_cmu_pclk",
+=09     "dout_clk_cpucl0_pclk", CLK_CON_GAT_CLK_CPUCL0_CMU_PCLK, 21, CLK_I=
GNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_CPUCL0_HPM_TARGETCLK_C, "gout_clk_cpucl0_hpm_targetcl=
k_c",
+=09     "dout_cmu_hpm", CLK_CON_GAT_CLK_CPUCL0_HPM_TARGETCLK_C, 21, CLK_IG=
NORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_CPUCL0_OSCCLK_CLK, "gout_clk_cpucl0_oscclk_clk",
+=09     "oscclk", CLK_CON_GAT_CLK_CPUCL0_OSCCLK_CLK, 21, CLK_IGNORE_UNUSED=
, 0),
+=09GATE(CLK_GOUT_CLK_CLUSTER0_CPU, "gout_clk_cluster0_cpu",
+=09     "dout_clk_cpucl0_cpu", CLK_CON_GAT_GATE_CLK_CLUSTER0_CPU, 21, CLK_=
IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_ADM_APB_G_CSSYS_CORE_PCLKM, "gout_cpucl0_adm_apb_g=
_cssys_core_pclkm",
+=09     "mout_pll_cpucl0_dbg_user", CLK_CON_GAT_GOUT_CPUCL0_ADM_APB_G_CSSY=
S_CORE_PCLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_ADS_AHB_G_CSSYS_FSYS_HCLKS, "gout_cpucl0_ads_ahb_g=
_cssys_fsys_hclks",
+=09     "mout_pll_cpucl0_dbg_user", CLK_CON_GAT_GOUT_CPUCL0_ADS_AHB_G_CSSY=
S_FSYS_HCLKS,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_ADS_APB_G_CSSYS_CPUCL1_PCLKS,
+=09     "gout_cpucl0_ads_apb_g_cssys_cpucl1_pclks", "mout_pll_cpucl0_dbg_u=
ser",
+=09     CLK_CON_GAT_GOUT_CPUCL0_ADS_APB_G_CSSYS_CPUCL1_PCLKS, 21, CLK_IGNO=
RE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_ADS_APB_G_P8Q_PCLKS, "gout_cpucl0_ads_apb_g_p8q_pc=
lks",
+=09     "mout_pll_cpucl0_dbg_user", CLK_CON_GAT_GOUT_CPUCL0_ADS_APB_G_P8Q_=
PCLKS,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_AD_APB_P_DUMP_PC_CPUCL0_PCLKM,
+=09     "gout_cpucl0_ad_apb_p_dump_pc_cpucl0_pclkm", "mout_pll_cpucl0_dbg_=
user",
+=09     CLK_CON_GAT_GOUT_CPUCL0_AD_APB_P_DUMP_PC_CPUCL0_PCLKM, 21, CLK_IGN=
ORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_AD_APB_P_DUMP_PC_CPUCL1_PCLKM,
+=09     "gout_cpucl0_ad_apb_p_dump_pc_cpucl1_pclkm", "mout_pll_cpucl0_dbg_=
user",
+=09     CLK_CON_GAT_GOUT_CPUCL0_AD_APB_P_DUMP_PC_CPUCL1_PCLKM, 21, CLK_IGN=
ORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_BUSIF_HPMCPUCL0_PCLK, "gout_cpucl0_busif_hpmcpucl0=
_pclk",
+=09     "dout_clk_cpucl0_pclk", CLK_CON_GAT_GOUT_CPUCL0_BUSIF_HPMCPUCL0_PC=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_CSSYS_DBG_PCLKDBG, "gout_cpucl0_cssys_dbg_pclkdbg"=
,
+=09     "mout_pll_cpucl0_dbg_user", CLK_CON_GAT_GOUT_CPUCL0_CSSYS_DBG_PCLK=
DBG,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_DUMP_PC_CPUCL0_PCLK, "gout_cpucl0_dump_pc_cpucl0_p=
clk",
+=09     "mout_pll_cpucl0_dbg_user", CLK_CON_GAT_GOUT_CPUCL0_DUMP_PC_CPUCL0=
_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_DUMP_PC_CPUCL1_PCLK, "gout_cpucl0_dump_pc_cpucl1_p=
clk",
+=09     "mout_pll_cpucl0_dbg_user", CLK_CON_GAT_GOUT_CPUCL0_DUMP_PC_CPUCL1=
_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_LHM_AXI_P_CPUCL0_CLK, "gout_cpucl0_lhm_axi_p_cpucl=
0_clk",
+=09     "dout_clk_cpucl0_pclk", CLK_CON_GAT_GOUT_CPUCL0_LHM_AXI_P_CPUCL0_C=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_LHS_AXI_D_CSSYS_CLK, "gout_cpucl0_lhs_axi_d_cssys_=
clk",
+=09     "mout_pll_cpucl0_dbg_user", CLK_CON_GAT_GOUT_CPUCL0_LHS_AXI_D_CSSY=
S_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_DBG_CLK, "gout_cpucl0_dbg_clk",
+=09     "mout_pll_cpucl0_dbg_user", CLK_CON_GAT_GOUT_CPUCL0_DBG_CLK, 21, C=
LK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_PCLK_CLK, "gout_cpucl0_pclk_clk",
+=09     "dout_clk_cpucl0_pclk", CLK_CON_GAT_GOUT_CPUCL0_PCLK_CLK, 21, CLK_=
IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_SECJTAG_CLK, "gout_cpucl0_secjtag_clk", "mout_pll_=
cpucl0_dbg_user",
+=09     CLK_CON_GAT_GOUT_CPUCL0_SECJTAG_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL0_SYSREG_PCLK, "gout_cpucl0_sysreg_pclk",
+=09     "dout_clk_cpucl0_pclk", CLK_CON_GAT_GOUT_CPUCL0_SYSREG_PCLK, 21, 0=
, 0),
+};
+
+static const struct samsung_cmu_info cpucl0_cmu_info __initconst =3D {
+=09.pll_clks =3D cpucl0_pll_clks,
+=09.nr_pll_clks =3D ARRAY_SIZE(cpucl0_pll_clks),
+=09.mux_clks =3D cpucl0_mux_clks,
+=09.nr_mux_clks =3D ARRAY_SIZE(cpucl0_mux_clks),
+=09.div_clks =3D cpucl0_div_clks,
+=09.nr_div_clks =3D ARRAY_SIZE(cpucl0_div_clks),
+=09.gate_clks =3D cpucl0_gate_clks,
+=09.nr_gate_clks =3D ARRAY_SIZE(cpucl0_gate_clks),
+=09.nr_clk_ids =3D CLKS_NR_CPUCL0,
+=09.clk_regs =3D cpucl0_clk_regs,
+=09.nr_clk_regs =3D ARRAY_SIZE(cpucl0_clk_regs),
+};
+
+static void __init exynos9610_cmu_cpucl0_init(struct device_node *np)
+{
+=09exynos_arm64_register_cmu(NULL, np, &cpucl0_cmu_info);
+}
+
+CLK_OF_DECLARE(exynos9610_cmu_cpucl0, "samsung,exynos9610-cmu-cpucl0",
+=09       exynos9610_cmu_cpucl0_init);
+
+/* CMU_CPUCL1 */
+#define PLL_LOCKTIME_PLL_CPUCL1=09=09=09=09=090x0000
+#define PLL_CON0_MUX_CLKCMU_CPUCL1_SWITCH_USER=09=09=090x0100
+#define PLL_CON2_MUX_CLKCMU_CPUCL1_SWITCH_USER=09=09=090x0108
+#define PLL_CON0_PLL_CPUCL1=09=09=09=09=090x0120
+#define CLK_CON_MUX_MUX_CLK_CPUCL1_PLL=09=09=09=090x1000
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_ACLK=09=09=090x1800
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_CNTCLK=09=09=090x1804
+#define CLK_CON_DIV_DIV_CLK_CPUCL1_CMUREF=09=09=090x180c
+#define CLK_CON_DIV_DIV_CLK_CPUCL1_CPU=09=09=09=090x1810
+#define CLK_CON_DIV_DIV_CLK_CPUCL1_PCLK=09=09=09=090x1814
+#define CLK_CON_DIV_DIV_CLK_CPUCL1_PCLKDBG=09=09=090x1818
+#define CLK_CON_GAT_CLK_CPUCL1_CMU_PCLK=09=09=09=090x2000
+#define CLK_CON_GAT_CLK_CPUCL1_HPM_TARGETCLK_C=09=09=090x2004
+#define CLK_CON_GAT_CLK_CPUCL1_OSCCLK_CLK=09=09=090x2008
+#define CLK_CON_GAT_GATE_CLK_CLUSTER1_CPU=09=09=090x2010
+#define CLK_CON_GAT_GOUT_CPUCL1_ADM_APB_G_CSSYS_CPUCL1_PCLKM=090x2014
+#define CLK_CON_GAT_GOUT_CPUCL1_BUSIF_HPMCPUCL1_PCLK=09=090x2018
+#define CLK_CON_GAT_GOUT_CPUCL1_LHM_AXI_P_CPUCL1_CLK=09=090x201c
+#define CLK_CON_GAT_GOUT_CPUCL1_LHS_ACE_D_CLK=09=09=090x2020
+#define CLK_CON_GAT_GOUT_CPUCL1_ACLK_CLK=09=09=090x2024
+#define CLK_CON_GAT_GOUT_CPUCL1_PCLKDBG_CLK=09=09=090x2028
+#define CLK_CON_GAT_GOUT_CPUCL1_PCLK_CLK=09=09=090x202c
+#define CLK_CON_GAT_GOUT_CPUCL1_SYSREG_PCLK=09=09=090x2030
+
+static const unsigned long cpucl1_clk_regs[] __initconst =3D {
+=09PLL_LOCKTIME_PLL_CPUCL1,
+=09PLL_CON0_MUX_CLKCMU_CPUCL1_SWITCH_USER,
+=09PLL_CON2_MUX_CLKCMU_CPUCL1_SWITCH_USER,
+=09PLL_CON0_PLL_CPUCL1,
+=09CLK_CON_MUX_MUX_CLK_CPUCL1_PLL,
+=09CLK_CON_DIV_DIV_CLK_CLUSTER1_ACLK,
+=09CLK_CON_DIV_DIV_CLK_CLUSTER1_CNTCLK,
+=09CLK_CON_DIV_DIV_CLK_CPUCL1_CMUREF,
+=09CLK_CON_DIV_DIV_CLK_CPUCL1_CPU,
+=09CLK_CON_DIV_DIV_CLK_CPUCL1_PCLK,
+=09CLK_CON_DIV_DIV_CLK_CPUCL1_PCLKDBG,
+=09CLK_CON_GAT_CLK_CPUCL1_CMU_PCLK,
+=09CLK_CON_GAT_CLK_CPUCL1_HPM_TARGETCLK_C,
+=09CLK_CON_GAT_CLK_CPUCL1_OSCCLK_CLK,
+=09CLK_CON_GAT_GATE_CLK_CLUSTER1_CPU,
+=09CLK_CON_GAT_GOUT_CPUCL1_ADM_APB_G_CSSYS_CPUCL1_PCLKM,
+=09CLK_CON_GAT_GOUT_CPUCL1_BUSIF_HPMCPUCL1_PCLK,
+=09CLK_CON_GAT_GOUT_CPUCL1_LHM_AXI_P_CPUCL1_CLK,
+=09CLK_CON_GAT_GOUT_CPUCL1_LHS_ACE_D_CLK,
+=09CLK_CON_GAT_GOUT_CPUCL1_ACLK_CLK,
+=09CLK_CON_GAT_GOUT_CPUCL1_PCLKDBG_CLK,
+=09CLK_CON_GAT_GOUT_CPUCL1_PCLK_CLK,
+=09CLK_CON_GAT_GOUT_CPUCL1_SYSREG_PCLK,
+};
+
+static const struct samsung_pll_rate_table pll_cpucl1_rate_table[] __initc=
onst =3D {
+=09PLL_35XX_RATE(26 * MHZ, 1499333333U, 346, 3, 1),
+=09PLL_35XX_RATE(26 * MHZ, 1898000000U, 292, 4, 0),
+=09PLL_35XX_RATE(26 * MHZ, 2400666666U, 277, 3, 0),
+=09PLL_35XX_RATE(26 * MHZ, 549900000U, 423, 5, 2),
+=09PLL_35XX_RATE(26 * MHZ, 850200000U, 327, 5, 1),
+};
+
+static const struct samsung_pll_clock cpucl1_pll_clks[] __initconst =3D {
+=09PLL(pll_1051x, CLK_FOUT_CPUCL1_PLL, "fout_cpucl1_pll", "oscclk",
+=09    PLL_LOCKTIME_PLL_CPUCL1, PLL_CON0_PLL_CPUCL1, pll_cpucl1_rate_table=
),
+};
+
+PNAME(mout_pll_cpucl1_switch_user_p)=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_cpucl1_switch" };
+PNAME(mout_clk_cpucl1_pll_p)=09=09=3D { "fout_cpucl1_pll",
+=09=09=09=09=09    "mout_pll_cpucl1_switch_user" };
+
+static const struct samsung_mux_clock cpucl1_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_PLL_CPUCL1_SWITCH_USER, "mout_pll_cpucl1_switch_user",
+=09    mout_pll_cpucl1_switch_user_p, PLL_CON0_MUX_CLKCMU_CPUCL1_SWITCH_US=
ER,
+=09    4, 1),
+=09MUX(CLK_MOUT_CLK_CPUCL1_PLL, "mout_clk_cpucl1_pll", mout_clk_cpucl1_pll=
_p,
+=09    CLK_CON_MUX_MUX_CLK_CPUCL1_PLL, 0, 1),
+};
+
+static const struct samsung_div_clock cpucl1_div_clks[] __initconst =3D {
+=09DIV(CLK_DOUT_CLK_CLUSTER1_ACLK, "dout_clk_cluster1_aclk", "gout_clk_clu=
ster1_cpu",
+=09    CLK_CON_DIV_DIV_CLK_CLUSTER1_ACLK, 0, 4),
+=09DIV(CLK_DOUT_CLK_CLUSTER1_CNTCLK, "dout_clk_cluster1_cntclk", "gout_clk=
_cluster1_cpu",
+=09    CLK_CON_DIV_DIV_CLK_CLUSTER0_CNTCLK, 0, 4),
+=09DIV(CLK_DOUT_CLK_CPUCL1_CMUREF, "dout_clk_cpucl1_cmuref", "dout_clk_cpu=
cl1_cpu",
+=09    CLK_CON_DIV_DIV_CLK_CPUCL1_CMUREF, 0, 4),
+=09DIV(CLK_DOUT_CLK_CPUCL1_CPU, "dout_clk_cpucl1_cpu", "mout_clk_cpucl1_pl=
l",
+=09    CLK_CON_DIV_DIV_CLK_CPUCL0_CPU, 0, 0),
+=09DIV(CLK_DOUT_CLK_CPUCL1_PCLK, "dout_clk_cpucl1_pclk", "dout_clk_cpucl1_=
cpu",
+=09    CLK_CON_DIV_DIV_CLK_CPUCL1_PCLK, 0, 4),
+=09DIV(CLK_DOUT_CLK_CPUCL1_PCLKDBG, "dout_clk_cpucl1_pclkdbg", "dout_clk_c=
pucl1_cpu",
+=09    CLK_CON_DIV_DIV_CLK_CPUCL1_PCLKDBG, 0, 4),
+};
+
+static const struct samsung_gate_clock cpucl1_gate_clks[] __initconst =3D =
{
+=09GATE(CLK_GOUT_CLK_CPUCL1_CMU_PCLK, "gout_clk_cpucl1_cmu_pclk",
+=09     "dout_clk_cpucl1_pclk", CLK_CON_GAT_CLK_CPUCL0_CMU_PCLK, 21, CLK_I=
GNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_CPUCL1_HPM_TARGETCLK_C, "gout_clk_cpucl1_hpm_targetcl=
k_c",
+=09     "dout_cmu_hpm", CLK_CON_GAT_CLK_CPUCL1_HPM_TARGETCLK_C, 21, CLK_IG=
NORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_CPUCL1_OSCCLK_CLK, "gout_clk_cpucl1_oscclk_clk",
+=09     "oscclk", CLK_CON_GAT_CLK_CPUCL1_OSCCLK_CLK, 21, CLK_IGNORE_UNUSED=
, 0),
+=09GATE(CLK_GOUT_CLK_CLUSTER1_CPU, "gout_clk_cluster1_cpu",
+=09     "dout_clk_cpucl1_cpu", CLK_CON_GAT_GATE_CLK_CLUSTER1_CPU, 21, CLK_=
IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL1_ADM_APB_G_CSSYS_CPUCL1_PCLKM,
+=09     "gout_cpucl1_adm_apb_g_cssys_cpucl1_pclkm", "dout_clk_cpucl1_pclkd=
bg",
+=09     CLK_CON_GAT_GOUT_CPUCL1_ADM_APB_G_CSSYS_CPUCL1_PCLKM, 21, CLK_IGNO=
RE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL1_BUSIF_HPMCPUCL1_PCLK, "gout_cpucl0_busif_hpmcpucl1=
_pclk",
+=09     "dout_clk_cpucl1_pclk", CLK_CON_GAT_GOUT_CPUCL1_BUSIF_HPMCPUCL1_PC=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL1_LHM_AXI_P_CPUCL1_CLK, "gout_cpucl1_lhm_axi_p_cpucl=
1_clk",
+=09     "dout_clk_cpucl1_pclk", CLK_CON_GAT_GOUT_CPUCL1_LHM_AXI_P_CPUCL1_C=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL1_LHS_ACE_D_CLK, "gout_cpucl1_lhs_ace_d_clk",
+=09     "dout_clk_cluster1_aclk", CLK_CON_GAT_GOUT_CPUCL1_LHS_ACE_D_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL1_ACLK_CLK, "gout_cpucl1_aclk_clk",
+=09     "dout_clk_cluster1_aclk", CLK_CON_GAT_GOUT_CPUCL1_ACLK_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL1_PCLKDBG_CLK, "gout_cpucl1_pclkdbg_clk",
+=09     "dout_clk_cpucl1_pclkdbg", CLK_CON_GAT_GOUT_CPUCL1_PCLKDBG_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL1_PCLK_CLK, "gout_cpucl1_pclk_clk",
+=09     "dout_clk_cpucl1_pclk", CLK_CON_GAT_GOUT_CPUCL1_PCLK_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CPUCL1_SYSREG_PCLK, "gout_cpucl1_sysreg_pclk",
+=09     "dout_clk_cpucl1_pclk", CLK_CON_GAT_GOUT_CPUCL1_SYSREG_PCLK,
+=09     21, 0, 0),
+};
+
+static const struct samsung_cmu_info cpucl1_cmu_info __initconst =3D {
+=09.pll_clks =3D cpucl1_pll_clks,
+=09.nr_pll_clks =3D ARRAY_SIZE(cpucl1_pll_clks),
+=09.mux_clks =3D cpucl1_mux_clks,
+=09.nr_mux_clks =3D ARRAY_SIZE(cpucl1_mux_clks),
+=09.div_clks =3D cpucl1_div_clks,
+=09.nr_div_clks =3D ARRAY_SIZE(cpucl1_div_clks),
+=09.gate_clks =3D cpucl1_gate_clks,
+=09.nr_gate_clks =3D ARRAY_SIZE(cpucl1_gate_clks),
+=09.nr_clk_ids =3D CLKS_NR_CPUCL1,
+=09.clk_regs =3D cpucl1_clk_regs,
+=09.nr_clk_regs =3D ARRAY_SIZE(cpucl1_clk_regs),
+};
+
+static void __init exynos9610_cmu_cpucl1_init(struct device_node *np)
+{
+=09exynos_arm64_register_cmu(NULL, np, &cpucl1_cmu_info);
+}
+
+CLK_OF_DECLARE(exynos9610_cmu_cpucl1, "samsung,exynos9610-cmu-cpucl1",
+=09       exynos9610_cmu_cpucl1_init);
+
+/* CMU_PERI */
+#define PLL_CON0_MUX_CLKCMU_PERI_BUS_USER=09=09=090x0100 // old
+#define PLL_CON2_MUX_CLKCMU_PERI_BUS_USER=09=09=090x0108
+#define PLL_CON0_MUX_CLKCMU_PERI_IP_USER=09=09=090x0120 // old
+#define PLL_CON2_MUX_CLKCMU_PERI_IP_USER=09=09=090x0128
+#define PLL_CON0_MUX_CLKCMU_PERI_UART_USER=09=09=090x0140
+#define PLL_CON2_MUX_CLKCMU_PERI_UART_USER=09=09=090x0148
+#define CLK_CON_DIV_DIV_CLK_PERI_I2C=09=09=09=090x1800
+#define CLK_CON_DIV_DIV_CLK_PERI_SPI0=09=09=09=090x1804 // old
+#define CLK_CON_DIV_DIV_CLK_PERI_SPI1=09=09=09=090x1808 // old
+#define CLK_CON_DIV_DIV_CLK_PERI_SPI2=09=09=09=090x180c // old
+#define CLK_CON_DIV_DIV_CLK_PERI_USI_I2C=09=09=090x1814
+#define CLK_CON_DIV_DIV_CLK_PERI_USI_USI=09=09=090x1818
+#define CLK_CON_GAT_CLK_PERI_CMU_PCLK=09=09=09=090x2000
+#define CLK_CON_GAT_CLK_PERI_OSCCLK_CLK=09=09=09=090x2004
+#define CLK_CON_GAT_GATE_CLK_PERI_I2C=09=09=09=090x2008
+#define CLK_CON_GAT_GATE_CLK_PERI_SPI0=09=09=09=090x200c // old
+#define CLK_CON_GAT_GATE_CLK_PERI_SPI1=09=09=09=090x2010 // old
+#define CLK_CON_GAT_GATE_CLK_PERI_SPI2=09=09=09=090x2014 // old
+#define CLK_CON_GAT_GATE_CLK_PERI_USI_I2C=09=09=090x2018
+#define CLK_CON_GAT_GATE_CLK_PERI_USI_USI=09=09=090x201c
+#define CLK_CON_GAT_GOUT_PERI_AXI2AHB_MSD32_ACLK=09=090x2020
+#define CLK_CON_GAT_GOUT_PERI_BUSIF_TMU_PCLK=09=09=090x2024
+#define CLK_CON_GAT_GOUT_PERI_CAMI2C_0_IPCLK=09=09=090x2028
+#define CLK_CON_GAT_GOUT_PERI_CAMI2C_0_PCLK=09=09=090x202c
+#define CLK_CON_GAT_GOUT_PERI_CAMI2C_1_IPCLK=09=09=090x2030
+#define CLK_CON_GAT_GOUT_PERI_CAMI2C_1_PCLK=09=09=090x2034
+#define CLK_CON_GAT_GOUT_PERI_CAMI2C_2_IPCLK=09=09=090x2038
+#define CLK_CON_GAT_GOUT_PERI_CAMI2C_2_PCLK=09=09=090x203c
+#define CLK_CON_GAT_GOUT_PERI_CAMI2C_3_IPCLK=09=09=090x2040
+#define CLK_CON_GAT_GOUT_PERI_CAMI2C_3_PCLK=09=09=090x2044
+#define CLK_CON_GAT_GOUT_PERI_I2C_0_PCLK=09=09=090x204c
+#define CLK_CON_GAT_GOUT_PERI_I2C_1_PCLK=09=09=090x2050
+#define CLK_CON_GAT_GOUT_PERI_I2C_2_PCLK=09=09=090x2054
+#define CLK_CON_GAT_GOUT_PERI_I2C_3_PCLK=09=09=090x2058
+#define CLK_CON_GAT_GOUT_PERI_I2C_4_PCLK=09=09=090x205c
+#define CLK_CON_GAT_GOUT_PERI_I2C_5_PCLK=09=09=090x2060
+#define CLK_CON_GAT_GOUT_PERI_I2C_6_PCLK=09=09=090x2064
+#define CLK_CON_GAT_GOUT_PERI_GPIO_PCLK=09=09=09=090x2048
+#define CLK_CON_GAT_GOUT_PERI_LHM_AXI_P_PERI_CLK=09=090x2068
+#define CLK_CON_GAT_GOUT_PERI_MCT_PCLK=09=09=09=090x206c // old
+#define CLK_CON_GAT_GOUT_PERI_OTP_CON_TOP_PCLK=09=09=090x2070
+#define CLK_CON_GAT_GOUT_PERI_PWM_MOTOR_PCLK_S0=09=09=090x2074
+#define CLK_CON_GAT_GOUT_PERI_BUS_CLK=09=09=09=090x2078
+#define CLK_CON_GAT_GOUT_PERI_I2C_CLK=09=09=09=090x207c
+#define CLK_CON_GAT_GOUT_PERI_SPI_0_CLK=09=09=09=090x2080
+#define CLK_CON_GAT_GOUT_PERI_SPI_1_CLK=09=09=09=090x2084
+#define CLK_CON_GAT_GOUT_PERI_SPI_2_CLK=09=09=09=090x2088
+#define CLK_CON_GAT_GOUT_PERI_UART_CLK=09=09=09=090x208c
+#define CLK_CON_GAT_GOUT_PERI_USI00_I2C_CLK=09=09=090x2090
+#define CLK_CON_GAT_GOUT_PERI_USI00_USI_CLK=09=09=090x2094
+#define CLK_CON_GAT_GOUT_PERI_SPI_0_IPCLK=09=09=090x2098 // old
+#define CLK_CON_GAT_GOUT_PERI_SPI_0_PCLK=09=09=090x209c // old
+#define CLK_CON_GAT_GOUT_PERI_SPI_1_IPCLK=09=09=090x20a0 // old
+#define CLK_CON_GAT_GOUT_PERI_SPI_1_PCLK=09=09=090x20a4 // old
+#define CLK_CON_GAT_GOUT_PERI_SPI_2_IPCLK=09=09=090x20a8 // old
+#define CLK_CON_GAT_GOUT_PERI_SPI_2_PCLK=09=09=090x20ac // old
+#define CLK_CON_GAT_GOUT_PERI_SYSREG_PCLK=09=09=090x20b0
+#define CLK_CON_GAT_GOUT_PERI_UART_IPCLK=09=09=090x20b4
+#define CLK_CON_GAT_GOUT_PERI_UART_PCLK=09=09=09=090x20b8
+#define CLK_CON_GAT_GOUT_PERI_USI00_I2C_IPCLK=09=09=090x20bc
+#define CLK_CON_GAT_GOUT_PERI_USI00_I2C_PCLK=09=09=090x20c0
+#define CLK_CON_GAT_GOUT_PERI_USI00_USI_IPCLK=09=09=090x20c4
+#define CLK_CON_GAT_GOUT_PERI_USI00_USI_PCLK=09=09=090x20c8
+#define CLK_CON_GAT_GOUT_PERI_WDT_CLUSTER0_PCLK=09=09=090x20cc
+#define CLK_CON_GAT_GOUT_PERI_WDT_CLUSTER1_PCLK=09=09=090x20d0
+
+static const unsigned long peri_clk_regs[] __initconst =3D {
+=09PLL_CON0_MUX_CLKCMU_PERI_BUS_USER,
+=09PLL_CON2_MUX_CLKCMU_PERI_BUS_USER,
+=09PLL_CON0_MUX_CLKCMU_PERI_IP_USER,
+=09PLL_CON2_MUX_CLKCMU_PERI_IP_USER,
+=09PLL_CON0_MUX_CLKCMU_PERI_UART_USER,
+=09PLL_CON2_MUX_CLKCMU_PERI_UART_USER,
+=09CLK_CON_DIV_DIV_CLK_PERI_I2C,
+=09CLK_CON_DIV_DIV_CLK_PERI_SPI0,
+=09CLK_CON_DIV_DIV_CLK_PERI_SPI1,
+=09CLK_CON_DIV_DIV_CLK_PERI_SPI2,
+=09CLK_CON_DIV_DIV_CLK_PERI_USI_I2C,
+=09CLK_CON_DIV_DIV_CLK_PERI_USI_USI,
+=09CLK_CON_GAT_CLK_PERI_CMU_PCLK,
+=09CLK_CON_GAT_CLK_PERI_OSCCLK_CLK,
+=09CLK_CON_GAT_GATE_CLK_PERI_I2C,
+=09CLK_CON_GAT_GATE_CLK_PERI_SPI0,
+=09CLK_CON_GAT_GATE_CLK_PERI_SPI1,
+=09CLK_CON_GAT_GATE_CLK_PERI_SPI2,
+=09CLK_CON_GAT_GATE_CLK_PERI_USI_I2C,
+=09CLK_CON_GAT_GATE_CLK_PERI_USI_USI,
+=09CLK_CON_GAT_GOUT_PERI_AXI2AHB_MSD32_ACLK,
+=09CLK_CON_GAT_GOUT_PERI_BUSIF_TMU_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_CAMI2C_0_IPCLK,
+=09CLK_CON_GAT_GOUT_PERI_CAMI2C_0_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_CAMI2C_1_IPCLK,
+=09CLK_CON_GAT_GOUT_PERI_CAMI2C_1_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_CAMI2C_2_IPCLK,
+=09CLK_CON_GAT_GOUT_PERI_CAMI2C_2_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_CAMI2C_3_IPCLK,
+=09CLK_CON_GAT_GOUT_PERI_CAMI2C_3_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_I2C_0_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_I2C_1_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_I2C_2_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_I2C_3_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_I2C_4_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_I2C_5_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_I2C_6_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_GPIO_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_LHM_AXI_P_PERI_CLK,
+=09CLK_CON_GAT_GOUT_PERI_MCT_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_OTP_CON_TOP_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_PWM_MOTOR_PCLK_S0,
+=09CLK_CON_GAT_GOUT_PERI_BUS_CLK,
+=09CLK_CON_GAT_GOUT_PERI_I2C_CLK,
+=09CLK_CON_GAT_GOUT_PERI_SPI_0_CLK,
+=09CLK_CON_GAT_GOUT_PERI_SPI_1_CLK,
+=09CLK_CON_GAT_GOUT_PERI_SPI_2_CLK,
+=09CLK_CON_GAT_GOUT_PERI_UART_CLK,
+=09CLK_CON_GAT_GOUT_PERI_USI00_I2C_CLK,
+=09CLK_CON_GAT_GOUT_PERI_USI00_USI_CLK,
+=09CLK_CON_GAT_GOUT_PERI_SPI_0_IPCLK,
+=09CLK_CON_GAT_GOUT_PERI_SPI_0_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_SPI_1_IPCLK,
+=09CLK_CON_GAT_GOUT_PERI_SPI_1_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_SPI_2_IPCLK,
+=09CLK_CON_GAT_GOUT_PERI_SPI_2_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_SYSREG_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_UART_IPCLK,
+=09CLK_CON_GAT_GOUT_PERI_UART_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_USI00_I2C_IPCLK,
+=09CLK_CON_GAT_GOUT_PERI_USI00_I2C_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_USI00_USI_IPCLK,
+=09CLK_CON_GAT_GOUT_PERI_USI00_USI_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_WDT_CLUSTER0_PCLK,
+=09CLK_CON_GAT_GOUT_PERI_WDT_CLUSTER1_PCLK,
+};
+
+PNAME(mout_pll_peri_bus_user_p)=09=09=3D { "oscclk", "dout_cmu_peri_bus" }=
;
+PNAME(mout_pll_peri_ip_user_p)=09=09=3D { "oscclk", "dout_cmu_peri_ip" };
+PNAME(mout_pll_peri_uart_user_p)=09=3D { "oscclk", "dout_cmu_peri_uart" };
+
+static const struct samsung_mux_clock peri_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_PLL_PERI_BUS_USER, "mout_pll_peri_bus_user", mout_pll_peri=
_bus_user_p,
+=09    PLL_CON0_MUX_CLKCMU_PERI_BUS_USER, 4, 1),
+=09MUX(CLK_MOUT_PLL_PERI_IP_USER, "mout_pll_peri_ip_user", mout_pll_peri_i=
p_user_p,
+=09    PLL_CON0_MUX_CLKCMU_PERI_IP_USER, 4, 1),
+=09MUX(CLK_MOUT_PLL_PERI_UART_USER, "mout_pll_peri_uart_user", mout_pll_pe=
ri_uart_user_p,
+=09    PLL_CON0_MUX_CLKCMU_PERI_UART_USER, 4, 1),
+};
+
+static const struct samsung_div_clock peri_div_clks[] __initconst =3D {
+=09DIV(CLK_DOUT_CLK_PERI_I2C, "dout_clk_peri_i2c", "gout_clk_peri_i2c",
+=09    CLK_CON_DIV_DIV_CLK_PERI_I2C, 0, 8),
+=09DIV(CLK_DOUT_CLK_PERI_SPI0, "dout_clk_peri_spi0", "gout_clk_peri_spi0",
+=09    CLK_CON_DIV_DIV_CLK_PERI_SPI0, 0, 8),
+=09DIV(CLK_DOUT_CLK_PERI_SPI1, "dout_clk_peri_spi1", "gout_clk_peri_spi1",
+=09    CLK_CON_DIV_DIV_CLK_PERI_SPI1, 0, 8),
+=09DIV(CLK_DOUT_CLK_PERI_SPI2, "dout_clk_peri_spi2", "gout_clk_peri_spi2",
+=09    CLK_CON_DIV_DIV_CLK_PERI_SPI2, 0, 8),
+=09DIV(CLK_DOUT_CLK_PERI_USI_I2C, "dout_clk_peri_usi_i2c", "gout_clk_peri_=
usi_i2c",
+=09    CLK_CON_DIV_DIV_CLK_PERI_USI_I2C, 0, 4),
+=09DIV(CLK_DOUT_CLK_PERI_USI_USI, "dout_clk_peri_usi_usi", "gout_clk_peri_=
usi_usi",
+=09    CLK_CON_DIV_DIV_CLK_PERI_USI_USI, 0, 8),
+};
+
+static const struct samsung_gate_clock peri_gate_clks[] __initconst =3D {
+=09GATE(CLK_GOUT_CLK_PERI_I2C, "gout_clk_peri_i2c", "mout_pll_peri_ip_user=
",
+=09     CLK_CON_GAT_GATE_CLK_PERI_I2C, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_PERI_SPI0, "gout_clk_peri_spi0", "mout_pll_peri_ip_us=
er",
+=09     CLK_CON_GAT_GATE_CLK_PERI_SPI0, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_PERI_SPI1, "gout_clk_peri_spi1", "mout_pll_peri_ip_us=
er",
+=09     CLK_CON_GAT_GATE_CLK_PERI_SPI1, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_PERI_SPI2, "gout_clk_peri_spi2", "mout_pll_peri_ip_us=
er",
+=09     CLK_CON_GAT_GATE_CLK_PERI_SPI2, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_PERI_USI_I2C, "gout_clk_peri_usi_i2c", "mout_pll_peri=
_ip_user",
+=09     CLK_CON_GAT_GATE_CLK_PERI_USI_I2C, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_PERI_USI_USI, "gout_clk_peri_usi_usi", "mout_pll_peri=
_ip_user",
+=09     CLK_CON_GAT_GATE_CLK_PERI_USI_USI, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_AXI2AHB_MSD32_ACLK, "gout_peri_axi2ahb_msd32_aclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_AXI2AHB_MSD32_ACLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_BUSIF_TMU_PCLK, "gout_peri_busif_tmu_pclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_BUSIF_TMU_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_CAMI2C_0_IPCLK, "gout_peri_cami2c_0_ipclk",
+=09     "dout_clk_peri_i2c", CLK_CON_GAT_GOUT_PERI_CAMI2C_0_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_CAMI2C_0_PCLK, "gout_peri_cami2c_0_pclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_CAMI2C_0_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_CAMI2C_1_IPCLK, "gout_peri_cami2c_1_ipclk",
+=09     "dout_clk_peri_i2c", CLK_CON_GAT_GOUT_PERI_CAMI2C_1_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_CAMI2C_1_PCLK, "gout_peri_cami2c_1_pclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_CAMI2C_1_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_CAMI2C_2_IPCLK, "gout_peri_cami2c_2_ipclk",
+=09     "dout_clk_peri_i2c", CLK_CON_GAT_GOUT_PERI_CAMI2C_2_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_CAMI2C_2_PCLK, "gout_peri_cami2c_2_pclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_CAMI2C_2_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_CAMI2C_3_IPCLK, "gout_peri_cami2c_3_ipclk",
+=09     "dout_clk_peri_i2c", CLK_CON_GAT_GOUT_PERI_CAMI2C_3_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_CAMI2C_3_PCLK, "gout_peri_cami2c_3_pclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_CAMI2C_3_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_I2C_0_PCLK, "gout_peri_i2c_0_pclk", "mout_pll_peri_b=
us_user",
+=09     CLK_CON_GAT_GOUT_PERI_I2C_0_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_I2C_1_PCLK, "gout_peri_i2c_1_pclk", "mout_pll_peri_b=
us_user",
+=09     CLK_CON_GAT_GOUT_PERI_I2C_1_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_I2C_2_PCLK, "gout_peri_i2c_2_pclk", "mout_pll_peri_b=
us_user",
+=09     CLK_CON_GAT_GOUT_PERI_I2C_2_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_I2C_3_PCLK, "gout_peri_i2c_3_pclk", "mout_pll_peri_b=
us_user",
+=09     CLK_CON_GAT_GOUT_PERI_I2C_3_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_I2C_4_PCLK, "gout_peri_i2c_4_pclk", "mout_pll_peri_b=
us_user",
+=09     CLK_CON_GAT_GOUT_PERI_I2C_4_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_I2C_5_PCLK, "gout_peri_i2c_5_pclk", "mout_pll_peri_b=
us_user",
+=09     CLK_CON_GAT_GOUT_PERI_I2C_5_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_I2C_6_PCLK, "gout_peri_i2c_6_pclk", "mout_pll_peri_b=
us_user",
+=09     CLK_CON_GAT_GOUT_PERI_I2C_6_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_GPIO_PCLK, "gout_peri_gpio_pclk", "mout_pll_peri_bus=
_user",
+=09     CLK_CON_GAT_GOUT_PERI_GPIO_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_LHM_AXI_P_PERI_CLK, "gout_peri_lhm_axi_p_peri_clk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_LHM_AXI_P_PERI_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_MCT_PCLK, "gout_peri_mct_pclk", "mout_pll_peri_bus_u=
ser",
+=09     CLK_CON_GAT_GOUT_PERI_MCT_PCLK, 21, 0, 0),
+=09GATE(CLK_GOUT_PERI_OTP_CON_TOP_PCLK, "gout_peri_otp_con_top_pclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_OTP_CON_TOP_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_PWM_MOTOR_PCLK_S0, "gout_peri_pwm_motor_pclk_s0",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_PWM_MOTOR_PCLK_S0,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_BUS_CLK, "gout_peri_bus_clk", "mout_pll_peri_bus_use=
r",
+=09     CLK_CON_GAT_GOUT_PERI_BUS_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_I2C_CLK, "gout_peri_i2c_clk", "dout_clk_peri_i2c",
+=09     CLK_CON_GAT_GOUT_PERI_I2C_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_SPI_0_CLK, "gout_peri_spi_0_clk", "dout_clk_peri_spi=
0",
+=09     CLK_CON_GAT_GOUT_PERI_SPI_0_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_SPI_1_CLK, "gout_peri_spi_1_clk", "dout_clk_peri_spi=
1",
+=09     CLK_CON_GAT_GOUT_PERI_SPI_1_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_SPI_2_CLK, "gout_peri_spi_2_clk", "dout_clk_peri_spi=
2",
+=09     CLK_CON_GAT_GOUT_PERI_SPI_2_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_UART_CLK, "gout_peri_uart_clk", "mout_pll_peri_uart_=
user",
+=09     CLK_CON_GAT_GOUT_PERI_UART_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_USI00_I2C_CLK, "gout_peri_usi00_i2c_clk",
+=09     "dout_clk_peri_usi_i2c", CLK_CON_GAT_GOUT_PERI_USI00_I2C_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_USI00_USI_CLK, "gout_peri_usi00_usi_clk",
+=09     "dout_clk_peri_usi_usi", CLK_CON_GAT_GOUT_PERI_USI00_USI_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_SPI_0_PCLK, "gout_peri_spi_0_pclk", "mout_pll_peri_b=
us_user",
+=09     CLK_CON_GAT_GOUT_PERI_SPI_0_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_SPI_0_IPCLK, "gout_peri_spi_0_ipclk", "dout_cmu_peri=
_spi0",
+=09     CLK_CON_GAT_GOUT_PERI_SPI_0_IPCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_SPI_1_PCLK, "gout_peri_spi_1_pclk", "mout_pll_peri_b=
us_user",
+=09     CLK_CON_GAT_GOUT_PERI_SPI_1_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_SPI_1_IPCLK, "gout_peri_spi_1_ipclk", "dout_cmu_peri=
_spi1",
+=09     CLK_CON_GAT_GOUT_PERI_SPI_1_IPCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_SPI_2_PCLK, "gout_peri_spi_2_pclk", "mout_pll_peri_b=
us_user",
+=09     CLK_CON_GAT_GOUT_PERI_SPI_2_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_SPI_2_IPCLK, "gout_peri_spi_2_ipclk", "dout_cmu_peri=
_spi1",
+=09     CLK_CON_GAT_GOUT_PERI_SPI_2_IPCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_SYSREG_PCLK, "gout_peri_sysreg_pclk", "mout_pll_peri=
_bus_user",
+=09     CLK_CON_GAT_GOUT_PERI_SYSREG_PCLK, 21, 0, 0),
+=09GATE(CLK_GOUT_PERI_UART_IPCLK, "gout_peri_uart_ipclk", "mout_pll_peri_u=
art_user",
+=09     CLK_CON_GAT_GOUT_PERI_UART_IPCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_UART_PCLK, "gout_peri_uart_pclk", "mout_pll_peri_bus=
_user",
+=09     CLK_CON_GAT_GOUT_PERI_UART_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_USI00_I2C_IPCLK, "gout_peri_usi00_i2c_ipclk",
+=09     "dout_clk_peri_usi_i2c_user", CLK_CON_GAT_GOUT_PERI_USI00_I2C_IPCL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_USI00_I2C_PCLK, "gout_peri_usi00_i2c_pclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_USI00_I2C_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_USI00_USI_IPCLK, "gout_peri_usi00_usi_ipclk",
+=09     "dout_clk_peri_usi_usi_user", CLK_CON_GAT_GOUT_PERI_USI00_USI_IPCL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_USI00_USI_PCLK, "gout_peri_usi00_usi_pclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_USI00_USI_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_WDT_CLUSTER0_PCLK, "gout_peri_wdt_cluster0_pclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_WDT_CLUSTER0_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_PERI_WDT_CLUSTER1_PCLK, "gout_peri_wdt_cluster1_pclk",
+=09     "mout_pll_peri_bus_user", CLK_CON_GAT_GOUT_PERI_WDT_CLUSTER1_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info peri_cmu_info __initconst =3D {
+=09.mux_clks=09=09=3D peri_mux_clks,
+=09.nr_mux_clks=09=09=3D ARRAY_SIZE(peri_mux_clks),
+=09.div_clks=09=09=3D peri_div_clks,
+=09.nr_div_clks=09=09=3D ARRAY_SIZE(peri_div_clks),
+=09.gate_clks=09=09=3D peri_gate_clks,
+=09.nr_gate_clks=09=09=3D ARRAY_SIZE(peri_gate_clks),
+=09.clk_regs=09=09=3D peri_clk_regs,
+=09.nr_clk_regs=09=09=3D ARRAY_SIZE(peri_clk_regs),
+=09.nr_clk_ids=09=09=3D CLKS_NR_PERI,
+};
+
+static void __init exynos9610_cmu_peri_init(struct device_node *np)
+{
+=09exynos_arm64_register_cmu(NULL, np, &peri_cmu_info);
+}
+
+CLK_OF_DECLARE(exynos9610_cmu_peri, "samsung,exynos9610-cmu-peri",
+=09       exynos9610_cmu_peri_init);
+
+/* CMU_APM */
+#define PLL_CON0_MUX_CLKCMU_APM_BUS_USER=09=090x0100
+#define PLL_CON2_MUX_CLKCMU_APM_BUS_USER=09=090x0108
+#define PLL_CON0_MUX_DLL_USER=09=09=09=090x0120
+#define PLL_CON2_MUX_DLL_USER=09=09=09=090x0128
+#define CLK_CON_MUX_CLKCMU_SHUB_BUS=09=09=090x1000
+#define CLK_CON_MUX_CLK_APM_BUS=09=09=09=090x1004
+#define CLK_CON_DIV_CLKCMU_SHUB_BUS=09=09=090x1800
+#define CLK_CON_DIV_CLK_APM_BUS=09=09=09=090x1804
+#define CLK_CON_GAT_CLKCMU_CMGP_BUS=09=09=090x2000
+#define CLK_CON_GAT_CLK_APM_CMU_PCLK=09=09=090x2004
+#define CLK_CON_GAT_CLK_APM_OSCCLK_CLK=09=09=090x2008
+#define CLK_CON_GAT_CLK_APM_OSCCLK_RCO_CLK=09=090x200c
+#define CLK_CON_GAT_GATE_CLKCMU_SHUB_BUS=09=090x2010
+#define CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK=090x2014
+#define CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK=090x2018
+#define CLK_CON_GAT_GOUT_APM_APBIF_RTC_ALIVE_PCLK=090x201c
+#define CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_ALIVE_PCLK=090x2020
+#define CLK_CON_GAT_GOUT_APM_GREBEINTEGRATION_HCLK=090x2024
+#define CLK_CON_GAT_GOUT_APM_INTMEM_ACLK=09=090x2028
+#define CLK_CON_GAT_GOUT_APM_INTMEM_PCLK=09=090x202c
+#define CLK_CON_GAT_GOUT_APM_LHM_AXI_P_GNSS_CLK=09=090x2030
+#define CLK_CON_GAT_GOUT_APM_LHM_AXI_P_CLK=09=090x2034
+#define CLK_CON_GAT_GOUT_APM_LHM_AXI_P_MODEM_CLK=090x2038
+#define CLK_CON_GAT_GOUT_APM_LHM_AXI_P_SHUB_CLK=09=090x203c
+#define CLK_CON_GAT_GOUT_APM_LHM_AXI_P_WLBT_CLK=09=090x2040
+#define CLK_CON_GAT_GOUT_APM_LHS_AXI_D_CLK=09=090x2044
+#define CLK_CON_GAT_GOUT_APM_LHS_AXI_LP_SHUB_CLK=090x2048
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_AP2CP_PCLK=09=090x204c
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_AP2CP_S_PCLK=090x2050
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_AP2GNSS_PCLK=090x2054
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_AP2SHUB_PCLK=090x2058
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_AP2WLBT_PCLK=090x205c
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_APM2AP_PCLK=090x2060
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_APM2CP_PCLK=090x2064
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_APM2GNSS_PCLK=090x2068
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_APM2SHUB_PCLK=090x206c
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_APM2WLBT_PCLK=090x2070
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_CP2GNSS_PCLK=090x2074
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_CP2SHUB_PCLK=090x2078
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_CP2WLBT_PCLK=090x207c
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_SHUB2GNSS_PCLK=090x2080
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_SHUB2WLBT_PCLK=090x2084
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_WLBT2ABOX_PCLK=090x2088
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_WLBT2GNSS_PCLK=090x208c
+#define CLK_CON_GAT_GOUT_APM_PEM_CLK=09=09=090x2090
+#define CLK_CON_GAT_GOUT_APM_PGEN_LITE_CLK=09=090x2094
+#define CLK_CON_GAT_GOUT_APM_PMU_INTR_GEN_PCLK=09=090x2098
+#define CLK_CON_GAT_GOUT_APM_BUS_CLK=09=09=090x209c
+#define CLK_CON_GAT_GOUT_APM_GREBE_CLK=09=09=090x20a0
+#define CLK_CON_GAT_GOUT_APM_SPEEDY_PCLK=09=090x20a4
+#define CLK_CON_GAT_GOUT_APM_SYSREG_PCLK=09=090x20a8
+#define CLK_CON_GAT_GOUT_APM_WDT_PCLK=09=09=090x20ac
+#define CLK_CON_GAT_GOUT_APM_XIU_DP_ACLK=09=090x20b0
+
+static const unsigned long apm_clk_regs[] __initconst =3D {
+=09PLL_CON0_MUX_CLKCMU_APM_BUS_USER,
+=09PLL_CON2_MUX_CLKCMU_APM_BUS_USER,
+=09PLL_CON0_MUX_DLL_USER,
+=09PLL_CON2_MUX_DLL_USER,
+=09CLK_CON_MUX_CLKCMU_SHUB_BUS,
+=09CLK_CON_MUX_CLK_APM_BUS,
+=09CLK_CON_DIV_CLKCMU_SHUB_BUS,
+=09CLK_CON_DIV_CLK_APM_BUS,
+=09CLK_CON_GAT_CLKCMU_CMGP_BUS,
+=09CLK_CON_GAT_CLK_APM_CMU_PCLK,
+=09CLK_CON_GAT_CLK_APM_OSCCLK_CLK,
+=09CLK_CON_GAT_CLK_APM_OSCCLK_RCO_CLK,
+=09CLK_CON_GAT_GATE_CLKCMU_SHUB_BUS,
+=09CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK,
+=09CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK,
+=09CLK_CON_GAT_GOUT_APM_APBIF_RTC_ALIVE_PCLK,
+=09CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_ALIVE_PCLK,
+=09CLK_CON_GAT_GOUT_APM_GREBEINTEGRATION_HCLK,
+=09CLK_CON_GAT_GOUT_APM_INTMEM_ACLK,
+=09CLK_CON_GAT_GOUT_APM_INTMEM_PCLK,
+=09CLK_CON_GAT_GOUT_APM_LHM_AXI_P_GNSS_CLK,
+=09CLK_CON_GAT_GOUT_APM_LHM_AXI_P_CLK,
+=09CLK_CON_GAT_GOUT_APM_LHM_AXI_P_MODEM_CLK,
+=09CLK_CON_GAT_GOUT_APM_LHM_AXI_P_SHUB_CLK,
+=09CLK_CON_GAT_GOUT_APM_LHM_AXI_P_WLBT_CLK,
+=09CLK_CON_GAT_GOUT_APM_LHS_AXI_D_CLK,
+=09CLK_CON_GAT_GOUT_APM_LHS_AXI_LP_SHUB_CLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_AP2CP_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_AP2CP_S_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_AP2GNSS_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_AP2SHUB_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_AP2WLBT_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_APM2AP_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_APM2CP_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_APM2GNSS_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_APM2SHUB_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_APM2WLBT_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_CP2GNSS_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_CP2SHUB_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_CP2WLBT_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_SHUB2GNSS_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_SHUB2WLBT_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_WLBT2ABOX_PCLK,
+=09CLK_CON_GAT_GOUT_APM_MAILBOX_WLBT2GNSS_PCLK,
+=09CLK_CON_GAT_GOUT_APM_PEM_CLK,
+=09CLK_CON_GAT_GOUT_APM_PGEN_LITE_CLK,
+=09CLK_CON_GAT_GOUT_APM_PMU_INTR_GEN_PCLK,
+=09CLK_CON_GAT_GOUT_APM_BUS_CLK,
+=09CLK_CON_GAT_GOUT_APM_GREBE_CLK,
+=09CLK_CON_GAT_GOUT_APM_SPEEDY_PCLK,
+=09CLK_CON_GAT_GOUT_APM_SYSREG_PCLK,
+=09CLK_CON_GAT_GOUT_APM_WDT_PCLK,
+=09CLK_CON_GAT_GOUT_APM_XIU_DP_ACLK,
+};
+
+PNAME(mout_pll_apm_bus_user_p)=09=09=3D { "oscclk", "dout_cmu_apm_bus" };
+PNAME(mout_pll_dll_user_p)=09=09=3D { "oscclk", "dll_dco" };
+PNAME(mout_cmu_shub_bus_p)=09=09=3D { "oscclk", "mout_pll_dll_user" };
+PNAME(mout_clk_apm_bus_p)=09=09=3D { "mout_pll_apm_bus_user",
+=09=09=09=09=09    "dll_dco" };
+
+static const struct samsung_mux_clock apm_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_PLL_APM_BUS_USER, "mout_pll_apm_bus_user", mout_pll_apm_bu=
s_user_p,
+=09    PLL_CON0_MUX_CLKCMU_APM_BUS_USER, 4, 1),
+=09MUX(CLK_MOUT_PLL_DLL_USER, "mout_pll_dll_user", mout_pll_dll_user_p,
+=09    PLL_CON0_MUX_DLL_USER, 4, 1),
+=09MUX(CLK_MOUT_CMU_SHUB_BUS, "mout_cmu_shub_bus", mout_cmu_shub_bus_p,
+=09    CLK_CON_MUX_CLKCMU_SHUB_BUS, 0, 1),
+=09MUX(CLK_MOUT_CLK_APM_BUS, "mout_clk_apm_bus", mout_clk_apm_bus_p,
+=09    CLK_CON_MUX_CLK_APM_BUS, 0, 1),
+};
+
+static const struct samsung_div_clock apm_div_clks[] __initconst =3D {
+=09DIV(CLK_DOUT_CMU_SHUB_BUS, "dout_cmu_shub_bus", "gout_cmu_shub_bus",
+=09    CLK_CON_DIV_CLKCMU_SHUB_BUS, 0, 3),
+=09DIV(CLK_DOUT_CLK_APM_BUS, "dout_clk_apm_bus", "mout_clk_apm_bus",
+=09    CLK_CON_DIV_CLK_APM_BUS, 0, 3),
+};
+
+static const struct samsung_gate_clock apm_gate_clks[] __initconst =3D {
+=09GATE(CLK_GOUT_CMU_CMGP_BUS, "gout_cmu_cmgp_bus", "dout_clk_apm_bus",
+=09     CLK_CON_GAT_CLKCMU_CMGP_BUS, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_APM_CMU_PCLK, "gout_clk_apm_cmu_pclk", "dout_clk_apm_=
bus",
+=09     CLK_CON_GAT_CLK_APM_CMU_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_APM_OSCCLK_CLK, "gat_clk_apm_oscclk_clk", "oscclk",
+=09     CLK_CON_GAT_CLK_APM_OSCCLK_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_APM_OSCCLK_RCO_CLK, "gat_clk_apm_oscclk_rco_clk", "os=
cclk",
+=09     CLK_CON_GAT_CLK_APM_OSCCLK_RCO_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_APBIF_GPIO_ALIVE_PCLK, "gout_apm_apbif_gpio_alive_pcl=
k",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_APBIF_PMU_ALIVE_PCLK, "gout_apm_apbif_pmu_alive_pclk"=
,
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_APBIF_RTC_ALIVE_PCLK, "gout_apm_apbif_rtc_alive_pclk"=
,
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_APBIF_RTC_ALIVE_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_APBIF_TOP_RTC_ALIVE_PCLK, "gout_apm_apbif_top_rtc_ali=
ve_pclk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_ALIVE_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_GREBEINTEGRATION_HCLK, "gout_apm_grebeintegration_hcl=
k",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_GREBEINTEGRATION_HCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_INTMEM_ACLK, "gout_apm_intmem_aclk", "dout_clk_apm_bu=
s",
+=09     CLK_CON_GAT_GOUT_APM_INTMEM_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_INTMEM_PCLK, "gout_apm_intmem_pclk", "dout_clk_apm_bu=
s",
+=09     CLK_CON_GAT_GOUT_APM_INTMEM_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_LHM_AXI_P_GNSS_CLK, "gout_apm_lhm_axi_p_gnss_clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_LHM_AXI_P_GNSS_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_LHM_AXI_P_CLK, "gout_apm_lhm_axi_p_clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_LHM_AXI_P_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_LHM_AXI_P_MODEM_CLK, "gout_apm_lhm_axi_p_modem_clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_LHM_AXI_P_MODEM_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_LHM_AXI_P_SHUB_CLK, "gout_apm_lhm_axi_p_shub_clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_LHM_AXI_P_SHUB_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_LHM_AXI_P_WLBT_CLK, "gout_apm_lhm_axi_p_wlbt_clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_LHM_AXI_P_WLBT_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_LHS_AXI_D_CLK, "gout_apm_lhs_axi_d_clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_LHS_AXI_D_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_LHS_AXI_LP_SHUB_CLK, "gout_apm_lhs_axi_lp_shub_clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_LHS_AXI_LP_SHUB_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_AP2CP_PCLK, "gout_apm_mailbox_ap2cp_pclk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_AP2CP_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_AP2CP_S_PCLK, "gout_apm_mailbox_ap2cp_s_pclk"=
,
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_AP2CP_S_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_AP2GNSS_PCLK, "gout_apm_mailbox_ap2gnss_pclk"=
,
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_AP2GNSS_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_AP2SHUB_PCLK, "gout_apm_mailbox_ap2shub_pclk"=
,
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_AP2SHUB_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_AP2WLBT_PCLK, "gout_apm_mailbox_ap2wlbt_pclk"=
,
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_AP2WLBT_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_APM2AP_PCLK, "gout_apm_mailbox_apm2ap_pclk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_APM2AP_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_APM2CP_PCLK, "gout_apm_mailbox_apm2cp_pclk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_APM2CP_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_APM2GNSS_PCLK, "gout_apm_mailbox_apm2gnss_pcl=
k",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_APM2GNSS_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_APM2SHUB_PCLK, "gout_apm_mailbox_apm2shub_pcl=
k",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_APM2SHUB_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_APM2WLBT_PCLK, "gout_apm_mailbox_apm2wlbt_pcl=
k",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_APM2WLBT_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_CP2GNSS_PCLK, "gout_apm_mailbox_cp2gnss_pclk"=
,
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_CP2GNSS_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_CP2SHUB_PCLK, "gout_apm_mailbox_cp2shub_pclk"=
,
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_CP2SHUB_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_CP2WLBT_PCLK, "gout_apm_mailbox_cp2wlbt_pclk"=
,
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_CP2WLBT_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_SHUB2GNSS_PCLK, "gout_apm_mailbox_shub2gnss_p=
clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_SHUB2GNSS_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_SHUB2WLBT_PCLK, "gout_apm_mailbox_shub2wlbt_p=
clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_SHUB2WLBT_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_WLBT2ABOX_PCLK, "gout_apm_mailbox_wlbt2abox_p=
clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_WLBT2ABOX_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_MAILBOX_WLBT2GNSS_PCLK, "gout_apm_mailbox_wlbt2gnss_p=
clk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_MAILBOX_WLBT2GNSS_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_PEM_CLK, "gout_apm_pem_clk", "dout_clk_apm_bus",
+=09     CLK_CON_GAT_GOUT_APM_PEM_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_PGEN_LITE_CLK, "gout_apm_pgen_lite_clk", "dout_clk_ap=
m_bus",
+=09     CLK_CON_GAT_GOUT_APM_PGEN_LITE_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_PMU_INTR_GEN_PCLK, "gout_apm_pmu_intr_gen_pclk",
+=09     "dout_clk_apm_bus", CLK_CON_GAT_GOUT_APM_PMU_INTR_GEN_PCLK, 21, CL=
K_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_BUS_CLK, "gout_apm_bus_clk", "dout_clk_apm_bus",
+=09     CLK_CON_GAT_GOUT_APM_BUS_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_GREBE_CLK, "gout_apm_grebe_clk", "dout_clk_apm_bus",
+=09     CLK_CON_GAT_GOUT_APM_GREBE_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_SPEEDY_PCLK, "gout_apm_speedy_pclk", "dout_clk_apm_bu=
s",
+=09     CLK_CON_GAT_GOUT_APM_SPEEDY_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_SYSREG_PCLK, "gout_apm_sysreg_pclk", "dout_clk_apm_bu=
s",
+=09     CLK_CON_GAT_GOUT_APM_SYSREG_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_WDT_PCLK, "gout_apm_wdt_pclk", "dout_clk_apm_bus",
+=09     CLK_CON_GAT_GOUT_APM_WDT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_APM_XIU_DP_ACLK, "gout_apm_xiu_dp_aclk", "dout_clk_apm_bu=
s",
+=09     CLK_CON_GAT_GOUT_APM_XIU_DP_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info apm_cmu_info __initconst =3D {
+=09.mux_clks=09=09=3D apm_mux_clks,
+=09.nr_mux_clks=09=09=3D ARRAY_SIZE(apm_mux_clks),
+=09.div_clks=09=09=3D apm_div_clks,
+=09.nr_div_clks=09=09=3D ARRAY_SIZE(apm_div_clks),
+=09.gate_clks=09=09=3D apm_gate_clks,
+=09.nr_gate_clks=09=09=3D ARRAY_SIZE(apm_gate_clks),
+=09.clk_regs=09=09=3D apm_clk_regs,
+=09.nr_clk_regs=09=09=3D ARRAY_SIZE(apm_clk_regs),
+=09.nr_clk_ids=09=09=3D CLKS_NR_APM,
+};
+
+static void __init exynos9610_cmu_apm_init(struct device_node *np)
+{
+=09exynos_arm64_register_cmu(NULL, np, &apm_cmu_info);
+}
+
+// Register APM early, as it's a dependency of CMU_CMGP
+CLK_OF_DECLARE(exynos9610_cmu_apm, "samsung,exynos9610-cmu-apm",
+=09       exynos9610_cmu_apm_init);
+
+/* CMU_CAM */
+#define PLL_CON0_MUX_CLKCMU_CAM_BUS_USER=09=09=090x0100
+#define PLL_CON2_MUX_CLKCMU_CAM_BUS_USER=09=09=090x0108
+#define CLK_CON_DIV_DIV_CLK_CAM_BUSP=09=09=09=090x1800
+#define CLK_CON_GAT_CLK_CAM_CMU_PCLK=09=09=09=090x2000
+#define CLK_CON_GAT_CLK_CAM_OSCCLK_CLK=09=09=09=090x2004
+#define CLK_CON_GAT_GOUT_CAM_BUSD=09=09=09=090x2008
+#define CLK_CON_GAT_GOUT_CAM_BTM_ACLK=09=09=09=090x200c
+#define CLK_CON_GAT_GOUT_CAM_BTM_PCLK=09=09=09=090x2010
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_3AA=09=09=090x2014
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS0=09=090x2018
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS1=09=090x201c
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS2=09=090x2020
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS3=09=090x2024
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_DMA=09=09=090x2028
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS0=09=090x202c
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS1=09=090x2030
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS2=09=090x2034
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS3=09=090x2038
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_PAFSTAT_CORE=09=090x203c
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_PPMU_CAM=09=090x2040
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_RDMA=09=09=090x2044
+// #define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_SMMU_CAM=09=090x2048
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_XIU_D_CAM=09=090x204c
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM0=090x2050
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM1=090x2054
+#define CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PPMU_CAM=09=090x2058
+#define CLK_CON_GAT_GOUT_CAM_LHM_AXI_P_CLK=09=09=090x205c
+#define CLK_CON_GAT_GOUT_CAM_LHS_ACEL_D_CLK=09=09=090x2060
+#define CLK_CON_GAT_GOUT_CAM_LHS_ATB_CAMISP_CLK=09=09=090x2064
+#define CLK_CON_GAT_GOUT_CAM_BUSD_CLK=09=09=09=090x2068
+#define CLK_CON_GAT_GOUT_CAM_BUSP_CLK=09=09=09=090x206c
+#define CLK_CON_GAT_GOUT_CAM_SYSREG_PCLK=09=09=090x2070
+
+static const unsigned long cam_clk_regs[] __initconst =3D {
+=09PLL_CON0_MUX_CLKCMU_CAM_BUS_USER,
+=09PLL_CON2_MUX_CLKCMU_CAM_BUS_USER,
+=09CLK_CON_DIV_DIV_CLK_CAM_BUSP,
+=09CLK_CON_GAT_CLK_CAM_CMU_PCLK,
+=09CLK_CON_GAT_CLK_CAM_OSCCLK_CLK,
+=09CLK_CON_GAT_GOUT_CAM_BUSD,
+=09CLK_CON_GAT_GOUT_CAM_BTM_ACLK,
+=09CLK_CON_GAT_GOUT_CAM_BTM_PCLK,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_3AA,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS0,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS1,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS2,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS3,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_DMA,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS0,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS1,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS2,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS3,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_PAFSTAT_CORE,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_PPMU_CAM,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_RDMA,
+=09// CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_SMMU_CAM,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_XIU_D_CAM,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM0,
+=09CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PPMU_CAM,
+=09CLK_CON_GAT_GOUT_CAM_LHM_AXI_P_CLK,
+=09CLK_CON_GAT_GOUT_CAM_LHS_ATB_CAMISP_CLK,
+=09CLK_CON_GAT_GOUT_CAM_BUSD_CLK,
+=09CLK_CON_GAT_GOUT_CAM_BUSP_CLK,
+=09CLK_CON_GAT_GOUT_CAM_SYSREG_PCLK,
+};
+
+PNAME(mout_pll_cam_bus_user_p) =3D { "oscclk", "dout_cmu_cam_bus" };
+
+static const struct samsung_mux_clock cam_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_PLL_CAM_BUS_USER, "mout_pll_cam_bus_user", mout_pll_cam_bu=
s_user_p,
+=09    PLL_CON0_MUX_CLKCMU_CAM_BUS_USER, 4, 1),
+};
+
+static const struct samsung_div_clock cam_div_clks[] __initconst =3D {
+=09DIV(CLK_DIV_CLK_CAM_BUSP, "dout_clk_cam_busp", "mout_pll_cam_bus_user",
+=09    CLK_CON_DIV_DIV_CLK_CAM_BUSP, 0, 2),
+};
+
+static const struct samsung_gate_clock cam_gate_clks[] __initconst =3D {
+=09GATE(CLK_GAT_CLK_CAM_CMU_PCLK, "gat_clk_cam_cmu_pclk", "dout_clk_cam_bu=
sp",
+=09     CLK_CON_GAT_CLK_CAM_CMU_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GAT_CLK_CAM_OSCCLK_CLK, "gat_clk_cam_oscclk_clk", "oscclk",
+=09     CLK_CON_GAT_CLK_CAM_OSCCLK_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_BUSD, "gout_cam_busd", "mout_pll_cam_bus_user",
+=09     CLK_CON_GAT_GOUT_CAM_BUSD, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_BTM_ACLK, "gout_cam_btm_aclk", "mout_pll_cam_bus_user=
",
+=09     CLK_CON_GAT_GOUT_CAM_BTM_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_BTM_PCLK, "gout_cam_btm_pclk", "dout_clk_cam_busp",
+=09     CLK_CON_GAT_GOUT_CAM_BTM_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+
+=09GATE(CLK_GOUT_CAM_LHS_ATB_CAMISP_CLK, "gout_cam_lhs_atb_camisp_clk",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_LHS_ATB_CAMISP_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_3AA, "gout_cam_is6p10p0_aclk_3aa",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_3AA,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS0, "gout_cam_is6p10p0_aclk_csis0",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS0,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS1, "gout_cam_is6p10p0_aclk_csis1",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS1,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS2, "gout_cam_is6p10p0_aclk_csis2",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS2,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS3, "gout_cam_is6p10p0_aclk_csis3",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_CSIS3,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_RDMA, "gout_cam_is6p10p0_aclk_rdma",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_RDMA,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS0, "gout_cam_is6p10p0_aclk_glu=
e_csis0",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_C=
SIS0,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS1, "gout_cam_is6p10p0_aclk_glu=
e_csis1",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_C=
SIS1,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS2, "gout_cam_is6p10p0_aclk_glu=
e_csis2",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_C=
SIS2,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS3, "gout_cam_is6p10p0_aclk_glu=
e_csis3",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_GLUE_C=
SIS3,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_PAFSTAT_CORE, "gout_cam_is6p10p0_aclk_p=
afstat_core",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_PAFSTA=
T_CORE,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_PPMU_CAM, "gout_cam_is6p10p0_aclk_ppmu_=
cam",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_PPMU_C=
AM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_DMA, "gout_cam_is6p10p0_aclk_dma",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_DMA,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09// GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_SMMU_CAM, "gout_cam_is6p10p0_aclk_sm=
mu_cam",
+=09//      "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_SMM=
U_CAM,
+=09//      21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_ACLK_XIU_D_CAM, "gout_cam_is6p10p0_aclk_xiu_=
d_cam",
+=09     "mout_pll_cam_bus_user", CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_XIU_D_=
CAM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM0, "gout_cam_is6p10p0_pclk=
_pgen_lite_cam0",
+=09     "dout_clk_cam_busp", CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_=
CAM0,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM1, "gout_cam_is6p10p0_pclk=
_pgen_lite_cam1",
+=09     "dout_clk_cam_busp", CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_=
CAM1,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_IS6P10P0_PCLK_PPMU_CAM, "gout_cam_is6p10p0_pclk_ppmu_=
cam",
+=09     "dout_clk_cam_busp", CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PPMU_CAM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_LHM_AXI_P_CLK, "gout_cam_lhm_axi_p_clk", "dout_clk_ca=
m_busp",
+=09     CLK_CON_GAT_GOUT_CAM_LHM_AXI_P_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_LHS_ACEL_D_CLK, "gout_cam_lhs_acel_d_clk", "mout_pll_=
cam_bus_user",
+=09     CLK_CON_GAT_GOUT_CAM_LHS_ACEL_D_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_BUSD_CLK, "gout_cam_busd_clk", "mout_pll_cam_bus_user=
",
+=09     CLK_CON_GAT_GOUT_CAM_BUSD_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_BUSP_CLK, "gout_cam_busp_clk", "dout_clk_cam_busp",
+=09     CLK_CON_GAT_GOUT_CAM_BUSP_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CAM_SYSREG_PCLK, "gout_cam_sysreg_pclk", "dout_clk_cam_bu=
sp",
+=09     CLK_CON_GAT_GOUT_CAM_SYSREG_PCLK, 21, 0, 0),
+};
+
+static const struct samsung_cmu_info cam_cmu_info __initconst =3D {
+=09.mux_clks=09=09=3D cam_mux_clks,
+=09.nr_mux_clks=09=09=3D ARRAY_SIZE(cam_mux_clks),
+=09.div_clks=09=09=3D cam_div_clks,
+=09.nr_div_clks=09=09=3D ARRAY_SIZE(cam_div_clks),
+=09.gate_clks=09=09=3D cam_gate_clks,
+=09.nr_gate_clks=09=09=3D ARRAY_SIZE(cam_gate_clks),
+=09.clk_regs=09=09=3D cam_clk_regs,
+=09.nr_clk_regs=09=09=3D ARRAY_SIZE(cam_clk_regs),
+=09.nr_clk_ids=09=09=3D CLKS_NR_CAM,
+};
+
+/* CMU_CMGP */
+#define CLK_CON_MUX_MUX_CLK_CMGP_ADC=09=09=090x1000
+#define CLK_CON_MUX_MUX_CLK_CMGP_I2C=09=09=090x1004
+#define CLK_CON_MUX_MUX_CLK_CMGP_USI00=09=09=090x1008
+#define CLK_CON_MUX_MUX_CLK_CMGP_USI01=09=09=090x100c
+#define CLK_CON_MUX_MUX_CLK_CMGP_USI02=09=09=090x1010
+#define CLK_CON_MUX_MUX_CLK_CMGP_USI03=09=09=090x1014
+#define CLK_CON_MUX_MUX_CLK_CMGP_USI04=09=09=090x1018
+#define CLK_CON_DIV_DIV_CLK_CMGP_ADC=09=09=090x1800
+#define CLK_CON_DIV_DIV_CLK_CMGP_I2C=09=09=090x1804
+#define CLK_CON_DIV_DIV_CLK_CMGP_USI00=09=09=090x1808
+#define CLK_CON_DIV_DIV_CLK_CMGP_USI01=09=09=090x180c
+#define CLK_CON_DIV_DIV_CLK_CMGP_USI02=09=09=090x1810
+#define CLK_CON_DIV_DIV_CLK_CMGP_USI03=09=09=090x1814
+#define CLK_CON_DIV_DIV_CLK_CMGP_USI04=09=09=090x1818
+#define CLK_CON_GAT_CMGP_CMU_PCLK=09=09=090x2004
+#define CLK_CON_GAT_CLK_CMGP_OSCCLK_RCO_CLK=09=090x2008
+#define CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S0=09=090x200c
+#define CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1=09=090x2010
+#define CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK=09=09=090x2014
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CMGP00_IPCLK=09=090x2018
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CMGP00_PCLK=09=090x201c
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CMGP01_IPCLK=09=090x2020
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CMGP01_PCLK=09=090x2024
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CMGP02_IPCLK=09=090x2028
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CMGP02_PCLK=09=090x202c
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CMGP03_IPCLK=09=090x2030
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CMGP03_PCLK=09=090x2034
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CMGP04_IPCLK=09=090x2038
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CMGP04_PCLK=09=090x203c
+#define CLK_CON_GAT_GOUT_CMGP_BUS_CLK=09=09=090x2040
+#define CLK_CON_GAT_GOUT_CMGP_I2C_CLK=09=09=090x2044
+#define CLK_CON_GAT_GOUT_CMGP_USI00_CLK=09=09=090x2048
+#define CLK_CON_GAT_GOUT_CMGP_USI01_CLK=09=09=090x204c
+#define CLK_CON_GAT_GOUT_CMGP_USI02_CLK=09=09=090x2050
+#define CLK_CON_GAT_GOUT_CMGP_USI03_CLK=09=09=090x2054
+#define CLK_CON_GAT_GOUT_CMGP_USI04_CLK=09=09=090x2058
+#define CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2CP_PCLK=090x205c
+#define CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2GNSS_PCLK=090x2060
+#define CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2PMU_AP_PCLK=090x2064
+#define CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2PMU_SHUB_PCLK=090x2068
+#define CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2SHUB_PCLK=090x206c
+#define CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2WLBT_PCLK=090x2070
+#define CLK_CON_GAT_GOUT_CMGP_SYSREG_PCLK=09=090x2074
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP00_IPCLK=09=090x2078
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP00_PCLK=09=090x207c
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP01_IPCLK=09=090x2080
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP01_PCLK=09=090x2084
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP02_IPCLK=09=090x2088
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP02_PCLK=09=090x208c
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP03_IPCLK=09=090x2090
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP03_PCLK=09=090x2094
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP04_IPCLK=09=090x2098
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP04_PCLK=09=090x209c
+
+static const unsigned long cmgp_clk_regs[] __initconst =3D {
+=09CLK_CON_MUX_MUX_CLK_CMGP_ADC,
+=09CLK_CON_MUX_MUX_CLK_CMGP_I2C,
+=09CLK_CON_MUX_MUX_CLK_CMGP_USI00,
+=09CLK_CON_MUX_MUX_CLK_CMGP_USI01,
+=09CLK_CON_MUX_MUX_CLK_CMGP_USI02,
+=09CLK_CON_MUX_MUX_CLK_CMGP_USI03,
+=09CLK_CON_MUX_MUX_CLK_CMGP_USI04,
+=09CLK_CON_DIV_DIV_CLK_CMGP_ADC,
+=09CLK_CON_DIV_DIV_CLK_CMGP_I2C,
+=09CLK_CON_DIV_DIV_CLK_CMGP_USI00,
+=09CLK_CON_DIV_DIV_CLK_CMGP_USI01,
+=09CLK_CON_DIV_DIV_CLK_CMGP_USI02,
+=09CLK_CON_DIV_DIV_CLK_CMGP_USI03,
+=09CLK_CON_DIV_DIV_CLK_CMGP_USI04,
+=09CLK_CON_GAT_CMGP_CMU_PCLK,
+=09CLK_CON_GAT_CLK_CMGP_OSCCLK_RCO_CLK,
+=09CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S0,
+=09CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1,
+=09CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CMGP00_IPCLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CMGP00_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CMGP01_IPCLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CMGP01_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CMGP02_IPCLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CMGP02_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CMGP03_IPCLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CMGP03_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CMGP04_IPCLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CMGP04_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_BUS_CLK,
+=09CLK_CON_GAT_GOUT_CMGP_I2C_CLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI00_CLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI01_CLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI02_CLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI03_CLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI04_CLK,
+=09CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2CP_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2GNSS_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2PMU_AP_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2PMU_SHUB_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2SHUB_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2WLBT_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_SYSREG_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI_CMGP00_IPCLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI_CMGP00_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI_CMGP01_IPCLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI_CMGP01_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI_CMGP02_IPCLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI_CMGP02_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI_CMGP03_IPCLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI_CMGP03_PCLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI_CMGP04_IPCLK,
+=09CLK_CON_GAT_GOUT_CMGP_USI_CMGP04_PCLK,
+};
+
+PNAME(mout_clk_cmgp_adc_p)=09=3D { "oscclk", "dout_clk_cmgp_adc" };
+PNAME(mout_clk_cmgp_i2c_p)=09=3D { "oscclk_rco",
+=09=09=09=09    "gout_cmu_cmgp_bus" };
+PNAME(mout_clk_cmgp_usi00_p)=09=3D { "oscclk_rco",
+=09=09=09=09    "gout_cmu_cmgp_bus" };
+PNAME(mout_clk_cmgp_usi01_p)=09=3D { "oscclk_rco",
+=09=09=09=09    "gout_cmu_cmgp_bus" };
+PNAME(mout_clk_cmgp_usi02_p)=09=3D { "oscclk_rco",
+=09=09=09=09    "gout_cmu_cmgp_bus" };
+PNAME(mout_clk_cmgp_usi03_p)=09=3D { "oscclk_rco",
+=09=09=09=09    "gout_cmu_cmgp_bus" };
+PNAME(mout_clk_cmgp_usi04_p)=09=3D { "oscclk_rco",
+=09=09=09=09    "gout_cmu_cmgp_bus" };
+
+static const struct samsung_mux_clock cmgp_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_CLK_CMGP_ADC, "mout_clk_cmgp_adc", mout_clk_cmgp_adc_p,
+=09    CLK_CON_MUX_MUX_CLK_CMGP_ADC, 0, 1),
+=09MUX(CLK_MOUT_CLK_CMGP_I2C, "mout_clk_cmgp_i2c", mout_clk_cmgp_i2c_p,
+=09    CLK_CON_MUX_MUX_CLK_CMGP_I2C, 0, 1),
+=09MUX(CLK_MOUT_CLK_CMGP_USI00, "mout_clk_cmgp_usi00", mout_clk_cmgp_usi00=
_p,
+=09    CLK_CON_MUX_MUX_CLK_CMGP_USI00, 0, 1),
+=09MUX(CLK_MOUT_CLK_CMGP_USI01, "mout_clk_cmgp_usi01", mout_clk_cmgp_usi01=
_p,
+=09    CLK_CON_MUX_MUX_CLK_CMGP_USI01, 0, 1),
+=09MUX(CLK_MOUT_CLK_CMGP_USI02, "mout_clk_cmgp_usi02", mout_clk_cmgp_usi02=
_p,
+=09    CLK_CON_MUX_MUX_CLK_CMGP_USI02, 0, 1),
+=09MUX(CLK_MOUT_CLK_CMGP_USI03, "mout_clk_cmgp_usi03", mout_clk_cmgp_usi03=
_p,
+=09    CLK_CON_MUX_MUX_CLK_CMGP_USI03, 0, 1),
+=09MUX(CLK_MOUT_CLK_CMGP_USI04, "mout_clk_cmgp_usi04", mout_clk_cmgp_usi04=
_p,
+=09    CLK_CON_MUX_MUX_CLK_CMGP_USI04, 0, 1),
+};
+
+static const struct samsung_div_clock cmgp_div_clks[] __initconst =3D {
+=09DIV(CLK_DOUT_CLK_CMGP_ADC, "dout_clk_cmgp_adc", "gout_cmu_cmgp_bus",
+=09    CLK_CON_DIV_DIV_CLK_CMGP_ADC, 0, 4),
+=09DIV(CLK_DOUT_CLK_CMGP_I2C, "dout_clk_cmgp_i2c", "mout_clk_cmgp_i2c",
+=09    CLK_CON_DIV_DIV_CLK_CMGP_I2C, 0, 4),
+=09DIV(CLK_DOUT_CLK_CMGP_USI00, "dout_clk_cmgp_usi00", "mout_clk_cmgp_usi0=
0",
+=09    CLK_CON_DIV_DIV_CLK_CMGP_USI00, 0, 4),
+=09DIV(CLK_DOUT_CLK_CMGP_USI01, "dout_clk_cmgp_usi01", "mout_clk_cmgp_usi0=
1",
+=09    CLK_CON_DIV_DIV_CLK_CMGP_USI01, 0, 4),
+=09DIV(CLK_DOUT_CLK_CMGP_USI02, "dout_clk_cmgp_usi02", "mout_clk_cmgp_usi0=
2",
+=09    CLK_CON_DIV_DIV_CLK_CMGP_USI02, 0, 4),
+=09DIV(CLK_DOUT_CLK_CMGP_USI03, "dout_clk_cmgp_usi03", "mout_clk_cmgp_usi0=
3",
+=09    CLK_CON_DIV_DIV_CLK_CMGP_USI03, 0, 4),
+=09DIV(CLK_DOUT_CLK_CMGP_USI04, "dout_clk_cmgp_usi04", "mout_clk_cmgp_usi0=
4",
+=09    CLK_CON_DIV_DIV_CLK_CMGP_USI04, 0, 4),
+};
+
+static const struct samsung_gate_clock cmgp_gate_clks[] __initconst =3D {
+=09GATE(CLK_GOUT_CMGP_CMU_PCLK, "gout_cmgp_cmu_pclk", "gout_cmu_cmgp_bus",
+=09     CLK_CON_GAT_CMGP_CMU_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_CMGP_OSCCLK_RCO_CLK, "gout_clk_cmgp_oscclk_rco_clk",
+=09     "oscclk_rco", CLK_CON_GAT_CLK_CMGP_OSCCLK_RCO_CLK, 21, CLK_IGNORE_=
UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_ADC_PCLK_S0, "gout_clk_cmgp_adc_pclk_s0",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S0,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_ADC_PCLK_S1, "gout_clk_cmgp_adc_pclk_s1",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_GPIO_PCLK, "gout_clk_cmgp_gpio_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CMGP00_IPCLK, "gout_clk_cmgp_i2c_cmgp00_ipclk",
+=09     "mout_clk_cmgp_i2c", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP00_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CMGP00_PCLK, "gout_clk_cmgp_i2c_cmgp00_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP00_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CMGP01_IPCLK, "gout_clk_cmgp_i2c_cmgp01_ipclk",
+=09     "mout_clk_cmgp_i2c", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP01_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CMGP01_PCLK, "gout_clk_cmgp_i2c_cmgp01_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP01_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CMGP02_IPCLK, "gout_clk_cmgp_i2c_cmgp02_ipclk",
+=09     "mout_clk_cmgp_i2c", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP02_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CMGP02_PCLK, "gout_clk_cmgp_i2c_cmgp02_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP02_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CMGP03_IPCLK, "gout_clk_cmgp_i2c_cmgp03_ipclk",
+=09     "mout_clk_cmgp_i2c", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP03_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CMGP03_PCLK, "gout_clk_cmgp_i2c_cmgp03_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP03_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CMGP04_IPCLK, "gout_clk_cmgp_i2c_cmgp04_ipclk",
+=09     "mout_clk_cmgp_i2c", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP04_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CMGP04_PCLK, "gout_clk_cmgp_i2c_cmgp04_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP04_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_BUS_CLK, "gout_cmgp_bus_clk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_BUS_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_I2C_CLK, "gout_cmgp_i2c_clk",
+=09     "dout_clk_cmgp_i2c", CLK_CON_GAT_GOUT_CMGP_I2C_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI00_CLK, "gout_cmgp_usi00_clk",
+=09     "mout_clk_cmgp_usi00", CLK_CON_GAT_GOUT_CMGP_USI00_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI01_CLK, "gout_cmgp_usi01_clk",
+=09     "mout_clk_cmgp_usi01", CLK_CON_GAT_GOUT_CMGP_USI01_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI02_CLK, "gout_cmgp_usi02_clk",
+=09     "mout_clk_cmgp_usi02", CLK_CON_GAT_GOUT_CMGP_USI02_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI03_CLK, "gout_cmgp_usi03_clk",
+=09     "mout_clk_cmgp_usi03", CLK_CON_GAT_GOUT_CMGP_USI03_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI04_CLK, "gout_cmgp_usi04_clk",
+=09     "mout_clk_cmgp_usi04", CLK_CON_GAT_GOUT_CMGP_USI04_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_SYSREG_CMGP2CP_PCLK,
+=09     "gout_cmgp_sysreg_cmgp2cp_pclk", "gout_cmu_cmgp_bus",
+=09     CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2CP_PCLK, 21, CLK_IGNORE_UNUSED, =
0),
+=09GATE(CLK_GOUT_CMGP_SYSREG_CMGP2GNSS_PCLK,
+=09     "gout_cmgp_sysreg_cmgp2gnss_pclk", "gout_cmu_cmgp_bus",
+=09     CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2GNSS_PCLK, 21, CLK_IGNORE_UNUSED=
, 0),
+=09GATE(CLK_GOUT_CMGP_SYSREG_CMGP2PMU_AP_PCLK,
+=09     "gout_cmgp_sysreg_cmgp2pmu_ap_pclk", "gout_cmu_cmgp_bus",
+=09     CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2PMU_AP_PCLK, 21, CLK_IGNORE_UNUS=
ED, 0),
+=09GATE(CLK_GOUT_CMGP_SYSREG_CMGP2PMU_SHUB_PCLK,
+=09     "gout_cmgp_sysreg_cmgp2pmu_shub_pclk", "gout_cmu_cmgp_bus",
+=09     CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2PMU_SHUB_PCLK, 21, CLK_IGNORE_UN=
USED, 0),
+=09GATE(CLK_GOUT_CMGP_SYSREG_CMGP2SHUB_PCLK,
+=09     "gout_cmgp_sysreg_cmgp2shub_pclk", "gout_cmu_cmgp_bus",
+=09     CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2SHUB_PCLK, 21, CLK_IGNORE_UNUSED=
, 0),
+=09GATE(CLK_GOUT_CMGP_SYSREG_CMGP2WLBT_PCLK,
+=09     "gout_cmgp_sysreg_cmgp2wlbt_pclk", "gout_cmu_cmgp_bus",
+=09     CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP2WLBT_PCLK, 21, CLK_IGNORE_UNUSED=
, 0),
+=09GATE(CLK_GOUT_CMGP_SYSREG_PCLK, "gout_cmgp_sysreg_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_SYSREG_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI_CMGP00_IPCLK, "gout_clk_cmgp_usi_cmgp00_ipclk",
+=09     "mout_clk_cmgp_usi00", CLK_CON_GAT_GOUT_CMGP_USI_CMGP00_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI_CMGP00_PCLK, "gout_clk_cmgp_usi_cmgp00_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_USI_CMGP00_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI_CMGP01_IPCLK, "gout_clk_cmgp_usi_cmgp01_ipclk",
+=09     "mout_clk_cmgp_usi01", CLK_CON_GAT_GOUT_CMGP_USI_CMGP01_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI_CMGP01_PCLK, "gout_clk_cmgp_usi_cmgp01_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_USI_CMGP01_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI_CMGP02_IPCLK, "gout_clk_cmgp_usi_cmgp02_ipclk",
+=09     "mout_clk_cmgp_usi02", CLK_CON_GAT_GOUT_CMGP_USI_CMGP02_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI_CMGP02_PCLK, "gout_clk_cmgp_usi_cmgp02_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_USI_CMGP02_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI_CMGP03_IPCLK, "gout_clk_cmgp_usi_cmgp03_ipclk",
+=09     "mout_clk_cmgp_usi03", CLK_CON_GAT_GOUT_CMGP_USI_CMGP03_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI_CMGP03_PCLK, "gout_clk_cmgp_usi_cmgp03_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_USI_CMGP03_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI_CMGP04_IPCLK, "gout_clk_cmgp_usi_cmgp04_ipclk",
+=09     "mout_clk_cmgp_usi04", CLK_CON_GAT_GOUT_CMGP_USI_CMGP04_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CMGP_USI_CMGP04_PCLK, "gout_clk_cmgp_usi_cmgp04_pclk",
+=09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_USI_CMGP04_IPCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info cmgp_cmu_info __initconst =3D {
+=09.mux_clks=09=09=3D cmgp_mux_clks,
+=09.nr_mux_clks=09=09=3D ARRAY_SIZE(cmgp_mux_clks),
+=09.div_clks=09=09=3D cmgp_div_clks,
+=09.nr_div_clks=09=09=3D ARRAY_SIZE(cmgp_div_clks),
+=09.gate_clks=09=09=3D cmgp_gate_clks,
+=09.nr_gate_clks=09=09=3D ARRAY_SIZE(cmgp_gate_clks),
+=09.clk_regs=09=09=3D cmgp_clk_regs,
+=09.nr_clk_regs=09=09=3D ARRAY_SIZE(cmgp_clk_regs),
+=09.nr_clk_ids=09=09=3D CLKS_NR_CMGP,
+};
+
+/* CMU_CORE */
+#define PLL_CON0_MUX_CLKCMU_CORE_BUS_USER=09=09=090x0100
+#define PLL_CON2_MUX_CLKCMU_CORE_BUS_USER=09=09=090x0108
+#define PLL_CON0_MUX_CLKCMU_CORE_CCI_USER=09=09=090x0120
+#define PLL_CON2_MUX_CLKCMU_CORE_CCI_USER=09=09=090x0128
+#define PLL_CON0_MUX_CLKCMU_CORE_G3D_USER=09=09=090x0140
+#define PLL_CON2_MUX_CLKCMU_CORE_G3D_USER=09=09=090x0148
+#define CLK_CON_MUX_MUX_CLK_CORE_GIC=09=09=09=090x1000
+#define CLK_CON_DIV_DIV_CLK_CORE_BUSP=09=09=09=090x1800
+#define CLK_CON_GAT_CLK_CORE_CMU_PCLK=09=09=09=090x2000
+#define CLK_CON_GAT_GOUT_CORE_AD_APB_CCI_550_PCLKM=09=090x2004
+#define CLK_CON_GAT_GOUT_CORE_AD_APB_DIT_PCLKM=09=09=090x2008
+#define CLK_CON_GAT_GOUT_CORE_AD_APB_PDMA0_PCLKM=09=090x200c
+#define CLK_CON_GAT_GOUT_CORE_AD_APB_PGEN_PDMA_PCLKM=09=090x2010
+#define CLK_CON_GAT_GOUT_CORE_AD_APB_PPFW_MEM0_PCLKM=09=090x2014
+#define CLK_CON_GAT_GOUT_CORE_AD_APB_PPFW_MEM1_PCLKM=09=090x2018
+#define CLK_CON_GAT_GOUT_CORE_AD_APB_PPFW_PERI_PCLKM=09=090x201c
+#define CLK_CON_GAT_GOUT_CORE_AD_APB_SPDMA_PCLKM=09=090x2020
+#define CLK_CON_GAT_GOUT_CORE_AD_AXI_GIC_ACLKM=09=09=090x2024
+#define CLK_CON_GAT_GOUT_CORE_ASYNCSFR_WR_DMC0_PCLK=09=090x2028
+#define CLK_CON_GAT_GOUT_CORE_ASYNCSFR_WR_DMC1_PCLK=09=090x202c
+#define CLK_CON_GAT_GOUT_CORE_AXI_US_A40_64TO128_DIT_ACLK=090x2030
+#define CLK_CON_GAT_GOUT_CORE_BAAW_P_GNSS_PCLK=09=09=090x2034
+#define CLK_CON_GAT_GOUT_CORE_BAAW_P_MODEM_PCLK=09=09=090x2038
+#define CLK_CON_GAT_GOUT_CORE_BAAW_P_SHUB_PCLK=09=09=090x203c
+#define CLK_CON_GAT_GOUT_CORE_BAAW_P_WLBT_PCLK=09=09=090x2040
+#define CLK_CON_GAT_GOUT_CORE_CCI_550_ACLK=09=09=090x2044
+#define CLK_CON_GAT_GOUT_CORE_DIT_ICLKL2A=09=09=090x2048
+#define CLK_CON_GAT_GOUT_CORE_GIC400_AIHWACG_CLK=09=090x204c
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D0_ISP_CLK=09=090x2050
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D0_MFC_CLK=09=090x2054
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D1_ISP_CLK=09=090x2058
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D1_MFC_CLK=09=090x205c
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_CAM_CLK=09=090x2060
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_DPU_CLK=09=090x2064
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_FSYS_CLK=09=090x2068
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_G2D_CLK=09=090x206c
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_USB_CLK=09=090x2070
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_VIPX1_CLK=09=090x2074
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_VIPX2_CLK=09=090x2078
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACE_D_CPUCL0_CLK=09=090x207c
+#define CLK_CON_GAT_GOUT_CORE_LHM_ACE_D_CPUCL1_CLK=09=090x2080
+#define CLK_CON_GAT_GOUT_CORE_LHM_AXI_D0_MODEM_CLK=09=090x2084
+#define CLK_CON_GAT_GOUT_CORE_LHM_AXI_D1_MODEM_CLK=09=090x2088
+#define CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_ABOX_CLK=09=090x208c
+#define CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_APM_CLK=09=09=090x2090
+#define CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_CSSYS_CLK=09=090x2094
+#define CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_G3D_CLK=09=09=090x2098
+#define CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_GNSS_CLK=09=090x209c
+#define CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_SHUB_CLK=09=090x20a0
+#define CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_WLBT_CLK=09=090x20a4
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_CPU_CLK=09=090x20a8
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_CP_CLK=09=090x20ac
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_NRT_CLK=09=090x20b0
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_RT_CLK=09=090x20b4
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_CPU_CLK=09=090x20b8
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_CP_CLK=09=090x20bc
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_NRT_CLK=09=090x20c0
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_RT_CLK=09=090x20c4
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_APM_CLK=09=09=090x20c8
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_CAM_CLK=09=09=090x20cc
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_CPUCL0_CLK=09=090x20d0
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_CPUCL1_CLK=09=090x20d4
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_DISPAUD_CLK=09=090x20d8
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_FSYS_CLK=09=090x20dc
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_G2D_CLK=09=09=090x20e0
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_G3D_CLK=09=09=090x20e4
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_GNSS_CLK=09=090x20e8
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_ISP_CLK=09=09=090x20ec
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MFC_CLK=09=09=090x20f0
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MIF0_CLK=09=090x20f4
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MIF1_CLK=09=090x20f8
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MODEM_CLK=09=090x20fc
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_PERI_CLK=09=090x2100
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_SHUB_CLK=09=090x2104
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_USB_CLK=09=09=090x2108
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_VIPX1_CLK=09=090x210c
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_VIPX2_CLK=09=090x2110
+#define CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_WLBT_CLK=09=090x2114
+#define CLK_CON_GAT_GOUT_CORE_PDMA_CORE_ACLK_PDMA0=09=090x2118
+#define CLK_CON_GAT_GOUT_CORE_PGEN_LITE_SIREX_CLK=09=090x211c
+#define CLK_CON_GAT_GOUT_CORE_PGEN_PDMA_CLK=09=09=090x2120
+#define CLK_CON_GAT_GOUT_CORE_PPCFW_G3D_ACLK=09=09=090x2124
+#define CLK_CON_GAT_GOUT_CORE_PPCFW_G3D_PCLK=09=09=090x2128
+#define CLK_CON_GAT_GOUT_CORE_PPFW_CORE_MEM0_CLK=09=090x212c
+#define CLK_CON_GAT_GOUT_CORE_PPFW_CORE_MEM1_CLK=09=090x2130
+#define CLK_CON_GAT_GOUT_CORE_PPFW_CORE_PERI_CLK=09=090x2134
+#define CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL0_ACLK=09=090x2138
+#define CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL0_PCLK=09=090x213c
+#define CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL1_ACLK=09=090x2140
+#define CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL1_PCLK=09=090x2144
+#define CLK_CON_GAT_GOUT_CORE_BUSD_CLK=09=09=09=090x2148
+#define CLK_CON_GAT_GOUT_CORE_BUSP_G3D_OCC_CLK=09=09=090x214c
+#define CLK_CON_GAT_GOUT_CORE_BUSP_CLK=09=09=09=090x2150
+#define CLK_CON_GAT_GOUT_CORE_BUSP_OCC_CLK=09=09=090x2154
+#define CLK_CON_GAT_GOUT_CORE_CCI_CLK=09=09=09=090x2158
+#define CLK_CON_GAT_GOUT_CORE_CCI_OCC_CLK=09=09=090x215c
+#define CLK_CON_GAT_GOUT_CORE_G3D_CLK=09=09=09=090x2160
+#define CLK_CON_GAT_GOUT_CORE_G3D_OCC_CLK=09=09=090x2164
+#define CLK_CON_GAT_GOUT_CORE_GIC_CLK=09=09=09=090x2168
+#define CLK_CON_GAT_GOUT_CORE_OSCCLK_CLK=09=09=090x216c
+#define CLK_CON_GAT_GOUT_CORE_SFR_APBIF_CMU_TOPC_PCLK=09=090x2170
+#define CLK_CON_GAT_GOUT_CORE_SIREX_ACLK=09=09=090x2174
+#define CLK_CON_GAT_GOUT_CORE_SIREX_PCLK=09=09=090x2178
+#define CLK_CON_GAT_GOUT_CORE_SPDMA_CORE_ACLK_PDMA1=09=090x217c
+#define CLK_CON_GAT_GOUT_CORE_SYSREG_PCLK=09=09=090x2180
+#define CLK_CON_GAT_GOUT_CORE_TREX_D_ACLK=09=09=090x2184
+#define CLK_CON_GAT_GOUT_CORE_TREX_D_CCLK=09=09=090x2188
+#define CLK_CON_GAT_GOUT_CORE_TREX_D_GCLK=09=09=090x218c
+#define CLK_CON_GAT_GOUT_CORE_TREX_D_PCLK=09=09=090x2190
+#define CLK_CON_GAT_GOUT_CORE_TREX_D_NRT_ACLK=09=09=090x2194
+#define CLK_CON_GAT_GOUT_CORE_TREX_D_NRT_PCLK=09=09=090x2198
+#define CLK_CON_GAT_GOUT_CORE_TREX_P_ACLK_P_CORE=09=090x219c
+#define CLK_CON_GAT_GOUT_CORE_TREX_P_CCLK_P_CORE=09=090x21a0
+#define CLK_CON_GAT_GOUT_CORE_TREX_P_PCLK=09=09=090x21a4
+#define CLK_CON_GAT_GOUT_CORE_TREX_P_PCLK_P_CORE=09=090x21a8
+#define CLK_CON_GAT_GOUT_CORE_XIU_D_ACLK=09=09=090x21ac
+
+static const unsigned long core_clk_regs[] __initconst =3D {
+=09PLL_CON0_MUX_CLKCMU_CORE_BUS_USER,
+=09PLL_CON2_MUX_CLKCMU_CORE_BUS_USER,
+=09PLL_CON0_MUX_CLKCMU_CORE_CCI_USER,
+=09PLL_CON2_MUX_CLKCMU_CORE_CCI_USER,
+=09PLL_CON0_MUX_CLKCMU_CORE_G3D_USER,
+=09PLL_CON2_MUX_CLKCMU_CORE_G3D_USER,
+=09CLK_CON_MUX_MUX_CLK_CORE_GIC,
+=09CLK_CON_DIV_DIV_CLK_CORE_BUSP,
+=09CLK_CON_GAT_CLK_CORE_CMU_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_AD_APB_CCI_550_PCLKM,
+=09CLK_CON_GAT_GOUT_CORE_AD_APB_DIT_PCLKM,
+=09CLK_CON_GAT_GOUT_CORE_AD_APB_PDMA0_PCLKM,
+=09CLK_CON_GAT_GOUT_CORE_AD_APB_PGEN_PDMA_PCLKM,
+=09CLK_CON_GAT_GOUT_CORE_AD_APB_PPFW_MEM0_PCLKM,
+=09CLK_CON_GAT_GOUT_CORE_AD_APB_PPFW_MEM1_PCLKM,
+=09CLK_CON_GAT_GOUT_CORE_AD_APB_PPFW_PERI_PCLKM,
+=09CLK_CON_GAT_GOUT_CORE_AD_APB_SPDMA_PCLKM,
+=09CLK_CON_GAT_GOUT_CORE_AD_AXI_GIC_ACLKM,
+=09CLK_CON_GAT_GOUT_CORE_ASYNCSFR_WR_DMC0_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_ASYNCSFR_WR_DMC1_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_AXI_US_A40_64TO128_DIT_ACLK,
+=09CLK_CON_GAT_GOUT_CORE_BAAW_P_GNSS_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_BAAW_P_MODEM_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_BAAW_P_SHUB_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_BAAW_P_WLBT_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_CCI_550_ACLK,
+=09CLK_CON_GAT_GOUT_CORE_DIT_ICLKL2A,
+=09CLK_CON_GAT_GOUT_CORE_GIC400_AIHWACG_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D0_ISP_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D0_MFC_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D1_ISP_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D1_MFC_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_CAM_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_DPU_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_FSYS_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_G2D_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_USB_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_VIPX1_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_VIPX2_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACE_D_CPUCL0_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_ACE_D_CPUCL1_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_AXI_D0_MODEM_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_AXI_D1_MODEM_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_ABOX_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_APM_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_CSSYS_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_G3D_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_GNSS_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_SHUB_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_WLBT_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_CPU_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_CP_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_NRT_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_RT_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_CPU_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_CP_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_NRT_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_RT_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_APM_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_CAM_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_CPUCL0_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_CPUCL1_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_DISPAUD_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_FSYS_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_G2D_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_G3D_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_GNSS_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_ISP_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MFC_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MIF0_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MIF1_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MODEM_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_PERI_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_SHUB_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_USB_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_VIPX1_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_VIPX2_CLK,
+=09CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_WLBT_CLK,
+=09CLK_CON_GAT_GOUT_CORE_PDMA_CORE_ACLK_PDMA0,
+=09CLK_CON_GAT_GOUT_CORE_PGEN_LITE_SIREX_CLK,
+=09CLK_CON_GAT_GOUT_CORE_PGEN_PDMA_CLK,
+=09CLK_CON_GAT_GOUT_CORE_PPCFW_G3D_ACLK,
+=09CLK_CON_GAT_GOUT_CORE_PPCFW_G3D_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_PPFW_CORE_MEM0_CLK,
+=09CLK_CON_GAT_GOUT_CORE_PPFW_CORE_MEM1_CLK,
+=09CLK_CON_GAT_GOUT_CORE_PPFW_CORE_PERI_CLK,
+=09CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL0_ACLK,
+=09CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL0_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL1_ACLK,
+=09CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL1_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_BUSD_CLK,
+=09CLK_CON_GAT_GOUT_CORE_BUSP_G3D_OCC_CLK,
+=09CLK_CON_GAT_GOUT_CORE_BUSP_CLK,
+=09CLK_CON_GAT_GOUT_CORE_BUSP_OCC_CLK,
+=09CLK_CON_GAT_GOUT_CORE_CCI_CLK,
+=09CLK_CON_GAT_GOUT_CORE_CCI_OCC_CLK,
+=09CLK_CON_GAT_GOUT_CORE_G3D_CLK,
+=09CLK_CON_GAT_GOUT_CORE_G3D_OCC_CLK,
+=09CLK_CON_GAT_GOUT_CORE_GIC_CLK,
+=09CLK_CON_GAT_GOUT_CORE_OSCCLK_CLK,
+=09CLK_CON_GAT_GOUT_CORE_SFR_APBIF_CMU_TOPC_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_SIREX_ACLK,
+=09CLK_CON_GAT_GOUT_CORE_SIREX_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_SPDMA_CORE_ACLK_PDMA1,
+=09CLK_CON_GAT_GOUT_CORE_SYSREG_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_TREX_D_ACLK,
+=09CLK_CON_GAT_GOUT_CORE_TREX_D_CCLK,
+=09CLK_CON_GAT_GOUT_CORE_TREX_D_GCLK,
+=09CLK_CON_GAT_GOUT_CORE_TREX_D_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_TREX_D_NRT_ACLK,
+=09CLK_CON_GAT_GOUT_CORE_TREX_D_NRT_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_TREX_P_ACLK_P_CORE,
+=09CLK_CON_GAT_GOUT_CORE_TREX_P_CCLK_P_CORE,
+=09CLK_CON_GAT_GOUT_CORE_TREX_P_PCLK,
+=09CLK_CON_GAT_GOUT_CORE_TREX_P_PCLK_P_CORE,
+=09CLK_CON_GAT_GOUT_CORE_XIU_D_ACLK,
+};
+
+PNAME(mout_pll_core_bus_user_p)=09=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_core_bus" };
+PNAME(mout_pll_core_cci_user_p)=09=3D=09 { "oscclk",
+=09=09=09=09=09    "dout_cmu_core_cci" };
+PNAME(mout_pll_core_g3d_user_p)=09=3D=09 { "oscclk",
+=09=09=09=09=09    "dout_cmu_core_g3d" };
+PNAME(mout_clk_core_gic_p)=09=09=3D { "oscclk",
+=09=09=09=09=09    "dout_clk_core_busp" };
+
+static const struct samsung_mux_clock core_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_PLL_CORE_BUS_USER, "mout_pll_core_bus_user", mout_pll_core=
_bus_user_p,
+=09    PLL_CON0_MUX_CLKCMU_CORE_BUS_USER, 4, 1),
+=09MUX(CLK_MOUT_PLL_CORE_CCI_USER, "mout_pll_core_cci_user", mout_pll_core=
_cci_user_p,
+=09    PLL_CON0_MUX_CLKCMU_CORE_CCI_USER, 4, 1),
+=09MUX(CLK_MOUT_PLL_CORE_G3D_USER, "mout_pll_core_g3d_user", mout_pll_core=
_g3d_user_p,
+=09    PLL_CON0_MUX_CLKCMU_CORE_G3D_USER, 4, 1),
+=09MUX(CLK_MOUT_CLK_CORE_GIC, "mout_clk_core_gic", mout_clk_core_gic_p,
+=09    CLK_CON_MUX_MUX_CLK_CORE_GIC, 0, 1),
+};
+
+static const struct samsung_div_clock core_div_clks[] __initconst =3D {
+=09DIV(CLK_DOUT_CLK_CORE_BUSP, "dout_clk_core_busp", "mout_pll_core_bus_us=
er",
+=09    CLK_CON_DIV_DIV_CLK_CORE_BUSP, 0, 2),
+};
+
+static const struct samsung_gate_clock core_gate_clks[] __initconst =3D {
+=09GATE(CLK_GOUT_CLK_CORE_CMU_PCLK, "gout_clk_core_cmu_pclk", "dout_clk_co=
re_busp",
+=09     CLK_CON_GAT_CLK_CORE_CMU_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_AD_APB_CCI_550_PCLKM, "gout_core_ad_apb_cci_550_pclk=
m",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_AD_APB_CCI_550_PCL=
KM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_AD_APB_DIT_PCLKM, "gout_core_ad_apb_dit_pclkm",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_AD_APB_DIT_PCLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_AD_APB_PDMA0_PCLKM, "gout_core_ad_apb_pdma0_pclkm",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_AD_APB_PDMA0_PCLKM=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_AD_APB_PGEN_PDMA_PCLKM, "gout_core_ad_apb_pgen_pdma_=
pclkm",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_AD_APB_PGEN_PDMA_P=
CLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_AD_APB_PPFW_MEM0_PCLKM, "gout_core_ad_apb_ppfw_mem0_=
pclkm",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_AD_APB_PPFW_MEM0_P=
CLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_AD_APB_PPFW_MEM1_PCLKM, "gout_core_ad_apb_ppfw_mem1_=
pclkm",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_AD_APB_PPFW_MEM1_P=
CLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_AD_APB_PPFW_PERI_PCLKM, "gout_core_ad_apb_ppfw_peri_=
pclkm",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_AD_APB_PPFW_PERI_P=
CLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_AD_APB_SPDMA_PCLKM, "gout_core_ad_apb_spdma_pclkm",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_AD_APB_SPDMA_PCLKM=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_AD_AXI_GIC_ACLKM, "gout_core_ad_axi_gic_aclkm",
+=09     "mout_clk_core_gic", CLK_CON_GAT_GOUT_CORE_AD_AXI_GIC_ACLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_ASYNCSFR_WR_DMC0_PCLK, "gout_core_asyncsfr_wr_dmc0_p=
clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_ASYNCSFR_WR_DMC0_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_ASYNCSFR_WR_DMC1_PCLK, "gout_core_asyncsfr_wr_dmc1_p=
clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_ASYNCSFR_WR_DMC1_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_AXI_US_A40_64TO128_DIT_ACLK,
+=09     "gout_core_axi_us_a40_64to128_dit_aclk", "mout_pll_core_bus_user",
+=09     CLK_CON_GAT_GOUT_CORE_AXI_US_A40_64TO128_DIT_ACLK, 21, CLK_IGNORE_=
UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_BAAW_P_GNSS_PCLK, "gout_core_baaw_p_gnss_pclk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_BAAW_P_GNSS_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_BAAW_P_MODEM_PCLK, "gout_core_baaw_p_modem_pclk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_BAAW_P_MODEM_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_BAAW_P_SHUB_PCLK, "gout_core_baaw_p_shub_pclk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_BAAW_P_SHUB_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_BAAW_P_WLBT_PCLK, "gout_core_baaw_p_wlbt_pclk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_BAAW_P_WLBT_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_CCI_550_ACLK, "gout_core_cci_550_aclk",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_CCI_550_ACLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_DIT_ICLKL2A, "gout_core_dit_iclkl2a",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_DIT_ICLKL2A,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_GIC400_AIHWACG_CLK, "gout_core_gic400_aihwacg_clk",
+=09     "mout_clk_core_gic", CLK_CON_GAT_GOUT_CORE_GIC400_AIHWACG_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D0_ISP_CLK, "gout_core_lhm_acel_d0_isp_clk"=
,
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D0_ISP_CL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D0_MFC_CLK, "gout_core_lhm_acel_d0_mfc_clk"=
,
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D0_MFC_CL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D1_ISP_CLK, "gout_core_lhm_acel_d1_isp_clk"=
,
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D1_ISP_CL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D1_MFC_CLK, "gout_core_lhm_acel_d1_mfc_clk"=
,
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D1_MFC_CL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D_CAM_CLK, "gout_core_lhm_acel_d_cam_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_CAM_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D_DPU_CLK, "gout_core_lhm_acel_d_dpu_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_DPU_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D_FSYS_CLK, "gout_core_lhm_acel_d_fsys_clk"=
,
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_FSYS_CL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D_G2D_CLK, "gout_core_lhm_acel_d_g2d_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_G2D_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D_USB_CLK, "gout_core_lhm_acel_d_usb_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_USB_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D_VIPX1_CLK, "gout_core_lhm_acel_d_vipx1_cl=
k",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_VIPX1_C=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACEL_D_VIPX2_CLK, "gout_core_lhm_acel_d_vipx2_cl=
k",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_ACEL_D_VIPX2_C=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACE_D_CPUCL0_CLK, "gout_core_lhm_ace_d_cpucl0_cl=
k",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_LHM_ACE_D_CPUCL0_C=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_ACE_D_CPUCL1_CLK, "gout_core_lhm_ace_d_cpucl1_cl=
k",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_LHM_ACE_D_CPUCL1_C=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_AXI_D0_MODEM_CLK, "gout_core_lhm_axi_d0_modem_cl=
k",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_AXI_D0_MODEM_C=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_AXI_D1_MODEM_CLK, "gout_core_lhm_axi_d1_modem_cl=
k",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_AXI_D1_MODEM_C=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_AXI_D_ABOX_CLK, "gout_core_lhm_axi_d_abox_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_ABOX_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_AXI_D_APM_CLK, "gout_core_lhm_axi_d_apm_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_APM_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_AXI_D_CSSYS_CLK, "gout_core_lhm_axi_d_cssys_clk"=
,
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_CSSYS_CL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_AXI_D_G3D_CLK, "gout_core_lhm_axi_d_g3d_clk",
+=09     "mout_pll_core_g3d_user", CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_G3D_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_AXI_D_GNSS_CLK, "gout_core_lhm_axi_d_gnss_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_GNSS_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_AXI_D_SHUB_CLK, "gout_core_lhm_axi_d_shub_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_SHUB_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHM_AXI_D_WLBT_CLK, "gout_core_lhm_axi_d_wlbt_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHM_AXI_D_WLBT_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_D0_MIF_CPU_CLK, "gout_core_lhs_axi_d0_mif_cp=
u_clk",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_CPU=
_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_D0_MIF_CP_CLK, "gout_core_lhs_axi_d0_mif_cp_=
clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_CP_=
CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_D0_MIF_NRT_CLK, "gout_core_lhs_axi_d0_mif_nr=
t_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_NRT=
_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_D0_MIF_RT_CLK, "gout_core_lhs_axi_d0_mif_rt_=
clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHS_AXI_D0_MIF_RT_=
CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_D1_MIF_CPU_CLK, "gout_core_lhs_axi_d1_mif_cp=
u_clk",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_CPU=
_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_D1_MIF_CP_CLK, "gout_core_lhs_axi_d1_mif_cp_=
clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_CP_=
CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_D1_MIF_NRT_CLK, "gout_core_lhs_axi_d1_mif_nr=
t_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_NRT=
_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_D1_MIF_RT_CLK, "gout_core_lhs_axi_d1_mif_rt_=
clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_LHS_AXI_D1_MIF_RT_=
CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_APM_CLK, "gout_core_lhs_axi_p_apm_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_APM_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_CAM_CLK, "gout_core_lhs_axi_p_cam_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_CAM_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_CPUCL0_CLK, "gout_core_lhs_axi_p_cpucl0_cl=
k",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_CPUCL0_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_CPUCL1_CLK, "gout_core_lhs_axi_p_cpucl1_cl=
k",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_CPUCL1_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_DISPAUD_CLK, "gout_core_lhs_axi_p_dispaud_=
clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_DISPAUD_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_FSYS_CLK, "gout_core_lhs_axi_p_fsys_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_FSYS_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_G2D_CLK, "gout_core_lhs_axi_p_g2d_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_G2D_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_G3D_CLK, "gout_core_lhs_axi_p_g3d_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_G3D_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_GNSS_CLK, "gout_core_lhs_axi_p_gnss_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_GNSS_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_ISP_CLK, "gout_core_lhs_axi_p_isp_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_ISP_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_MFC_CLK, "gout_core_lhs_axi_p_mfc_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MFC_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_MIF0_CLK, "gout_core_lhs_axi_p_mif0_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MIF0_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_MIF1_CLK, "gout_core_lhs_axi_p_mif1_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MIF1_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_MODEM_CLK, "gout_core_lhs_axi_p_modem_clk"=
,
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_MODEM_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_PERI_CLK, "gout_core_lhs_axi_p_peri_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_PERI_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_SHUB_CLK, "gout_core_lhs_axi_p_shub_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_SHUB_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_USB_CLK, "gout_core_lhs_axi_p_usb_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_USB_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_VIPX1_CLK, "gout_core_lhs_axi_p_vipx1_clk"=
,
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_VIPX1_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_VIPX2_CLK, "gout_core_lhs_axi_p_vipx2_clk"=
,
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_VIPX2_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_LHS_AXI_P_WLBT_CLK, "gout_core_lhs_wlbt_p_apm_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_LHS_AXI_P_WLBT_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PDMA_CORE_ACLK_PDMA0, "gout_core_pdma_core_aclk_pdma=
0",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_PDMA_CORE_ACLK_PDM=
A0,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PGEN_LITE_SIREX_CLK, "gout_core_pgen_lite_sirex_clk"=
,
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_PGEN_LITE_SIREX_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PGEN_PDMA_CLK, "gout_core_pgen_pdma_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_PGEN_PDMA_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PPCFW_G3D_ACLK, "gout_core_ppcfw_g3d_aclk",
+=09     "mout_pll_core_g3d_user", CLK_CON_GAT_GOUT_CORE_PPCFW_G3D_ACLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PPCFW_G3D_PCLK, "gout_core_ppcfw_g3d_pclk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_PPCFW_G3D_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PPFW_CORE_MEM0_CLK, "gout_core_ppfw_core_mem0_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_PPFW_CORE_MEM0_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PPFW_CORE_MEM1_CLK, "gout_core_ppfw_core_mem1_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_PPFW_CORE_MEM1_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PPFW_CORE_PERI_CLK, "gout_core_ppfw_core_peri_clk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_PPFW_CORE_PERI_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PPMU_ACE_CPUCL0_ACLK, "gout_core_ppmu_ace_cpucl0_acl=
k",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL0_AC=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PPMU_ACE_CPUCL0_PCLK, "gout_core_ppmu_ace_cpucl0_pcl=
k",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL0_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PPMU_ACE_CPUCL1_ACLK, "gout_core_ppmu_ace_cpucl1_acl=
k",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL1_AC=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_PPMU_ACE_CPUCL1_PCLK, "gout_core_ppmu_ace_cpucl1_pcl=
k",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_PPMU_ACE_CPUCL1_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_BUSD_CLK, "gout_core_busd_clk", "mout_pll_core_bus_u=
ser",
+=09     CLK_CON_GAT_GOUT_CORE_BUSD_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_BUSP_G3D_OCC_CLK, "gout_core_busp_g3d_occ_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_BUSP_G3D_OCC_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_BUSP_CLK, "gout_core_busp_clk", "dout_clk_core_busp"=
,
+=09     CLK_CON_GAT_GOUT_CORE_BUSP_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_BUSP_OCC_CLK, "gout_core_busp_occ_clk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_BUSP_OCC_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_CCI_CLK, "gout_core_cci_clk", "mout_pll_core_cci_use=
r",
+=09     CLK_CON_GAT_GOUT_CORE_CCI_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_CCI_OCC_CLK, "gout_core_cci_occ_clk",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_CCI_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_G3D_CLK, "gout_core_g3d_clk", "mout_pll_core_g3d_use=
r",
+=09     CLK_CON_GAT_GOUT_CORE_G3D_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_G3D_OCC_CLK, "gout_core_cci_g3d_occ_clk",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_G3D_OCC_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_GIC_CLK, "gout_core_gic_clk", "mout_clk_core_gic",
+=09     CLK_CON_GAT_GOUT_CORE_GIC_CLK, 21, 0, 0),
+=09GATE(CLK_GOUT_CORE_OSCCLK_CLK, "gout_core_oscclk_clk", "oscclk",
+=09     CLK_CON_GAT_GOUT_CORE_OSCCLK_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_SFR_APBIF_CMU_TOPC_PCLK, "gout_core_sfr_apbif_cmu_to=
pc_pclk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_SFR_APBIF_CMU_TOPC_PCL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_SIREX_ACLK, "gout_core_sirex_aclk", "mout_pll_core_b=
us_user",
+=09     CLK_CON_GAT_GOUT_CORE_SIREX_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_SIREX_PCLK, "gout_core_sirex_pclk", "dout_clk_core_b=
usp",
+=09     CLK_CON_GAT_GOUT_CORE_SIREX_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_SPDMA_CORE_ACLK_PDMA1, "gout_core_spdma_core_aclk_pd=
ma1",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_SPDMA_CORE_ACLK_PD=
MA1,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_SYSREG_PCLK, "gout_core_sysreg_pclk", "dout_clk_core=
_busp",
+=09     CLK_CON_GAT_GOUT_CORE_SYSREG_PCLK, 21, 0, 0),
+=09GATE(CLK_GOUT_CORE_TREX_D_ACLK, "gout_core_trex_d_aclk", "mout_pll_core=
_bus_user",
+=09     CLK_CON_GAT_GOUT_CORE_TREX_D_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_TREX_D_CCLK, "gout_core_trex_d_cclk", "mout_pll_core=
_cci_user",
+=09     CLK_CON_GAT_GOUT_CORE_TREX_D_CCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_TREX_D_GCLK, "gout_core_trex_d_gclk", "mout_pll_core=
_g3d_user",
+=09     CLK_CON_GAT_GOUT_CORE_TREX_D_GCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_TREX_D_PCLK, "gout_core_trex_d_pclk", "dout_clk_core=
_busp",
+=09     CLK_CON_GAT_GOUT_CORE_TREX_D_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_TREX_D_NRT_ACLK, "gout_core_trex_d_nrt_aclk",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_TREX_D_NRT_ACLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_TREX_D_NRT_PCLK, "gout_core_trex_d_nrt_pclk",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_TREX_D_NRT_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+
+=09GATE(CLK_GOUT_CORE_TREX_P_ACLK_P_CORE, "gout_core_trex_p_aclk_p_core",
+=09     "mout_pll_core_bus_user", CLK_CON_GAT_GOUT_CORE_TREX_P_ACLK_P_CORE=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_TREX_P_CCLK_P_CORE, "gout_core_trex_p_cclk_p_core",
+=09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_TREX_P_CCLK_P_CORE=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_TREX_P_PCLK, "gout_core_trex_p_pclk", "dout_clk_core=
_busp",
+=09     CLK_CON_GAT_GOUT_CORE_TREX_P_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_TREX_P_PCLK_P_CORE, "gout_core_trex_p_pclk_p_core",
+=09     "dout_clk_core_busp", CLK_CON_GAT_GOUT_CORE_TREX_P_PCLK_P_CORE,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CORE_XIU_D_ACLK, "gout_core_xiu_d_aclk", "mout_pll_core_b=
us_user",
+=09     CLK_CON_GAT_GOUT_CORE_XIU_D_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info core_cmu_info __initconst =3D {
+=09.mux_clks=09=09=3D core_mux_clks,
+=09.nr_mux_clks=09=09=3D ARRAY_SIZE(core_mux_clks),
+=09.gate_clks=09=09=3D core_gate_clks,
+=09.nr_gate_clks=09=09=3D ARRAY_SIZE(core_gate_clks),
+=09.clk_regs=09=09=3D core_clk_regs,
+=09.nr_clk_regs=09=09=3D ARRAY_SIZE(core_clk_regs),
+=09.nr_clk_ids=09=09=3D CLKS_NR_CORE,
+};
+
+/* CMU_DISPAUD */
+#define PLL_LOCKTIME_PLL_AUD=09=09=09=09=090x0000
+#define PLL_CON0_MUX_CLKCMU_DISPAUD_AUD_USER=09=09=090x0100
+#define PLL_CON2_MUX_CLKCMU_DISPAUD_AUD_USER=09=09=090x0108
+#define PLL_CON0_MUX_CLKCMU_DISPAUD_CPU_USER=09=09=090x0120
+#define PLL_CON2_MUX_CLKCMU_DISPAUD_CPU_USER=09=09=090x0128
+#define PLL_CON0_MUX_CLKCMU_DISPAUD_DISP_USER=09=09=090x0140
+#define PLL_CON2_MUX_CLKCMU_DISPAUD_DISP_USER=09=09=090x0148
+#define PLL_CON0_PLL_AUD=09=09=09=09=090x0160
+#define PLL_CON3_PLL_AUD=09=09=09=09=090x016c
+#define CLK_CON_MUX_MUX_CLK_AUD_BUS=09=09=09=090x1000
+#define CLK_CON_MUX_MUX_CLK_AUD_CPU=09=09=09=090x1004
+#define CLK_CON_MUX_MUX_CLK_AUD_CPU_HCH=09=09=09=090x1008
+#define CLK_CON_MUX_MUX_CLK_AUD_FM=09=09=09=090x100c
+#define CLK_CON_MUX_MUX_CLK_AUD_UAIF0=09=09=09=090x1010
+#define CLK_CON_MUX_MUX_CLK_AUD_UAIF1=09=09=09=090x1014
+#define CLK_CON_MUX_MUX_CLK_AUD_UAIF2=09=09=09=090x1018
+#define CLK_CON_DIV_DIV_CLK_AUD_AUDIF=09=09=09=090x1800
+#define CLK_CON_DIV_DIV_CLK_AUD_BUS=09=09=09=090x1808
+#define CLK_CON_DIV_DIV_CLK_AUD_CPU=09=09=09=090x180c
+#define CLK_CON_DIV_DIV_CLK_AUD_CPU_ACLK=09=09=090x1810
+#define CLK_CON_DIV_DIV_CLK_AUD_CPU_PCLKDBG=09=09=090x1814
+#define CLK_CON_DIV_DIV_CLK_AUD_DSIF=09=09=09=090x1818
+#define CLK_CON_DIV_DIV_CLK_AUD_FM=09=09=09=090x181c
+#define CLK_CON_DIV_DIV_CLK_AUD_FM_SPDY=09=09=09=090x1820
+#define CLK_CON_DIV_DIV_CLK_AUD_UAIF0=09=09=09=090x1824
+#define CLK_CON_DIV_DIV_CLK_AUD_UAIF1=09=09=09=090x1828
+#define CLK_CON_DIV_DIV_CLK_AUD_UAIF2=09=09=09=090x182c
+#define CLK_CON_DIV_DIV_CLK_DISPAUD_BUSP=09=09=090x1830
+#define CLK_CON_GAT_CLK_DISPAUD_ABOX_BCLK_UAIF0=09=09=090x2000
+#define CLK_CON_GAT_CLK_DISPAUD_ABOX_BCLK_UAIF1=09=09=090x2004
+#define CLK_CON_GAT_CLK_DISPAUD_ABOX_BCLK_UAIF2=09=09=090x2008
+#define CLK_CON_GAT_CLK_DISPAUD_CMU_PCLK=09=09=090x200c
+#define CLK_CON_GAT_CLK_DISPAUD_CLK_AUD_UAIF0_CLK=09=090x2010
+#define CLK_CON_GAT_CLK_DISPAUD_CLK_AUD_UAIF1_CLK=09=090x2014
+#define CLK_CON_GAT_CLK_DISPAUD_CLK_AUD_UAIF2_CLK=09=090x2018
+#define CLK_CON_GAT_CLK_DISPAUD_OSCCLK_CLK=09=09=090x201c
+#define CLK_CON_GAT_GOUT_DISPAUD_ABOX_ACLK=09=09=090x2020
+#define CLK_CON_GAT_GOUT_DISPAUD_ABOX_BCLK_DSIF=09=09=090x2024
+#define CLK_CON_GAT_GOUT_DISPAUD_ABOX_BCLK_SPDY=09=09=090x2028
+#define CLK_CON_GAT_GOUT_DISPAUD_ABOX_CCLK_ASB=09=09=090x202c
+#define CLK_CON_GAT_GOUT_DISPAUD_ABOX_CCLK_CA7=09=09=090x2030
+#define CLK_CON_GAT_GOUT_DISPAUD_ABOX_CCLK_DBG=09=09=090x2034
+#define CLK_CON_GAT_GOUT_DISPAUD_ABOX_OSC_SPDY=09=09=090x2038
+#define CLK_CON_GAT_GOUT_DISPAUD_AXI_US_32TO128_ACLK=09=090x203c
+#define CLK_CON_GAT_GOUT_DISPAUD_CLK_DISPAUD_AUD=09=090x2040
+#define CLK_CON_GAT_GOUT_DISPAUD_CLK_DISPAUD_DISP=09=090x2044
+#define CLK_CON_GAT_GOUT_DISPAUD_BTM_ABOX_ACLK=09=09=090x2048
+#define CLK_CON_GAT_GOUT_DISPAUD_BTM_ABOX_PCLK=09=09=090x204c
+#define CLK_CON_GAT_GOUT_DISPAUD_BTM_DPU_ACLK=09=09=090x2050
+#define CLK_CON_GAT_GOUT_DISPAUD_BTM_DPU_PCLK=09=09=090x2054
+#define CLK_CON_GAT_GOUT_DISPAUD_DFTMUX_AUD_CODEC_MCLK=09=090x2058
+#define CLK_CON_GAT_GOUT_DISPAUD_DPU_ACLK_DECON=09=09=090x2060
+#define CLK_CON_GAT_GOUT_DISPAUD_DPU_ACLK_DMA=09=09=090x2064
+#define CLK_CON_GAT_GOUT_DISPAUD_DPU_ACLK_DPP=09=09=090x2068
+#define CLK_CON_GAT_GOUT_DISPAUD_GPIO_DISPAUD_PCLK=09=090x206c
+#define CLK_CON_GAT_GOUT_DISPAUD_LHM_AXI_P_DISPAUD_CLK=09=090x2070
+#define CLK_CON_GAT_GOUT_DISPAUD_LHS_ACEL_D_DPU_CLK=09=090x2074
+#define CLK_CON_GAT_GOUT_DISPAUD_LHS_AXI_D_ABOX_CLK=09=090x2078
+#define CLK_CON_GAT_GOUT_DISPAUD_PERI_AXI_ASB_ACLKM=09=090x207c
+#define CLK_CON_GAT_GOUT_DISPAUD_PERI_AXI_ASB_PCLK=09=090x2080
+#define CLK_CON_GAT_GOUT_DISPAUD_PPMU_ABOX_ACLK=09=09=090x2084
+#define CLK_CON_GAT_GOUT_DISPAUD_PPMU_ABOX_PCLK=09=09=090x2088
+#define CLK_CON_GAT_GOUT_DISPAUD_PPMU_DPU_ACLK=09=09=090x208c
+#define CLK_CON_GAT_GOUT_DISPAUD_PPMU_DPU_PCLK=09=09=090x2090
+#define CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CPU_ACLK_CLK=09=090x2094
+#define CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CPU_CLKIN_CLK=09=090x2098
+#define CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CPU_PCLKDBG_CLK=090x209c
+#define CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_DSIF_CLK=09=090x20a0
+#define CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CLK=09=09=090x20a4
+#define CLK_CON_GAT_GOUT_DISPAUD_CLK_BUSP_CLK=09=09=090x20a8
+#define CLK_CON_GAT_GOUT_DISPAUD_CLK_DISP_CLK=09=09=090x20ac
+#define CLK_CON_GAT_GOUT_DISPAUD_SMMU_ABOX_CLK=09=09=090x20b0
+#define CLK_CON_GAT_GOUT_DISPAUD_SMMU_DPU_CLK=09=09=090x20b4
+#define CLK_CON_GAT_GOUT_DISPAUD_SYSREG_PCLK=09=09=090x20b8
+#define CLK_CON_GAT_GOUT_DISPAUD_WDT_AUD_PCLK=09=09=090x20bc
+
+static const unsigned long dispaud_clk_regs[] __initconst =3D {
+=09PLL_LOCKTIME_PLL_AUD,
+=09PLL_CON0_MUX_CLKCMU_DISPAUD_AUD_USER,
+=09PLL_CON2_MUX_CLKCMU_DISPAUD_AUD_USER,
+=09PLL_CON0_MUX_CLKCMU_DISPAUD_CPU_USER,
+=09PLL_CON2_MUX_CLKCMU_DISPAUD_CPU_USER,
+=09PLL_CON0_MUX_CLKCMU_DISPAUD_DISP_USER,
+=09PLL_CON2_MUX_CLKCMU_DISPAUD_DISP_USER,
+=09PLL_CON0_PLL_AUD,
+=09PLL_CON3_PLL_AUD,
+=09CLK_CON_MUX_MUX_CLK_AUD_BUS,
+=09CLK_CON_MUX_MUX_CLK_AUD_CPU,
+=09CLK_CON_MUX_MUX_CLK_AUD_CPU_HCH,
+=09CLK_CON_MUX_MUX_CLK_AUD_FM,
+=09CLK_CON_MUX_MUX_CLK_AUD_UAIF0,
+=09CLK_CON_MUX_MUX_CLK_AUD_UAIF1,
+=09CLK_CON_MUX_MUX_CLK_AUD_UAIF2,
+=09CLK_CON_DIV_DIV_CLK_AUD_AUDIF,
+=09CLK_CON_DIV_DIV_CLK_AUD_BUS,
+=09CLK_CON_DIV_DIV_CLK_AUD_CPU,
+=09CLK_CON_DIV_DIV_CLK_AUD_CPU_ACLK,
+=09CLK_CON_DIV_DIV_CLK_AUD_CPU_PCLKDBG,
+=09CLK_CON_DIV_DIV_CLK_AUD_DSIF,
+=09CLK_CON_DIV_DIV_CLK_AUD_FM,
+=09CLK_CON_DIV_DIV_CLK_AUD_FM_SPDY,
+=09CLK_CON_DIV_DIV_CLK_AUD_UAIF0,
+=09CLK_CON_DIV_DIV_CLK_AUD_UAIF1,
+=09CLK_CON_DIV_DIV_CLK_AUD_UAIF2,
+=09CLK_CON_DIV_DIV_CLK_DISPAUD_BUSP,
+=09CLK_CON_GAT_CLK_DISPAUD_ABOX_BCLK_UAIF0,
+=09CLK_CON_GAT_CLK_DISPAUD_ABOX_BCLK_UAIF1,
+=09CLK_CON_GAT_CLK_DISPAUD_ABOX_BCLK_UAIF2,
+=09CLK_CON_GAT_CLK_DISPAUD_CMU_PCLK,
+=09CLK_CON_GAT_CLK_DISPAUD_CLK_AUD_UAIF0_CLK,
+=09CLK_CON_GAT_CLK_DISPAUD_CLK_AUD_UAIF1_CLK,
+=09CLK_CON_GAT_CLK_DISPAUD_CLK_AUD_UAIF2_CLK,
+=09CLK_CON_GAT_CLK_DISPAUD_OSCCLK_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_ABOX_ACLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_ABOX_BCLK_DSIF,
+=09CLK_CON_GAT_GOUT_DISPAUD_ABOX_BCLK_SPDY,
+=09CLK_CON_GAT_GOUT_DISPAUD_ABOX_CCLK_ASB,
+=09CLK_CON_GAT_GOUT_DISPAUD_ABOX_CCLK_CA7,
+=09CLK_CON_GAT_GOUT_DISPAUD_ABOX_CCLK_DBG,
+=09CLK_CON_GAT_GOUT_DISPAUD_ABOX_OSC_SPDY,
+=09CLK_CON_GAT_GOUT_DISPAUD_AXI_US_32TO128_ACLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_CLK_DISPAUD_AUD,
+=09CLK_CON_GAT_GOUT_DISPAUD_CLK_DISPAUD_DISP,
+=09CLK_CON_GAT_GOUT_DISPAUD_BTM_ABOX_ACLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_BTM_ABOX_PCLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_BTM_DPU_ACLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_BTM_DPU_PCLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_DFTMUX_AUD_CODEC_MCLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_DPU_ACLK_DECON,
+=09CLK_CON_GAT_GOUT_DISPAUD_DPU_ACLK_DMA,
+=09CLK_CON_GAT_GOUT_DISPAUD_DPU_ACLK_DPP,
+=09CLK_CON_GAT_GOUT_DISPAUD_GPIO_DISPAUD_PCLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_LHM_AXI_P_DISPAUD_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_LHS_ACEL_D_DPU_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_LHS_AXI_D_ABOX_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_PERI_AXI_ASB_ACLKM,
+=09CLK_CON_GAT_GOUT_DISPAUD_PERI_AXI_ASB_PCLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_PPMU_ABOX_ACLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_PPMU_ABOX_PCLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_PPMU_DPU_ACLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_PPMU_DPU_PCLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CPU_ACLK_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CPU_CLKIN_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CPU_PCLKDBG_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_DSIF_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_CLK_BUSP_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_CLK_DISP_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_SMMU_ABOX_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_SMMU_DPU_CLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_SYSREG_PCLK,
+=09CLK_CON_GAT_GOUT_DISPAUD_WDT_AUD_PCLK,
+};
+
+static const struct samsung_pll_rate_table pll_aud_rate_table[] __initcons=
t =3D {
+=09PLL_36XX_RATE(26 * MHZ, 1179648040, 45, 1, 0, 24319),
+=09PLL_36XX_RATE(26 * MHZ, 1083801605, 42, 1, 0, -20665),
+};
+
+static const struct samsung_pll_clock dispaud_pll_clks[] __initconst =3D {
+=09PLL(pll_1061x, CLK_FOUT_AUD_PLL, "fout_aud_pll", "oscclk",
+=09    PLL_LOCKTIME_PLL_AUD, PLL_CON0_PLL_AUD, pll_aud_rate_table),
+};
+
+PNAME(mout_pll_dispaud_aud_user_p)=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_dispaud_aud" };
+PNAME(mout_pll_dispaud_cpu_user_p)=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_dispaud_cpu" };
+PNAME(mout_pll_dispaud_disp_user_p)=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_dispaud_disp" };
+PNAME(mout_clk_aud_bus_p)=09=09=3D { "dout_clk_aud_bus",
+=09=09=09=09=09    "mout_pll_dispaud_aud_user" };
+PNAME(mout_clk_aud_cpu_p)=09=09=3D { "dout_clk_aud_cpu",
+=09=09=09=09=09    "mout_pll_dispaud_cpu_user" };
+PNAME(mout_clk_aud_cpu_hch_p)=09=09=3D { "mout_clk_aud_cpu", "oscclk" };
+PNAME(mout_clk_aud_fm_p)=09=09=3D { "oscclk",
+=09=09=09=09=09    "dout_clk_aud_fm_spdy" };
+PNAME(mout_clk_aud_uaif0_p)=09=09=3D { "dout_clk_aud_uaif0",
+=09=09=09=09=09    "ioclk_audiocdclk0" };
+PNAME(mout_clk_aud_uaif1_p)=09=09=3D { "dout_clk_aud_uaif1",
+=09=09=09=09=09    "ioclk_audiocdclk1" };
+PNAME(mout_clk_aud_uaif2_p)=09=09=3D { "dout_clk_aud_uaif2",
+=09=09=09=09=09    "ioclk_audiocdclk0" };
+
+static const struct samsung_mux_clock dispaud_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_PLL_DISPAUD_AUD_USER, "mout_pll_dispaud_aud_user", mout_pl=
l_dispaud_aud_user_p,
+=09    PLL_CON0_MUX_CLKCMU_DISPAUD_AUD_USER, 4, 1),
+=09MUX(CLK_MOUT_PLL_DISPAUD_CPU_USER, "mout_pll_dispaud_cpu_user", mout_pl=
l_dispaud_cpu_user_p,
+=09    PLL_CON0_MUX_CLKCMU_DISPAUD_CPU_USER, 4, 1),
+=09MUX(CLK_MOUT_PLL_DISPAUD_DISP_USER, "mout_pll_dispaud_disp_user",
+=09    mout_pll_dispaud_disp_user_p, PLL_CON0_MUX_CLKCMU_DISPAUD_DISP_USER=
, 4, 1),
+=09MUX(CLK_MOUT_CLK_AUD_BUS, "mout_clk_aud_bus", mout_clk_aud_bus_p,
+=09    CLK_CON_MUX_MUX_CLK_AUD_BUS, 0, 1),
+=09MUX(CLK_MOUT_CLK_AUD_CPU, "mout_clk_aud_cpu", mout_clk_aud_cpu_p,
+=09    CLK_CON_MUX_MUX_CLK_AUD_CPU, 0, 1),
+=09MUX(CLK_MOUT_CLK_AUD_CPU_HCH, "mout_clk_aud_cpu_hch", mout_clk_aud_cpu_=
hch_p,
+=09    CLK_CON_MUX_MUX_CLK_AUD_CPU_HCH, 0, 1),
+=09MUX(CLK_MOUT_CLK_AUD_FM, "mout_clk_aud_fm", mout_clk_aud_fm_p,
+=09    CLK_CON_MUX_MUX_CLK_AUD_FM, 0, 1),
+=09MUX(CLK_MOUT_CLK_AUD_UAIF0, "mout_clk_aud_uaif0", mout_clk_aud_uaif0_p,
+=09    CLK_CON_MUX_MUX_CLK_AUD_UAIF0, 0, 1),
+=09MUX(CLK_MOUT_CLK_AUD_UAIF1, "mout_clk_aud_uaif1", mout_clk_aud_uaif1_p,
+=09    CLK_CON_MUX_MUX_CLK_AUD_UAIF1, 0, 1),
+=09MUX(CLK_MOUT_CLK_AUD_UAIF2, "mout_clk_aud_uaif2", mout_clk_aud_uaif2_p,
+=09    CLK_CON_MUX_MUX_CLK_AUD_UAIF2, 0, 1),
+};
+
+static const struct samsung_div_clock dispaud_div_clks[] __initconst =3D {
+=09DIV(CLK_DOUT_CLK_AUD_AUDIF, "dout_clk_aud_audif", "fout_aud_pll",
+=09    CLK_CON_DIV_DIV_CLK_AUD_AUDIF, 0, 9),
+=09DIV(CLK_DOUT_CLK_AUD_BUS, "dout_clk_aud_bus", "fout_aud_pll",
+=09    CLK_CON_DIV_DIV_CLK_AUD_BUS, 0, 3),
+=09DIV(CLK_DOUT_CLK_AUD_CPU, "dout_clk_aud_cpu", "fout_aud_pll",
+=09    CLK_CON_DIV_DIV_CLK_AUD_CPU, 0, 4),
+=09DIV(CLK_DOUT_CLK_AUD_CPU_ACLK, "dout_clk_aud_cpu_aclk", "mout_clk_aud_c=
pu_hch",
+=09    CLK_CON_DIV_DIV_CLK_AUD_CPU_ACLK, 0, 3),
+=09DIV(CLK_DOUT_CLK_AUD_CPU_PCLKDBG, "dout_clk_aud_cpu_pclkdbg", "mout_clk=
_aud_cpu_hch",
+=09    CLK_CON_DIV_DIV_CLK_AUD_CPU_PCLKDBG, 0, 3),
+=09DIV(CLK_DOUT_CLK_AUD_DSIF, "dout_clk_aud_dsif", "dout_clk_aud_audif",
+=09    CLK_CON_DIV_DIV_CLK_AUD_DSIF, 0, 9),
+=09DIV(CLK_DOUT_CLK_AUD_FM, "dout_clk_aud_fm", "mout_clk_aud_fm",
+=09    CLK_CON_DIV_DIV_CLK_AUD_FM, 0, 9),
+=09DIV(CLK_DOUT_CLK_AUD_FM_SPDY, "dout_clk_aud_fm_spdy", "tick_usb",
+=09    CLK_CON_DIV_DIV_CLK_AUD_FM_SPDY, 0, 9),
+=09DIV(CLK_DOUT_CLK_AUD_UAIF0, "dout_clk_aud_uaif0", "dout_clk_aud_audif",
+=09    CLK_CON_DIV_DIV_CLK_AUD_UAIF0, 0, 9),
+=09DIV(CLK_DOUT_CLK_AUD_UAIF1, "dout_clk_aud_uaif1", "dout_clk_aud_audif",
+=09    CLK_CON_DIV_DIV_CLK_AUD_UAIF1, 0, 9),
+=09DIV(CLK_DOUT_CLK_AUD_UAIF2, "dout_clk_aud_uaif2", "dout_clk_aud_audif",
+=09    CLK_CON_DIV_DIV_CLK_AUD_UAIF2, 0, 9),
+=09DIV(CLK_DOUT_CLK_DISPAUD_BUSP, "dout_clk_dispaud_busp", "mout_pll_dispa=
ud_disp_user",
+=09    CLK_CON_DIV_DIV_CLK_DISPAUD_BUSP, 0, 3),
+};
+
+static const struct samsung_gate_clock dispaud_gate_clks[] __initconst =3D=
 {
+=09GATE(CLK_GOUT_CLK_DISPAUD_ABOX_BCLK_UAIF0, "gout_clk_dispaud_abox_bclk_=
uaif0",
+=09     "mout_clk_aud_uaif0", CLK_CON_GAT_CLK_DISPAUD_ABOX_BCLK_UAIF0,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_DISPAUD_ABOX_BCLK_UAIF1, "gout_clk_dispaud_abox_bclk_=
uaif1",
+=09     "mout_clk_aud_uaif1", CLK_CON_GAT_CLK_DISPAUD_ABOX_BCLK_UAIF1,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_DISPAUD_ABOX_BCLK_UAIF2, "gout_clk_dispaud_abox_bclk_=
uaif2",
+=09     "mout_clk_aud_uaif2", CLK_CON_GAT_CLK_DISPAUD_ABOX_BCLK_UAIF2,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_DISPAUD_CMU_PCLK, "gout_clk_dispaud_cmu_pclk",
+=09     "dout_clk_dispaud_busp", CLK_CON_GAT_CLK_DISPAUD_CMU_PCLK, 21, CLK=
_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_DISPAUD_CLK_AUD_UAIF0_CLK, "gout_clk_dispaud_clk_aud_=
uaif0_clk",
+=09     "mout_clk_aud_uaif0", CLK_CON_GAT_CLK_DISPAUD_CLK_AUD_UAIF0_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_DISPAUD_CLK_AUD_UAIF1_CLK, "gout_clk_dispaud_clk_aud_=
uaif1_clk",
+=09     "mout_clk_aud_uaif1", CLK_CON_GAT_CLK_DISPAUD_CLK_AUD_UAIF1_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_DISPAUD_CLK_AUD_UAIF2_CLK, "gout_clk_dispaud_clk_aud_=
uaif2_clk",
+=09     "mout_clk_aud_uaif2", CLK_CON_GAT_CLK_DISPAUD_CLK_AUD_UAIF2_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_DISPAUD_OSCCLK_CLK, "gout_clk_dispaud_oscclk_clk", "o=
scclk",
+=09     CLK_CON_GAT_CLK_DISPAUD_OSCCLK_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_ABOX_ACLK, "gout_clk_dispaud_abox_aclk", "mout_cl=
k_aud_bus",
+=09     CLK_CON_GAT_GOUT_DISPAUD_ABOX_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_ABOX_BCLK_DSIF, "gout_clk_dispaud_abox_bclk_dsif"=
,
+=09     "dout_clk_aud_dsif", CLK_CON_GAT_GOUT_DISPAUD_ABOX_BCLK_DSIF,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_ABOX_BCLK_SPDY, "gout_clk_dispaud_abox_bclk_spdy"=
,
+=09     "dout_clk_aud_fm", CLK_CON_GAT_GOUT_DISPAUD_ABOX_BCLK_SPDY,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_ABOX_CCLK_ASB, "gout_clk_dispaud_abox_cclk_asb",
+=09     "dout_clk_aud_cpu_aclk", CLK_CON_GAT_GOUT_DISPAUD_ABOX_CCLK_ASB,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_ABOX_CCLK_CA7, "gout_clk_dispaud_abox_cclk_ca7",
+=09     "mout_clk_aud_cpu_hch", CLK_CON_GAT_GOUT_DISPAUD_ABOX_CCLK_CA7,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_ABOX_CCLK_DBG, "gout_clk_dispaud_abox_cclk_dbg",
+=09     "dout_clk_aud_cpu_pclkdbg", CLK_CON_GAT_GOUT_DISPAUD_ABOX_CCLK_DBG=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_ABOX_OSC_SPDY, "gout_clk_dispaud_abox_osc_spdy",
+=09     "mout_clk_aud_fm", CLK_CON_GAT_GOUT_DISPAUD_ABOX_OSC_SPDY, 21, CLK=
_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_AXI_US_32TO128_ACLK, "gout_dispaud_axi_us_32to128=
_aclk",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_AXI_US_32TO128_ACLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_CLK_DISPAUD_AUD, "gout_dispaud_clk_dispaud_aud",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_CLK_DISPAUD_AUD,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_CLK_DISPAUD_DISP, "gout_dispaud_clk_dispaud_disp"=
,
+=09     "mout_pll_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_CLK_DISPAUD=
_DISP,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_BTM_ABOX_ACLK, "gout_dispaud_btm_abox_aclk", "mou=
t_clk_aud_bus",
+=09     CLK_CON_GAT_GOUT_DISPAUD_BTM_ABOX_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_BTM_ABOX_PCLK, "gout_dispaud_btm_abox_pclk",
+=09     "dout_clk_dispaud_busp", CLK_CON_GAT_GOUT_DISPAUD_BTM_ABOX_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_BTM_DPU_ACLK, "gout_dispaud_btm_dpu_aclk",
+=09     "mout_cmu_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_BTM_DPU_ACL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_BTM_DPU_PCLK, "gout_dispaud_btm_dpu_pclk",
+=09     "dout_clk_dispaud_busp", CLK_CON_GAT_GOUT_DISPAUD_BTM_DPU_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_DFTMUX_AUD_CODEC_MCLK, "gout_dispaud_dftmux_aud_c=
odec_mclk",
+=09     "dout_clk_aud_audif", CLK_CON_GAT_GOUT_DISPAUD_DFTMUX_AUD_CODEC_MC=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_DPU_ACLK_DECON, "gout_dispaud_dpu_aclk_decon",
+=09     "mout_pll_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_DPU_ACLK_DE=
CON,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_DPU_ACLK_DMA, "gout_dispaud_dpu_aclk_dma",
+=09     "mout_pll_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_DPU_ACLK_DM=
A,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_DPU_ACLK_DPP, "gout_dispaud_dpu_aclk_dpp",
+=09     "mout_pll_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_DPU_ACLK_DP=
P,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_GPIO_DISPAUD_PCLK, "gout_dispaud_gpio_dispaud_pcl=
k",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_GPIO_DISPAUD_PCLK,
+=09     21, 0, 0),
+=09GATE(CLK_GOUT_DISPAUD_LHM_AXI_P_DISPAUD_CLK, "gout_dispaud_lhm_axi_p_di=
spaud_clk",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_LHM_AXI_P_DISPAUD_CLK=
,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_LHS_ACEL_D_DPU_CLK, "gout_dispaud_lhs_acel_d_dpu_=
clk",
+=09     "mout_cmu_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_LHS_ACEL_D_=
DPU_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_LHS_AXI_D_ABOX_CLK, "gout_dispaud_lhs_axi_d_abox_=
clk",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_LHS_AXI_D_ABOX_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_PERI_AXI_ASB_ACLKM, "gout_dispaud_peri_axi_asb_ac=
lkm",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_PERI_AXI_ASB_ACLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_PERI_AXI_ASB_PCLK, "gout_dispaud_peri_axi_asb_pcl=
k",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_PERI_AXI_ASB_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_PPMU_ABOX_ACLK, "gout_dispaud_ppmu_abox_aclk",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_PPMU_ABOX_ACLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_PPMU_ABOX_PCLK, "gout_dispaud_ppmu_abox_pclk",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_PPMU_ABOX_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_PPMU_DPU_ACLK, "gout_dispaud_ppmu_dpu_aclk",
+=09     "mout_cmu_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_PPMU_DPU_AC=
LK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_PPMU_DPU_PCLK, "gout_dispaud_ppmu_dpu_pclk",
+=09     "dout_clk_dispaud_busp", CLK_CON_GAT_GOUT_DISPAUD_PPMU_DPU_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_CLK_AUD_CPU_ACLK_CLK,
+=09     "gout_dispaud_clk_aud_cpu_aclk_clk", "dout_clk_aud_cpu_aclk",
+=09     CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CPU_ACLK_CLK, 21, CLK_IGNORE_UNUS=
ED, 0),
+=09GATE(CLK_GOUT_DISPAUD_CLK_AUD_CPU_CLKIN_CLK,
+=09     "gout_dispaud_clk_aud_cpu_clkin_clk", "mout_clk_aud_cpu_hch",
+=09     CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CPU_CLKIN_CLK, 21, CLK_IGNORE_UNU=
SED, 0),
+=09GATE(CLK_GOUT_DISPAUD_CLK_AUD_CPU_PCLKDBG_CLK,
+=09     "gout_dispaud_clk_aud_cpu_pclkdbg_clk", "dout_clk_aud_cpu_pclkdbg"=
,
+=09     CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CPU_PCLKDBG_CLK, 21, CLK_IGNORE_U=
NUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_CLK_AUD_DSIF_CLK, "gout_dispaud_clk_aud_dsif_clk"=
,
+=09     "dout_clk_aud_dsif", CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_DSIF_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_CLK_AUD_CLK, "gout_dispaud_clk_aud_clk",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_CLK_AUD_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_CLK_BUSP_CLK, "gout_dispaud_clk_busp_clk",
+=09     "dout_clk_dispaud_busp", CLK_CON_GAT_GOUT_DISPAUD_CLK_BUSP_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_CLK_DISP_CLK, "gout_dispaud_clk_disp_clk",
+=09     "mout_cmu_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_CLK_DISP_CL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_SMMU_ABOX_CLK, "gout_dispaud_smmu_abox_clk",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_SMMU_ABOX_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_SMMU_DPU_CLK, "gout_dispaud_smmu_dpu_clk",
+=09     "mout_cmu_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_SMMU_DPU_CL=
K,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_DISPAUD_SYSREG_PCLK, "gout_dispaud_sysreg_pclk",
+=09     "dout_clk_dispaud_busp", CLK_CON_GAT_GOUT_DISPAUD_SYSREG_PCLK,
+=09     21, 0, 0),
+=09GATE(CLK_GOUT_DISPAUD_WDT_AUD_PCLK, "gout_dispaud_wdt_aud_pclk",
+=09     "mout_clk_aud_bus", CLK_CON_GAT_GOUT_DISPAUD_WDT_AUD_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info dispaud_cmu_info __initconst =3D {
+=09.pll_clks =3D dispaud_pll_clks,
+=09.nr_pll_clks =3D ARRAY_SIZE(dispaud_pll_clks),
+=09.mux_clks =3D dispaud_mux_clks,
+=09.nr_mux_clks =3D ARRAY_SIZE(dispaud_mux_clks),
+=09.div_clks =3D dispaud_div_clks,
+=09.nr_div_clks =3D ARRAY_SIZE(dispaud_div_clks),
+=09.gate_clks =3D dispaud_gate_clks,
+=09.nr_gate_clks =3D ARRAY_SIZE(dispaud_gate_clks),
+=09.nr_clk_ids =3D CLKS_NR_DISPAUD,
+=09.clk_regs =3D dispaud_clk_regs,
+=09.nr_clk_regs =3D ARRAY_SIZE(dispaud_clk_regs),
+};
+
+/* CMU_FSYS */
+#define PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER=09=090x0100
+#define PLL_CON2_MUX_CLKCMU_FSYS_BUS_USER=09=090x0108
+#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER=09=090x0120
+#define PLL_CON2_MUX_CLKCMU_FSYS_MMC_CARD_USER=09=090x0128
+#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER=09=090x0140
+#define PLL_CON2_MUX_CLKCMU_FSYS_MMC_EMBD_USER=09=090x0148
+#define PLL_CON0_MUX_CLKCMU_FSYS_UFS_EMBD_USER=09=090x0160
+#define PLL_CON2_MUX_CLKCMU_FSYS_UFS_EMBD_USER=09=090x0168
+#define CLK_CON_GAT_CLK_FSYS_CMU_PCLK=09=09=090x2000
+#define CLK_CON_GAT_CLK_FSYS_OSCCLK_CLK=09=09=090x2004
+#define CLK_CON_GAT_GOUT_FSYS_ADM_AHB_SSS_HCLKM=09=090x2008
+#define CLK_CON_GAT_GOUT_FSYS_BTM_ACLK=09=09=090x200c
+#define CLK_CON_GAT_GOUT_FSYS_BTM_PCLK=09=09=090x2010
+#define CLK_CON_GAT_GOUT_FSYS_GPIO_PCLK=09=09=090x2014
+#define CLK_CON_GAT_GOUT_FSYS_LHM_AXI_P_CLK=09=090x2018
+#define CLK_CON_GAT_GOUT_FSYS_LHS_ACEL_D_CLK=09=090x201c
+#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_ACLK=09=090x2020
+#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN=09=090x2024
+#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_ACLK=09=090x2028
+#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN=09=090x202c
+#define CLK_CON_GAT_GOUT_FSYS_PGEN_LITE_CLK=09=090x2030
+#define CLK_CON_GAT_GOUT_FSYS_PPMU_ACLK=09=09=090x2034
+#define CLK_CON_GAT_GOUT_FSYS_PPMU_PCLK=09=09=090x2038
+#define CLK_CON_GAT_GOUT_FSYS_BUS_CLK=09=09=090x203c
+#define CLK_CON_GAT_GOUT_FSYS_RTIC_ACLK=09=09=090x2040
+#define CLK_CON_GAT_GOUT_FSYS_RTIC_PCLK=09=09=090x2044
+#define CLK_CON_GAT_GOUT_FSYS_SSS_ACLK=09=09=090x2048
+#define CLK_CON_GAT_GOUT_FSYS_SSS_PCLK=09=09=090x204c
+#define CLK_CON_GAT_GOUT_FSYS_SYSREG_PCLK=09=090x2050
+#define CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_ACLK=09=090x2054
+#define CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_CLK_UNIPRO=090x2058
+#define CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_FMP_CLK=09=090x205c
+#define CLK_CON_GAT_GOUT_FSYS_XIU_D_ACLK=09=090x2060
+
+static const unsigned long fsys_clk_regs[] __initconst =3D {
+=09PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER,
+=09PLL_CON2_MUX_CLKCMU_FSYS_BUS_USER,
+=09PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER,
+=09PLL_CON2_MUX_CLKCMU_FSYS_MMC_CARD_USER,
+=09PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER,
+=09PLL_CON2_MUX_CLKCMU_FSYS_MMC_EMBD_USER,
+=09PLL_CON0_MUX_CLKCMU_FSYS_UFS_EMBD_USER,
+=09PLL_CON2_MUX_CLKCMU_FSYS_UFS_EMBD_USER,
+=09CLK_CON_GAT_CLK_FSYS_CMU_PCLK,
+=09CLK_CON_GAT_CLK_FSYS_OSCCLK_CLK,
+=09CLK_CON_GAT_GOUT_FSYS_ADM_AHB_SSS_HCLKM,
+=09CLK_CON_GAT_GOUT_FSYS_BTM_ACLK,
+=09CLK_CON_GAT_GOUT_FSYS_BTM_PCLK,
+=09CLK_CON_GAT_GOUT_FSYS_GPIO_PCLK,
+=09CLK_CON_GAT_GOUT_FSYS_LHM_AXI_P_CLK,
+=09CLK_CON_GAT_GOUT_FSYS_LHS_ACEL_D_CLK,
+=09CLK_CON_GAT_GOUT_FSYS_MMC_CARD_ACLK,
+=09CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_ACLK,
+=09CLK_CON_GAT_GOUT_FSYS_PGEN_LITE_CLK,
+=09CLK_CON_GAT_GOUT_FSYS_PPMU_ACLK,
+=09CLK_CON_GAT_GOUT_FSYS_PPMU_PCLK,
+=09CLK_CON_GAT_GOUT_FSYS_BUS_CLK,
+=09CLK_CON_GAT_GOUT_FSYS_SYSREG_PCLK,
+=09CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_ACLK,
+=09CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_FMP_CLK,
+=09CLK_CON_GAT_GOUT_FSYS_XIU_D_ACLK,
+};
+
+PNAME(mout_pll_fsys_bus_user_p)=09=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_fsys_bus" };
+PNAME(mout_pll_fsys_mmc_card_user_p)=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_fsys_mmc_card" };
+PNAME(mout_pll_fsys_mmc_embd_user_p)=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_fsys_mmc_embd" };
+PNAME(mout_pll_fsys_ufs_embd_user_p)=09=3D { "oscclk",
+=09=09=09=09=09    "dout_cmu_fsys_ufs_embd" };
+
+static const struct samsung_mux_clock fsys_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_PLL_FSYS_BUS_USER, "mout_pll_fsys_bus_user", mout_pll_fsys=
_bus_user_p,
+=09    PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER, 4, 1),
+=09MUX(CLK_MOUT_PLL_FSYS_MMC_CARD_USER, "mout_pll_fsys_mmc_card_user",
+=09    mout_pll_fsys_mmc_card_user_p, PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_US=
ER, 4, 1),
+=09MUX(CLK_MOUT_PLL_FSYS_MMC_EMBD_USER, "mout_pll_fsys_mmc_embd_user",
+=09    mout_pll_fsys_mmc_embd_user_p, PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_US=
ER, 4, 1),
+=09MUX(CLK_MOUT_PLL_FSYS_UFS_EMBD_USER, "mout_pll_fsys_ufs_embd_user",
+=09    mout_pll_fsys_ufs_embd_user_p, PLL_CON0_MUX_CLKCMU_FSYS_UFS_EMBD_US=
ER, 4, 1),
+};
+
+static const struct samsung_gate_clock fsys_gate_clks[] __initconst =3D {
+=09GATE(CLK_GOUT_FSYS_CMU_PCLK, "gout_fsys_cmu_pclk", "mout_pll_fsys_bus_u=
ser",
+=09     CLK_CON_GAT_CLK_FSYS_CMU_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_OSCCLK_CLK, "gout_fsys_oscclk_clk", "oscclk",
+=09     CLK_CON_GAT_CLK_FSYS_OSCCLK_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_ADM_AHB_SSS_HCLKM, "gout_fsys_adm_ahb_sss_hclkm",
+=09     "mout_pll_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_ADM_AHB_SSS_HCLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_BTM_ACLK, "gout_fsys_btm_aclk", "mout_pll_fsys_bus_u=
ser",
+=09     CLK_CON_GAT_GOUT_FSYS_BTM_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_BTM_PCLK, "gout_fsys_btm_pclk", "mout_pll_fsys_bus_u=
ser",
+=09     CLK_CON_GAT_GOUT_FSYS_BTM_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_GPIO_PCLK, "gout_fsys_gpio_pclk", "mout_pll_fsys_bus=
_user",
+=09     CLK_CON_GAT_GOUT_FSYS_GPIO_PCLK, 21, 0, 0),
+=09GATE(CLK_GOUT_FSYS_LHM_AXI_P_CLK, "gout_fsys_lhm_axi_p_clk",
+=09     "mout_pll_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_LHM_AXI_P_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_LHS_ACEL_D_CLK, "gout_fsys_lhs_acel_d_clk",
+=09     "mout_pll_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_LHS_ACEL_D_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_MMC_CARD_ACLK, "gout_fsys_mmc_card_aclk",
+=09     "mout_pll_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_MMC_CARD_ACLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_MMC_CARD_SDCLKIN, "gout_fsys_mmc_card_sdclkin",
+=09     "mout_pll_fsys_mmc_card_user", CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCL=
KIN,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_MMC_EMBD_ACLK, "gout_fsys_mmc_embd_aclk",
+=09     "mout_pll_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_ACLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_MMC_EMBD_SDCLKIN, "gout_fsys_mmc_embd_sdclkin",
+=09     "mout_pll_fsys_mmc_embd_user", CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCL=
KIN,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_PGEN_LITE_CLK, "gout_fsys_pgen_lite_clk",
+=09     "mout_pll_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_PGEN_LITE_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_PPMU_ACLK, "gout_fsys_ppmu_aclk", "mout_pll_fsys_bus=
_user",
+=09     CLK_CON_GAT_GOUT_FSYS_PPMU_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_PPMU_PCLK, "gout_fsys_ppmu_pclk", "mout_pll_fsys_bus=
_user",
+=09     CLK_CON_GAT_GOUT_FSYS_PPMU_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_BUS_CLK, "gout_fsys_bus_clk", "mout_pll_fsys_bus_use=
r",
+=09     CLK_CON_GAT_GOUT_FSYS_BUS_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_SYSREG_PCLK, "gout_fsys_sysreg_pclk", "mout_pll_fsys=
_bus_user",
+=09     CLK_CON_GAT_GOUT_FSYS_SYSREG_PCLK, 21, 0, 0),
+=09GATE(CLK_GOUT_FSYS_UFS_EMBD_ACLK, "gout_fsys_ufs_embd_aclk",
+=09     "mout_pll_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_ACLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_UFS_EMBD_CLK_UNIPRO, "gout_fsys_ufs_embd_clk_unipro"=
,
+=09     "mout_pll_fsys_ufs_embd_user", CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_CLK_=
UNIPRO,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_UFS_EMBD_FMP_CLK, "gout_fsys_ufs_embd_fmp_clk",
+=09     "mout_pll_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_FMP_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_FSYS_XIU_D_ACLK, "gout_fsys_xiu_d_aclk", "mout_pll_fsys_b=
us_user",
+=09     CLK_CON_GAT_GOUT_FSYS_XIU_D_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info fsys_cmu_info __initconst =3D {
+=09.mux_clks=09=09=3D fsys_mux_clks,
+=09.nr_mux_clks=09=09=3D ARRAY_SIZE(fsys_mux_clks),
+=09.gate_clks=09=09=3D fsys_gate_clks,
+=09.nr_gate_clks=09=09=3D ARRAY_SIZE(fsys_gate_clks),
+=09.clk_regs=09=09=3D fsys_clk_regs,
+=09.nr_clk_regs=09=09=3D ARRAY_SIZE(fsys_clk_regs),
+=09.nr_clk_ids=09=09=3D CLKS_NR_FSYS,
+};
+
+/* CMU_G2D */
+#define PLL_CON0_MUX_CLKCMU_G2D_G2D_USER=090x0100
+#define PLL_CON2_MUX_CLKCMU_G2D_G2D_USER=090x0108
+#define PLL_CON0_MUX_CLKCMU_G2D_MSCL_USER=090x0120
+#define PLL_CON2_MUX_CLKCMU_G2D_MSCL_USER=090x0128
+#define CLK_CON_DIV_DIV_CLK_G2D_BUSP=09=090x1800
+#define CLK_CON_GAT_CLK_G2D_CMU_PCLK=09=090x2000
+#define CLK_CON_GAT_CLK_G2D_OSCCLK_CLK=09=090x2004
+#define CLK_CON_GAT_GOUT_G2D_AS_AXI_JPEG_ACLKM=090x2008
+#define CLK_CON_GAT_GOUT_G2D_AS_AXI_JPEG_ACLKS=090x200c
+#define CLK_CON_GAT_GOUT_G2D_AS_AXI_MSCL_ACLKM=090x2010
+#define CLK_CON_GAT_GOUT_G2D_AS_AXI_MSCL_ACLKS=090x2014
+#define CLK_CON_GAT_GOUT_G2D_CLK_G2D_G2D=090x2018
+#define CLK_CON_GAT_GOUT_G2D_CLK_G2D_MSCL=090x201c
+#define CLK_CON_GAT_GOUT_G2D_BTM_G2D_ACLK=090x2020
+#define CLK_CON_GAT_GOUT_G2D_BTM_G2D_PCLK=090x2024
+#define CLK_CON_GAT_GOUT_G2D_G2D_ACLK=09=090x2028
+#define CLK_CON_GAT_GOUT_G2D_JPEG_FIMP_CLK=090x202c
+#define CLK_CON_GAT_GOUT_G2D_LHM_AXI_P_CLK=090x2030
+#define CLK_CON_GAT_GOUT_G2D_LHS_ACEL_D_CLK=090x2034
+#define CLK_CON_GAT_GOUT_G2D_MSCL_ACLK=09=090x2038
+#define CLK_CON_GAT_GOUT_G2D_PGEN100_LITE_CLK=090x203c
+#define CLK_CON_GAT_GOUT_G2D_PPMU_ACLK=09=090x2040
+#define CLK_CON_GAT_GOUT_G2D_PPMU_PCLK=09=090x2044
+#define CLK_CON_GAT_GOUT_G2D_BUSP_CLK=09=090x2048
+#define CLK_CON_GAT_GOUT_G2D_G2D_CLK=09=090x204c
+#define CLK_CON_GAT_GOUT_G2D_MSCL_CLK=09=090x2050
+#define CLK_CON_GAT_GOUT_G2D_SYSMMU_CLK=09=090x2054
+#define CLK_CON_GAT_GOUT_G2D_SYSREG_PCLK=090x2058
+#define CLK_CON_GAT_GOUT_G2D_XIU_D_MSCL_ACLK=090x205c
+
+static const unsigned long g2d_clk_regs[] __initconst =3D {
+=09PLL_CON0_MUX_CLKCMU_G2D_G2D_USER,
+=09PLL_CON2_MUX_CLKCMU_G2D_G2D_USER,
+=09PLL_CON0_MUX_CLKCMU_G2D_MSCL_USER,
+=09PLL_CON2_MUX_CLKCMU_G2D_MSCL_USER,
+=09CLK_CON_DIV_DIV_CLK_G2D_BUSP,
+=09CLK_CON_GAT_CLK_G2D_CMU_PCLK,
+=09CLK_CON_GAT_CLK_G2D_OSCCLK_CLK,
+=09CLK_CON_GAT_GOUT_G2D_AS_AXI_JPEG_ACLKM,
+=09CLK_CON_GAT_GOUT_G2D_AS_AXI_JPEG_ACLKS,
+=09CLK_CON_GAT_GOUT_G2D_AS_AXI_MSCL_ACLKM,
+=09CLK_CON_GAT_GOUT_G2D_AS_AXI_MSCL_ACLKS,
+=09CLK_CON_GAT_GOUT_G2D_CLK_G2D_G2D,
+=09CLK_CON_GAT_GOUT_G2D_CLK_G2D_MSCL,
+=09CLK_CON_GAT_GOUT_G2D_BTM_G2D_ACLK,
+=09CLK_CON_GAT_GOUT_G2D_BTM_G2D_PCLK,
+=09CLK_CON_GAT_GOUT_G2D_G2D_ACLK,
+=09CLK_CON_GAT_GOUT_G2D_JPEG_FIMP_CLK,
+=09CLK_CON_GAT_GOUT_G2D_LHM_AXI_P_CLK,
+=09CLK_CON_GAT_GOUT_G2D_LHS_ACEL_D_CLK,
+=09CLK_CON_GAT_GOUT_G2D_MSCL_ACLK,
+=09CLK_CON_GAT_GOUT_G2D_PGEN100_LITE_CLK,
+=09CLK_CON_GAT_GOUT_G2D_PPMU_ACLK,
+=09CLK_CON_GAT_GOUT_G2D_PPMU_PCLK,
+=09CLK_CON_GAT_GOUT_G2D_BUSP_CLK,
+=09CLK_CON_GAT_GOUT_G2D_G2D_CLK,
+=09CLK_CON_GAT_GOUT_G2D_MSCL_CLK,
+=09// CLK_CON_GAT_GOUT_G2D_SYSMMU_CLK, // wronly
+=09CLK_CON_GAT_GOUT_G2D_SYSREG_PCLK,
+=09CLK_CON_GAT_GOUT_G2D_XIU_D_MSCL_ACLK,
+};
+
+PNAME(mout_pll_g2d_g2d_user_p) =3D { "oscclk", "dout_cmu_g2d_g2d" };
+PNAME(mout_pll_g2d_mscl_user_p) =3D { "oscclk", "dout_cmu_g2d_mscl" };
+
+static const struct samsung_mux_clock g2d_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_PLL_G2D_G2D_USER, "mout_pll_g2d_g2d_user", mout_pll_g2d_g2=
d_user_p,
+=09    PLL_CON0_MUX_CLKCMU_G2D_G2D_USER, 4, 1),
+=09MUX(CLK_MOUT_PLL_G2D_MSCL_USER, "mout_pll_g2d_mscl_user", mout_pll_g2d_=
mscl_user_p,
+=09    PLL_CON0_MUX_CLKCMU_G2D_MSCL_USER, 4, 1),
+};
+
+static const struct samsung_div_clock g2d_div_clks[] __initconst =3D {
+=09DIV(CLK_DOUT_CLK_G2D_BUSP, "dout_clk_g2d_busp", "mout_pll_g2d_mscl_user=
",
+=09    CLK_CON_DIV_DIV_CLK_G2D_BUSP, 0, 3),
+};
+
+static const struct samsung_gate_clock g2d_gate_clks[] __initconst =3D {
+=09GATE(CLK_GOUT_CLK_G2D_CMU_PCLK, "gout_clk_g2d_cmu_pclk", "dout_clk_g2d_=
busp",
+=09     CLK_CON_GAT_CLK_G2D_CMU_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_G2D_OSCCLK_CLK, "gout_clk_g2d_oscclk_clk", "oscclk",
+=09     CLK_CON_GAT_CLK_G2D_OSCCLK_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_AS_AXI_JPEG_ACLKM, "gout_g2d_as_axi_jpeg_aclkm",
+=09     "mout_pll_g2d_g2d_user", CLK_CON_GAT_GOUT_G2D_AS_AXI_JPEG_ACLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_AS_AXI_JPEG_ACLKS, "gout_g2d_as_axi_jpeg_aclks",
+=09     "mout_pll_g2d_mscl_user", CLK_CON_GAT_GOUT_G2D_AS_AXI_JPEG_ACLKS,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_AS_AXI_MSCL_ACLKM, "gout_g2d_as_axi_mscl_aclkm",
+=09     "mout_pll_g2d_g2d_user", CLK_CON_GAT_GOUT_G2D_AS_AXI_MSCL_ACLKM,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_AS_AXI_MSCL_ACLKS, "gout_g2d_as_axi_mscl_aclks",
+=09     "mout_pll_g2d_mscl_user", CLK_CON_GAT_GOUT_G2D_AS_AXI_MSCL_ACLKS,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_CLK_G2D_G2D, "gout_g2d_clk_g2d_g2d", "mout_pll_g2d_g2=
d_user",
+=09     CLK_CON_GAT_GOUT_G2D_CLK_G2D_G2D, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_CLK_G2D_MSCL, "gout_g2d_clk_g2d_mscl", "mout_pll_g2d_=
mscl_user",
+=09     CLK_CON_GAT_GOUT_G2D_CLK_G2D_MSCL, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_BTM_G2D_ACLK, "gout_g2d_btm_g2d_aclk", "mout_pll_g2d_=
g2d_user",
+=09     CLK_CON_GAT_GOUT_G2D_BTM_G2D_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_BTM_G2D_PCLK, "gout_g2d_btm_g2d_pclk", "dout_clk_g2d_=
busp",
+=09     CLK_CON_GAT_GOUT_G2D_BTM_G2D_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_G2D_ACLK, "gout_g2d_g2d_aclk", "mout_pll_g2d_g2d_user=
",
+=09     CLK_CON_GAT_GOUT_G2D_G2D_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_JPEG_FIMP_CLK, "gout_g2d_jpeg_fimp_clk", "mout_pll_g2=
d_mscl_user",
+=09     CLK_CON_GAT_GOUT_G2D_JPEG_FIMP_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_LHM_AXI_P_CLK, "gout_g2d_lhm_axi_p_clk", "dout_clk_g2=
d_busp",
+=09     CLK_CON_GAT_GOUT_G2D_LHM_AXI_P_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_LHS_ACEL_D_CLK, "gout_g2d_lhs_acel_d_clk", "mout_pll_=
g2d_mscl_user",
+=09     CLK_CON_GAT_GOUT_G2D_LHS_ACEL_D_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_MSCL_ACLK, "gout_g2d_mscl_aclk", "mout_pll_g2d_mscl_u=
ser",
+=09     CLK_CON_GAT_GOUT_G2D_MSCL_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_PGEN100_LITE_CLK, "gout_g2d_pgen100_lite_clk", "dout_=
clk_g2d_busp",
+=09     CLK_CON_GAT_GOUT_G2D_PGEN100_LITE_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_PPMU_ACLK, "gout_g2d_ppmu_aclk", "mout_pll_g2d_g2d_us=
er",
+=09     CLK_CON_GAT_GOUT_G2D_PPMU_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_PPMU_PCLK, "gout_g2d_ppmu_pclk", "dout_clk_g2d_busp",
+=09     CLK_CON_GAT_GOUT_G2D_PPMU_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_BUSP_CLK, "gout_g2d_busp_clk", "dout_clk_g2d_busp",
+=09     CLK_CON_GAT_GOUT_G2D_BUSP_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_SYSMMU_CLK, "gout_g2d_sysmmu_clk", "mout_pll_g2d_g2d_=
user",
+=09     CLK_CON_GAT_GOUT_G2D_SYSMMU_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G2D_SYSREG_PCLK, "gout_g2d_sysreg_pclk", "dout_clk_g2d_bu=
sp",
+=09     CLK_CON_GAT_GOUT_G2D_SYSREG_PCLK, 21, 0, 0),
+=09GATE(CLK_GOUT_G2D_XIU_D_MSCL_ACLK, "gout_g2d_xiu_d_mscl_aclk", "mout_pl=
l_g2d_g2d_user",
+=09     CLK_CON_GAT_GOUT_G2D_XIU_D_MSCL_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info g2d_cmu_info __initconst =3D {
+=09.mux_clks=09=09=3D g2d_mux_clks,
+=09.nr_mux_clks=09=09=3D ARRAY_SIZE(g2d_mux_clks),
+=09.div_clks=09=09=3D g2d_div_clks,
+=09.nr_div_clks=09=09=3D ARRAY_SIZE(g2d_div_clks),
+=09.gate_clks=09=09=3D g2d_gate_clks,
+=09.nr_gate_clks=09=09=3D ARRAY_SIZE(g2d_gate_clks),
+=09.clk_regs=09=09=3D g2d_clk_regs,
+=09.nr_clk_regs=09=09=3D ARRAY_SIZE(g2d_clk_regs),
+=09.nr_clk_ids=09=09=3D CLKS_NR_G2D,
+};
+
+/* CMU_G3D */
+#define PLL_LOCKTIME_PLL_G3D=09=09=090x0000
+#define PLL_CON0_MUX_CLKCMU_G3D_SWITCH_USER=090x0100
+#define PLL_CON2_MUX_CLKCMU_G3D_SWITCH_USER=090x0108
+#define PLL_CON0_PLL_G3D=09=09=090x0120
+#define CLK_CON_MUX_MUX_CLK_G3D_BUSD=09=090x1004
+#define CLK_CON_DIV_DIV_CLK_G3D_BUSD=09=090x1800
+#define CLK_CON_DIV_DIV_CLK_G3D_BUSP=09=090x1804
+#define CLK_CON_GAT_CLK_G3D_CMU_PCLK=09=090x2000
+#define CLK_CON_GAT_CLK_G3D_G3D_CLK=09=090x2004
+#define CLK_CON_GAT_CLK_G3D_HPM_TARGETCLK_C=090x2008
+#define CLK_CON_GAT_CLK_G3D_OSCCLK_CLK=09=090x200c
+#define CLK_CON_GAT_GOUT_G3D_BTM_G3D_ACLK=090x2014
+#define CLK_CON_GAT_GOUT_G3D_BTM_G3D_PCLK=090x2018
+#define CLK_CON_GAT_GOUT_G3D_BUSIF_HPMG3D_PCLK=090x201c
+#define CLK_CON_GAT_GOUT_G3D_GRAY2BIN_G3D_CLK=090x2020
+#define CLK_CON_GAT_GOUT_G3D_LHM_AXI_G3DSFR_CLK=090x2024
+#define CLK_CON_GAT_GOUT_G3D_LHM_AXI_P_G3D_CLK=090x2028
+#define CLK_CON_GAT_GOUT_G3D_LHS_AXI_D_G3D_CLK=090x202c
+#define CLK_CON_GAT_GOUT_G3D_LHS_AXI_G3DSFR_CLK=090x2030
+#define CLK_CON_GAT_GOUT_G3D_PGEN_LITE_G3D_CLK=090x2034
+#define CLK_CON_GAT_GOUT_G3D_BUSD_CLK=09=090x2038
+#define CLK_CON_GAT_GOUT_G3D_BUSP_CLK=09=090x203c
+#define CLK_CON_GAT_GOUT_G3D_SYSREG_PCLK=090x2040
+
+static const unsigned long g3d_clk_regs[] __initconst =3D {
+=09PLL_LOCKTIME_PLL_G3D,
+=09PLL_CON0_MUX_CLKCMU_G3D_SWITCH_USER,
+=09PLL_CON2_MUX_CLKCMU_G3D_SWITCH_USER,
+=09PLL_CON0_PLL_G3D,
+=09CLK_CON_MUX_MUX_CLK_G3D_BUSD,
+=09CLK_CON_DIV_DIV_CLK_G3D_BUSD,
+=09CLK_CON_DIV_DIV_CLK_G3D_BUSP,
+=09CLK_CON_GAT_CLK_G3D_CMU_PCLK,
+=09CLK_CON_GAT_CLK_G3D_G3D_CLK,
+=09CLK_CON_GAT_CLK_G3D_HPM_TARGETCLK_C,
+=09CLK_CON_GAT_CLK_G3D_OSCCLK_CLK,
+=09CLK_CON_GAT_GOUT_G3D_BTM_G3D_ACLK,
+=09CLK_CON_GAT_GOUT_G3D_BTM_G3D_PCLK,
+=09CLK_CON_GAT_GOUT_G3D_BUSIF_HPMG3D_PCLK,
+=09CLK_CON_GAT_GOUT_G3D_GRAY2BIN_G3D_CLK,
+=09CLK_CON_GAT_GOUT_G3D_LHM_AXI_G3DSFR_CLK,
+=09CLK_CON_GAT_GOUT_G3D_LHM_AXI_P_G3D_CLK,
+=09CLK_CON_GAT_GOUT_G3D_LHS_AXI_D_G3D_CLK,
+=09CLK_CON_GAT_GOUT_G3D_LHS_AXI_G3DSFR_CLK,
+=09CLK_CON_GAT_GOUT_G3D_PGEN_LITE_G3D_CLK,
+=09CLK_CON_GAT_GOUT_G3D_BUSD_CLK,
+=09CLK_CON_GAT_GOUT_G3D_BUSP_CLK,
+=09CLK_CON_GAT_GOUT_G3D_SYSREG_PCLK,
+};
+
+static const struct samsung_pll_rate_table pll_g3d_rate_table[] __initcons=
t =3D {
+=09PLL_35XX_RATE(26 * MHZ, 750000000, 375, 13, 0),
+=09PLL_35XX_RATE(26 * MHZ, 1000000000, 500, 13, 0),
+=09PLL_35XX_RATE(26 * MHZ, 1200000000, 600, 13, 0),
+=09PLL_35XX_RATE(26 * MHZ, 330000000, 660, 13, 2),
+=09PLL_35XX_RATE(26 * MHZ, 550000000, 550, 13, 1),
+};
+
+static const struct samsung_pll_clock g3d_pll_clks[] __initconst =3D {
+=09PLL(pll_1052x, CLK_FOUT_G3D_PLL, "fout_g3d_pll", "oscclk",
+=09    PLL_LOCKTIME_PLL_G3D, PLL_CON0_PLL_G3D,
+=09    pll_g3d_rate_table),
+};
+
+PNAME(mout_g3d_switch_user_p)=09=3D { "oscclk", "dout_cmu_g3d_switch" };
+PNAME(mout_clk_g3d_busd_p)=09=3D { "fout_g3d_pll",
+=09=09=09=09    "mout_g3d_switch_user" };
+
+static const struct samsung_mux_clock g3d_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_G3D_SWITCH_USER, "mout_g3d_switch_user", mout_g3d_switch_u=
ser_p,
+=09    PLL_CON0_MUX_CLKCMU_G3D_SWITCH_USER, 4, 1),
+=09MUX(CLK_MOUT_CLK_G3D_BUSD, "mout_clk_g3d_busd", mout_clk_g3d_busd_p,
+=09    CLK_CON_MUX_MUX_CLK_G3D_BUSD, 0, 1),
+};
+
+static const struct samsung_div_clock g3d_div_clks[] __initconst =3D {
+=09DIV(CLK_DOUT_CLK_G3D_BUSD, "dout_clk_g3d_busd", "mout_clk_g3d_busd",
+=09    CLK_CON_DIV_DIV_CLK_G3D_BUSD, 0, 1),
+=09DIV(CLK_DOUT_CLK_G3D_BUSP, "dout_clk_g3d_busp", "mout_clk_g3d_busd",
+=09    CLK_CON_DIV_DIV_CLK_G3D_BUSP, 0, 3),
+};
+
+static const struct samsung_gate_clock g3d_gate_clks[] __initconst =3D {
+=09GATE(CLK_GOUT_CLK_G3D_CMU_PCLK, "gout_clk_g3d_cmu_pclk", "dout_clk_g3d_=
busp",
+=09     CLK_CON_GAT_CLK_G3D_CMU_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_G3D_G3D_CLK, "gout_clk_g3d_g3d_clk", "dout_clk_g3d_bu=
sd",
+=09     CLK_CON_GAT_CLK_G3D_G3D_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_G3D_HPM_TARGETCLK_C, "gout_clk_g3d_hpm_targetclk_c",
+=09     "dout_cmu_hpm", CLK_CON_GAT_CLK_G3D_HPM_TARGETCLK_C, 21, CLK_IGNOR=
E_UNUSED, 0),
+=09GATE(CLK_GOUT_CLK_G3D_OSCCLK_CLK, "gout_clk_g3d_oscclk_clk", "oscclk",
+=09     CLK_CON_GAT_CLK_G3D_OSCCLK_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_BTM_G3D_ACLK, "gout_g3d_btm_g3d_aclk", "dout_clk_g3d_=
busd",
+=09     CLK_CON_GAT_GOUT_G3D_BTM_G3D_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_BTM_G3D_PCLK, "gout_g3d_btm_g3d_pclk", "dout_clk_g3d_=
busp",
+=09     CLK_CON_GAT_GOUT_G3D_BTM_G3D_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_BUSIF_HPMG3D_PCLK, "gout_g3d_busif_hpmg3d_pclk",
+=09     "dout_clk_g3d_busp", CLK_CON_GAT_GOUT_G3D_BUSIF_HPMG3D_PCLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_GRAY2BIN_G3D_CLK, "gout_g3d_gray2bin_g3d_clk",
+=09     "dout_clk_g3d_busd", CLK_CON_GAT_GOUT_G3D_GRAY2BIN_G3D_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_LHM_AXI_G3DSFR_CLK, "gout_g3d_lhm_axi_g3dsfr_clk",
+=09     "dout_clk_g3d_busd", CLK_CON_GAT_GOUT_G3D_LHM_AXI_G3DSFR_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_LHM_AXI_P_G3D_CLK, "gout_g3d_lhm_axi_p_g3d_clk",
+=09     "dout_clk_g3d_busp", CLK_CON_GAT_GOUT_G3D_LHM_AXI_P_G3D_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_LHS_AXI_D_G3D_CLK, "gout_g3d_lhs_axi_d_g3d_clk",
+=09     "dout_clk_g3d_busd", CLK_CON_GAT_GOUT_G3D_LHS_AXI_D_G3D_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_LHS_AXI_G3DSFR_CLK, "gout_g3d_lhs_axi_g3dsfr_clk",
+=09     "dout_clk_g3d_busp", CLK_CON_GAT_GOUT_G3D_LHS_AXI_G3DSFR_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_PGEN_LITE_G3D_CLK, "gout_g3d_pgen_lite_g3d_clk",
+=09     "dout_clk_g3d_busp", CLK_CON_GAT_GOUT_G3D_PGEN_LITE_G3D_CLK,
+=09     21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_BUSD_CLK, "gout_g3d_busd_clk", "dout_clk_g3d_busd",
+=09     CLK_CON_GAT_GOUT_G3D_BUSD_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_BUSP_CLK, "gout_g3d_busp_clk", "dout_clk_g3d_busp",
+=09     CLK_CON_GAT_GOUT_G3D_BUSP_CLK, 21, CLK_IGNORE_UNUSED, 0),
+=09GATE(CLK_GOUT_G3D_SYSREG_PCLK, "gout_g3d_sysreg_pclk", "dout_clk_g3d_bu=
sp",
+=09     CLK_CON_GAT_GOUT_G3D_SYSREG_PCLK, 21, 0, 0),
+};
+
+static const struct samsung_cmu_info g3d_cmu_info __initconst =3D {
+=09.pll_clks=09=09=3D g3d_pll_clks,
+=09.nr_pll_clks=09=09=3D ARRAY_SIZE(g3d_pll_clks),
+=09.mux_clks=09=09=3D g3d_mux_clks,
+=09.nr_mux_clks=09=09=3D ARRAY_SIZE(g3d_mux_clks),
+=09.div_clks=09=09=3D g3d_div_clks,
+=09.nr_div_clks=09=09=3D ARRAY_SIZE(g3d_div_clks),
+=09.gate_clks=09=09=3D g3d_gate_clks,
+=09.nr_gate_clks=09=09=3D ARRAY_SIZE(g3d_gate_clks),
+=09.clk_regs=09=09=3D g3d_clk_regs,
+=09.nr_clk_regs=09=09=3D ARRAY_SIZE(g3d_clk_regs),
+=09.nr_clk_ids=09=09=3D CLKS_NR_G3D,
+};
+
+static int __init exynos9610_cmu_probe(struct platform_device *pdev)
+{
+=09const struct samsung_cmu_info *info;
+=09struct device *dev =3D &pdev->dev;
+
+=09info =3D of_device_get_match_data(dev);
+=09exynos_arm64_register_cmu(dev, dev->of_node, info);
+
+=09return 0;
+}
+
+static const struct of_device_id exynos9610_cmu_of_match[] =3D {
+=09{
+=09=09.compatible =3D "samsung,exynos9610-cmu-cam",
+=09=09.data =3D &cam_cmu_info,
+=09},
+=09{
+=09=09.compatible =3D "samsung,exynos9610-cmu-cmgp",
+=09=09.data =3D &cmgp_cmu_info,
+=09},
+=09{
+=09=09.compatible =3D "samsung,exynos9610-cmu-core",
+=09=09.data =3D &core_cmu_info,
+=09},
+=09{
+=09=09.compatible =3D "samsung,exynos9610-cmu-dispaud",
+=09=09.data =3D &dispaud_cmu_info,
+=09},
+=09{
+=09=09.compatible =3D "samsung,exynos9610-cmu-fsys",
+=09=09.data =3D &fsys_cmu_info,
+=09},
+=09{
+=09=09.compatible =3D "samsung,exynos9610-cmu-g2d",
+=09=09.data =3D &g2d_cmu_info,
+=09},
+=09{
+=09=09.compatible =3D "samsung,exynos9610-cmu-g3d",
+=09=09.data =3D &g3d_cmu_info,
+=09},
+=09{ }
+};
+
+static struct platform_driver exynos9610_cmu_driver __refdata =3D {
+=09.driver =3D {
+=09=09.name =3D "exynos9610-cmu",
+=09=09.of_match_table =3D exynos9610_cmu_of_match,
+=09=09.suppress_bind_attrs =3D true,
+=09},
+=09.probe =3D exynos9610_cmu_probe,
+};
+
+static int __init exynos9610_cmu_init(void)
+{
+=09return platform_driver_register(&exynos9610_cmu_driver);
+}
+core_initcall(exynos9610_cmu_init);

--=20
2.47.3


