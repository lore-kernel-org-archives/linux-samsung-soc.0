Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951E76C95
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550127; cv=none; b=Br/LW0psY8/LLtNQZ5FQWXH4IP8d6Dz0C1tBK0/9VVv3P47RpkC5BOVNHx9YGpzFJ14KCqcg51yBoRm7hXx8EXHKW65onBYE+PL3F68T43hwpgGY4w9GO3l9zJrygZRJgvJ48htM4edCaOLVFnkNLFpXSThgVsS6GvwJC8VMAnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550127; c=relaxed/simple;
	bh=NdU2LIEnp5ujFawnyZ2tpXI9lweTV2bJLnqL5ZSnYQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnRsfH+uUwYeodVXQoO0FR8ZECeL0ejFSR8cgcMC15YAaRG+qEGxVUOlC4kOx/3bUotXgqY1cfrKSJTponShYqiBwihoBc8c/TGCwFWyp64/blmnzK4FFt3gIM3aB8ebYieVL0gqm6cMAeUVqJE7uDYqag6i5pY4RbfJMrv46UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rZOKeLV/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rZOKeLV/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3604697d63so37126866b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550122; x=1707154922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvAE0+fmvTQFFSzj6Dft6tKLSUPrgAbTsR8MYrmwQCs=;
        b=rZOKeLV/lH7u5IPLu1QfLdNHJQ7OrBnIXnWkTGCENEQ0omr3ryRFjji108WlvTDAkE
         yM7EaZCUI9IuncfW7EF049ORbMUYKyHsVU9nHEhy8Spum20e3zvnaVcz6IZGeKVOQJQh
         rKpV2uq6/9KTkcmBFZfoiXIiKGTA14PkhZJDH/ML4Gnua5spzCYQyFGYf8cyuVrOSv0y
         3Ah9dCYKGU3x5wpR58cey7Wo7Q9NMMqEy7xxeOOUHUeoeRt97Ge3GYV8DirdaLJ8nMy/
         yD2RbNVc41vwtViSvj1ZJq8Lm3dtuq2iHQHtmcW+towZPCA+lNA/Twpx/BWmPObAAAlV
         ofvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550122; x=1707154922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvAE0+fmvTQFFSzj6Dft6tKLSUPrgAbTsR8MYrmwQCs=;
        b=klAnptIaKePQqP8iFEW9HtdiHPFowHi5coxCwGs5CcqtSxyhzwqP4GX3kJGn8TJQRt
         AsmX10nb/x/DJledJiqxY4q3MhFAbvzvmx/QMyGzos+Lx9tJDxl9ZpZc6DkVsxabP8EF
         ODBJP+wnR4sZGjVO5OD/RiV0f5vc6XB/AzI2MNFr2uds1znB/MJMUYZsaYNljSqWot8E
         QPGUtBeCQ42jy41JmgbJBwPA17esVyK0DhRVLsA6KExG+2PE4XgcVSVpfUu1ea12BzDT
         3R8AF+KrxMKl1BoLsniuhPMuTTVvjnLSs7YD6vL5lhPSZmyhVT7OLAbB2wHosE7nX3US
         c77A==
X-Gm-Message-State: AOJu0YzNbLXwxhjF8YSXoq9x8FxxekOeRPa6Ew4iUF1y3ZadfCRieGLA
	u6BkH/s3pmt7TQsYrvsqqurZFjBkziBuYPE5ExIvUUn+KWWxJFI2Y8cNLuTbcRw=
X-Google-Smtp-Source: AGHT+IGG2qv9SLqdP+/Zs4jChkXZSXrjt3vkMjG+GIKLzgCVLAQHQNFisHcQxMZERY7VMS4PH/RvlQ==
X-Received: by 2002:a17:906:fa04:b0:a28:fe84:f2c6 with SMTP id lo4-20020a170906fa0400b00a28fe84f2c6mr4933587ejb.15.1706550122504;
        Mon, 29 Jan 2024 09:42:02 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id qx25-20020a170906fcd900b00a311a360433sm4237765ejb.143.2024.01.29.09.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:42:02 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	inux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: exynos: gs101: define USI12 with I2C configuration
Date: Mon, 29 Jan 2024 17:40:09 +0000
Message-ID: <20240129174151.1174248-7-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240129174151.1174248-1-andre.draszik@linaro.org>
References: <20240129174151.1174248-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the gs101-oriole board, i2c bus 12 has various USB-related
controllers attached to it.

Note the selection of the USI protocol is intentionally left for the
board dts file.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

---
v2:
* reorder pinctrl-0 & pinctrl-names
* collect Reviewed-by: tags
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e1bcf490309a..9876ecae0ad8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -451,6 +451,36 @@ pinctrl_peric1: pinctrl@10c40000 {
 			interrupts = <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		usi12: usi@10d500c0 {
+			compatible = "google,gs101-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_5>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1010>;
+			samsung,mode = <USI_V2_NONE>;
+			status = "disabled";
+
+			hsi2c_12: i2c@10d50000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d50000 0xc0>;
+				interrupts = <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				pinctrl-0 = <&hsi2c12_bus>;
+				pinctrl-names = "default";
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				status = "disabled";
+			};
+		};
+
 		pinctrl_hsi1: pinctrl@11840000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x11840000 0x00001000>;
-- 
2.43.0.429.g432eaa2c6b-goog

