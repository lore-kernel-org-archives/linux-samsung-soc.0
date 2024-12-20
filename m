Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701231B6541
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690774; cv=none; b=ZoxmyAxRuCNyWjQYaUhoSQG1swe4sPxeyjDCu3aacj6kD2lPuFpLMWwUeXCgBtwzNxUIgSru6CfTRM8Ps+i1cHEfDEeVmQbwGEoZEKvD5mXyMDkiCa+aSvUnkBFVU6wI60nM0T+nYJGFXlrm9N920lpKC4/AlwgQBtjbn0mmThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690774; c=relaxed/simple;
	bh=AhRBht02RHZ29E7oO4jKae+4/7Omd+mmnzz7/jvmNsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q2W34dwn+QQuXNxILQWH0nzo2cC2JKLRVY9D4g9WYmw+8cZ03UnMd9MtOR+KISm8y/+pKEakuX/jhQaSMXlwe/EwWa8wOTMikZBDcTWpS7rVa6oFlRCHwEWQTi9SQa5wg8Y4nkDS5QsvZmZuBHeQhojEHzTN8ozn3KRgresQP8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vPXm/m2s; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vPXm/m2s"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso365113166b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 02:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734690771; x=1735295571; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnPh/juyVOiTzWCImlW3ZTqxEo/ZPE8pe0CN7AE6LjQ=;
        b=vPXm/m2sS6RTlk3xmPJt6upRYxk+DiVQo3RLl7wszesahugNAKH0NEgX7SqzItMn3U
         0njMmuvrl3OoH+iSfQL9sCaI96mwfUPuKFiXvFGYgSj1FXlNg9gJuuy0fDOa/Sccjqyf
         GRJs3/0UT2a1Jv1zpAtpu8jOAnhDSnzBYlmnchQQ6TapIDaojjfSK3TCplL0jCoEKhed
         nXGM1fuQPxO7zx1C7giCi3/GSpTRk4C/mFV5ym1vZqbvmWcrQzzWLR4OEH5mv6Jf9yYb
         WFrpnc457U4hMfoqKQNilNbJkkSjrNhQHUzOY2qGUBvpVCTcp3XS5A1iR66xS/SBM850
         Yvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690771; x=1735295571;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnPh/juyVOiTzWCImlW3ZTqxEo/ZPE8pe0CN7AE6LjQ=;
        b=kUsMt6mFreJamh6VuqHXDp8Qw+qTqKFEKR/N/9GMeLRwCAZt/dxSQsQQTVPFZ18Fu6
         KGMSZFbNEA0entiHd0G+aB4FjlCRoPXFfsJrOHDIlZ+QF06mrl74B4rq3dW1ONwOMHLE
         6Q8pPUqc54V/wIxaLWwluV2aReuJzHWZZ5vLRckKlH6PPcrkLK7uq28VLPekU7LJ1BqV
         U2s4Xd9yleV7YM+ywAp7FBhIXZziQ1Wx6g40AmqNet1UQvgSeWce2/8sk2XLRA7wXv3Y
         1mxpLUl61Ra0KgLn3THbF9jZwh7BBkLlW45j+Simq+0qCi0kjoD7u2dpdSHyzOc6TYRb
         ULQA==
X-Forwarded-Encrypted: i=1; AJvYcCXGWZvFjFi8PRQRTYcPoEmSBdCeIbVK0YEez/p7Ac0taulIDTHx5awPbGJ3UBAbTSmbLmz2ai0JaQTVzjusxslbBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnDjy1EBBF2xQ+R54BKleRc55N7yz/odmK810HbZFRHSm6IpK0
	O6wOO5poUnSKj4WTWIKeqybE/B86x2GXaZUgllBqa2BSE2k35WNtDh1Z6PXNGbs=
