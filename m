Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532471B87E9
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 May 2025 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748064104; cv=none; b=C/2laSzinEpms1BdftWy5EwQdKqUsIs2pP3cKVG/mQ3nX6lF5VjjnIRFTZs8G+9oGnJ0rA5qeZBZSIE9taRTqMoc+XRq3f0dCyAkCGBoaBdbTxQmMl9vRVOMPPXe5ZHTbSLgx2RrB31SvhI3QeGXBxs8CowXgVYvmAfXPTzw5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748064104; c=relaxed/simple;
	bh=+jwqBuIwFMBeNotpPI6tkIuGBlP83Ihx29EXiedTQeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NfN1A9kVYQXbegFJbb5X1JISIZRoF6XJ0Gcpt+9hmez/Msvk8ltk5Khp7we39k5V4hyUciBrW6ePQVEeJt5voANuu+xCt5iL/zdT7o6h73bHjw9oWajycILVDNNimnL0ifrRMxllvZau950xcV42ig9ruSdcahRdfgsdM7laF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f85i/E8r; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f85i/E8r"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad564b7aea9so300528966b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2025 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064099; x=1748668899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Twazfz0joDHDf3E0VUXRkggat1KdGbQWxfqNgUu5Y8=;
        b=f85i/E8ru0B3StnOmk25oZBBK2xMpuL+AuQtKizcNTRlFtNGk1woykQVEhJcfdrHFg
         UKGKn8O83EdCypfKynAbFWjsj4yuDIDQtNBF6QDrlWUCFq6R1ZpoWoK8Mk3/ZH2DFNnF
         JJxRWw1zoQIKJ72cizxsH1O5N7rwgP2DNK54p2To2Q2RIsm6PxvMUDrKGk8a0V7shqzI
         J6voFEsUVS8YmLSFLp2FlI69GfvA3eD13LSBVTkU15hP9jIx/bDdOaidx83nE2iNt50D
         U/d5aTgxjCo8szne6fEoy31KZuuc2zz3CKZdqwUng/3pZTNLy1mBzdeKtsxJMN1DwSXK
         eK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064099; x=1748668899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Twazfz0joDHDf3E0VUXRkggat1KdGbQWxfqNgUu5Y8=;
        b=JefbusGbwN0r/HJeyAb7zj8PwmmIueAHcoxxhJ2ozdYEO8BCEuLKO24SlI0e70doRs
         nXsRKpjsT7YUakRCkI0ylnfNvWW50MfqJaOP4PTuyt5DZI1JZrcn/t92caFjFVW/ILw7
         3cD0mJWYn0zFzmRlXXmsJzYOXJ2kmkP0AMA2MAOrTq7ltkytVFPaPjD4nbBoOEwGgqAP
         XDFriOHmhR226Ljf1h7b9SdGloTHh0151UTRcj7UYYKCjNIT00jdxibpYlJyzIPEJQ8X
         KUqf5yFQ659i0Hmc1rHOea6VYUrLLmQC6UbgeI5YLlbsFX1KH60vf4HKB8KdbgoeKqsL
         EicA==
X-Forwarded-Encrypted: i=1; AJvYcCVRX/5cRH118p+VhBgvj2pqMgMoyOr3FGDO/HR37NYMNc+KOheAGN2cPCmu9SjYateFccGo9lzjYAX7XpJSVwpGhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0B5H7UgjLnI2bV0hRKJZtA9cjHlD9rG4mK9x/GWcFbfm9lVW4
	zNyj3iQJJfKDZHJhpFsETD+5Ss0ikCz0ExGqzS9z5IUQmU1fvN9He4ti6727pmTRSEQ=
X-Gm-Gg: ASbGncvpjQfw96rSOLgpF76/ZMJ6hA7zcUEL9zft3kbFGEyJngp4Xek5QEO0HQMYeuT
	/+BdXQed7j3aLbJ7G6jFSQ2I2nRG5iFw1hAfq64215vuACfGiwfb4XDl67M05J/KcxKbcykMevh
	nx4yVLYBL6WMn1x5kSerCRgOWvvPmdK6wnzJzZvTzt2Xk+L1Oei1vDaKmxkVtCQ9x7RPgDSQ/xK
	doFEKv3QPyTMxTTwu9FsHjGE+Yhr+CW+AIquxSWY+B+VLeDLcdVzasgpb3P+t37mTY1Eao3houe
	gApo2s7zINAd/chlRmH4jwx7Wiol4WhaRH8AjUD+spmM9bI9R+Iu/EbAYB4qCQ8I5+D7Fm3zCMB
	CGH1sAApNqoW6t9MrvNsvZkmNQcrOIU94Ewo=
X-Google-Smtp-Source: AGHT+IHtMWk0Zf+q26yD0iAFN/AxSEy+PDpN0ChAhlrk8dppBVzxLu8QU9Jabhie5nFR/O8+Q1JeMA==
X-Received: by 2002:a17:907:96a0:b0:ad5:67f3:73ea with SMTP id a640c23a62f3a-ad64e84b500mr516495266b.21.1748064099584;
        Fri, 23 May 2025 22:21:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 24 May 2025 06:21:30 +0100
Subject: [PATCH v2 3/4] arm64: dts: exynos: gs101-pixel-common: add
 nvmem-reboot-mode
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-b4-max77759-mfd-dts-v2-3-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
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

Add the 'nvmem-reboot-mode' which is used to communicate a requested
boot mode to the boot loader.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- add dm-verity-device-corrupted
- update commit message slightly
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi      | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index de5c8d236b705505c0745827c5c6b67d94ba6227..cd8e1b8a10b111190b984e104f749d04514d0449 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -60,6 +60,21 @@ button-power {
 		};
 	};
 
+	reboot-mode {
+		compatible = "nvmem-reboot-mode";
+		nvmem-cells = <&nvmem_reboot_mode>;
+		nvmem-cell-names = "reboot-mode";
+		mode-bootloader = <0x800000fc>;
+		mode-charge = <0x8000000a>;
+		mode-dm-verity-device-corrupted = <0x80000050>;
+		mode-fastboot = <0x800000fa>;
+		mode-reboot-ab-update = <0x80000052>;
+		mode-recovery = <0x800000ff>;
+		mode-rescue = <0x800000f9>;
+		mode-shutdown-thermal = <0x80000051>;
+		mode-shutdown-thermal-battery = <0x80000051>;
+	};
+
 	/* TODO: Remove this once PMIC is implemented  */
 	reg_placeholder: regulator-0 {
 		compatible = "regulator-fixed";
@@ -224,7 +239,7 @@ nvmem-layout {
 				#address-cells = <1>;
 				#size-cells = <1>;
 
-				reboot-mode@0 {
+				nvmem_reboot_mode: reboot-mode@0 {
 					reg = <0x0 0x4>;
 				};
 

-- 
2.49.0.1151.ga128411c76-goog

