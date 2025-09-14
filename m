Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8731D27B6;
	Sun, 14 Sep 2025 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757884773; cv=none; b=hvNgG3lmi2jc67/9qpN7HT8LN1cmkqn3vxYx75n9HwRSuPNY4n2JbWBiKbT+XXCsGtm6tkEv0r3ADAQOypvpprBIsPjyDSWMBg3WJ7eRgBRL9jEnvI04pyHJ4WkUgj3Y36twP8Q+2XLfqe9dC58fXGrZre5y7WH41Dj52VpHeY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757884773; c=relaxed/simple;
	bh=Tm2tkgwVfm/rSf7qiWCn1fx12NZ369907uxKBQf5w8w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lsUMpXKdcMfs8FFXpzoNbQR3oQ/1Pmdgb8vbvrLeGTSaoLS5ZaZX3SFaFNrU1z9W8Deya9D5tsRmuHuD+nCg5em6SK7MYp3Hy/nUm56AhlUcoswfNqdgCZDhA68t05YzDawerhkH9vibQIq67RoRZo9IHprlyDtaeCzUmKCOaUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=QPVwBSgi; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="QPVwBSgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757884766; x=1758143966;
	bh=ODo9UZb3u8FT/19zOvc129UIw6FeGXUJ4RZq5xtxicA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QPVwBSgiLx0eZe6+FLy7vrDu8jE3VfAzFUD4QKvATByGhBZ2/qe7nxO949Ytj4klz
	 aVA52nUmF6iUQZdjIqlsNLrl6kA/bd5CFpAlAaI3C9R6vKVD1awWteIhHqlhgcrFwp
	 WzTmhJT9Ozt5saJWhcEkeVeGX+EsRDt/4K2UumjAGamRbojrKiaSCf6GSj4SNK5LKa
	 vjm04Esk1F1yXI1GYh+EQJmKCfu65f4RKorXln+nfmY11/2BIbkjjCzZ5j4WzvqNYP
	 LUargAibrr1BYqSrwLuvOmanSkW0H8v8lQ4GErvYSqyzbd09BN+aXCJ5o3eCCX6ZLz
	 w6vukq/mFkb1Q==
Date: Sun, 14 Sep 2025 21:19:19 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandru Chimac <alexchimac@protonmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 1/8] dt-bindings: clock: samsung: Add Exynos9610 CMU bindings
Message-ID: <20250915-exynos9610-clocks-v1-1-3f615022b178@chimac.ro>
In-Reply-To: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: b15908df5025982c6643690b9c1fe0b5d1b7c07b
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This clock management unit has a topmost block (CMU_TOP)
that generates top clocks for other blocks, alongside 20
other blocks, out of which 11 are currently implemented.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 .../bindings/clock/samsung,exynos9610-clock.yaml   | 344 ++++++++++
 include/dt-bindings/clock/samsung,exynos9610.h     | 720 +++++++++++++++++=
++++
 2 files changed, 1064 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos9610-clo=
