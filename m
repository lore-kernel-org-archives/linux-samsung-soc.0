Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37561143C6F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905574; cv=none; b=HAvh59gL9YZTOa7KNolFq0z46CU1oyyls85ypyadfaJMea5yfv2M9cGOdmKmmMIrqc34Ayx0r9NfehyVBBfUeLmkH2Vxzajg3RttNS1mc4wmXL6E/OuO65BMQO/e81huYOExUyXUeY8OluP7djL9rOZD1FQj+1W1+s3zKCDP4Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905574; c=relaxed/simple;
	bh=ynd0BU/QdPiedpmwy4ixCC8VlFeGhbbYTb+LcXtnnXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lKToribB7Wep4geFUR1JHe4lqy0ASvHGC6fN9M44wnw4NigRhpUKZbpegSnEDrRkg9VBalKEYruc5lqbR7GR+ZPEL7CEloVGbGMXlVKY8Pmsa+9sgkcpzoBi12rdMZa5sc+Js3+I/fhK17e88grSyoxXSR9dx+bmvHkEH8/7QDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D2ibth5W; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D2ibth5W"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41adf155cffso4826245e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905571; x=1714510371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBOMQvlwyQAQ+Abc2xhhW1DcJnrKUYVw/PPBC3M05Co=;
        b=D2ibth5WGx/sJuCTjCw1+zr0Wrz35aIb7zoPj1Vcp4HLkxXiLCAahREWvKp6gpIeM2
         a+W6831EAYekrGd78OrPbeKtFHg/nnYBG5/+l5iPEcZm0Mp3hQdVekoAgo4bgYEvXial
         ASQU15DQuVuP/CMgfa8RTaFbBlN+7f1R77oeAc5N8J6kAl31xInCH4jGCCH+ttFBLOeb
         lKERRdAMx/rXYivWsLbwzvw/Oy61Jiny1uT+qfRFFxGkHW7amk3mq4gy9FQYxuUT8Cy+
         07uM1GZzYhET48fsCdy1E9mx30jajQy7+7xqgvrqY2Fppt4UqejUNiGACf6tdYQ2XqBK
         IDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905571; x=1714510371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBOMQvlwyQAQ+Abc2xhhW1DcJnrKUYVw/PPBC3M05Co=;
        b=MK/Sseb3w4m9ts+9YWaBVJPHEyV83u3XPU6aOx1m7t0h33pwivrGuDGONDWemP7szG
         4cN2udu7p/kcyFqWdLC07ZmlvlhaAyXQqta58PLYjqd9urtxJqRrwhVN5OUtPjcaVDYq
         xJ3tF1/db6ultO1LIjs4DElDEUkIlq/wCy2umeer2UJZ/XIgZjtFFApTjm4OaCG7s5gl
         9CDUr01+UXkwT61sQ+iUQR+MjsKvP6/i9JwITeItNilliGG/5ZVeI78Jav4iFOQ9TlCm
         iaav2W8MCkNEuqEzbqq7e9B5Aj4kxaETDRmq3NLHKW7Bdr05zG8yh7HjFUoidTn69oWN
         bubw==
X-Forwarded-Encrypted: i=1; AJvYcCW7XGWW1ozpvFbRYeUj1XUytTwvvl57n5PXYB7aurdrZBV+1e2bQw7ERi01wF4bULwkr/TY9Rixe15u6OQP5NmBJCKnW6xNyrG6oY/UeLHH3v4=
X-Gm-Message-State: AOJu0YybcQwSRikWgCKPpedQiuIGc+YBlA0AWq8zGIY0FFE8Lg952oxc
	y49G2NP59794nGV7alxj6IqEp0930vRUtrARpHXA9gnj506fBvaocwe8F07I4Bs=
X-Google-Smtp-Source: AGHT+IG9DgCjmKcQA9J2q7MrzxwwWtFfg6SaXIWhfP3iX6GYqmoGdroKdUSDaXrKbhvSY/tA+wyliw==
X-Received: by 2002:a5d:5610:0:b0:343:b252:2222 with SMTP id l16-20020a5d5610000000b00343b2522222mr272098wrv.6.1713905571616;
        Tue, 23 Apr 2024 13:52:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id ww4-20020a170907084400b00a51d88e6164sm7443632ejb.203.2024.04.23.13.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:52:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 21:52:49 +0100
Subject: [PATCH 2/2] arm64: dts: exynos: gs101-oriole: enable USB on this
 board
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-usb-dts-gs101-v1-2-3421b0371298@linaro.org>
References: <20240423-usb-dts-gs101-v1-0-3421b0371298@linaro.org>
In-Reply-To: <20240423-usb-dts-gs101-v1-0-3421b0371298@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Pixel 6 (Oriole) has a USB-C connector that can act as host or device.

The USB role is detected dynamically using a MAX77759 TCPCI controller,
but since there is no driver for the MAX77759, the role is defaulted to
peripheral, without any endpoints / ports.

This allows Oriole to be configured as a gadget, e.g. using configfs.

As PMIC regulators are not implemented yet, we rely on USB LDOs being
enabled enabled by the bootloader. A placeholder regulator is used for
now.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 6be15e990b65..03b2a6fdfdc4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -53,6 +53,12 @@ button-power {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_placeholder: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "placeholder_reg";
+	};
 };
 
 &ext_24_5m {
@@ -106,6 +112,24 @@ &serial_0 {
 	status = "okay";
 };
 
+&usbdrd31 {
+	status = "okay";
+	vdd10-supply = <&reg_placeholder>;
+	vdd33-supply = <&reg_placeholder>;
+};
+
+&usbdrd31_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	maximum-speed = "super-speed-plus";
+	status = "okay";
+};
+
+&usbdrd31_phy {
+	status = "okay";
+};
+
 &usi_uart {
 	samsung,clkreq-on; /* needed for UART mode */
 	status = "okay";

-- 
2.44.0.769.g3c40516874-goog

