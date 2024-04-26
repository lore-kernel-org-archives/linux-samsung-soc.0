Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086451422D4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125790; cv=none; b=A0Bcjx3kmPrwxC/ghW17K/jhy+mAIad5x721rwnbwLATkzLwcXbBj3F6QMYRwZ51zhJzxTngZO1V3oCoDn/LnnkTcvJospk1XYHI8Mv2Uhvo/vIyvb4+XCVN97dVNzKIPPdnZVQux4JfmGx2t1L3n76gGWQE41pgBAr8UnRmpy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125790; c=relaxed/simple;
	bh=kEIXNWge+gu6r69LP1+LoW5ZL/kMo1721Gar8FYgwE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7Jh1YBsMsGuWHhPezN7qEhCW57eo3zEEEUXI9Olf/WYv4FrBn6+2IM80NQ2K2INW3t2N7ByGQ2MpAATBy+KfV4FY5iAK63mnadRcsogcEHGcE0Hot5vkhm0+8mZ/2TxvPQHRKRm2rAKmNiXuAz9R2c7FxCNnOk3up7hrrZSYMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sljorf8a; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sljorf8a"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a5883518135so224806866b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 03:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714125787; x=1714730587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXVLcsEROWtnozSKM9ibFjZVD9YeGJfdJ8xwiEDpbCA=;
        b=sljorf8abuXbxliOoFIkZbMZ0KUNYxoCzpmwvJ1PvhBKTdXzaf70grQr3owfp4C75D
         dJONjyTB8CHK8uQR/tFfFZY40eWUmUUIqr2daX4IJw91FqKCGxlYnyvNyZU3uDsC4ACP
         9rjrKvY9bswDq6kEhMgm+vdndEzBTt9YetFh1333Nd6CklzPNyLbojTMEqwvZx1PzMTQ
         XYPNBO5NSUdsIUV5Gy0IzR7Z7NQmEN0+7eq3pHIhRDA5GOgdpqE1vYt5EILyrZ7HhP7N
         Aha1WZRXgOq/b6haHvUhJFpquxREvVUDNudsIwS+MOm5YpCf+RNKIzJYkbQJAak8+X0Z
         W8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714125787; x=1714730587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXVLcsEROWtnozSKM9ibFjZVD9YeGJfdJ8xwiEDpbCA=;
        b=ix8tVkw51yaG2L4REcnfbF3urJPIY332u0VSqNAGT0WFLQMf+EwFpVa2wh6+hqSfUO
         dOTnG8EQJuwCmhQ1q/ZqFYwKR6BwdfyNsP2Mp++B3Tc8HtkGBWp2LDykG2atHLFMZY9n
         MZYAmrt2i4cx1LMYzvTzBsCOoi0jPkmO1JO9gzTAW+2EMylPrzECsbGJuOfJrYakmTX1
         tWqdwf/hJivgGAUUT1oJ41q25MyFaa0jJSOgrRnCObBp5ABhVqceiW2x3Daw1LOz4a7b
         yGUB3fikyG9Ao56aMAF9KIbQ1Imb/GF36a7EjeCz8ncohahWtj1iLZiQVUCQ0frwnbzz
         okVg==
X-Forwarded-Encrypted: i=1; AJvYcCXxkYTAZHwka8p5qzmtEGlIaIVFfwY0Ky6oiJPOCF0SIm7Od3e+et45syT3IlgzQe6Yvn5Ex1xOh/bwrxZi/zGgJwRa00ZOf5NL8p5pE3vb2pw=
X-Gm-Message-State: AOJu0YwPDsWKVd4NM1SJZhgseTvirC5U+Hm0cmZZkWWoaHVuCPNntq4p
	sN0SLjwEsfe3xnqNmXh/icsECkfU+BFgpLl/1F9fzWoF0eQ5Jd865hnTTGoY+1U=
X-Google-Smtp-Source: AGHT+IHWAn2UwzuKzKX4rvGcf0ZfBBLAyRhZHKgOyrPEhmB6C/M04p2DwE2DH2kIrrp+nKiuxjo6WA==
X-Received: by 2002:a17:906:1457:b0:a52:2c0e:2e91 with SMTP id q23-20020a170906145700b00a522c0e2e91mr1517888ejc.17.1714125787362;
        Fri, 26 Apr 2024 03:03:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b00a555ef55ab5sm10417289ejj.218.2024.04.26.03.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:03:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 26 Apr 2024 11:03:04 +0100
Subject: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: add HSI2
 clock management unit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240426-hsi0-gs101-v2-1-2157da8b63e3@linaro.org>
References: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
In-Reply-To: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

From: Peter Griffin <peter.griffin@linaro.org>

Add dt schema documentation and clock IDs for the High Speed Interface
2 (HSI2) clock management unit. This CMU feeds high speed interfaces
such as PCIe and UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
[AD: keep CMUs in google,gs101.h sorted alphabetically, and resolve
minor merge conflicts in google,gs101-clock.yaml]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml         | 26 +++++++++
 include/dt-bindings/clock/google,gs101.h           | 62 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 94dcc4f84c85..6323971e1f2f 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -31,6 +31,7 @@ properties:
       - google,gs101-cmu-apm
       - google,gs101-cmu-misc
       - google,gs101-cmu-hsi0
+      - google,gs101-cmu-hsi2
       - google,gs101-cmu-peric0
       - google,gs101-cmu-peric1
 
@@ -97,6 +98,31 @@ allOf:
             - const: usb31drd
             - const: usbdpdbg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-cmu-hsi2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: High Speed Interface bus clock (from CMU_TOP)
