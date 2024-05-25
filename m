Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D069944;
	Sat, 25 May 2024 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716643697; cv=none; b=Zzvp+5kdZzHceadQ4ZkGtS+f/uzRO5iWEYAkmZctCNpXHvk3mZRMA8FPFsUiMor685GA9ARKtyHmP/gtyMMGOpd0zBEWtvYFzcNoh60TJI+MtLz3w/MwZA4dgITSWnb132S6Pdbt8JindCYdQlK8nbYHE0wIXi9ERMMdKkBvFq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716643697; c=relaxed/simple;
	bh=7q1elFo7CAxZkZBweHbgmjBT8X4yHLYsePVZJR8HO/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6/n/c3ZX14yDYQ5JjTOrBYWNgI0I+Edvjy2WXHYwkkjiguieJ4WQD/2bF12rUMCaNHtMjoVjs3VdVVW0y/aq8WLhWgJ8sECY4Elqm/llJoFDev4ZceOTRc45JwK7qOA+rL5Ee6RrSrOs97QL+idxRrahU86H8CKwkzQsi48yeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhELMDfQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhELMDfQ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5755fafa5a7so9240557a12.1;
        Sat, 25 May 2024 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643695; x=1717248495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYm1aEjf0Zap75LycmMoJDPmBXZE+yZRaT5MJKObyzU=;
        b=JhELMDfQHPP5JIjvczdK5xT6BQZj+eZX8FxPGs5MXkS/XEYyAFxGLw4osZ5FQksqY1
         cG5/+KJM12aF/LSAP/u9PxmO2bQ4Ud8fdjz9zu0I5dXHx0L5yF33Beu70y1czbKVpaI9
         mtPQJnQSuwRpOkpXMl/Ozu19yoZZyfJdTOLvP8UtpHKqUjKrLdtdJsFHq/5yFolGPebJ
         mf1D9JDdraLyRjw5lRaotK/TK4veQQ/Sv1HnkZ2WxG6E+tPfZIBm6ZCDPB5oVZs736Xe
         6Mt1XATcLz8bL+EenqXs4aFd/AdDY9bln5ukP9c6LLPVMjTxcggEJsUazWPU7Z8ACt5y
         BFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643695; x=1717248495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYm1aEjf0Zap75LycmMoJDPmBXZE+yZRaT5MJKObyzU=;
        b=lmk6bcIJ0fj/Lr3zjjWTSfVgzS7GocNyUCI6vw+WAYOgNU9vO+l577nidSBRe27Klj
         s7UpQKOEGygu/EfIfZ02Nx2pTweT89M4wOxOqopzis/XX5GUIRyHeB0iaWS1wAcwf4Gt
         XJHbs/rilQsFnWbgnYWy4T/++nA6CaZ29pWmfXLfTFw/SvTwLdRiQkypo2x3ckLgCc9U
         cL5KgrVvl6VWTgNxM3I54KcZPhP3SoR1GdgTyU15QGPsnJ9ftOgLJA0N4g8ATXuD2acI
         bqtTdmLyCCK/PSajNwT73Fy547Q5+BjXFaAfjt2FuFF57TxW30jTaQavd9fp5qXTUE9B
         +WTg==
X-Forwarded-Encrypted: i=1; AJvYcCW7C9DJHKdHG4/Q/fgsiidYevQh/AdiYNnIDhW3siv4lQKSWmlHEfQmfAuWYkIs/sk2fB2/JuV1nMmvRD0tKyZtOHJeKwkJTuEUnBahceQAXoaj4419lxxj2Ii6yra/gMCiwL8fRP+U75dQSrzFEll5HfXTOWHm67DiTXdEhoLrjjuV2kv6DJnK8gsZO0zgWbcLVUdN4uZv7zj8Gj2lLI1exKdX5Mp+4qs=
X-Gm-Message-State: AOJu0YxCOoX197qPz4YChGnCNsQyiCZkmY1QexduvbbqEbwbX+X8R4Ng
	NQselzeANj4n25ffQM4x6p7uP8JM5zlcTo2TMGs7GFkKr5bcnmgN
X-Google-Smtp-Source: AGHT+IHdx/tw9IhnGg8vGuaesdmmsPdkFnOGx7QFZnPi31e5dF3k4vigUZYqt0/oZwQjTd+tJOtmbQ==
X-Received: by 2002:a17:906:1117:b0:a55:a895:46ae with SMTP id a640c23a62f3a-a6265259847mr314823766b.63.1716643694468;
        Sat, 25 May 2024 06:28:14 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl. [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:14 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:10 +0200
Subject: [PATCH v4 6/9] ASoC: samsung: midas_wm1811: Use dev_err_probe
 where appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-6-f488e03bd8c7@gmail.com>
References: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
In-Reply-To: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=1631;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7q1elFo7CAxZkZBweHbgmjBT8X4yHLYsePVZJR8HO/Y=;
 b=awYAMRq5ulLIglF1H1Y0PzqOS1+tuiQldsorqr7g2v3Tj2K+KBY61oddW8/uQHpyx94/xqJYL
 nI8BlGptFftDtpMEsYUXRbgdBe19G8yVyT0v6GPBo4T6+cC5eZMmRmk
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Since we're already using it in the newly-added GPIO requests for
jack detection, extend it to the previous checks as well.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Adapted to regulator get functions being dropped in favor of
  SND_SOC_DAPM_REGULATOR_SUPPLY
Changes in v2:
- Added this commit
---
 sound/soc/samsung/midas_wm1811.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 88fa9e5bc093..ad0283364081 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -590,17 +590,15 @@ static int midas_probe(struct platform_device *pdev)
 	card->dev = dev;
 
 	priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpio_fm_sel)) {
-		dev_err(dev, "Failed to get FM selection GPIO\n");
-		return PTR_ERR(priv->gpio_fm_sel);
-	}
+	if (IS_ERR(priv->gpio_fm_sel))
+		return dev_err_probe(dev, PTR_ERR(priv->gpio_fm_sel),
+				     "Failed to get FM selection GPIO\n");
 
 	priv->gpio_lineout_sel = devm_gpiod_get_optional(dev, "lineout-sel",
 						    GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpio_lineout_sel)) {
-		dev_err(dev, "Failed to get line out selection GPIO\n");
-		return PTR_ERR(priv->gpio_lineout_sel);
-	}
+	if (IS_ERR(priv->gpio_lineout_sel))
+		return dev_err_probe(dev, PTR_ERR(priv->gpio_lineout_sel),
+				     "Failed to get line out selection GPIO\n");
 
 	priv->gpio_headset_detect = devm_gpiod_get_optional(dev,
 				"headset-detect", GPIOD_IN);

-- 
2.45.1

