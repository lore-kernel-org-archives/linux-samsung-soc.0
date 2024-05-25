Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6564F1F8;
	Sat, 25 May 2024 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716643694; cv=none; b=stpmdaALL/tOv88gJBwfl8zZD/PEaINNATdy5jbdGnC2KfKphvptxMA4QYeM7+A1qSIa0JVy5+n0hlzUw6K4vr0qvNL9mzIb86bDMlD4qJ95iWY8X9m8iJZP3kWz3PhK//ejgnZ7fVs95Kb5st6djjoMMeYh4GwRrs1k5kou7Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716643694; c=relaxed/simple;
	bh=2vAqa2DIEcQwtApC4VQYYpht9ERjbrcStYfppA44U0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dcdL38xS60WccI48tGb+FpjdAOLSufHQrJ6MahE4EAsgcUvg8i9XlYHoXkn6aUhiyr04awpm4IDQXcUU1s6If43JBNiKB9P9whZf4rQd6KOtGnKtRIox5ZIoY3nOfeEte0HcGGlOhv5mp2fxUO1XtyP7M11mnF2LrDCZDYt74L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feMFvn57; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feMFvn57"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a626919d19dso281166766b.0;
        Sat, 25 May 2024 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643691; x=1717248491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyhcJDHjI0opVSCgJiHt0Zs5JH59m1ORkw4OcBCxAuU=;
        b=feMFvn57VXf0Ks5wUp31oSgNhnt6qOH60/tfIpn5gWIOgfVS9tA37CTM1Cm/hM+Jon
         V9WkuqA4sxv6nIGJu5QHp/o0AriWP9sGS3fGyrRVt+jcybAeY/QvEHR1NuSramAnwznE
         i7nPrV2fr9mtEhca2KkZktZVFAwv6aBeyIlnSUHKjnxMqSMRF2bv2XTrB5aOsfD61ZLb
         ZbNxoR9lSx1/57+pM5pVH7owQZqFjtaWPn+5LTW8wXrl/IJL+jrQLX/lnQC/VfEZGWhU
         dR3Hc5VG4pzqjxkfMhJYiz893+uBld6NzFT6g/oxejvVtG+LUlE85ZvjdIpZ6aMaWuLW
         ludQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643691; x=1717248491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyhcJDHjI0opVSCgJiHt0Zs5JH59m1ORkw4OcBCxAuU=;
        b=FDJ/hkxAZc5lz+KAiwyV9xg9PKaz3DNGsi8Zw6cMIAhmgfn05hiNbRaYLTVfizhs3t
         zSfslHm1Uwt1jMHax/lQD8lUwXwE9AOmF2LXML0W4sZds2hYIP0TYzS1fsgqYMXY+S+9
         Vq6fL2/8Y40503Q866VHTxG01+hqYQWv175s7/7vSihOY6dg4pjZ0OhL0hMP4j5kH0zF
         TXkaiQXXPQAKYy+3iYAVgYwoy5gZKLTboQCnJ4gFxMhr/bfsNn2dIJ9NNYeRmrkMO73O
         PeFW04wzvStP6Tf1F7CV8xGkLilVdC7w0aSEawKSSP5CVGxkG9iRikhaFmnX4ZqANeTe
         KTIA==
X-Forwarded-Encrypted: i=1; AJvYcCXvHh0PLHxc/jFRqvlC6mcg9idRGIEQK/eEIkFl4z/B7f4BzbOx+TL4vwwxuoMDGysJbVEwiPgp4DmkFjWxnL6is+7MjVNf7pdIldMg+0tQnJDx6N1s3xt40+n0wEzNQYqcDhWKXpQCBb4sJ7lu9f8WcyvkcfXWRML+RbhAOXLFxULALO0Qn33InaevSad4eZ575hoqoiIE0TIOdblT8OIoy1kB7s8wiiY=
X-Gm-Message-State: AOJu0YwUWvhIWxrgk0jCPfgs2B6d+yvBKxb6GyST7HeAs7/4OluFntrl
	Cn4O9DYY7V/Y547f46IOzXGu+qrJJn0ClYKu6iRiV5AHmJpHD4KF