X-Gm-Gg: ASbGncvSph9sSBsVDbYElaY74BcPxIHrfTcW/NFMepHGDR1kqY6c1rZVv0pnuMoKkae
	mpifWlKd0XJDEQUjNPrLcR9msL/1lckYFeUsVpso4If8zK5VMAs6N58Odb9Vfh0sJKyVqePBwCP
	20FmikCAiyJ3ssIH42lgTpq0l8UovV32628adqi67VA2Ahxass7TGq97fCIoAxpEEQK+TW4n43V
	9tMssfryvWVqmC6+Rg9Q2glkvLHmOxf8XwOyg6Fyhb8h8i2HQLbbDFgPGwJ/vB1grU6ki/JBXOZ
	ByO05Egm5Aeab7TDmX35brmExUTJJ+w+oWEtX+Gm
X-Google-Smtp-Source: AGHT+IExwMGLFo9EP9y/Egh+BLh+KfOHOoPkz6X1qvfx7pdCFx5WJHmb12wq7ReFv0+A2rj/5cCZNQ==
X-Received: by 2002:a17:907:5c3:b0:aa6:8a1b:8b74 with SMTP id a640c23a62f3a-aac342179f3mr160475866b.53.1734690770668;
        Fri, 20 Dec 2024 02:32:50 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06543asm161604566b.175.2024.12.20.02.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 02:32:50 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 20 Dec 2024 10:32:50 +0000
Subject: [PATCH v2] arm64: dts: exynos: gs101-oriole: configure
 simple-framebuffer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org>
X-B4-Tracking: v=1; b=H4sIANFHZWcC/x3MMQqAMAxA0atIZgNNVVCvIg5q0xpQKw2IIN7d4
 viG/x9QTsIKffFA4ktU4pFhywKWdToCo7hssMbWZKnDoGQIVfZzYz9jTBI3Rlf5yZFv5rprIbd
 nYi/3/x3G9/0A2QmCsGcAAAA=
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The bootloader configures the display hardware for a framebuffer at the
given address, let's add a simple-framebuffer node here until we get a
proper DRM driver.

This has several benefits since it's an OLED display:
* energy consumption goes down significantly, as it changes from white
  (as left by bootloader) to black (linux console), and we generally
  don't run out of battery anymore when plugged into a USB port
* less of a burn-in effect I assume
* phone stays cooler due to reduced energy consumption by display

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
This is marked as v2, because it has been split out from my original
series in [1] to make it independent, for two reasons:
* drop the dependency on other patches touching the same file
* no need to mingle this one with adding Pixel 6 Pro support

Other than that, there are no changes and I kept the existing trailers.

For those who want to try this out:
The stock bootloader disables the decon hardware trigger before jumping
to Linux, preventing framebuffer updates from reaching the display. We
have added a work-around in our Yocto BSP layer for the time being
(until a proper display exists upstream). An alternative might be to
port and use uniLoader from https://github.com/ivoszbg/uniLoader, as
seems to be done for some other Exynos platforms.
---
Changes in v2:
- split out of original series
- Link to v1 series: https://lore.kernel.org/r/20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 387fb779bd29..a00cb27e167e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -22,9 +22,23 @@ aliases {
 	};
 
 	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
 		/* Bootloader expects bootargs specified otherwise it crashes */
 		bootargs = "";
 		stdout-path = &serial_0;
+
+		/* Use display framebuffer as setup by bootloader */
+		framebuffer0: framebuffer@fac00000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
 	};
 
 	gpio-keys {
@@ -68,6 +82,13 @@ ufs_0_fixed_vcc_reg: regulator-1 {
 		regulator-boot-on;
 		enable-active-high;
 	};
+
+	reserved-memory {
+		cont_splash_mem: splash@fac00000 {
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			no-map;
+		};
+	};
 };
 
 &ext_24_5m {

---
base-commit: 8503810115fbff903f626adc0788daa048302bc0
change-id: 20241219-gs101-simplefb-oriole-d3fad1f5b498

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

