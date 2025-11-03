Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60B932255C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197298; cv=none; b=gucGgfiFF6A4pCqX1t6EKr7/ifZhMQo9ZKtvxMBEYhOWIeb6TFWcFAgGNYS9EM4Imidrf+D56Ph0Et/amqM/Aqss5wnj20koCDcjdnnBIdUmm5tCj3gI9cplm/hLQnmrkMPTzepM/47QSafRuGaJjmHkAmGTSOtwSfxjuYi+6Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197298; c=relaxed/simple;
	bh=Ep9VqpEEy3DliB6wfxhwC677Qa8a8OVz72OQ5z6O6l0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLi7OZSGrvGW+u6p9yq7PmIbKS1WGEFRUJJUo31aR9uaesewRKeg0w8q5Kkimj7UoDJ9VRQSMrtCLAN1R9KbicIpA7Uc/HaqFU/fL4cUEy+hkRvvqOdgDnQbiIac8kYSx8d9fsg5516BlS/ae5/tPcy95fywmB3s4VL78/Z81yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sjj7sVM6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sjj7sVM6"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b5b823b4f3dso771842266b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 11:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197290; x=1762802090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SymEZu7KuHsaR6tBK8LZYO8ms6zJrn1970mxvhHuMAU=;
        b=sjj7sVM6/8Fza/KZuuC2AN8YVBBK9X4gEhsfcpu1MefXjRwQQoUe/QKwSRsHVKqQcz
         O8842sftNZB31RSBnKdMuCRsAJCXxWa1UgTU/sttOZSBEYrXuRaDZNg2+R9fkGborXHo
         HSzQRzufhZj1gQ6Ha+5xg9LTxw+qMWw0R2DOsmg/M+lZj3q+Paw3Lm2LSviRzVnCW1+a
         3rOvvpXkI9XGLVJerRZhMXToEGKYLmq1T2/CmRJbB5CjmEbGuxKbn9+KJeSuAI8KJLl5
         F1hFlolZvKH+QzQ18Ifu05nVE3gCRgHsRbIkBl+d0nIMU4cfHItlYLD1/GoaG8Y6fTor
         YhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197290; x=1762802090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SymEZu7KuHsaR6tBK8LZYO8ms6zJrn1970mxvhHuMAU=;
        b=sgS6ETrm+/wtlKwg33HK9eJ4XuuFp5RXF7EaCLYIGDuaBuW/c0kINcvZrRW9uwrA9U
         v33qfLVORpwxuEAdldm8UUoPd/egSLLXrDBswP4G73P0Oe+sNFzFKRwQIHf0BhIfEfIv
         /BABWdQeDFmiPUYWUWd4rkL87JcJoNyiDry+fRH2/TOStSsoxKNyzwZdHjJyippltbGe
         dLAFpgpZ0jwuKBNvfW6OQ9bCRSzqO0M6LAUorFxHCauFQEIRLi0Soe/CGsR0FUXT5eqj
         v3hbW6R+xjVT4cYI7d+USljbHsVOZ1luJ45THz7dEz0owacEx07tqqzl+qKQ/K7Cc3Mx
         RY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1CePqj+zEyTj67gsB/n5H3zquivV06uVWMB42Yb44TxYDOMD/VwqEgaQlae1ZRqm1kCJ04BQA6LBX72+YNgm7LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHE5/LFmvHEw0MolVa7MBEYIZSV/GdGCQ1MsL1qhk685izlmdB
	tKjy/2bskKyBbiX7209mafiizieVSPxQMj5h+dq7ob/HfOeEs0UZt9gf3dBWR9kXPYc=
X-Gm-Gg: ASbGncvsXjHJh++y2wiz38aagsrjJiJplQhhtuAl/TRR4jUnbc760QQUEjdP5kVm+wU
	hKQp0qoLkAgpX01vVJpxZRxSi3/Vjbmyh4HJqJJfo5KmiD7He5Ow3BJ1fTWH/LaAABgaIJt3YZg
	jJVnH4CRbiBNwvor48XYC2sdK1YiRLgXabn4CO/Y2GXQ9a4elXSZPbOw+ZultkzZLKWqlbU1Cy8
	n4Cv8WkDUzm3il8z242nwlKuA5wW1Z0U7v15IMTqxdgSObvheebw2tzxPbiHmxMItGO1nuXslj/
	M86lNYcorXC8rnJyaJD0uAXFtCGIkDJEUWcXHnG1a8vtMqwg/xc9CasSoKmh+sOG1ARzvctsqDL
	FuPkKfqBmtL1MUIiMLwAUdi6CLtFIZwGGCHJ+9QLt21pJJc7Pu8IEImDiEFwl4G717PNaKTel4M
	kdqS4mc5IOiC2VK+/bwo/Fdvoa8BhWHalx23K9Zwh03SQ84S42pzAHt9nmZWK0
X-Google-Smtp-Source: AGHT+IFuubeogvRryabHYkXen2w1TOoix4qArdOV/ufZ8vU9XKqBaFFhwfEA0gbZhZn3sytwpzWIDA==
X-Received: by 2002:a17:907:3e91:b0:b4b:4f7:7a51 with SMTP id a640c23a62f3a-b707089cceemr1365761166b.62.1762197289732;
        Mon, 03 Nov 2025 11:14:49 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:49 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:52 +0000
Subject: [PATCH v3 13/20] regulator: s2mps11: place constants on right side
 of comparison tests
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-13-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

For the lines being changed, checkpatch reports:

    WARNING: Comparisons should place the constant on the right side of the test

Update the code accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- new patch
---
 drivers/regulator/s2mps11.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 30586e9884bfb998ff07e3148813344b307506c0..8a36ab67b73e4151c7f67af0555a6465ee1e7a04 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1221,32 +1221,32 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	case S2MPS11X:
 		rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps11_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps11_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS13X:
 		rdev_num = ARRAY_SIZE(s2mps13_regulators);
 		regulators = s2mps13_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps13_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps13_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS14X:
 		rdev_num = ARRAY_SIZE(s2mps14_regulators);
 		regulators = s2mps14_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps14_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps14_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS15X:
 		rdev_num = ARRAY_SIZE(s2mps15_regulators);
 		regulators = s2mps15_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps15_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps15_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPU02:
 		rdev_num = ARRAY_SIZE(s2mpu02_regulators);
 		regulators = s2mpu02_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu02_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpu02_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPU05:
 		rdev_num = ARRAY_SIZE(s2mpu05_regulators);
 		regulators = s2mpu05_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu05_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpu05_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,

-- 
2.51.2.997.g839fc31de9-goog