X-Google-Smtp-Source: AGHT+IEPpi36yJB2n9ipEwdR4D1zjMs1IzS01+2Vzze66vzbl5+wC4+jiyDQmWyXGxZdTp2Ak5ZhWA==
X-Received: by 2002:a17:906:8443:b0:a61:7f85:e31c with SMTP id a640c23a62f3a-a6261f91a42mr367814466b.12.1716643690633;
        Sat, 25 May 2024 06:28:10 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl. [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:10 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:07 +0200
Subject: [PATCH v4 3/9] ASoC: samsung: midas_wm1811: Use
 SND_SOC_DAPM_REGULATOR_SUPPLY for bias regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-3-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=4146;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=2vAqa2DIEcQwtApC4VQYYpht9ERjbrcStYfppA44U0Y=;
 b=aPD49g9qEDnvFgYpa5MvgqUaV0Ias6Acg1pgU8JR9ggAbockzhyIz4uoEhAXWApuS8Qs+03bm
 7D7hw3nfGozDATDmsFZ8F3NJgXmuf/Xt38YOWi7jNvh2bMfPkTYpKDb
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Instead of using a custom function with the SND_SOC_DAPM_MIC widget,
split out the main mic/sub mic bias regulators into a separate widget
using SND_SOC_DAPM_REGULATOR_SUPPLY, and connect them via a routing.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Added this commit
---
 sound/soc/samsung/midas_wm1811.c | 62 +++++++++-------------------------------
 1 file changed, 13 insertions(+), 49 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index f31244156ff6..20b274734487 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -10,7 +10,6 @@
 #include <linux/mfd/wm8994/registers.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/regulator/consumer.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -27,8 +26,6 @@
 #define DEFAULT_FLL1_RATE 11289600U
 
 struct midas_priv {
-	struct regulator *reg_mic_bias;
-	struct regulator *reg_submic_bias;
 	struct gpio_desc *gpio_fm_sel;
 	struct gpio_desc *gpio_lineout_sel;
 	unsigned int fll1_rate;
@@ -169,38 +166,6 @@ static int midas_ext_spkmode(struct snd_soc_dapm_widget *w,
 	return ret;
 }
 
-static int midas_mic_bias(struct snd_soc_dapm_widget *w,
-			  struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_card *card = w->dapm->card;
-	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		return regulator_enable(priv->reg_mic_bias);
-	case SND_SOC_DAPM_POST_PMD:
-		return regulator_disable(priv->reg_mic_bias);
-	}
-
-	return 0;
-}
-
-static int midas_submic_bias(struct snd_soc_dapm_widget *w,
-			     struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_card *card = w->dapm->card;
-	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		return regulator_enable(priv->reg_submic_bias);
-	case SND_SOC_DAPM_POST_PMD:
-		return regulator_disable(priv->reg_submic_bias);
-	}
-
-	return 0;
-}
-
 static int midas_fm_set(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event)
 {
@@ -272,8 +237,17 @@ static const struct snd_soc_dapm_widget midas_dapm_widgets[] = {
 
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_MIC("Main Mic", midas_mic_bias),
-	SND_SOC_DAPM_MIC("Sub Mic", midas_submic_bias),
+	SND_SOC_DAPM_MIC("Main Mic", NULL),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("mic-bias", 0, 0),
+	SND_SOC_DAPM_MIC("Sub Mic", NULL),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("submic-bias", 0, 0),
+};
+
+/* Default routing; supplemented by audio-routing DT property */
+static const struct snd_soc_dapm_route midas_dapm_routes[] = {
+	/* Bind microphones with their respective regulator supplies */
+	{"Main Mic", NULL, "mic-bias"},
+	{"Sub Mic", NULL, "submic-bias"},
 };
 
 static int midas_set_bias_level(struct snd_soc_card *card,
@@ -421,6 +395,8 @@ static struct snd_soc_card midas_card = {
 	.num_controls = ARRAY_SIZE(midas_controls),
 	.dapm_widgets = midas_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(midas_dapm_widgets),
+	.dapm_routes = midas_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(midas_dapm_routes),
 
 	.set_bias_level = midas_set_bias_level,
 	.late_probe = midas_late_probe,
@@ -443,18 +419,6 @@ static int midas_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, priv);
 	card->dev = dev;
 
-	priv->reg_mic_bias = devm_regulator_get(dev, "mic-bias");
-	if (IS_ERR(priv->reg_mic_bias)) {
-		dev_err(dev, "Failed to get mic bias regulator\n");
-		return PTR_ERR(priv->reg_mic_bias);
-	}
-
-	priv->reg_submic_bias = devm_regulator_get(dev, "submic-bias");
-	if (IS_ERR(priv->reg_submic_bias)) {
-		dev_err(dev, "Failed to get submic bias regulator\n");
-		return PTR_ERR(priv->reg_submic_bias);
-	}
-
 	priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->gpio_fm_sel)) {
 		dev_err(dev, "Failed to get FM selection GPIO\n");

-- 
2.45.1

