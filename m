Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4672D9EEC
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030978; cv=none; b=U06bfp6XCMRNlGrhgryoHNpXbhdTX0TDYJq1qiUyIt+N9a1rCprkxW+j9CsjU1uYRh4Y6qhe51QNnj5cgA4LpnTnqRFHiD8fi0QSQ8hyWpQwOzX15AT/0bdcxUX2tsOlTQ3IvtIAqUPjiIQ5c2/fO95bBAFkMUXMiaVhmbMS51s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030978; c=relaxed/simple;
	bh=3Km3fcNcSPZ2Pb31AkgSOmK8Yw3sAe9TSLDvBZGtkMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0sjEl5czK7oE5ielKtawLDq/ER7J/ViBqVAjLe4tq4YOep3qzE5vD80GVHeyGkGHuNfR/JgSP5DCyjRJRRwhvRuIIPTYWWeIRn8OwGxFCN4Y8AG/42uWLVXmIhzHXzHaBRrcBZ4jdnTlPi+4qrT8LNN/4eUUd6vztL9IKzYbfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o63VOEKY; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o63VOEKY"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so3507614a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751030973; x=1751635773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97dsq8shbijTwl1Kc6C9X7zbEyd2fSdds/39rteFriY=;
        b=o63VOEKYRWpqWTmMxuipc6iLDL7rnLKHXZgNtz7pjFZWNbs3r35I2aZlwspkTgzvM5
         s/7jlLJ1k5PMUHXkdGe633aoJnEP8MF/XGo4pRS0lDcZFqwDpLVSslUfGvMviP0368YJ
         /02aVgQZlPOOr6661zIu8DhMImKic5JtPuMRqi0az8l8ulZuhFf8Y9TZ+2TDkgYCPOB7
         hMyNR+Ajq93ofHNYoD8gBp+KTe26j3hau6hUh3RrK7spnq9py29jIQ6zJsyJJs1tsKgq
         Olb7kcqPDWJRQliMqH7BG+aVdbfdr8bCC6Y1DI4V67bX3897fVenEqca6LThPhE3fffD
         x4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030973; x=1751635773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97dsq8shbijTwl1Kc6C9X7zbEyd2fSdds/39rteFriY=;
        b=OKzzXHLrJsUPnTL13jOxjcw5qham9HkjGWTM5IVq/o11lEi977RUI95D23VDZ8NplR
         fCdR4d9yIawr0bYdi1ta0Dd5AYLnp65F02N2blhRzooTFlskBb1ApYzeqTMjVbyntd5B
         gUJugmxtvC8nYMVctWlxIrI2jcSWf9pfKSnpeb4w1IDwwRuTILg3WwfFFEn0GLG5gr4j
         YpfymlzAzSMCVKt24OOyX0/VtUBexjADb64peYRYzAlQhSmxf8ad+90KsrfqJSGWporX
         p0cB3gnDW1px1E3Ma/jD/BQjp9XkBNz6oOYHaI61oTn2kPD3s0QaNB6k4pfgAWzbH3Xl
         OxDA==
X-Forwarded-Encrypted: i=1; AJvYcCXErJgyLSCjXRF3Kig/+69TUOFTC39UtMBGKunFMInBqUoM9fHnX2FMZ0VpIAUNqLwpxPMDMmY518QmdOJ/t6nPgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynDVs5Hn2Y1v+IVISJI2pCFJK42EqY3tpDEwXYPkEz02h1+onQ
	ItV+akG47nige2hZTzTfGzcrylhy0kC33TV4YmQCkWy6JLDw7H0YitVzmkECEtfMRb4=
X-Gm-Gg: ASbGncuraN3YbxrDR5ia3d16e/zxXds0bTROv7Op3Y2LtLVDCCQxDLTYdQyNk7AZcnB
	lb9QFD5iFDb9N0fiLmRPGGd7SMWVIacPlCHMjBUna4iYvMX+TJ//gdac1lSHSasip/Z2v5qL/61
	KIWdMU9cMxMrV+JNYHzqQowa0MZUTF7WqwHiYS7D1UdQReL44vOo0NkgFUmV7ltX2+sWRKBEc+s
	Y49N28xXXyTmsD3E3HHpNantbhwFa5Na+CdvodAqxU1bRtlPrMkHdVZtb6ZxLpdqxBFZSu8ILmr
	wQth0bDB8mDd4hzZDCiRzkb/qLfXJ1sx/ZEOM28OgnrCLPPkWPygsxFvCQ4AAxm+7+C7qgSu1yl
	JK2/TvZ54MU2LsolxOzGRMHrItL1KNUQh1FsWLDxeRxV8gQ==
X-Google-Smtp-Source: AGHT+IGBgERbQ8JzXtKIK0Cr/Y2P+P8Vyd6f4ZzXNGWb2nY1h3VKwcv0VnVGjAGel1FVXEgEuaqQWw==
X-Received: by 2002:a05:6402:40cd:b0:607:ec35:eb8e with SMTP id 4fb4d7f45d1cf-60c88e72eaamr2655542a12.20.1751030973492;
        Fri, 27 Jun 2025 06:29:33 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82908297sm1462702a12.26.2025.06.27.06.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Jun 2025 14:29:31 +0100
Subject: [PATCH 2/3] arm64: dts: exynos: gs101-pixel-common: add main PMIC
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-gs101-reboot3-v1-2-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
In-Reply-To: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On Pixel 6 (and Pro), a Samsung S2MPG10 is used as main PMIC, which
contains the following functional blocks:
    * common / speedy interface
    * regulators
    * 3 clock outputs
    * RTC
    * power meters
    * GPIO interfaces

This change enables the PMIC itself and the RTC. We're still working on
the remaining parts or waiting for bindings to be merged, hence only a
small subset of the functional is being enabled.

The regulators fall into the same category (still being finalised), but
since the binding requires a 'regulators' node, an empty node is being
added to avoid validation errors at this stage.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index cd8e1b8a10b111190b984e104f749d04514d0449..c1b51f4cfb8c174852b44690f84ed1aa0b4057c2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -100,6 +100,19 @@ cont_splash_mem: splash@fac00000 {
 	};
 };
 
+&acpm_ipc {
+	pmic {
+		compatible = "samsung,s2mpg10-pmic";
+		interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int>;
+		wakeup-source;
+
+		regulators {
+		};
+	};
+};
+
 &ext_24_5m {
 	clock-frequency = <24576000>;
 };
@@ -290,6 +303,12 @@ if_pmic_int: if-pmic-int-pins {
 };
 
 &pinctrl_gpio_alive {
+	pmic_int: pmic-int-pins {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
 	key_power: key-power-pins {
 		samsung,pins = "gpa10-1";
 		samsung,pin-function = <GS101_PIN_FUNC_EINT>;

-- 
2.50.0.727.gbf7dc18ff4-goog