ck.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos9610-clock.=
yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f3b7bc49a6ab18c5dd3c54d1f5f=
cdb7a67d15668
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos9610-clock.yaml
@@ -0,0 +1,344 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos9610-clock.yaml
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos9610 SoC clock controller
+
+maintainers:
+  - Alexandru Chimac <alexchimac@protonmail.com>
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |
+  Exynos9610 clock controller is comprised of several CMU units, generatin=
g
+  clocks for different domains. Those CMU units are modeled as separate de=
vice
+  tree nodes, and might depend on each other. Root clocks in that clock tr=
ee are
+  three external clocks:: OSCCLK (26MHz), DLL_DCO (360MHz), OSCCLK_RCO (CM=
GP, 30MHz).
+  The external OSCCLK must be defined as fixed-rate clock in the device tr=
ee.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLL=
s
+  and dividers; all other clocks of function blocks (other CMUs) are usual=
ly derived
+  from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this ident=
ifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros
+  in 'include/dt-bindings/clock/samsung,exynos9610.h'.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos9610-cmu-top
+      - samsung,exynos9610-cmu-apm
+      - samsung,exynos9610-cmu-cam
+      - samsung,exynos9610-cmu-cmgp
+      - samsung,exynos9610-cmu-core
+      - samsung,exynos9610-cmu-cpucl0
+      - samsung,exynos9610-cmu-cpucl1
+      - samsung,exynos9610-cmu-dispaud
+      - samsung,exynos9610-cmu-fsys
+      - samsung,exynos9610-cmu-g2d
+      - samsung,exynos9610-cmu-g3d
+      - samsung,exynos9610-cmu-peri
+
+  clocks:
+    minItems: 1
+    maxItems: 7
+
+  clock-names:
+    minItems: 1
+    maxItems: 7
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-apm
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: External reference clock (360Mhz)
+            - description: CMU_APM bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dll_dco
+            - const: dout_cmu_apm_bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-cam
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: CMU_CAM bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_cam_bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-cmgp
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: External reference clock (30MHz)
+            - description: CMU_CMGP bus clock (from CMU_APM)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: oscclk_rco
+            - const: gout_cmu_cmgp_bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-core
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: CMU_CORE bus clock (from CMU_TOP)
+            - description: CMU_CORE CCI clock (from CMU_TOP)
+            - description: CMU_CORE G3D clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gout_cmu_core_bus
+            - const: gout_cmu_core_cci
+            - const: gout_cmu_core_g3d
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-cpucl0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: CMU_CPUCL0 debug clock (from CMU_TOP)
+            - description: CMU_CPUCL0 switch clock (from CMU_TOP)
+            - description: HPM clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_cpucl0_dbg
+            - const: dout_cmu_cpucl0_switch
+            - const: dout_cmu_hpm
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-cpucl1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: CMU_CPUCL1 switch clock (from CMU_TOP)
+            - description: HPM clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_cpucl1_switch
+            - const: dout_cmu_hpm
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-dispaud
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: External reference clock (10Mhz)
+            - description: External reference clock (100Mhz)
+            - description: External reference clock (60Mhz)
+            - description: CMU_DISPAUD audio clock (from CMU_TOP)
+            - description: CMU_DISPAUD CPU clock (from CMU_TOP)
+            - description: CMU_DISPAUD display clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: ioclk_audiocdclk0
+            - const: ioclk_audiocdclk1
+            - const: tick_usb
+            - const: dout_cmu_dispaud_aud
+            - const: dout_cmu_dispaud_cpu
+            - const: dout_cmu_dispaud_disp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-fsys
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: CMU_FSYS bus clock (from CMU_TOP)
+            - description: CMU_FSYS external MMC clock (from CMU_TOP)
+            - description: CMU_FSYS embedded MMC clock (from CMU_TOP)
+            - description: CMU_FSYS embedded UFS clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_fsys_bus
+            - const: dout_cmu_fsys_mmc_card
+            - const: dout_cmu_fsys_mmc_embd
+            - const: dout_cmu_fsys_ufs_embd
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-g2d
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: CMU_G2D G2D clock (from CMU_TOP)
+            - description: CMU_G2D MSCL clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_g2d_g2d
+            - const: dout_cmu_g2d_mscl
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-g3d
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: CMU_G3D switch clock (from CMU_TOP)
+            - description: HPM clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_g3d_switch
+            - const: dout_cmu_hpm
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos9610-cmu-peri
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26MHz)
+            - description: CMU_PERI bus clock (from CMU_TOP)
+            - description: CMU_PERI IP clock (from CMU_TOP)
+            - description: CMU_PERI UART clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_peri_bus
+            - const: dout_cmu_peri_ip
+            - const: dout_cmu_peri_uart
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_FSYS
+  - |
+    #include <dt-bindings/clock/samsung,exynos9610.h>
+
+    cmu_fsys: clock-controller@13400000 {
+        compatible =3D "samsung,exynos9610-cmu-fsys";
+        reg =3D <0x13400000 0x8000>;
+        #clock-cells =3D <1>
+
+        clocks =3D <&oscclk>,
+                 <&cmu_top CLK_DOUT_CMU_FSYS_BUS>,
+                 <&cmu_top CLK_DOUT_CMU_FSYS_MMC_CARD>,
+                 <&cmu_top CLK_DOUT_CMU_FSYS_MMC_EMBD>,
+                 <&cmu_top CLK_DOUT_CMU_FSYS_UFS_EMBD>,
+
+        clock-names =3D "oscclk",
+                      "dout_cmu_fsys_bus",
+                      "dout_cmu_fsys_mmc_card",
+                      "dout_cmu_fsys_mmc_embd",
+                      "dout_cmu_fsys_ufs_embd";
+    };
+...
diff --git a/include/dt-bindings/clock/samsung,exynos9610.h b/include/dt-bi=
ndings/clock/samsung,exynos9610.h
new file mode 100644
index 0000000000000000000000000000000000000000..047c35fd8bf133996aaa185f9c8=
e5457499e707e
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos9610.h
@@ -0,0 +1,720 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Device tree binding constants for Exynos9610 clocks
+ *
+ * Copyright (c) 2025, Alexandru Chimac <alex@chimac.ro>
+ */
+
+/* CMU_TOP PLLs */
+#define CLK_FOUT_SHARED0_PLL=09=091
+#define CLK_FOUT_SHARED1_PLL=09=092
+#define CLK_FOUT_MMC_PLL=09=093
+
+/* CMU_TOP muxes */
+#define CLK_MOUT_PLL_SHARED0=09=094
+#define CLK_MOUT_PLL_SHARED1=09=095
+#define CLK_MOUT_PLL_MMC=09=096
+#define CLK_MOUT_CMU_APM_BUS=09=097
+#define CLK_MOUT_CMU_CAM_BUS=09=098
+#define CLK_MOUT_CMU_CIS_CLK0=09=099
+#define CLK_MOUT_CMU_CIS_CLK1=09=0910
+#define CLK_MOUT_CMU_CIS_CLK2=09=0911
+#define CLK_MOUT_CMU_CIS_CLK3=09=0912
+#define CLK_MOUT_CMU_CORE_BUS=09=0913
+#define CLK_MOUT_CMU_CORE_CCI=09=0914
+#define CLK_MOUT_CMU_CORE_G3D=09=0915
+#define CLK_MOUT_CMU_CPUCL0_DBG=09=0916
+#define CLK_MOUT_CMU_CPUCL0_SWITCH=0917
+#define CLK_MOUT_CMU_CPUCL1_SWITCH=0918
+#define CLK_MOUT_CMU_DISPAUD_AUD=0919
+#define CLK_MOUT_CMU_DISPAUD_CPU=0920
+#define CLK_MOUT_CMU_DISPAUD_DISP=0921
+#define CLK_MOUT_CMU_FSYS_BUS=09=0922
+#define CLK_MOUT_CMU_FSYS_MMC_CARD=0923
+#define CLK_MOUT_CMU_FSYS_MMC_EMBD=0924
+#define CLK_MOUT_CMU_FSYS_UFS_EMBD=0925
+#define CLK_MOUT_CMU_G2D_G2D=09=0926
+#define CLK_MOUT_CMU_G2D_MSCL=09=0927
+#define CLK_MOUT_CMU_G3D_SWITCH=09=0928
+#define CLK_MOUT_CMU_HPM=09=0929
+#define CLK_MOUT_CMU_ISP_BUS=09=0930
+#define CLK_MOUT_CMU_ISP_GDC=09=0931
+#define CLK_MOUT_CMU_ISP_VRA=09=0932
+#define CLK_MOUT_CMU_MFC_MFC=09=0933
+#define CLK_MOUT_CMU_MFC_WFD=09=0934
+#define CLK_MOUT_CMU_MIF_BUSP=09=0935
+#define CLK_MOUT_CMU_MIF_SWITCH=09=0936
+#define CLK_MOUT_CMU_PERI_BUS=09=0937
+#define CLK_MOUT_CMU_PERI_IP=09=0938
+#define CLK_MOUT_CMU_PERI_UART=09=0939
+#define CLK_MOUT_CMU_USB_BUS=09=0940
+#define CLK_MOUT_CMU_USB_DPGTC=09=0941
+#define CLK_MOUT_CMU_USB_USB30DRD=0942
+#define CLK_MOUT_CMU_VIPX1_BUS=09=0943
+#define CLK_MOUT_CMU_VIPX2_BUS=09=0944
+#define CLK_MOUT_CLK_CMU_CMUREF=09=0945
+#define CLK_MOUT_CMU_CMUREF=09=0946
+
+/* CMU_TOP dividers */
+#define CLK_DOUT_CMU_SHARED0_DIV2=0947
+#define CLK_DOUT_CMU_SHARED0_DIV3=0948
+#define CLK_DOUT_CMU_SHARED0_DIV4=0949
+#define CLK_DOUT_CMU_SHARED1_DIV2=0950
+#define CLK_DOUT_CMU_SHARED1_DIV3=0951
+#define CLK_DOUT_CMU_SHARED1_DIV4=0952
+#define CLK_DOUT_CMU_MMC_DIV2=09=0953
+#define CLK_DOUT_AP2CP_SHARED0_PLL_CLK=0954
+#define CLK_DOUT_AP2CP_SHARED1_PLL_CLK=0955
+#define CLK_DOUT_CMU_APM_BUS=09=0956
+#define CLK_DOUT_CMU_CAM_BUS=09=0957
+#define CLK_DOUT_CMU_CIS_CLK0=09=0958
+#define CLK_DOUT_CMU_CIS_CLK1=09=0959
+#define CLK_DOUT_CMU_CIS_CLK2=09=0960
+#define CLK_DOUT_CMU_CIS_CLK3=09=0961
+#define CLK_DOUT_CMU_CORE_BUS=09=0962
+#define CLK_DOUT_CMU_CORE_CCI=09=0963
+#define CLK_DOUT_CMU_CORE_G3D=09=0964
+#define CLK_DOUT_CMU_CPUCL0_DBG=09=0965
+#define CLK_DOUT_CMU_CPUCL0_SWITCH=0966
+#define CLK_DOUT_CMU_CPUCL1_SWITCH=0967
+#define CLK_DOUT_CMU_DISPAUD_AUD=0968
+#define CLK_DOUT_CMU_DISPAUD_CPU=0969
+#define CLK_DOUT_CMU_DISPAUD_DISP=0970
+#define CLK_DOUT_CMU_FSYS_BUS=09=0971
+#define CLK_DOUT_CMU_FSYS_MMC_CARD=0972
+#define CLK_DOUT_CMU_FSYS_MMC_EMBD=0973
+#define CLK_DOUT_CMU_FSYS_UFS_EMBD=0974
+#define CLK_DOUT_CMU_G2D_G2D=09=0975
+#define CLK_DOUT_CMU_G2D_MSCL=09=0976
+#define CLK_DOUT_CMU_G3D_SWITCH=09=0977
+#define CLK_DOUT_CMU_HPM=09=0978
+#define CLK_DOUT_CMU_ISP_BUS=09=0979
+#define CLK_DOUT_CMU_ISP_GDC=09=0980
+#define CLK_DOUT_CMU_ISP_VRA=09=0981
+#define CLK_DOUT_CMU_MFD_MFC=09=0982
+#define CLK_DOUT_CMU_MFD_WFD=09=0983
+#define CLK_DOUT_CMU_MIF_BUSP=09=0984
+#define CLK_DOUT_CMU_PERI_BUS=09=0985
+#define CLK_DOUT_CMU_PERI_IP=09=0986
+#define CLK_DOUT_CMU_PERI_UART=09=0987
+#define CLK_DOUT_CMU_USB_BUS=09=0988
+#define CLK_DOUT_CMU_USB_DPGTC=09=0989
+#define CLK_DOUT_CMU_USB_USB30DRD=0990
+#define CLK_DOUT_CMU_VIPX1_BUS=09=0991
+#define CLK_DOUT_CMU_VIPX2_BUS=09=0992
+#define CLK_DOUT_CLK_CMU_CMUREF=09=0993
+#define CLK_DOUT_CMU_OTP=09=0994
+
+/* CMU_TOP gates */
+#define CLK_GOUT_CMU_MIF_SWITCH=09=0995
+#define CLK_GOUT_CLK_CMU_OTP_CLK=0996
+#define CLK_GOUT_CMU_APM_BUS=09=0997
+#define CLK_GOUT_CMU_CAM_BUS=09=0998
+#define CLK_GOUT_CMU_CIS_CLK0=09=0999
+#define CLK_GOUT_CMU_CIS_CLK1=09=09100
+#define CLK_GOUT_CMU_CIS_CLK2=09=09101
+#define CLK_GOUT_CMU_CIS_CLK3=09=09102
+#define CLK_GOUT_CMU_CORE_BUS=09=09103
+#define CLK_GOUT_CMU_CORE_CCI=09=09104
+#define CLK_GOUT_CMU_CORE_G3D=09=09105
+#define CLK_GOUT_CMU_CPUCL0_DBG=09=09106
+#define CLK_GOUT_CMU_CPUCL0_SWITCH=09107
+#define CLK_GOUT_CMU_CPUCL1_SWITCH=09108
+#define CLK_GOUT_CMU_DISPAUD_AUD=09109
+#define CLK_GOUT_CMU_DISPAUD_CPU=09110
+#define CLK_GOUT_CMU_DISPAUD_DISP=09111
+#define CLK_GOUT_CMU_FSYS_BUS=09=09112
+#define CLK_GOUT_CMU_FSYS_MMC_CARD=09113
+#define CLK_GOUT_CMU_FSYS_MMC_EMBD=09114
+#define CLK_GOUT_CMU_FSYS_UFS_EMBD=09115
+#define CLK_GOUT_CMU_G2D_G2D=09=09116
+#define CLK_GOUT_CMU_G2D_MSCL=09=09117
+#define CLK_GOUT_CMU_G3D_SWITCH=09=09118
+#define CLK_GOUT_CMU_HPM=09=09119
+#define CLK_GOUT_CMU_ISP_BUS=09=09120
+#define CLK_GOUT_CMU_ISP_GDC=09=09121
+#define CLK_GOUT_CMU_ISP_VRA=09=09122
+#define CLK_GOUT_CMU_MFC_MFC=09=09123
+#define CLK_GOUT_CMU_MFC_WFD=09=09124
+#define CLK_GOUT_CMU_MIF_BUSP=09=09125
+#define CLK_GOUT_CMU_MODEM_SHARED0=09126
+#define CLK_GOUT_CMU_MODEM_SHARED1=09127
+#define CLK_GOUT_CMU_PERI_BUS=09=09128
+#define CLK_GOUT_CMU_PERI_IP=09=09129
+#define CLK_GOUT_CMU_PERI_UART=09=09130
+#define CLK_GOUT_CMU_USB_BUS=09=09131
+#define CLK_GOUT_CMU_USB_DPGTC=09=09132
+#define CLK_GOUT_CMU_USB_USB30DRD=09133
+#define CLK_GOUT_CMU_VIPX1_BUS=09=09134
+#define CLK_GOUT_CMU_VIPX2_BUS=09=09135
+
+/* CMU_APM muxes */
+#define CLK_MOUT_PLL_APM_BUS_USER=09=091
+#define CLK_MOUT_PLL_DLL_USER=09=09=092
+#define CLK_MOUT_CMU_SHUB_BUS=09=09=093
+#define CLK_MOUT_CLK_APM_BUS=09=09=094
+
+/* CMU_APM dividers */
+#define CLK_DOUT_CMU_SHUB_BUS=09=09=095
+#define CLK_DOUT_CLK_APM_BUS=09=09=096
+
+/* CPU_APM gates */
+#define CLK_GOUT_CMU_CMGP_BUS=09=09=097
+#define CLK_GOUT_CLK_APM_CMU_PCLK=09=098
+#define CLK_GOUT_CLK_APM_OSCCLK_CLK=09=099
+#define CLK_GOUT_CLK_APM_OSCCLK_RCO_CLK=09=0910
+#define CLK_GOUT_APM_APBIF_GPIO_ALIVE_PCLK=0911
+#define CLK_GOUT_APM_APBIF_PMU_ALIVE_PCLK=0912
+#define CLK_GOUT_APM_APBIF_RTC_ALIVE_PCLK=0912
+#define CLK_GOUT_APM_APBIF_TOP_RTC_ALIVE_PCLK=0913
+#define CLK_GOUT_APM_GREBEINTEGRATION_HCLK=0914
+#define CLK_GOUT_APM_INTMEM_ACLK=09=0915
+#define CLK_GOUT_APM_INTMEM_PCLK=09=0916
+#define CLK_GOUT_APM_LHM_AXI_P_GNSS_CLK=09=0917
+#define CLK_GOUT_APM_LHM_AXI_P_CLK=09=0918
+#define CLK_GOUT_APM_LHM_AXI_P_MODEM_CLK=0919
+#define CLK_GOUT_APM_LHM_AXI_P_SHUB_CLK=09=0920
+#define CLK_GOUT_APM_LHM_AXI_P_WLBT_CLK=09=0921
+#define CLK_GOUT_APM_LHS_AXI_D_CLK=09=0922
+#define CLK_GOUT_APM_LHS_AXI_LP_SHUB_CLK=0923
+#define CLK_GOUT_APM_MAILBOX_AP2CP_PCLK=09=0924
+#define CLK_GOUT_APM_MAILBOX_AP2CP_S_PCLK=0925
+#define CLK_GOUT_APM_MAILBOX_AP2GNSS_PCLK=0926
+#define CLK_GOUT_APM_MAILBOX_AP2SHUB_PCLK=0927
+#define CLK_GOUT_APM_MAILBOX_AP2WLBT_PCLK=0928
+#define CLK_GOUT_APM_MAILBOX_APM2AP_PCLK=0929
+#define CLK_GOUT_APM_MAILBOX_APM2CP_PCLK=0930
+#define CLK_GOUT_APM_MAILBOX_APM2GNSS_PCLK=0931
+#define CLK_GOUT_APM_MAILBOX_APM2SHUB_PCLK=0932
+#define CLK_GOUT_APM_MAILBOX_APM2WLBT_PCLK=0933
+#define CLK_GOUT_APM_MAILBOX_CP2GNSS_PCLK=0934
+#define CLK_GOUT_APM_MAILBOX_CP2SHUB_PCLK=0935
+#define CLK_GOUT_APM_MAILBOX_CP2WLBT_PCLK=0936
+#define CLK_GOUT_APM_MAILBOX_SHUB2GNSS_PCLK=0937
+#define CLK_GOUT_APM_MAILBOX_SHUB2WLBT_PCLK=0938
+#define CLK_GOUT_APM_MAILBOX_WLBT2ABOX_PCLK=0939
+#define CLK_GOUT_APM_MAILBOX_WLBT2GNSS_PCLK=0940
+#define CLK_GOUT_APM_PEM_CLK=09=09=0941
+#define CLK_GOUT_APM_PGEN_LITE_CLK=09=0942
+#define CLK_GOUT_APM_PMU_INTR_GEN_PCLK=09=0943
+#define CLK_GOUT_APM_BUS_CLK=09=09=0944
+#define CLK_GOUT_APM_GREBE_CLK=09=09=0945
+#define CLK_GOUT_APM_SPEEDY_PCLK=09=0946
+#define CLK_GOUT_APM_SYSREG_PCLK=09=0947
+#define CLK_GOUT_APM_WDT_PCLK=09=09=0948
+#define CLK_GOUT_APM_XIU_DP_ACLK=09=0949
+
+/* CMU_CAM muxes */
+#define CLK_MOUT_PLL_CAM_BUS_USER=09=09=091
+
+/* CMU_CAM dividers */
+#define CLK_DIV_CLK_CAM_BUSP=09=09=09=092
+
+/* CMU_CAM gates */
+#define CLK_GAT_CLK_CAM_CMU_PCLK=09=09=093
+#define CLK_GAT_CLK_CAM_OSCCLK_CLK=09=09=094
+#define CLK_GOUT_CAM_BUSD=09=09=09=095
+#define CLK_GOUT_CAM_BTM_ACLK=09=09=09=096
+#define CLK_GOUT_CAM_BTM_PCLK=09=09=09=097
+#define CLK_GOUT_CAM_LHS_ATB_CAMISP_CLK=09=09=098
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_3AA=09=09=099
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS0=09=0910
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS1=09=0911
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS2=09=0912
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS3=09=0913
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_RDMA=09=09=0914
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS0=09=0915
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS1=09=0916
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS2=09=0917
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS3=09=0918
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_PAFSTAT_CORE=09=0919
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_PPMU_CAM=09=0920
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_DMA=09=09=0921
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_SMMU_CAM=09=0922
+#define CLK_GOUT_CAM_IS6P10P0_ACLK_XIU_D_CAM=09=0923
+#define CLK_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM0=0924
+#define CLK_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM1=0925
+#define CLK_GOUT_CAM_IS6P10P0_PCLK_PPMU_CAM=09=0926
+#define CLK_GOUT_CAM_LHM_AXI_P_CLK=09=09=0927
+#define CLK_GOUT_CAM_LHS_ACEL_D_CLK=09=09=0928
+#define CLK_GOUT_CAM_BUSD_CLK=09=09=09=0929
+#define CLK_GOUT_CAM_BUSP_CLK=09=09=09=0930
+#define CLK_GOUT_CAM_SYSREG_PCLK=09=09=0931
+
+/* CMU_CMGP muxes */
+#define CLK_MOUT_CLK_CMGP_ADC=09=09=090
+#define CLK_MOUT_CLK_CMGP_I2C=09=09=091
+#define CLK_MOUT_CLK_CMGP_USI00=09=09=092
+#define CLK_MOUT_CLK_CMGP_USI01=09=09=093
+#define CLK_MOUT_CLK_CMGP_USI02=09=09=094
+#define CLK_MOUT_CLK_CMGP_USI03=09=09=095
+#define CLK_MOUT_CLK_CMGP_USI04=09=09=096
+
+/* CMU_CMGP dividers */
+#define CLK_DOUT_CLK_CMGP_ADC=09=09=090
+#define CLK_DOUT_CLK_CMGP_I2C=09=09=091
+#define CLK_DOUT_CLK_CMGP_USI00=09=09=092
+#define CLK_DOUT_CLK_CMGP_USI01=09=09=093
+#define CLK_DOUT_CLK_CMGP_USI02=09=09=094
+#define CLK_DOUT_CLK_CMGP_USI03=09=09=095
+#define CLK_DOUT_CLK_CMGP_USI04=09=09=096
+
+/* CMU_CMGP gates */
+#define CLK_GOUT_CMGP_CMU_PCLK=09=09=097
+#define CLK_GOUT_CLK_CMGP_OSCCLK_RCO_CLK=098
+#define CLK_GOUT_CMGP_ADC_PCLK_S0=09=099
+#define CLK_GOUT_CMGP_ADC_PCLK_S1=09=0910
+#define CLK_GOUT_CMGP_GPIO_PCLK=09=09=0911
+#define CLK_GOUT_CMGP_I2C_CMGP00_IPCLK=09=0912
+#define CLK_GOUT_CMGP_I2C_CMGP00_PCLK=09=0913
+#define CLK_GOUT_CMGP_I2C_CMGP01_IPCLK=09=0914
+#define CLK_GOUT_CMGP_I2C_CMGP01_PCLK=09=0915
+#define CLK_GOUT_CMGP_I2C_CMGP02_IPCLK=09=0916
+#define CLK_GOUT_CMGP_I2C_CMGP02_PCLK=09=0917
+#define CLK_GOUT_CMGP_I2C_CMGP03_IPCLK=09=0918
+#define CLK_GOUT_CMGP_I2C_CMGP03_PCLK=09=0919
+#define CLK_GOUT_CMGP_I2C_CMGP04_IPCLK=09=0920
+#define CLK_GOUT_CMGP_I2C_CMGP04_PCLK=09=0921
+#define CLK_GOUT_CMGP_BUS_CLK=09=09=0922
+#define CLK_GOUT_CMGP_I2C_CLK=09=09=0923
+#define CLK_GOUT_CMGP_USI00_CLK=09=09=0924
+#define CLK_GOUT_CMGP_USI01_CLK=09=09=0925
+#define CLK_GOUT_CMGP_USI02_CLK=09=09=0926
+#define CLK_GOUT_CMGP_USI03_CLK=09=09=0927
+#define CLK_GOUT_CMGP_USI04_CLK=09=09=0928
+#define CLK_GOUT_CMGP_SYSREG_CMGP2CP_PCLK=0929
+#define CLK_GOUT_CMGP_SYSREG_CMGP2GNSS_PCLK=0930
+#define CLK_GOUT_CMGP_SYSREG_CMGP2PMU_AP_PCLK=0931
+#define CLK_GOUT_CMGP_SYSREG_CMGP2PMU_SHUB_PCLK=0932
+#define CLK_GOUT_CMGP_SYSREG_CMGP2SHUB_PCLK=0933
+#define CLK_GOUT_CMGP_SYSREG_CMGP2WLBT_PCLK=0934
+#define CLK_GOUT_CMGP_SYSREG_PCLK=09=0935
+#define CLK_GOUT_CMGP_USI_CMGP00_IPCLK=09=0936
+#define CLK_GOUT_CMGP_USI_CMGP00_PCLK=09=0937
+#define CLK_GOUT_CMGP_USI_CMGP01_IPCLK=09=0938
+#define CLK_GOUT_CMGP_USI_CMGP01_PCLK=09=0939
+#define CLK_GOUT_CMGP_USI_CMGP02_IPCLK=09=0940
+#define CLK_GOUT_CMGP_USI_CMGP02_PCLK=09=0941
+#define CLK_GOUT_CMGP_USI_CMGP03_IPCLK=09=0942
+#define CLK_GOUT_CMGP_USI_CMGP03_PCLK=09=0943
+#define CLK_GOUT_CMGP_USI_CMGP04_IPCLK=09=0944
+#define CLK_GOUT_CMGP_USI_CMGP04_PCLK=09=0945
+
+/* CMU_CORE muxes */
+#define CLK_MOUT_PLL_CORE_BUS_USER=09=09=091
+#define CLK_MOUT_PLL_CORE_CCI_USER=09=09=092
+#define CLK_MOUT_PLL_CORE_G3D_USER=09=09=093
+#define CLK_MOUT_CLK_CORE_GIC=09=09=09=094
+
+/* CMU_CORE dividers */
+#define CLK_DOUT_CLK_CORE_BUSP=09=09=09=095
+
+/* CMU_CORE gates */
+#define CLK_GOUT_CLK_CORE_CMU_PCLK=09=09=096
+#define CLK_GOUT_CORE_AD_APB_CCI_550_PCLKM=09=097
+#define CLK_GOUT_CORE_AD_APB_DIT_PCLKM=09=09=098
+#define CLK_GOUT_CORE_AD_APB_PDMA0_PCLKM=09=099
+#define CLK_GOUT_CORE_AD_APB_PGEN_PDMA_PCLKM=09=0910
+#define CLK_GOUT_CORE_AD_APB_PPFW_MEM0_PCLKM=09=0911
+#define CLK_GOUT_CORE_AD_APB_PPFW_MEM1_PCLKM=09=0912
+#define CLK_GOUT_CORE_AD_APB_PPFW_PERI_PCLKM=09=0913
+#define CLK_GOUT_CORE_AD_APB_SPDMA_PCLKM=09=0914
+#define CLK_GOUT_CORE_AD_AXI_GIC_ACLKM=09=09=0915
+#define CLK_GOUT_CORE_ASYNCSFR_WR_DMC0_PCLK=09=0916
+#define CLK_GOUT_CORE_ASYNCSFR_WR_DMC1_PCLK=09=0917
+#define CLK_GOUT_CORE_AXI_US_A40_64TO128_DIT_ACLK=0918
+#define CLK_GOUT_CORE_BAAW_P_GNSS_PCLK=09=09=0919
+#define CLK_GOUT_CORE_BAAW_P_MODEM_PCLK=09=09=0920
+#define CLK_GOUT_CORE_BAAW_P_SHUB_PCLK=09=09=0921
+#define CLK_GOUT_CORE_BAAW_P_WLBT_PCLK=09=09=0922
+#define CLK_GOUT_CORE_CCI_550_ACLK=09=09=0923
+#define CLK_GOUT_CORE_DIT_ICLKL2A=09=09=0924
+#define CLK_GOUT_CORE_GIC400_AIHWACG_CLK=09=0925
+#define CLK_GOUT_CORE_LHM_ACEL_D0_ISP_CLK=09=0926
+#define CLK_GOUT_CORE_LHM_ACEL_D0_MFC_CLK=09=0927
+#define CLK_GOUT_CORE_LHM_ACEL_D1_ISP_CLK=09=0928
+#define CLK_GOUT_CORE_LHM_ACEL_D1_MFC_CLK=09=0929
+#define CLK_GOUT_CORE_LHM_ACEL_D_CAM_CLK=09=0930
+#define CLK_GOUT_CORE_LHM_ACEL_D_DPU_CLK=09=0931
+#define CLK_GOUT_CORE_LHM_ACEL_D_FSYS_CLK=09=0932
+#define CLK_GOUT_CORE_LHM_ACEL_D_G2D_CLK=09=0933
+#define CLK_GOUT_CORE_LHM_ACEL_D_USB_CLK=09=0934
+#define CLK_GOUT_CORE_LHM_ACEL_D_VIPX1_CLK=09=0935
+#define CLK_GOUT_CORE_LHM_ACEL_D_VIPX2_CLK=09=0936
+#define CLK_GOUT_CORE_LHM_ACE_D_CPUCL0_CLK=09=0937
+#define CLK_GOUT_CORE_LHM_ACE_D_CPUCL1_CLK=09=0938
+#define CLK_GOUT_CORE_LHM_AXI_D0_MODEM_CLK=09=0939
+#define CLK_GOUT_CORE_LHM_AXI_D1_MODEM_CLK=09=0940
+#define CLK_GOUT_CORE_LHM_AXI_D_ABOX_CLK=09=0941
+#define CLK_GOUT_CORE_LHM_AXI_D_APM_CLK=09=09=0942
+#define CLK_GOUT_CORE_LHM_AXI_D_CSSYS_CLK=09=0943
+#define CLK_GOUT_CORE_LHM_AXI_D_G3D_CLK=09=09=0944
+#define CLK_GOUT_CORE_LHM_AXI_D_GNSS_CLK=09=0945
+#define CLK_GOUT_CORE_LHM_AXI_D_SHUB_CLK=09=0946
+#define CLK_GOUT_CORE_LHM_AXI_D_WLBT_CLK=09=0947
+#define CLK_GOUT_CORE_LHS_AXI_D0_MIF_CPU_CLK=09=0948
+#define CLK_GOUT_CORE_LHS_AXI_D0_MIF_CP_CLK=09=0949
+#define CLK_GOUT_CORE_LHS_AXI_D0_MIF_NRT_CLK=09=0950
+#define CLK_GOUT_CORE_LHS_AXI_D0_MIF_RT_CLK=09=0951
+#define CLK_GOUT_CORE_LHS_AXI_D1_MIF_CPU_CLK=09=0952
+#define CLK_GOUT_CORE_LHS_AXI_D1_MIF_CP_CLK=09=0953
+#define CLK_GOUT_CORE_LHS_AXI_D1_MIF_NRT_CLK=09=0954
+#define CLK_GOUT_CORE_LHS_AXI_D1_MIF_RT_CLK=09=0955
+#define CLK_GOUT_CORE_LHS_AXI_P_APM_CLK=09=09=0956
+#define CLK_GOUT_CORE_LHS_AXI_P_CAM_CLK=09=09=0957
+#define CLK_GOUT_CORE_LHS_AXI_P_CPUCL0_CLK=09=0958
+#define CLK_GOUT_CORE_LHS_AXI_P_CPUCL1_CLK=09=0959
+#define CLK_GOUT_CORE_LHS_AXI_P_DISPAUD_CLK=09=0960
+#define CLK_GOUT_CORE_LHS_AXI_P_FSYS_CLK=09=0961
+#define CLK_GOUT_CORE_LHS_AXI_P_G2D_CLK=09=09=0962
+#define CLK_GOUT_CORE_LHS_AXI_P_G3D_CLK=09=09=0963
+#define CLK_GOUT_CORE_LHS_AXI_P_GNSS_CLK=09=0964
+#define CLK_GOUT_CORE_LHS_AXI_P_ISP_CLK=09=09=0965
+#define CLK_GOUT_CORE_LHS_AXI_P_MFC_CLK=09=09=0966
+#define CLK_GOUT_CORE_LHS_AXI_P_MIF0_CLK=09=0967
+#define CLK_GOUT_CORE_LHS_AXI_P_MIF1_CLK=09=0968
+#define CLK_GOUT_CORE_LHS_AXI_P_MODEM_CLK=09=0969
+#define CLK_GOUT_CORE_LHS_AXI_P_PERI_CLK=09=0970
+#define CLK_GOUT_CORE_LHS_AXI_P_SHUB_CLK=09=0971
+#define CLK_GOUT_CORE_LHS_AXI_P_USB_CLK=09=09=0972
+#define CLK_GOUT_CORE_LHS_AXI_P_VIPX1_CLK=09=0973
+#define CLK_GOUT_CORE_LHS_AXI_P_VIPX2_CLK=09=0974
+#define CLK_GOUT_CORE_LHS_AXI_P_WLBT_CLK=09=0975
+#define CLK_GOUT_CORE_PDMA_CORE_ACLK_PDMA0=09=0976
+#define CLK_GOUT_CORE_PGEN_LITE_SIREX_CLK=09=0977
+#define CLK_GOUT_CORE_PGEN_PDMA_CLK=09=09=0978
+#define CLK_GOUT_CORE_PPCFW_G3D_ACLK=09=09=0979
+#define CLK_GOUT_CORE_PPCFW_G3D_PCLK=09=09=0980
+#define CLK_GOUT_CORE_PPFW_CORE_MEM0_CLK=09=0981
+#define CLK_GOUT_CORE_PPFW_CORE_MEM1_CLK=09=0982
+#define CLK_GOUT_CORE_PPFW_CORE_PERI_CLK=09=0983
+#define CLK_GOUT_CORE_PPMU_ACE_CPUCL0_ACLK=09=0984
+#define CLK_GOUT_CORE_PPMU_ACE_CPUCL0_PCLK=09=0985
+#define CLK_GOUT_CORE_PPMU_ACE_CPUCL1_ACLK=09=0986
+#define CLK_GOUT_CORE_PPMU_ACE_CPUCL1_PCLK=09=0987
+#define CLK_GOUT_CORE_BUSD_CLK=09=09=09=0988
+#define CLK_GOUT_CORE_BUSP_G3D_OCC_CLK=09=09=0989
+#define CLK_GOUT_CORE_BUSP_CLK=09=09=09=0990
+#define CLK_GOUT_CORE_BUSP_OCC_CLK=09=09=0991
+#define CLK_GOUT_CORE_CCI_CLK=09=09=09=0992
+#define CLK_GOUT_CORE_CCI_OCC_CLK=09=09=0993
+#define CLK_GOUT_CORE_G3D_CLK=09=09=09=0994
+#define CLK_GOUT_CORE_G3D_OCC_CLK=09=09=0995
+#define CLK_GOUT_CORE_GIC_CLK=09=09=09=0996
+#define CLK_GOUT_CORE_OSCCLK_CLK=09=09=0997
+#define CLK_GOUT_CORE_SFR_APBIF_CMU_TOPC_PCLK=09=0998
+#define CLK_GOUT_CORE_SIREX_ACLK=09=09=0999
+#define CLK_GOUT_CORE_SIREX_PCLK=09=09=09100
+#define CLK_GOUT_CORE_SPDMA_CORE_ACLK_PDMA1=09=09101
+#define CLK_GOUT_CORE_SYSREG_PCLK=09=09=09102
+#define CLK_GOUT_CORE_TREX_D_ACLK=09=09=09103
+#define CLK_GOUT_CORE_TREX_D_CCLK=09=09=09104
+#define CLK_GOUT_CORE_TREX_D_GCLK=09=09=09105
+#define CLK_GOUT_CORE_TREX_D_PCLK=09=09=09106
+#define CLK_GOUT_CORE_TREX_D_NRT_ACLK=09=09=09107
+#define CLK_GOUT_CORE_TREX_D_NRT_PCLK=09=09=09108
+#define CLK_GOUT_CORE_TREX_P_ACLK_P_CORE=09=09109
+#define CLK_GOUT_CORE_TREX_P_CCLK_P_CORE=09=09110
+#define CLK_GOUT_CORE_TREX_P_PCLK=09=09=09111
+#define CLK_GOUT_CORE_TREX_P_PCLK_P_CORE=09=09112
+#define CLK_GOUT_CORE_XIU_D_ACLK=09=09=09113
+
+/* CMU_CPUCL0 PLLs */
+#define CLK_FOUT_CPUCL0_PLL=09=09=09=091
+
+/* CMU_CPUCL0 muxes */
+#define CLK_MOUT_PLL_CPUCL0_DBG_USER=09=09=092
+#define CLK_MOUT_PLL_CPUCL0_SWITCH_USER=09=09=093
+#define CLK_MOUT_CLK_CPUCL0_PLL=09=09=09=094
+
+/* CMU_CPUCL0 dividers */
+#define CLK_DOUT_CLK_CLUSTER0_ACLK=09=09=095
+#define CLK_DOUT_CLK_CLUSTER0_CNTCLK=09=09=096
+#define CLK_DOUT_CLK_CLUSTER0_PCLKDBG=09=09=097
+#define CLK_DOUT_CLK_CPUCL0_CMUREF=09=09=098
+#define CLK_DOUT_CLK_CPUCL0_CPU=09=09=09=099
+#define CLK_DOUT_CLK_CPUCL0_PCLK=09=09=0910
+
+/* CMU_CPUCL0 gates */
+#define CLK_GOUT_CLK_CPUCL0_CMU_PCLK=09=09=0911
+#define CLK_GOUT_CLK_CPUCL0_HPM_TARGETCLK_C=09=0912
+#define CLK_GOUT_CLK_CPUCL0_OSCCLK_CLK=09=09=0913
+#define CLK_GOUT_CLK_CLUSTER0_CPU=09=09=0914
+#define CLK_GOUT_CPUCL0_ADM_APB_G_CSSYS_CORE_PCLKM=0915
+#define CLK_GOUT_CPUCL0_ADS_AHB_G_CSSYS_FSYS_HCLKS=0916
+#define CLK_GOUT_CPUCL0_ADS_APB_G_CSSYS_CPUCL1_PCLKS=0917
+#define CLK_GOUT_CPUCL0_ADS_APB_G_P8Q_PCLKS=09=0918
+#define CLK_GOUT_CPUCL0_AD_APB_P_DUMP_PC_CPUCL0_PCLKM=0919
+#define CLK_GOUT_CPUCL0_AD_APB_P_DUMP_PC_CPUCL1_PCLKM=0920
+#define CLK_GOUT_CPUCL0_BUSIF_HPMCPUCL0_PCLK=09=0921
+#define CLK_GOUT_CPUCL0_CSSYS_DBG_PCLKDBG=09=0922
+#define CLK_GOUT_CPUCL0_DUMP_PC_CPUCL0_PCLK=09=0923
+#define CLK_GOUT_CPUCL0_DUMP_PC_CPUCL1_PCLK=09=0924
+#define CLK_GOUT_CPUCL0_LHM_AXI_P_CPUCL0_CLK=09=0925
+#define CLK_GOUT_CPUCL0_LHS_AXI_D_CSSYS_CLK=09=0926
+#define CLK_GOUT_CPUCL0_DBG_CLK=09=09=09=0927
+#define CLK_GOUT_CPUCL0_PCLK_CLK=09=09=0928
+#define CLK_GOUT_CPUCL0_SECJTAG_CLK=09=09=0929
+#define CLK_GOUT_CPUCL0_SYSREG_PCLK=09=09=0930
+
+/* CMU_CPUCL1 PLLs */
+#define CLK_FOUT_CPUCL1_PLL=09=09=09=091
+
+/* CMU_CPUCL1 muxes */
+#define CLK_MOUT_PLL_CPUCL1_SWITCH_USER=09=09=092
+#define CLK_MOUT_CLK_CPUCL1_PLL=09=09=09=093
+
+/* CMU_CPUCL1 dividers */
+#define CLK_DOUT_CLK_CLUSTER1_ACLK=09=09=094
+#define CLK_DOUT_CLK_CLUSTER1_CNTCLK=09=09=095
+#define CLK_DOUT_CLK_CPUCL1_CMUREF=09=09=096
+#define CLK_DOUT_CLK_CPUCL1_CPU=09=09=09=097
+#define CLK_DOUT_CLK_CPUCL1_PCLK=09=09=098
+#define CLK_DOUT_CLK_CPUCL1_PCLKDBG=09=09=099
+
+/* CMU_CPUCL1 gates */
+#define CLK_GOUT_CLK_CPUCL1_CMU_PCLK=09=09=0910
+#define CLK_GOUT_CLK_CPUCL1_HPM_TARGETCLK_C=09=0911
+#define CLK_GOUT_CLK_CPUCL1_OSCCLK_CLK=09=09=0912
+#define CLK_GOUT_CLK_CLUSTER1_CPU=09=09=0913
+#define CLK_GOUT_CPUCL1_ADM_APB_G_CSSYS_CPUCL1_PCLKM=0914
+#define CLK_GOUT_CPUCL1_BUSIF_HPMCPUCL1_PCLK=09=0915
+#define CLK_GOUT_CPUCL1_LHM_AXI_P_CPUCL1_CLK=09=0916
+#define CLK_GOUT_CPUCL1_LHS_ACE_D_CLK=09=09=0917
+#define CLK_GOUT_CPUCL1_ACLK_CLK=09=09=0918
+#define CLK_GOUT_CPUCL1_PCLKDBG_CLK=09=09=0919
+#define CLK_GOUT_CPUCL1_PCLK_CLK=09=09=0920
+#define CLK_GOUT_CPUCL1_SYSREG_PCLK=09=09=0921
+
+/* CMU_DISPAUD PLLs */
+#define CLK_FOUT_AUD_PLL=09=09=09=091
+
+/* CMU_DISPAUD muxes */
+#define CLK_MOUT_PLL_DISPAUD_AUD_USER=09=09=092
+#define CLK_MOUT_PLL_DISPAUD_CPU_USER=09=09=093
+#define CLK_MOUT_PLL_DISPAUD_DISP_USER=09=09=094
+#define CLK_MOUT_CLK_AUD_BUS=09=09=09=095
+#define CLK_MOUT_CLK_AUD_CPU=09=09=09=096
+#define CLK_MOUT_CLK_AUD_CPU_HCH=09=09=097
+#define CLK_MOUT_CLK_AUD_FM=09=09=09=098
+#define CLK_MOUT_CLK_AUD_UAIF0=09=09=09=099
+#define CLK_MOUT_CLK_AUD_UAIF1=09=09=09=0910
+#define CLK_MOUT_CLK_AUD_UAIF2=09=09=09=0911
+
+/* CMU_DISPAUD dividers */
+#define CLK_DOUT_CLK_AUD_AUDIF=09=09=09=0912
+#define CLK_DOUT_CLK_AUD_BUS=09=09=09=0913
+#define CLK_DOUT_CLK_AUD_CPU=09=09=09=0914
+#define CLK_DOUT_CLK_AUD_CPU_ACLK=09=09=0915
+#define CLK_DOUT_CLK_AUD_CPU_PCLKDBG=09=09=0916
+#define CLK_DOUT_CLK_AUD_DSIF=09=09=09=0917
+#define CLK_DOUT_CLK_AUD_FM=09=09=09=0918
+#define CLK_DOUT_CLK_AUD_FM_SPDY=09=09=0919
+#define CLK_DOUT_CLK_AUD_UAIF0=09=09=09=0920
+#define CLK_DOUT_CLK_AUD_UAIF1=09=09=09=0921
+#define CLK_DOUT_CLK_AUD_UAIF2=09=09=09=0922
+#define CLK_DOUT_CLK_DISPAUD_BUSP=09=09=0923
+
+/* CMU_DISPAUD gates */
+#define CLK_GOUT_CLK_DISPAUD_ABOX_BCLK_UAIF0=09=0924
+#define CLK_GOUT_CLK_DISPAUD_ABOX_BCLK_UAIF1=09=0925
+#define CLK_GOUT_CLK_DISPAUD_ABOX_BCLK_UAIF2=09=0926
+#define CLK_GOUT_CLK_DISPAUD_CMU_PCLK=09=09=0927
+#define CLK_GOUT_CLK_DISPAUD_CLK_AUD_UAIF0_CLK=09=0928
+#define CLK_GOUT_CLK_DISPAUD_CLK_AUD_UAIF1_CLK=09=0929
+#define CLK_GOUT_CLK_DISPAUD_CLK_AUD_UAIF2_CLK=09=0930
+#define CLK_GOUT_CLK_DISPAUD_OSCCLK_CLK=09=09=0931
+#define CLK_GOUT_DISPAUD_ABOX_ACLK=09=09=0932
+#define CLK_GOUT_DISPAUD_ABOX_BCLK_DSIF=09=09=0933
+#define CLK_GOUT_DISPAUD_ABOX_BCLK_SPDY=09=09=0934
+#define CLK_GOUT_DISPAUD_ABOX_CCLK_ASB=09=09=0935
+#define CLK_GOUT_DISPAUD_ABOX_CCLK_CA7=09=09=0936
+#define CLK_GOUT_DISPAUD_ABOX_CCLK_DBG=09=09=0937
+#define CLK_GOUT_DISPAUD_ABOX_OSC_SPDY=09=09=0938
+#define CLK_GOUT_DISPAUD_AXI_US_32TO128_ACLK=09=0939
+#define CLK_GOUT_DISPAUD_CLK_DISPAUD_AUD=09=0940
+#define CLK_GOUT_DISPAUD_CLK_DISPAUD_DISP=09=0941
+#define CLK_GOUT_DISPAUD_BTM_ABOX_ACLK=09=09=0942
+#define CLK_GOUT_DISPAUD_BTM_ABOX_PCLK=09=09=0943
+#define CLK_GOUT_DISPAUD_BTM_DPU_ACLK=09=09=0944
+#define CLK_GOUT_DISPAUD_BTM_DPU_PCLK=09=09=0945
+#define CLK_GOUT_DISPAUD_DFTMUX_AUD_CODEC_MCLK=09=0946
+#define CLK_GOUT_DISPAUD_DPU_ACLK_DECON=09=09=0947
+#define CLK_GOUT_DISPAUD_DPU_ACLK_DMA=09=09=0948
+#define CLK_GOUT_DISPAUD_DPU_ACLK_DPP=09=09=0949
+#define CLK_GOUT_DISPAUD_GPIO_DISPAUD_PCLK=09=0950
+#define CLK_GOUT_DISPAUD_LHM_AXI_P_DISPAUD_CLK=09=0951
+#define CLK_GOUT_DISPAUD_LHS_ACEL_D_DPU_CLK=09=0952
+#define CLK_GOUT_DISPAUD_LHS_AXI_D_ABOX_CLK=09=0953
+#define CLK_GOUT_DISPAUD_PERI_AXI_ASB_ACLKM=09=0954
+#define CLK_GOUT_DISPAUD_PERI_AXI_ASB_PCLK=09=0955
+#define CLK_GOUT_DISPAUD_PPMU_ABOX_ACLK=09=09=0956
+#define CLK_GOUT_DISPAUD_PPMU_ABOX_PCLK=09=09=0957
+#define CLK_GOUT_DISPAUD_PPMU_DPU_ACLK=09=09=0958
+#define CLK_GOUT_DISPAUD_PPMU_DPU_PCLK=09=09=0959
+#define CLK_GOUT_DISPAUD_CLK_AUD_CPU_ACLK_CLK=09=0960
+#define CLK_GOUT_DISPAUD_CLK_AUD_CPU_CLKIN_CLK=09=0961
+#define CLK_GOUT_DISPAUD_CLK_AUD_CPU_PCLKDBG_CLK=0962
+#define CLK_GOUT_DISPAUD_CLK_AUD_DSIF_CLK=09=0963
+#define CLK_GOUT_DISPAUD_CLK_AUD_CLK=09=09=0964
+#define CLK_GOUT_DISPAUD_CLK_BUSP_CLK=09=09=0965
+#define CLK_GOUT_DISPAUD_CLK_DISP_CLK=09=09=0966
+#define CLK_GOUT_DISPAUD_SMMU_ABOX_CLK=09=09=0967
+#define CLK_GOUT_DISPAUD_SMMU_DPU_CLK=09=09=0968
+#define CLK_GOUT_DISPAUD_SYSREG_PCLK=09=09=0969
+#define CLK_GOUT_DISPAUD_WDT_AUD_PCLK=09=09=0970
+
+/* CMU_FSYS muxes */
+#define CLK_MOUT_PLL_FSYS_BUS_USER=09=091
+#define CLK_MOUT_PLL_FSYS_MMC_CARD_USER=09=092
+#define CLK_MOUT_PLL_FSYS_MMC_EMBD_USER=09=093
+#define CLK_MOUT_PLL_FSYS_UFS_EMBD_USER=09=094
+
+/* CMU_FSYS gates */
+#define CLK_GOUT_FSYS_CMU_PCLK=09=09=095
+#define CLK_GOUT_FSYS_OSCCLK_CLK=09=096
+#define CLK_GOUT_FSYS_ADM_AHB_SSS_HCLKM=09=097
+#define CLK_GOUT_FSYS_BTM_ACLK=09=09=098
+#define CLK_GOUT_FSYS_BTM_PCLK=09=09=099
+#define CLK_GOUT_FSYS_GPIO_PCLK=09=09=0910
+#define CLK_GOUT_FSYS_LHM_AXI_P_CLK=09=0911
+#define CLK_GOUT_FSYS_LHS_ACEL_D_CLK=09=0912
+#define CLK_GOUT_FSYS_MMC_CARD_ACLK=09=0913
+#define CLK_GOUT_FSYS_MMC_CARD_SDCLKIN=09=0914
+#define CLK_GOUT_FSYS_MMC_EMBD_ACLK=09=0915
+#define CLK_GOUT_FSYS_MMC_EMBD_SDCLKIN=09=0916
+#define CLK_GOUT_FSYS_PGEN_LITE_CLK=09=0917
+#define CLK_GOUT_FSYS_PPMU_ACLK=09=09=0918
+#define CLK_GOUT_FSYS_PPMU_PCLK=09=09=0919
+#define CLK_GOUT_FSYS_BUS_CLK=09=09=0920
+#define CLK_GOUT_FSYS_SYSREG_PCLK=09=0921
+#define CLK_GOUT_FSYS_UFS_EMBD_ACLK=09=0922
+#define CLK_GOUT_FSYS_UFS_EMBD_CLK_UNIPRO=0923
+#define CLK_GOUT_FSYS_UFS_EMBD_FMP_CLK=09=0924
+#define CLK_GOUT_FSYS_XIU_D_ACLK=09=0925
+
+/* CMU_G2D muxes */
+#define CLK_MOUT_PLL_G2D_G2D_USER=091
+#define CLK_MOUT_PLL_G2D_MSCL_USER=092
+
+/* CMU_G2D dividers */
+#define CLK_DOUT_CLK_G2D_BUSP=09=093
+
+/* CMU_G2D gates */
+#define CLK_GOUT_CLK_G2D_CMU_PCLK=094
+#define CLK_GOUT_CLK_G2D_OSCCLK_CLK=095
+#define CLK_GOUT_G2D_AS_AXI_JPEG_ACLKM=096
+#define CLK_GOUT_G2D_AS_AXI_JPEG_ACLKS=097
+#define CLK_GOUT_G2D_AS_AXI_MSCL_ACLKM=098
+#define CLK_GOUT_G2D_AS_AXI_MSCL_ACLKS=099
+#define CLK_GOUT_G2D_CLK_G2D_G2D=0910
+#define CLK_GOUT_G2D_CLK_G2D_MSCL=0911
+#define CLK_GOUT_G2D_BTM_G2D_ACLK=0912
+#define CLK_GOUT_G2D_BTM_G2D_PCLK=0913
+#define CLK_GOUT_G2D_G2D_ACLK=09=0914
+#define CLK_GOUT_G2D_JPEG_FIMP_CLK=0915
+#define CLK_GOUT_G2D_LHM_AXI_P_CLK=0916
+#define CLK_GOUT_G2D_LHS_ACEL_D_CLK=0917
+#define CLK_GOUT_G2D_MSCL_ACLK=09=0918
+#define CLK_GOUT_G2D_PGEN100_LITE_CLK=0919
+#define CLK_GOUT_G2D_PPMU_ACLK=09=0920
+#define CLK_GOUT_G2D_PPMU_PCLK=09=0921
+#define CLK_GOUT_G2D_BUSP_CLK=09=0922
+#define CLK_GOUT_G2D_SYSMMU_CLK=09=0923
+#define CLK_GOUT_G2D_SYSREG_PCLK=0924
+#define CLK_GOUT_G2D_XIU_D_MSCL_ACLK=0925
+
+/* CMU_G3D PLLs */
+#define CLK_FOUT_G3D_PLL=09=09=091
+
+/* CMU_G3D muxes */
+#define CLK_MOUT_G3D_SWITCH_USER=09=092
+#define CLK_MOUT_CLK_G3D_BUSD=09=09=093
+
+/* CMU_G3D dividers */
+#define CLK_DOUT_CLK_G3D_BUSD=09=09=094
+#define CLK_DOUT_CLK_G3D_BUSP=09=09=095
+
+/* CMU_G3D gates */
+#define CLK_GOUT_CLK_G3D_CMU_PCLK=09=096
+#define CLK_GOUT_CLK_G3D_G3D_CLK=09=097
+#define CLK_GOUT_CLK_G3D_HPM_TARGETCLK_C=098
+#define CLK_GOUT_CLK_G3D_OSCCLK_CLK=09=099
+#define CLK_GOUT_G3D_BTM_G3D_ACLK=09=0910
+#define CLK_GOUT_G3D_BTM_G3D_PCLK=09=0911
+#define CLK_GOUT_G3D_BUSIF_HPMG3D_PCLK=09=0912
+#define CLK_GOUT_G3D_GRAY2BIN_G3D_CLK=09=0913
+#define CLK_GOUT_G3D_LHM_AXI_G3DSFR_CLK=09=0914
+#define CLK_GOUT_G3D_LHM_AXI_P_G3D_CLK=09=0915
+#define CLK_GOUT_G3D_LHS_AXI_D_G3D_CLK=09=0916
+#define CLK_GOUT_G3D_LHS_AXI_G3DSFR_CLK=09=0917
+#define CLK_GOUT_G3D_PGEN_LITE_G3D_CLK=09=0918
+#define CLK_GOUT_G3D_BUSD_CLK=09=09=0919
+#define CLK_GOUT_G3D_BUSP_CLK=09=09=0920
+#define CLK_GOUT_G3D_SYSREG_PCLK=09=0921
+
+/* CMU_PERI muxes */
+#define CLK_MOUT_PLL_PERI_BUS_USER=09=091
+#define CLK_MOUT_PLL_PERI_IP_USER=09=092
+#define CLK_MOUT_PLL_PERI_UART_USER=09=093
+
+/* CMU_PERI dividers */
+#define CLK_DOUT_CLK_PERI_I2C=09=09=094
+#define CLK_DOUT_CLK_PERI_SPI0=09=09=095
+#define CLK_DOUT_CLK_PERI_SPI1=09=09=096
+#define CLK_DOUT_CLK_PERI_SPI2=09=09=097
+#define CLK_DOUT_CLK_PERI_USI_I2C=09=098
+#define CLK_DOUT_CLK_PERI_USI_USI=09=099
+
+/* CMU_PERI gates */
+#define CLK_GOUT_CLK_PERI_I2C=09=09=0910
+#define CLK_GOUT_CLK_PERI_SPI0=09=09=0911
+#define CLK_GOUT_CLK_PERI_SPI1=09=09=0912
+#define CLK_GOUT_CLK_PERI_SPI2=09=09=0913
+#define CLK_GOUT_CLK_PERI_USI_I2C=09=0914
+#define CLK_GOUT_CLK_PERI_USI_USI=09=0915
+#define CLK_GOUT_PERI_AXI2AHB_MSD32_ACLK=0916
+#define CLK_GOUT_PERI_BUSIF_TMU_PCLK=09=0917
+#define CLK_GOUT_PERI_CAMI2C_0_IPCLK=09=0918
+#define CLK_GOUT_PERI_CAMI2C_0_PCLK=09=0919
+#define CLK_GOUT_PERI_CAMI2C_1_IPCLK=09=0920
+#define CLK_GOUT_PERI_CAMI2C_1_PCLK=09=0921
+#define CLK_GOUT_PERI_CAMI2C_2_IPCLK=09=0922
+#define CLK_GOUT_PERI_CAMI2C_2_PCLK=09=0923
+#define CLK_GOUT_PERI_CAMI2C_3_IPCLK=09=0924
+#define CLK_GOUT_PERI_CAMI2C_3_PCLK=09=0925
+#define CLK_GOUT_PERI_I2C_0_PCLK=09=0926
+#define CLK_GOUT_PERI_I2C_1_PCLK=09=0927
+#define CLK_GOUT_PERI_I2C_2_PCLK=09=0928
+#define CLK_GOUT_PERI_I2C_3_PCLK=09=0929
+#define CLK_GOUT_PERI_I2C_4_PCLK=09=0930
+#define CLK_GOUT_PERI_I2C_5_PCLK=09=0931
+#define CLK_GOUT_PERI_I2C_6_PCLK=09=0932
+#define CLK_GOUT_PERI_GPIO_PCLK=09=09=0933
+#define CLK_GOUT_PERI_LHM_AXI_P_PERI_CLK=0934
+#define CLK_GOUT_PERI_MCT_PCLK=09=09=0935
+#define CLK_GOUT_PERI_OTP_CON_TOP_PCLK=09=0936
+#define CLK_GOUT_PERI_PWM_MOTOR_PCLK_S0=09=0937
+#define CLK_GOUT_PERI_BUS_CLK=09=09=0938
+#define CLK_GOUT_PERI_I2C_CLK=09=09=0939
+#define CLK_GOUT_PERI_SPI_0_CLK=09=09=0940
+#define CLK_GOUT_PERI_SPI_1_CLK=09=09=0941
+#define CLK_GOUT_PERI_SPI_2_CLK=09=09=0942
+#define CLK_GOUT_PERI_UART_CLK=09=09=0943
+#define CLK_GOUT_PERI_USI00_I2C_CLK=09=0944
+#define CLK_GOUT_PERI_USI00_USI_CLK=09=0945
+#define CLK_GOUT_PERI_SPI_0_PCLK=09=0946
+#define CLK_GOUT_PERI_SPI_0_IPCLK=09=0947
+#define CLK_GOUT_PERI_SPI_1_PCLK=09=0948
+#define CLK_GOUT_PERI_SPI_1_IPCLK=09=0949
+#define CLK_GOUT_PERI_SPI_2_PCLK=09=0950
+#define CLK_GOUT_PERI_SPI_2_IPCLK=09=0951
+#define CLK_GOUT_PERI_SYSREG_PCLK=09=0952
+#define CLK_GOUT_PERI_UART_IPCLK=09=0953
+#define CLK_GOUT_PERI_UART_PCLK=09=09=0954
+#define CLK_GOUT_PERI_USI00_I2C_IPCLK=09=0955
+#define CLK_GOUT_PERI_USI00_I2C_PCLK=09=0956
+#define CLK_GOUT_PERI_USI00_USI_IPCLK=09=0957
+#define CLK_GOUT_PERI_USI00_USI_PCLK=09=0958
+#define CLK_GOUT_PERI_WDT_CLUSTER0_PCLK=09=0959
+#define CLK_GOUT_PERI_WDT_CLUSTER1_PCLK=09=0960

--=20
2.47.3


