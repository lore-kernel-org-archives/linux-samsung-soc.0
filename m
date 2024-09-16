Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F4C15ADB3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Sep 2024 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726505912; cv=none; b=UBRbmDylw6bN1imYMwtgAZs+1qderNlGupLyiSMTdYofBHd2k9lgKvON2SGN5o+nNBruCIlbetfvXoz/9L7U1nr9eXlaYal2kibniggakidkZIixiXHm1amvqSOS0RCCAleyKBTDs8WpVNzcKUWIY6SSlMAw+lI9VMSKQYHeQug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726505912; c=relaxed/simple;
	bh=JUGwCQgDc1XQaJ20BNUbmsAs/IyKe+i8y/P3i/N6YLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rpOIZR9Z45LQSrdm7qmat4w2ShlYdjFbeRLmUsBq80otNuSw1TW6PH7kvaDAuTDWzvNnErwrUQbD8Tj/7w5VBYLd75aE8yAR5kmRJgGFI6wkPJloHVw+a+2njYiCpLMSRwoA51WiyEFVbZqxaemKWQi77A/VnTCK5WhDItwcf+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tBOCr5Of; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tBOCr5Of"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so921931066b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Sep 2024 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726505909; x=1727110709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POee83DySvDnOivfI8SVt6siVzJDLaBFoZypeDiY6xs=;
        b=tBOCr5Of0nHWV7PJmzmHsQohEQbA8EBHueB5Bg7Ln6hOWZRpe0OOvGNB6252gZ8Ieu
         aVw2HlfNhlnA1ZkStKPQu3amrhxNyRCKFXUTnrKjX7xXHkWUPQ/yAIvHJVlSq2spNfuW
         9WrGCkba0DIEi/J0IJhzX5ct88PxXZFRKKiONC/l9qQm2qX5S7LwjGd2ZTqg/gWxy1nm
         zkuhLH6kJoXzZaJ55C3NlJBSXVplyZv/Nowd0e4lsbEm9v8OpSng0c2yk2jQw8cXSxXh
         6F4rsuAfJp7mCG8a6qJQhobHoNZ+1BtLtk3HQkzEkjmUnef6oT2iq3J/tc9qwMjTRWgj
         1u+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726505909; x=1727110709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POee83DySvDnOivfI8SVt6siVzJDLaBFoZypeDiY6xs=;
        b=jlD7/qvR+PRReG6l/g3D5Tp/JsB0B1rjOlXaL17102GU0phc5svGrqRBhXo3HsZYmQ
         KwbN3vqvXEcS120hfr+KC+rWoNd8/QUfqW1s5mSQORenMR7VImJ27QVEy+40pOp+XxDA
         MioU9dz7hYQL8XeB020V/Ugo3oa6BOSsCUQCaC1DGdH4UZH2LtrEWGq9mQBSrm3fD1zq
         HkOheYD3IUJA+KFSYxBs/HawiJzIk4feu5WXCFJJnehDS5QcivRHqxopdXwac2ak2BnH
         baathGx5bdQk+yScnjB68d5XjIOJdiR2wNIVzBcfGNL2qbZmtEwczDMJU4Pam7zPZEyv
         NtFA==
X-Forwarded-Encrypted: i=1; AJvYcCVbSX4XYovyJMZDipcZ9P9gqOGNbCdy42JnFxr1b4lzrMOmzyv6lPEWhFNUTKS7LdS2tbzTOvskLq2TjMurU4aMjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2PiN4ob2MG2zb+DEeoksAC1vowmcLK37DnIke8JmbYv/CAHJQ
	2+2WwDGlVJTrvC4Q0gIvoRug2ya3jje5uqg+9QPihBKFBY6yTIq47PAxfE58Hws=
