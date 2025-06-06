Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C143289E14
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jun 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222201; cv=none; b=NRFQS3Rcm6trUXpFkITWssqTYBMjQOR8KNCSVzpDjDJuAH8cXg8O2zqvIh+Ltd2pHimX+qCiPeUDI/QTFg2l0OewxVorAtAxmEBIH7fdBSjd9nd/XTMo5RD80q6hiduCDWQTVzUTBOSKI5yb2G0YMaA1Ti6D+woeXOPxZMOvJU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222201; c=relaxed/simple;
	bh=XW6upis7ywUBB7dA4Zx7cA15c1x+GH83X1v6QRh5Bzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eU+8WZTt5Q/nYjEUOTJDe/WyriNOjW5j/KVvfyyraHivr5vZ9n5/TS2U/W0iy7bbDGMqozXw40b4Ch7Jk9P1xdhLJqrAp0av+rVX8tIHnIHzoM2Y5laat347Ej9pm2vFLks5yN3uPiV1VNfVdJD1We66K/W1ilRjw+szPGY/OtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=voew/uOS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="voew/uOS"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad574992fcaso355565366b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2025 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222197; x=1749826997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrVXOODskeO9o6lbylcxPdrCt1GmYzprp7c50qP9sE0=;
        b=voew/uOS/S86vPm+lRnM0Xy3aMJDz9+Ttpt/ILp1QlCCT5WgQAYUw2a9fc9jaPGmBS
         6qY9C/hjTZY8GAWCXOYrSFL5cLNpFDJRTZzmkvAyMTKRPP8XAuvVzl/j1nzvfbQBeDfh
         Wa7p98fMk/ddvrnvrUXfDOi03pGFEIi1BtlTffYqfba1Pxl87Ez2se+5SEDGrIQVNr6A
         6z51QIc2SLv6qnEzx+z4yfJ4EN1AFVvmlBKMMSCXdqG4OosdmwsqbfCK/HmdDWDc5OSD
         EKPMZHaeONeY4jj0DeyawjqaCKQTTFIz2ozRJ/P703Fr9jZnzukJ0u5JvUlOCYkgsAAa
         Af3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222197; x=1749826997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrVXOODskeO9o6lbylcxPdrCt1GmYzprp7c50qP9sE0=;
        b=dixcZzr2YgDAwb4QWYgEr0AWFFylw0own3SAjdjT6MTkv4Egh2SI6Vr5n2fcUMaAlM
         d4CdWVBOFzjcWn5eeAscuVGJPjaWYf5Owkh6D10IcGALEmm6+fWCXEAuPt8GmxfJEL45
         R96uQDRK2nDIdu5wrAJnZjNEazQgEzIKqb/nA4XgcQfwdgjkft+ORyIHel7SD00DSqnY
         8OW09pQWcg0QzFJPmZPdsefAlc+tMaiMy9XMf5xbjBpALpei6Dt6mUnH0Inc+V95SC5J
         pAfnmI9LUNJNDb6b0I3Rnrtnbku7u3WKV1xQrzThYxm15bKATZiSK98h9JUnti++szhR
         jf7A==
X-Forwarded-Encrypted: i=1; AJvYcCXDvOZrWHKiABss34+DmBVQz99kcZLysn9GD2eZ/eWzzfFOI8RKRg5kiAy6rvhxtfCy1w7Qu0BZ9WI3WXkQIqrONw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDu1G/Kg3qX/7xJwVkjQJ0l3G/RLczTmAVTOyw5t+OpLqpG6r9
	6/AIoElZF4h7tHQlo9nJQ+p+rP4SUR0PSrg6nrDF8UgIagWbf6FuOUp9Mj8+sJWP2D8=
X-Gm-Gg: ASbGncsCOnuihYRevUFiKO1Y6QvXBk8V85m3mkiN+O0y99xZJH70keIqMtQ8WHT7NCs
	nJ90Pxkafi1INyCUqRkmGfycXOVX2R9/s5+s4CR3c4L1/l6Os1qDvAqEoSa2JpRnPSm0O5xVf/k
	gmC+4YJfn8j4UjZJhEZhPq1RXD9/Rjo2ylmZ33MWfNWiCEYc/eLtFMWGLRS6By1PKMaurAsNUN+
	Dwql3KGby41xL9VkKOli1E7Js2ukZZU3ZRohWKuFm7s6CEtiOgxzP5qVDyvcEU+nv9osUMkBCW4
	gK3WquD0Dg8w52H4IcPIjr2ohuckEuxl4fhxVSJwM87ReQ7jWZWmzHStvk7KuBQTpTMDTYizr89
	01eH27y6ADaCOBBADJugnA+2Vxpx4E8gZGzdRR2rKq8WZ8g==
X-Google-Smtp-Source: AGHT+IFPnRXvPeosibDEAxvwHPrDNR/Agw7oG0bKI7jl5+GdDejJiSgSnw2j3hTsx9Z3U15SN2WC4g==
X-Received: by 2002:a17:906:ee87:b0:adb:23e0:9290 with SMTP id a640c23a62f3a-ade1a916fe3mr332115566b.4.1749222197197;
        Fri, 06 Jun 2025 08:03:17 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:06 +0100
Subject: [PATCH v2 10/17] regulator: s2mps11: use dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-10-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages to add regulator name and ID
like in other messages in this driver, and update messages to be more
similar to other child-drivers of this PMIC (e.g. RTC).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 1f51fbc6c7b6e158f9707c04d9f030b9eee5e842..30586e9884bfb998ff07e3148813344b307506c0 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1249,9 +1249,9 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu05_regulators));
 		break;
 	default:
-		dev_err(&pdev->dev, "Invalid device type: %u\n",
-				    s2mps11->dev_type);
-		return -EINVAL;
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Unsupported device type %d\n",
+				     s2mps11->dev_type);
 	}
 
 	s2mps11->ext_control_gpiod = devm_kcalloc(&pdev->dev, rdev_num,
@@ -1290,21 +1290,20 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 			devm_gpiod_unhinge(&pdev->dev, config.ena_gpiod);
 		regulator = devm_regulator_register(&pdev->dev,
 						&regulators[i], &config);
-		if (IS_ERR(regulator)) {
-			dev_err(&pdev->dev, "regulator init failed for %d\n",
-				i);
-			return PTR_ERR(regulator);
-		}
+		if (IS_ERR(regulator))
+			return dev_err_probe(&pdev->dev, PTR_ERR(regulator),
+					     "regulator init failed for %d/%s\n",
+					     regulators[i].id,
+					     regulators[i].name);
 
 		if (config.ena_gpiod) {
 			ret = s2mps14_pmic_enable_ext_control(s2mps11,
-					regulator);
-			if (ret < 0) {
-				dev_err(&pdev->dev,
-						"failed to enable GPIO control over %s: %d\n",
-						regulator->desc->name, ret);
-				return ret;
-			}
+							      regulator);
+			if (ret < 0)
+				return dev_err_probe(&pdev->dev, ret,
+						     "failed to enable GPIO control over %d/%s\n",
+						     regulator->desc->id,
+						     regulator->desc->name);
 		}
 	}
 

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

