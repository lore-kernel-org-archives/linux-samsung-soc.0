Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0765525A65A
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756572525; cv=none; b=WnZlJyKGu1NG6HbD/fArtbLF2/vj97x0vx+eSNe/AG8VI3NC6HU2vAL1dJxJ3jB4sTCXKL9SAIGzqF2z9i0QmOlvF1+IQGoSkP6OztxW+OWqz+LyLE1wPIVOUmgT0lHqfCYvNTlF6P89SRDLIlGkzDkR3AMjPX9/SbFHVBfmCp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756572525; c=relaxed/simple;
	bh=/yr40NhWQv2Ug11CJlWV8gxRtDh8+POFy/BtnxIC6hE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hQ6LTUOkLOz4fLfJMQgk3BkaXkMbVNaLE+I8K9tt7vqItGRamSOlhaZ8mrrnswf/brfZlWPOuQyvVvCo0rvfgwNj5CuyCGlgErVPJMjgz43mup0CFbRYS43/UHF3U7LJguDAqwbGFH0VqaxyeBuo+o5weZQz7GqR8zdUZMlFGD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5pZs/TJ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5pZs/TJ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3cd99b4bb72so274856f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 09:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756572521; x=1757177321; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rI+9TEFW7c8SXLX59IxxVSbZo74iy4dg7/4hYEvNg6w=;
        b=D5pZs/TJcKupBGfbHilnfOTUxmegDRW89kn5Yxv+gEszDtK6+kwBHLrpu//sSZhRo+
         vsRmlx1wknPsGLC5ueIuhPxwSFS8XgM0EAIxEGXeKMgySoQG9wIgH/0vh1BeBAfORi1s
         Zz6qpof459xbcKQr1OCXDyjM6/uqzVYjUaICl0RGH5KNRdh8UlQk57rmNko7HFcYbkmh
         iclmRaKa7Nu20WrrH7WZJfpzNe4qTUN7C6jQau2wFVQ5UcWBVHuoQHFckayAwCjdvW8Q
         /klft3DZmgOobtiQmaJ9kU2lJR3tUrZzRDaEH0pEveZ4m5sZ0QT6M+E3icDcf19bvbZy
         8vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756572521; x=1757177321;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rI+9TEFW7c8SXLX59IxxVSbZo74iy4dg7/4hYEvNg6w=;
        b=v5a8sxX6ynP6hH2ecmRCKmqZFywXU4fqzLeopsz/wpjqVKoMD7aCLnSL1+JA8CjGzb
         PfJs6SVUJF6Non0T3G0nopc2kdaMZQIUTgwpboGeFQjrnVy0Q5sj0qnjzV4TJ5XGIOv/
         00w9rVBJV82+FHBU1ma0knx6+8g+JuV+9TQXNi10t4DF7PPJUPEBFILYCPNL6+v5msm3
         93fnKxC3kP04iEmRSmSCnTC2VpmoeH7hDJ81c0l+03EP+wPmhU6gycE4Gwn99kea0Z95
         94/eJjcMWAPhLfIFK2gpSOSFf9QNliJrB8RGak6j8hU8ekmc2EOju+XI2mBO6ejigFhw
         euDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcEVP6iY4j44QLb4NPpPvY8IXAPpEfg4Vh2HarzNrN27SdxFDTzCWX1j759A6xcGgE4n9ssW6MdwVV7nw2uWonYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN+j4zlX77485tNq36EF1m1xPH1+PWpQHS014xraj/o8koBkkB
	WhnPPWh8AB8TCvUcgyfsTsp2fsbDfxyFncCOF7hR59ym6wYhdOZZNoywHOdMGWXwmLA=
X-Gm-Gg: ASbGncuwY/S45cxIeTAzOKQYlLoIz/PAAE2fXbMhHgwsf+63WcC/UOhXHYc9Bf0yLNK
	AaQjJBTY5BAg8z2qGfK2Q0NJoqmnYIMKxI3HpGNk/pjwtkYsiiPxDjB1/IATUeGV0Mb2+NiviRe
	B00wZBZneoY/Kti7AB5/a8aaFy/hwP5G9Gc5qmdPrYUoCEOIb0oT3Lmk0318S5/wznA0aMfR4d9
	9SFRtif5gT3b8d1qrQulkmqqw/HYBQOeZn8x58oBFTJY4TiRo0mPQfTwlM3ymM5QVyAIJ+bW8Wm
	SMNpKDeDA8TSm85Jzk/4lGz+zEs61enBoTHy26quXVbuYpUrVp5p2iNHq1rHaLsNwhDvIJthEb3
	KDaZ7E/wDXjeLqKdey/FYh1yjZbCBUvYvWZdvW5UQiGiP8Zx44Q==
