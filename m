Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4404C148304
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138717; cv=none; b=ZpbVBy/mABFbVRfRhQzqNMtSBTgwMGE9VOr1d6nvCXuiXcwJEid/F6+I4Mp2yvgKC6czcisiQQsLqYqoi/9dDGo3AyuOsgcYqLr1nI3YZaGZIW4Mr9Xmy8UOvADvZFeesBgunsUE9x8wM3llCxcfuUf6uhKY1s0krRQSlyYIhhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138717; c=relaxed/simple;
	bh=MnvkoP96ETwyzM7/zS913M9b2W7iLYDRzbOwtkS5MV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pDzpNAOCjC8gOFpPCLV47OcEvY1/YglCJgQSHBu2BXJ6is4Ed2wOaYvEr2A8Xco3LoVzmt1/Ze7RU+DVjMBM8A3Cq35VnurzTLxIMamfHobXGuojc3192jbResAacqcO7G77DhB50FVJALR1bXdmdyuy09JbUhveCjIX0EECPD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4FhMx14; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4FhMx14"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41b847a81d1so4230775e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714138713; x=1714743513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uH+qHwJN2mCxyTFNfSJEDrH1StJ86nloa+of3UztIac=;
        b=z4FhMx14LmsoNoNXtCMCcl34OzHzNjwtm2Gxb930lUp7MWnY/+GStD3fjP177mJ1Iz
         Z2aXZfr5J3BI5mhfTwDBGC3wDQgXDpym/BP3jWTbao4+cQaFQjRWJs3N+bE2SU9sZG77
         /xYuxRaNmLMhNP0Z+R3Qwm3rB6ec0c4MbAANsPMB427eOTbhiWCImn1uQ2SEStU4F4M7
         X4z+8jF8hc8PaXrroHNkX6jZnw04SbvfE8j2/+PYkzQAouB0NOYR8WMKuMPC6Lbgdpwd
         20HS6cO/7iDa4TXWo1QYObGIHOQ26dFbUoO4uPy4CnEgWpqnuxTcTJwzE/yyUigdLTxT
         Vl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138713; x=1714743513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uH+qHwJN2mCxyTFNfSJEDrH1StJ86nloa+of3UztIac=;
        b=M8EMFd7s8Yp5/9o7mIyPc56MnqorFFDPokj2mqAjTJSieIcyQR7A3Tu73OHdG/OvmZ
         Z1vbnLI8lmTxJB47XSgAMsRXf0ASBeVaD1xSqd1BHU/hxyrRtVJh8yo9zcmxGF2OuS8e
         GsxQOMa3do7csG7KKy4wWM9tvDtSSXH+eTKmjmCcF32ZQBnMvzO4pRoHvHq3/Xc5m4Cl
         E1BlN41TjHs3F7ySM2Ka9WMwVh/iHkqvGN/J2ZweVf4DHnbilCYNFhhG7qCwnLrzIvsC
         kjV3XE9elIbeRZr4N4dRxvo89l2sBaFv8oCBUwZAFckKPd1fedvLaTPssKz/0OnRaJks
         bWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZmY/ka1clnmjJb6gyO5QUE28ror+FyOwk5Zj5Bnds3YV18j4rTr7isIRjGkXEAvB8EyqUoXArcBBuasAkoCG8hbGhZ1TPl/0GuQh+WsyDylU=
X-Gm-Message-State: AOJu0Ywb9zWq5rP71Ci3tidpYSgLgTAWkqGthVLqSFce+bzjmie3bwFO
	4VQGE/g/gzAWrJm13ded8c/p0I1LzebLnbUpb9t/LpzJtpD4LQk6fwJLmccCdXM=
X-Google-Smtp-Source: AGHT+IFm+sPiQDs7FxsoddzmGcb5i4tZc2v1N/h+hnpqJdNZnJd4NgTvZqKCbojGXOgRYrkPQiVqiQ==
X-Received: by 2002:a5d:47a3:0:b0:346:41a7:2fc2 with SMTP id 3-20020a5d47a3000000b0034641a72fc2mr2953583wrb.32.1714138713599;
        Fri, 26 Apr 2024 06:38:33 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:63cc:9bae:f542:50e4])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00341b451a31asm22327689wru.36.2024.04.26.06.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 06:38:33 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 3/4] arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes
Date: Fri, 26 Apr 2024 14:38:23 +0100
Message-ID: <20240426133824.2283144-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240426133824.2283144-1-peter.griffin@linaro.org>
References: <20240426133824.2283144-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the ufs controller node and phy node for gs101.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 09044deede63..4679ca33c6a0 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1277,6 +1277,42 @@ pinctrl_hsi2: pinctrl@14440000 {
 			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		ufs_0_phy: phy@17e04000 {
+			compatible = "google,gs101-ufs-phy";
+			reg = <0x14704000 0x3000>;
+			reg-names = "phy-pma";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <0>;
+			clocks = <&ext_24_5m>;
+			clock-names = "ref_clk";
+			status = "disabled";
+		};
+
+		ufs_0: ufs@14700000 {
+			compatible = "google,gs101-ufs";
+			reg = <0x14700000 0x200>,
+			      <0x14701100 0x200>,
+			      <0x14780000 0xa000>,
+			      <0x14600000 0x100>;
+			reg-names = "hci", "vs_hci", "unipro", "ufsp";
+			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_ACLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_ACLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_PCLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
+			clock-names = "core_clk", "sclk_unipro_main", "fmp",
+				      "aclk", "pclk", "sysreg";
+			freq-table-hz = <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>;
+			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
+			pinctrl-names = "default";
+			phys = <&ufs_0_phy>;
+			phy-names = "ufs-phy";
+			samsung,sysreg = <&sysreg_hsi2 0x710>;
+			status = "disabled";
+		};
+
 		cmu_apm: clock-controller@17400000 {
 			compatible = "google,gs101-cmu-apm";
 			reg = <0x17400000 0x8000>;
-- 
2.44.0.769.g3c40516874-goog