X-Google-Smtp-Source: AGHT+IG4lR4FfFrt1+aMIT+Isdeh2RHT8IgEpUYl774+4W1+M8HEGgjX7tXlhYp0yOF9k9KIgJQKQA==
X-Received: by 2002:a17:907:72d1:b0:a8d:6372:2d38 with SMTP id a640c23a62f3a-a8ffabc1d72mr2373277566b.18.1726505908867;
        Mon, 16 Sep 2024 09:58:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90979ceb67sm32992966b.219.2024.09.16.09.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 09:58:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 16 Sep 2024 17:58:27 +0100
Subject: [PATCH 2/3] arm64: dts: exynos: gs101-oriole: enable max20339 OVP
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240916-max20339-dts-v1-2-2f7ed7c24e83@linaro.org>
References: <20240916-max20339-dts-v1-0-2f7ed7c24e83@linaro.org>
In-Reply-To: <20240916-max20339-dts-v1-0-2f7ed7c24e83@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Enable the Maxim max20339 OVP with load switches.

This is the first device behind the USB plug and can gate all incoming
power as well as protecting the input path from overvoltages.

Its load switches are used for wireless charging and for OTG.

Regulator and GPIO line names have been chosen to match the schematic.

Note that its interrupt line is connected to a Maxim max77759 and
supplies are connected to a PMIC and to a boost regulator controlled by
that PMIC, none of which we have drivers or DTS entries for at this
stage, so those parts have been left out.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 387fb779bd29..a3276aa91091 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -68,6 +68,12 @@ ufs_0_fixed_vcc_reg: regulator-1 {
 		regulator-boot-on;
 		enable-active-high;
 	};
+
+	/* This represents Vbus coming from the USB Type-C connector */
+	reg_src_ppvar_usbc_vbus: regulator-src-ppvar-usbc-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "src_ppvar_usbc_vbus";
+	};
 };
 
 &ext_24_5m {
@@ -90,6 +96,51 @@ eeprom: eeprom@50 {
 &hsi2c_12 {
 	status = "okay";
 	/* TODO: add the devices once drivers exist */
+
+	ovp: ovp@35 {
+		compatible = "maxim,max20339";
+		reg = <0x35>;
+		/* TODO: add interrupt once driver for max77759-gpio exists */
+		/* TODO: Update this once PMIC is implemented (PP1800_L2M_ALIVE) */
+		dig-supply = <&reg_placeholder>;
+
+		insw-supply = <&reg_src_ppvar_usbc_vbus>;
+		/* TODO: update this once boost regulator exists */
+		lsw1-supply = <&reg_placeholder>;
+		lsw2-supply = <&reg_placeholder>;
+
+		gpio {
+			gpio-controller;
+			#gpio-cells = <2>;
+			/*
+			 * "Human-readable name [SIGNAL_LABEL]" where the
+			 * latter comes from the schematic
+			 */
+			gpio-line-names = "Vin valid [SRC_PPVAR_USBC_VBUS]";
+		};
+
+		regulators {
+			insw_reg: insw {
+				regulator-name = "PPVAR_VBUS_OVP";
+				regulator-active-discharge = <0>;
+				regulator-min-microvolt = <5850000>;
+				regulator-max-microvolt = <14500000>;
+				regulator-ov-protection-microvolt = <14500000>;
+			};
+			lsw1_reg: lsw1 {
+				regulator-name = "PPVAR_VBUS_OVP_LSW1";
+				regulator-oc-protection-microamp = <1460000>;
+				regulator-ov-protection-microvolt = <1>;
+				shunt-resistor-micro-ohms = <120000000>;
+			};
+			lsw2_reg: lsw2 {
+				regulator-name = "PPVAR_QI_VOUT_TX";
+				regulator-oc-protection-microamp = <1230000>;
+				regulator-ov-protection-microvolt = <1>;
+				shunt-resistor-micro-ohms = <143000000>;
+			};
+		};
+	};
 };
 
 &pinctrl_far_alive {

-- 
2.46.0.662.g92d0881bb0-goog