+            - description: High Speed Interface pcie clock (from CMU_TOP)
+            - description: High Speed Interface ufs clock (from CMU_TOP)
+            - description: High Speed Interface mmc clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: pcie
+            - const: ufs_embd
+            - const: mmc_card
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 7a2006f0edf1..442f9e9037dc 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -367,6 +367,68 @@
 #define CLK_GOUT_HSI0_XIU_D1_HSI0_ACLK				51
 #define CLK_GOUT_HSI0_XIU_P_HSI0_ACLK				52
 
+/* CMU_HSI2 */
+#define CLK_MOUT_HSI2_BUS_USER						1
+#define CLK_MOUT_HSI2_MMC_CARD_USER					2
+#define CLK_MOUT_HSI2_PCIE_USER						3
+#define CLK_MOUT_HSI2_UFS_EMBD_USER					4
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCIE_003_PHY_REFCLK_IN		5
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCIE_004_PHY_REFCLK_IN		6
+#define CLK_GOUT_HSI2_SSMT_PCIE_IA_GEN4A_1_ACLK				7
+#define CLK_GOUT_HSI2_SSMT_PCIE_IA_GEN4A_1_PCLK				8
+#define CLK_GOUT_HSI2_SSMT_PCIE_IA_GEN4B_1_ACLK				9
+#define CLK_GOUT_HSI2_SSMT_PCIE_IA_GEN4B_1_PCLK				10
+#define CLK_GOUT_HSI2_D_TZPC_HSI2_PCLK					11
+#define CLK_GOUT_HSI2_GPC_HSI2_PCLK					12
+#define CLK_GOUT_HSI2_GPIO_HSI2_PCLK					13
+#define CLK_GOUT_HSI2_HSI2_CMU_HSI2_PCLK				14
+#define CLK_GOUT_HSI2_LHM_AXI_P_HSI2_I_CLK				15
+#define CLK_GOUT_HSI2_LHS_ACEL_D_HSI2_I_CLK				16
+#define CLK_GOUT_HSI2_MMC_CARD_I_ACLK					17
+#define CLK_GOUT_HSI2_MMC_CARD_SDCLKIN					18
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCIE_003_DBI_ACLK_UG			19
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCIE_003_MSTR_ACLK_UG			20
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCIE_003_SLV_ACLK_UG			21
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCIE_003_I_DRIVER_APB_CLK		22
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCIE_004_DBI_ACLK_UG			23
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCIE_004_MSTR_ACLK_UG			24
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCIE_004_SLV_ACLK_UG			25
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCIE_004_I_DRIVER_APB_CLK		26
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCS_PMA_PHY_UDBG_I_APB_PCLK		27
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCS_PMA_PIPE_PAL_PCIE_I_APB_PCLK	28
+#define CLK_GOUT_HSI2_PCIE_GEN4_1_PCS_PMA_PCIEPHY210X2_QCH_I_APB_PCLK	29
+#define CLK_GOUT_HSI2_PCIE_IA_GEN4A_1_I_CLK				30
+#define CLK_GOUT_HSI2_PCIE_IA_GEN4B_1_I_CLK				31
+#define CLK_GOUT_HSI2_PPMU_HSI2_ACLK					32
+#define CLK_GOUT_HSI2_PPMU_HSI2_PCLK					33
+#define CLK_GOUT_HSI2_QE_MMC_CARD_HSI2_ACLK				34
+#define CLK_GOUT_HSI2_QE_MMC_CARD_HSI2_PCLK				35
+#define CLK_GOUT_HSI2_QE_PCIE_GEN4A_HSI2_ACLK				36
+#define CLK_GOUT_HSI2_QE_PCIE_GEN4A_HSI2_PCLK				37
+#define CLK_GOUT_HSI2_QE_PCIE_GEN4B_HSI2_ACLK				38
+#define CLK_GOUT_HSI2_QE_PCIE_GEN4B_HSI2_PCLK				39
+#define CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_ACLK				40
+#define CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_PCLK				41
+#define CLK_GOUT_HSI2_CLK_HSI2_BUS_CLK					42
+#define CLK_GOUT_HSI2_CLK_HSI2_OSCCLK_CLK				43
+#define CLK_GOUT_HSI2_SSMT_HSI2_ACLK					44
+#define CLK_GOUT_HSI2_SSMT_HSI2_PCLK					45
+#define CLK_GOUT_HSI2_SYSMMU_HSI2_CLK_S2				46
+#define CLK_GOUT_HSI2_SYSREG_HSI2_PCLK					47
+#define CLK_GOUT_HSI2_UASC_PCIE_GEN4A_DBI_1_ACLK			48
+#define CLK_GOUT_HSI2_UASC_PCIE_GEN4A_DBI_1_PCLK			49
+#define CLK_GOUT_HSI2_UASC_PCIE_GEN4A_SLV_1_ACLK			50
+#define CLK_GOUT_HSI2_UASC_PCIE_GEN4A_SLV_1_PCLK			51
+#define CLK_GOUT_HSI2_UASC_PCIE_GEN4B_DBI_1_ACLK			52
+#define CLK_GOUT_HSI2_UASC_PCIE_GEN4B_DBI_1_PCLK			53
+#define CLK_GOUT_HSI2_UASC_PCIE_GEN4B_SLV_1_ACLK			54
+#define CLK_GOUT_HSI2_UASC_PCIE_GEN4B_SLV_1_PCLK			55
+#define CLK_GOUT_HSI2_UFS_EMBD_I_ACLK					56
+#define CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO				57
+#define CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK				58
+#define CLK_GOUT_HSI2_XIU_D_HSI2_ACLK					59
+#define CLK_GOUT_HSI2_XIU_P_HSI2_ACLK					60
+
 /* CMU_MISC */
 #define CLK_MOUT_MISC_BUS_USER				1
 #define CLK_MOUT_MISC_SSS_USER				2

-- 
2.44.0.769.g3c40516874-goog

