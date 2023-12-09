Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N72p1EDZ"
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA8A10E
	for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Dec 2023 14:01:38 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bf26b677dso3138830e87.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Dec 2023 14:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702159297; x=1702764097; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf6kxtFYggdfbxJYCVZWg+cgkdXOPlRkn+YTuzn4osc=;
        b=N72p1EDZth6hevcT2+j5/ZHMOgXPnhRlIsWXjmDEppDaZYOpeBCidoV5p3AjnrtiKp
         6wKrBaInIj4SqvgmYCC44zMXBVm/9zgfHx5/dsJP9ccvktTyQLlz+oWbeMvBJ5+5KZtr
         jCY6vLNrbLL4DswcSoGuXo8u8TC+I8YalUrAtgujc4qSnYFl9AweR36RHorNdhc5WKts
         EkKhBoJ2s8VTEDauciKJ8qq//dYPO6znoktndUWYgP8qfSfNaUD/y+iXxDLdQ/YGCgHf
         WlXVdwBWA/4F4ewXWLkNnlTax1MjyWptfBFR1hpI/u0uVpXS6t4S5eagoWW7SxpX3wtJ
         PSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702159297; x=1702764097;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rf6kxtFYggdfbxJYCVZWg+cgkdXOPlRkn+YTuzn4osc=;
        b=VcNn0MaTxP3B7TV4quJepwR/P+WFU61WeMlIHFV3hMIe4IBy1ie0lgXD2SKkIOCQpG
         tg8nOmjTSIW/7kZwo1CduhQKHA8EnITCGthZIewMrNETQHbE1DRq7+nHeZZrVOvBR6/s
         t4njJR6n4xpDmigpUjTIGcP3mOsPXmg6Nd472r6rRTg3fD8RzGRatV6x73NT/xUY6hND
         HOLntLCshxo1q3mpXqDp6hc7VOi27beJBosubbypqo+IbqxdU5UbzZo1ZT2Hd2vrTK8V
         Xveqq4nhrlZt0NINLcsXni59FOmNgDL53oSbUK/9OYpk12IQYOiMDApXM/CVDM3Pe8qu
         Bxcw==
X-Gm-Message-State: AOJu0YxtEaBZ3qGnTQ+PtnFtFdO6OdfP+ooo4CukSChk5BhHnVT1tfBy
	soDHrAeDBdez9JdGqSu4PJuMDV9Zcd14PTKKhJo=
X-Google-Smtp-Source: AGHT+IFBUEVjY+K4P0Zha/3JhCUnzGdXx6Cwpnkna/C2qd7ZWtdFCT0oVacrclwVM5TqPh0T2pmeTQ==
X-Received: by 2002:a05:6512:3282:b0:50c:9e1:bf76 with SMTP id p2-20020a056512328200b0050c09e1bf76mr514417lfe.9.1702159297223;
        Sat, 09 Dec 2023 14:01:37 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id s16-20020a056512215000b0050be73a1c27sm626098lfr.258.2023.12.09.14.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 14:01:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 09 Dec 2023 23:01:27 +0100
Subject: [PATCH] ASoC: wm1250-ev1: Fix uninitialized ret
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231209-descriptors-sound-wlf-v1-1-5b885ce43ae1@linaro.org>
X-B4-Tracking: v=1; b=H4sIALbjdGUC/3WNywrCMBBFf6XM2pEmfSCu/A/pIk6m7UBJykSrU
 vrvxoJLl+fCOXeFxCqc4FysoLxIkhgymEMBNLowMIrPDLa0lbFlg54Tqcz3qAlTfASPz6lHbsk
 xVURtbSG7s3Ivr7177TKPkrLx3m8W811/xdOf4mKwRKq9u7V9Yw3TZZLgNB6jDtBt2/YBUB6db
 rsAAAA=
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The GPIO descriptor conversion patch left an unitialized ret behind
by mistake, fix it by getting rid of the variable altogether.

Fixes: 10a366f36e2a ("ASoC: wm1250-ev1: Convert to GPIO descriptors")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312090953.DiUo3mue-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/wm1250-ev1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm1250-ev1.c b/sound/soc/codecs/wm1250-ev1.c
index a2a8b2a4b19b..9fa6df48799b 100644
--- a/sound/soc/codecs/wm1250-ev1.c
+++ b/sound/soc/codecs/wm1250-ev1.c
@@ -129,7 +129,6 @@ static int wm1250_ev1_pdata(struct i2c_client *i2c)
 {
 	struct wm1250_ev1_pdata *pdata = dev_get_platdata(&i2c->dev);
 	struct wm1250_priv *wm1250;
-	int ret;
 
 	if (!pdata)
 		return 0;
@@ -165,7 +164,7 @@ static int wm1250_ev1_pdata(struct i2c_client *i2c)
 
 	dev_set_drvdata(&i2c->dev, wm1250);
 
-	return ret;
+	return 0;
 }
 
 static int wm1250_ev1_probe(struct i2c_client *i2c)

---
base-commit: e0fa2154a7f46ca49105025d118261d34f7dfa7e
change-id: 20231205-descriptors-sound-wlf-e6caec3cc642

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

