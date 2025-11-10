Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89596336EC1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802952; cv=none; b=e1r9fCc8wBtqtYZmSb35GJjVyC+Kb418/Hxfd8GkDUi4DnCx90KLkGa6WBR1Flcz7N9bZbPM9EC524awD8IkJalkjvbLJUo1G0VpCpk1Dq0EboaTQ41q3K41WrpcOf6Q7HDR7fXjfojFO4ZhoaGGliNHA3bjXRKmzaeitHsTNNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802952; c=relaxed/simple;
	bh=QlgIZM6a8G7ebRRBr/Ymjzyq0EM2ZhxwbkcfrP/9WaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2izgZdCOXrEZnwl8EtIEv9l0rVKHskSa4YRD/Y4fg+Et9l/BL0mUmeRhQNdMv+nrjeuQTf99664C16QQvqeka+Gk3WPW56rgUDlR4VOSENAc0RnY7Bh5d195sIJqPZKDFl91MmSdjjdc7Hk2SYvmY/hE8Dh6aG93UJnBOvE/cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ouyeRHYf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ouyeRHYf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b725ead5800so451529166b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802945; x=1763407745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKonCPupUC+bG3BYmfoKbIV6pthcjc9BkK1iVxTRfG4=;
        b=ouyeRHYfaY0R0Ei9FUaOlbjh4ZAnqlZf7fSDPyt5fA0DXQZSrWa/OZORxLlcRtr0x5
         H+8s2r1YoWlQLFSoLtEzyjYdeKPbw2nPNJ0UyQwhOL/whm+5PhYG1IagxVLSXJC9god6
         1mqEXKKVAyyyARKA6F3ySTGGX1JguzyI/PAuQv7p5R+5zvLKABveJhfP1Y4iR+4ZnLZ+
         2zxGoCdGocXRChsGpxcWWWDVcq/oIX5HnifpbXMWeIPcMwb59yLIqTVAn0x8tqPbCFNT
         FnEHn+tC+PCWgoJ1la/zd3lVCEMFRnBS1lLNrCKfpZNzjkQLOhUjrs+RMrC5YfIRBJqN
         qTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802945; x=1763407745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zKonCPupUC+bG3BYmfoKbIV6pthcjc9BkK1iVxTRfG4=;
        b=Bex1x2q+4w6cnJkmsA2E3TC7TQ8QZJgmCLt6ys1yDdt1KeQ8JfrKTIvGHve6JMWfRs
         cGqe+OW04SlpAZBkUmmJ4Eg/vIdxRkYwxwJjSZUPrPguT0AhmlAmUoFcAD+JzwJwgFBt
         oCEdLfIv0JSanp33wxw6K6G7wKGsiKCHDuzkN7hLWIB7XJOawFK8BwpPVP9ieldcEaZj
         W10d/g36Km0Vr1juPNmf85o7+BOJnEy3wuCQ8oZpPj0pyVur0vQ1XWs6SN6BoL9RUdH5
         COcoiFuWTfVSSBRS1AFHx/s+6N/asMQ5xQQSrAFPqQvnwicxfvp/BpTZ+0AhKifA5qRL
         TrpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHhaiobsHa/LjgrjLHADbzOIZijpcxZRRXTTRQt+zq9jBGznaY5gxTXkbMxRUquDMo4cgPOtD35uCgAedTF0mCPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy00DMjVv3MFhCQOsnd6nSyKNkhtKFuPjecwdy5KnxvohNC18Sl
	Y0xGWSPVGeJkeEMCPH6T0K72xwKKSeJLjnSiQfVNabOx2wBCf5mfsRv1rou6ThOVqRk=
X-Gm-Gg: ASbGnctdGuVlZbmuqYF3ATWuiI/U+DraJhGoqF6AiBK/5pWh/rt0tHGjJy6kIn5K/vO
	wQrg55wXRYM+QQ8eU2b9KSmmJUaqMucdJp6MwROwcp2R2j/mqbcTDsvnxg9qv0E4dtJRiyxH3FI
	/77XeSHI1Nlb+/KRZSFGkDfllqviKGGhhQTymNC64aANDmK8aCbH36cAcZS6C6P8LQdrEFDzqmX
	F5ois0vmsfbmciia9FBTXWl3FQ0BsB7GG/ayIgrt3Rgh0zCwMOSS5wkIqafhNwLGN1WOtwYzcjy
	iy0Wz8e0CfSST9LVGgASJ1aOrMEhVmVvj0gDSvAT1yN/1mU2RLPgRLYk55+B0Pll4+lx1Vm1+Qm
	C7enzBYZFkgAet68b7dQ3DvLUBMHDyxczhMbdcJo3CkOWJj+Gc8Zq6aMTRapl0cHNED7FMxJQZ6
	GJWnN2vgORie2PJW1qPK492a15hCuLFGPTKxmHJBZmkqPLsoanaa5PFXR8uGlsv7obhCkT8Ms=
X-Google-Smtp-Source: AGHT+IGociUEXCMH9EZnqdHW6O6NvooD0NFgtcVgxLnNvsoTMYo5GwswgzK23CjfOBC+ZZdaBDycIg==
X-Received: by 2002:a17:907:9412:b0:b3e:e16a:8cdb with SMTP id a640c23a62f3a-b72e02944e3mr990967966b.12.1762802945515;
        Mon, 10 Nov 2025 11:29:05 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:05 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:55 +0000
Subject: [PATCH v4 12/20] regulator: s2mps11: use dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-12-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages to add regulator name and ID
like in other messages in this driver, and update messages to be more
similar to other child-drivers of this PMIC (e.g. RTC).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.51.2.1041.gc1ab5b90ca-goog

