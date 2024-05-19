Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58441FB4;
	Sun, 19 May 2024 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716106693; cv=none; b=ZmehcX/g9/FhCSpe54bK4+tX0CKweswKE8nTroKWX0AvhFtthMEp+N7GRHVRdQmNjjRuWRWncrfgjU152Lr9z1GjRLrvHNWjhoeyDPGKVS5+g3Hxnq1vJFZh+aja/ME07ZrY55Ns3FxJAuWGP++ZtpsV5S2Vo5DuenncVjmb3eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716106693; c=relaxed/simple;
	bh=oxZAMqMqlKlTjZ/d/nZ7mM8CRcGM1aALJhSvZTlSCIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X9SEKQB4sARmffMCtRdrWCClEGDe1kelUSwCMNaMd/L3wEbbq68rWi3cVnUInn8y+uz2PKkmm/YdDPux02GbsLfDdyWQcMGBLr4UEkysb7PGbEkChlWzHPMdje0twMfiR/UxyjIhf0HAqtwsXEf/hohA9NLM0A/0jm0VHGgmwSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imAH6Aqy; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imAH6Aqy"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f99f9e0faso3889123e87.2;
        Sun, 19 May 2024 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716106690; x=1716711490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBQXsZU35VYhqiFUuzQSMRWlgIZsYX5osBGZyaRNZAc=;
        b=imAH6Aqy+9qejQKYN+UWHs/uOfdDy7WOG2aJ1U8newRI7gBqq2yMuYJQh3Ut5XaS5s
         DbIfVKshpMq3mLa0ctlfdM19xkvbQBnVh8iQKODXJA2Ugw+BM523u6DfWs7U0sJwTIjN
         4aB/lZqli+4TbKODx+7XMui80sD2uSO7BOBEizuR9kbKbozN0KXtn8MJuqQvgrRrUyoz
         GoAX2iS8I1GZ5nKvrUhWcrzDb08sZhjJhefGVB2pH+WwfL6IZAjtVZZicxXxsIRbwQrI
         gt5i8RdC0IilJ7IGcIFCpa7uWxyubu6ljhXh1uWb808Im/nMHYiXLA6KYgOLseiiDFLd
         najg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716106690; x=1716711490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBQXsZU35VYhqiFUuzQSMRWlgIZsYX5osBGZyaRNZAc=;
        b=m5PpBq6ttzNYjOYgw2WFQPbzXN8Sj4DGZn2TBNBnKJNFZE38NOLMMRbsYctowoWh7T
         Z1CqtTVeu9KnisDRh9viJStjBmk+xW87BdcP5G9woz9WserHN64Ela4dqMKTXwEI7KAL
         Yo3FxVqpvoeQ+ahPAnv3eGg1EOtcArzcL7rnwCmBjUKVUXRFoWok4vC59NTnPvrVD5S0
         u1mKrll3uJRH3B8GxhG89tbvDrWHRZilAQRRgEnmiKnQQg3VUsXPWeuOToEaLfldvqMF
         Yql2WPFMhGgJQBgiNR0kl+pR2ELzvCqOm3oehAPf1jicZhvMy2IBSPfdfGXqx6Q2CaWC
         ZiCA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Nz1IVv31YD7PpDwJPUiuIKJaBtiQ69TKGDUAFVJC8/oP1n8NUZqFibSXG4ox7x5fBP7hzRqB65JS1HWrpI3wpqJlBxcBHYrYV0vnQfvaE3hLB9B4+3c0+hfME0tZ5Cq1AI9avfMsmReBn7LpX6JLtHajBT1IeufA9M9zhWFJUKduWW1/eZg/050Fvndc+aan3wG57sppD30RjiYy6HG+jA8ebIfxiQk=
X-Gm-Message-State: AOJu0YzqDAL91//u5U0ty7yfaCanJOr7R6xJ3+VOWQ8O153VmDY+lLKU
	pxHmSIWHcftNLIvSrCe7kAnqSpg0saj2dNYwZ4+tCw7oB9Zs/Clm
X-Google-Smtp-Source: AGHT+IEilfnVxtejbu/ht9RsEU/PAmph0nDxRzwauS2k1nuOc2xrr0wwjEZekDl9AfdgWnlGYcB5Eg==
X-Received: by 2002:a05:6512:b15:b0:51a:ca75:9ffe with SMTP id 2adb3069b0e04-5221057b50bmr23433137e87.42.1716106689783;
        Sun, 19 May 2024 01:18:09 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl. [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:09 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:47 +0200
Subject: [PATCH v3 1/8] ASoC: dt-bindings: samsung,midas-audio: Add headset
 mic bias supply
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-1-0c1736144c0e@gmail.com>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=1024;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oxZAMqMqlKlTjZ/d/nZ7mM8CRcGM1aALJhSvZTlSCIE=;
 b=BhIKKL+8RIOGcP4bUlY911QYk1W9Fy3JXaNFWUp3TXITqmXYjEBxWsyPihAzfzCdyP0qEcTeV
 ow6N+zBCrMNAp4ThqQJrxiywHiLgDSQJXmY+JaRKZwzCc+BvJiEYIum
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Some devices use a separate mic bias supply (also referred to as
"ear mic bias") to enable/disable the headset mic.

Add the DT property headset-mic-bias-supply to allow for specifying
this supply.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 6ec80f529d84..6ed53dd0bb53 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -53,6 +53,9 @@ properties:
   submic-bias-supply:
     description: Supply for the micbias on the Sub microphone
 
+  headset-mic-bias-supply:
+    description: Supply for the micbias on the Headset microphone
+
   fm-sel-gpios:
     maxItems: 1
     description: GPIO pin for FM selection

-- 
2.45.0

