Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77C481A6;
	Sat, 25 May 2024 13:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716643691; cv=none; b=SSW553iLJ15b402irpIl0E+a1/X29FGCLxw2vexy96+TM75iH8WVIKj913Lw/vA5KqoqbS+bQwOrwc35UCFaoUbFHZMZjBnEKui0S31mst9XrdDxM3duNebY/5N4XJEw+T7hkuIuWLOIdK/d3raaQSB+dVbSZv9WXKcmrlcKNjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716643691; c=relaxed/simple;
	bh=KcCxSAxMvDkXt904XYa6/SbZmduZSxVRxErNI/Om7zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jsJ77Le5R2ppqBpLYQkt/1dJYExQw50T2OYGRqzb+80R6mnXhMu3lBHF2abRz9wky/hGT1PRQWTAqyIhaDqyRrYo0oFbryhFq/J1lt3f1GeZ+2RQrl0McM+PIu+4gKaOtfKozjp4HL19JBaiggzMlOmZ/LY9+lyIG/qYD7cyLv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJrITZHT; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJrITZHT"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6267639e86so204499866b.2;
        Sat, 25 May 2024 06:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643688; x=1717248488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMTEq8/81TXzUfHAT3yRUVR+6g/j7Gm/Znm9RLjIAhg=;
        b=GJrITZHT3als54VOdIN4M53n7iUBDwmkoyi0TtKiMa4mOihfsRoqslxqaYy8K9rCk8
         pTIdArpXzu7TE8zWho8arn+LUdR/ZqSAIreh7CqOHVwx7xIzksLJSK8kpHPwgQFSj1Cv
         RoMYAbTYH2HNRkIUYp+feA5J8Ey+8Nw0FLwzxZUsL51VPY8TZKT1C+jHtccq+p8glIZQ
         +qUnmdP++VXlbZzW1nukZWAnKyhwOTYScKB8Vr4xuIIgW/Jt+cv5QeOLn8lmbCVrv6Zc
         gK9Wtsz4BuOfzMkUzEQEIY9Y6GO+j1vVMKJGlidxjYOYbQ8uaAMu86B+0mMT+loeCSpz
         3Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643688; x=1717248488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMTEq8/81TXzUfHAT3yRUVR+6g/j7Gm/Znm9RLjIAhg=;
        b=dWrpTrmOTFlBmz1cd2/g7b1Hy9t7lxGuKlToYZAOmVNmUNt1I/7JtWxPA2pC03ydm/
         Pc6gVREgroHRCp6hHWu/+UAUCZc0fdVjL6lPXBmfBNd55yMKwxKtJcglIFRUlGU6XPRF
         C1lNwC6iXn9CKkbdFmFV4FIbRwZrw5TXzwVnWC54RoWoopu9rl60tcF+rywUt5Z6clZa
         7YN7L8WR4dhalsZ37sfBRYlqmIT7LcfecDCLfhVKDsYMr6DsUytQe9h6caR+E0RmiNmt
         6Zr57A57a1+DcTMktMZf+jeZOjRz0mg0Q/GI8HPx46AHZrLugnJ+hi+bgaCBsRoGI9nw
         ZR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCURQ6NykPvzoZFHUD6V7/P1MAvuNuTYAFW4Q9JZ479iNJFPPBrC27nb+pbXMxIaVZCL46kqon584gF+m6hcQ6/O5cuagi179aNkAg1MSFg8ylKWQCWras/u3K9PlLXD4N/ChmyXHPLydT7jPZYykFwTT8+n39yZ32i5QVMjyI8BO5NAqicgiRHEir6nuG7hSRGADR1lHTYqt1O72Vw583/okTjTKIq2mkU=
X-Gm-Message-State: AOJu0Yy8JGACjKRj66anPRtZ5Xj4ge1rrLg5XVARScMCLXG+vtrrdYoj
	UUKBeyVxhdIKfJOu3sjW6jWogrVnmjZ7peJnsnSVOx3B78RBz0PR
X-Google-Smtp-Source: AGHT+IFnN0alOg81y3ApkSMx/NppMuYvffZFNlVbN94bNUUJGBOlukHxGi7dQOIDZEZnNR+iOrPy4g==
X-Received: by 2002:a17:906:e2d9:b0:a5a:c194:b53d with SMTP id a640c23a62f3a-a62645d6c0dmr338273766b.20.1716643687998;
        Sat, 25 May 2024 06:28:07 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl. [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:07 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:05 +0200
Subject: [PATCH v4 1/9] ASoC: dt-bindings: samsung,midas-audio: Add headset
 mic bias supply
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-1-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=1024;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=KcCxSAxMvDkXt904XYa6/SbZmduZSxVRxErNI/Om7zM=;
 b=a8ffLr0BQKc3Mzr1ZH8qlfYzy+cz2DGscrTaCLSE6p59apseaVUutkgI3r1MbdZ60rLEp+h4Q
 zzO93Snks1kAD9Ic+jkeVqx657Cohmx+VeeSF36c4iKWSsDOm9PaIBY
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
2.45.1