X-Google-Smtp-Source: AGHT+IFGSi7AECyXD5beDfkfvviE4VSoPFSm03RnqtK69pwNpNQQvYBcKrGHy25gGpl0+JN3uPjsMg==
X-Received: by 2002:a5d:5d08:0:b0:3c8:2667:4e37 with SMTP id ffacd0b85a97d-3d0fab2a6demr1709155f8f.5.1756572521266;
        Sat, 30 Aug 2025 09:48:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf274dde69sm7818129f8f.14.2025.08.30.09.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:48:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/5] iio: adc: samsung: Simplify, cleanup and drop
 S3C2410
Date: Sat, 30 Aug 2025 18:48:29 +0200
Message-Id: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF4rs2gC/3WNQQ7CIBBFr9LM2jFAJW1deQ/TBcK0naSBBpRoG
 u4udu/yveS/v0OiyJTg2uwQKXPi4CuoUwN2MX4mZFcZlFBa9K3A1Fq0Kxn/2tA4i500thdD12s
 loK62SBO/j+J9rLxweob4OQ6y/Nn/rSxRoCN9cdNDuoHMbWVvYjiHOMNYSvkCmoO+7a8AAAA=
X-Change-ID: 20250830-s3c-cleanup-adc-71ac80978520
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/yr40NhWQv2Ug11CJlWV8gxRtDh8+POFy/BtnxIC6hE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosytfwXY+6qS0t4VDJFlNL5VvQplxb/kkOaz15
 0/oPOSdmNiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMrXwAKCRDBN2bmhouD
 1yWED/9EgNIyUUaP8RhPAhL8uhU3TxBuThxk8dO5pkseUDiC/g02FVKyx385abCebVnOdADsDKa
 1A0BkUH7DYNxBAZTfj11aKLxLFGKmjMRBWBoc20vlJgVCBL9IOXlQIGwpriQcOwFnPId3gy1Xad
 BMXfu4ujElM3LukCAuu0nhiIZujXB9Pvkbc8r8EkOh1EeVIEOJKtIPRNXLqHlk5kGZEICnQ6aw4
 SEHHe0woXjpSfl7jzTquuzVFqwAgg2qAIOKnnK5tLfdASY3vkqll7m41zbVfW2X+tJycOV2cw72
 dDtjSLm9o8YwxOUvPSjAMyHgAaKE/BLs6+8zJywdAktuCjSSr/y6HBT1QmEcVUD18nqNI9mOqwe
 ajvCwxz1Ba2o9x/4dwwPHdZtaGdz18tF/gnT38t6n6Abu9yNGWiPl2R+wyuODY859zheIO4Ojic
 Xi/vqAU1TgONJNUz0SMO/8gJ+UffPkb4BOzBGBaKH99k+o8ECbeUPsMEyK4/uiYyON5EqL+xMQP
 Y2AlGbNzpkldFFHz8ZNma71jhPEIE9YnLhp8qc9S1uJ3qS/FjCVJLrjV0KCPhC5yXxgfm0qi591
 /bBxEnxCsZKxOMxSqsZcVbCUtIjoWieiM3p3fc3eyzctSyLcM5gulIb+7a0U2gXUcQ2msRPQcca
 DG7jMMpS/XT2zdQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Patch #5: Fix S5Pv210 interrupts
- Patch #3: Drop touchscreen-s3c2410.h
- Add Rb tags
- Link to v1: https://lore.kernel.org/r/20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org

S3C2410 is gone from kernel, so we can drop its support and remaining
related pieces.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      iio: adc: exynos_adc: Drop S3C2410 support
      iio: adc: exynos_adc: Drop touchscreen support
      iio: adc: exynos_adc: Drop platform data support
      dt-bindings: iio: adc: samsung,exynos: Drop S3C2410
      dt-bindings: iio: adc: samsung,exynos: Drop touchscreen support

 .../bindings/iio/adc/samsung,exynos-adc.yaml       |  26 +-
 drivers/iio/adc/exynos_adc.c                       | 282 +--------------------
 include/linux/platform_data/touchscreen-s3c2410.h  |  22 --
 3 files changed, 14 insertions(+), 316 deletions(-)
---
base-commit: 642543fe9a04beda174633dff607429dc1734b2a
change-id: 20250830-s3c-cleanup-adc-71ac80978520

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

