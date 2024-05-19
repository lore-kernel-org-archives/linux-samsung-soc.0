Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF68A18C08;
	Sun, 19 May 2024 08:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716106694; cv=none; b=XH0u65R4GEoS5qq4ZKW7EAi9R94rCYvqWvh1L1pfrzihq1SS1Y4klPev02ow7ceYGMr5J6Ape3sLug1CAPmfAXvbPd42kFs3GMaE3KnFf7FUjuiqf3Mg59fLsDHHmoAxy4mSqtbWgJuR5ZiMYeR0Yhere2fIrWvV3kfxy20M168=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716106694; c=relaxed/simple;
	bh=EZXePcBvXKiwP3EXDEHqCyB/Gu0AEIhLbrUV4Fe+KI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkG2kRTy2kBPVIXSadUIv4abGEayQRMemccCrgXwpijteE+TM8owptJRsmlfDz1OXkAchLABBCbZ3S/minpPmpIlaPxKeFCsyyr2Hph1qLQvzxkJg3vQRZd9Db/qmRItirDQXQ+n7YFKgrCy+DYv7tGvzhMSp71Wb8HZ18auWxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evO6cqRH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evO6cqRH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so6291515a12.3;
        Sun, 19 May 2024 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716106691; x=1716711491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9dPohp8pfuUkAslj/44LQMkiwtv+DsL3rPN9tPKGHw=;
        b=evO6cqRHGpItRJvz3XH4lqDh0qa8kN16LXUCHjDbROGxF8X9Wl3XDwtqRHZ6FSt7a9
         qoN5cFKynMDDtdwGj6sWb/iOoivXcu1urQhGVsRQUgxCFPDrKCnwTL0gbMcW79o4YJW6
         Bxi1NQipKlI+YLN8bLhY7P9KPmJuTzMH05Tn/zbHs3g4X1ST1RQqG8oFDQ4RevTQw9Nh
         fERDvXtz0k3VqnQ2OW5xbVutORon9FKln2PE+Zck87ooUWfFrwslfs5R2KXgdqFK1jZh
         43xx9LB18TYn0pHyb7Kiv62hHQSNY+SIl05v2MnDAhtznDWpUXhrDzinlIJ0l4zSTfV4
         iUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716106691; x=1716711491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9dPohp8pfuUkAslj/44LQMkiwtv+DsL3rPN9tPKGHw=;
        b=dimSBAx78YxMw0ogkwTfpihSCyQ7NaLv92nJM6rYpz2rGIJRiHqUemxay6xQwn9x4z
         //dWnrLrLbj4yoc0JYKET0oTd/w2+MVMPKSd67L5nLaGjwNTc1ojkfPQVEzq2I+ta33Y
         m3zXkhodHS/S/GnuPor1ysBa6i1ikh2YT07kPYDFdMsgDdMjXWN/WNR4aqGTL7xvjxOU
         RwhO7vDQjiE1WX9AzYo0Ha36xg6jJY+omIwiOw1TYsXidQ31jO4H6HKh0WaQJH4L2ONA
         3DSZKwUBHMiLpUXSBe9HZ2hz5r30I7r7sfKKP/Eb3A5S17lMT0hktp2YKkyHlAcqGJcT
         +6SA==
X-Forwarded-Encrypted: i=1; AJvYcCXYnr731lmJAm6C09q1tbBFXOEoL1LD9u/oFWFcds1mvV2EStVT9qMgHUcfBVPJnpUUcXCyf6aewwc/G35u/JhPyxbcR6IKBlzkStEc3/sJAHSn7fKdJRYI3rd0cBSNWWjkY6Oys3mAvKrLDKthYvwKBUK9wfsLIhb94G1UaBAs+2Yyp/eoroLeCIKitul2BchLkDizSzxEb35qpA1SQIC759bsgQmLddk=
X-Gm-Message-State: AOJu0YzOT1NNixAzRgiJ7g/PFa1vdoyP/h49Hmiav+pMDcMyi7BOBvGe
	gIQlpZKxDG3C36iTrSffcFJb5uUgrPPUl4EKaE+w5hYQ5KyM/E0j
X-Google-Smtp-Source: AGHT+IFSJPpCsXD8nlzNZtTtwVuOywlJ3kEeHAEQNsTVgsVqCTp5lAG6+vAvM/y1zxZstH6QWCi7tQ==
X-Received: by 2002:a50:9519:0:b0:575:d74:338c with SMTP id 4fb4d7f45d1cf-5750d7433dbmr5644244a12.10.1716106691185;
        Sun, 19 May 2024 01:18:11 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl. [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:10 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:48 +0200
Subject: [PATCH v3 2/8] ASoC: dt-bindings: samsung,midas-audio: Add
 GPIO-based headset jack detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-2-0c1736144c0e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=2328;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=EZXePcBvXKiwP3EXDEHqCyB/Gu0AEIhLbrUV4Fe+KI4=;
 b=y0s6y128OFbER9wO691Pl1y+dbxejiJKN2KyMeWLB/2Zj0rDj0uqrU/vqrYEf3sfku35wMvuJ
 4n07G9uGfoZC4uco+vrUBL0eL2AF5KeXYuDpzrN+9MsyZOiAHxEX8eh
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Some Samsung devices that share the midas-audio driver use a GPIO-based
approach to headset jack detection, as opposed to using the built-in
jack detection provided by the wm8994 driver. This setup uses two GPIOs
(one for jack detection and another for key detection) and an ADC
channel for determining the jack type or button pressed.

Add DT configuration values that allow for describing these setups.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Re-added pipe (|) to description of samsung,headset-button-threshold-
  microvolt to prevent syntax error (otherwise the "in order: ..." part
  is interpreted as a list)
Changes in v2:
- Added vendor prefix to threshold properties
- Dropped pipe (|) character from description: field
---
 .../bindings/sound/samsung,midas-audio.yaml        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 6ed53dd0bb53..69ddfd4afdcd 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -64,6 +64,36 @@ properties:
     maxItems: 1
     description: GPIO pin for line out selection
 
+  headset-detect-gpios:
+    maxItems: 1
+    description: GPIO for detection of headset insertion
+
+  headset-key-gpios:
+    maxItems: 1
+    description: GPIO for detection of headset key press
+
+  io-channels:
+    maxItems: 1
+    description: IO channel to read micbias voltage for headset detection
+
+  io-channel-names:
+    const: headset-detect
+
+  samsung,headset-4pole-threshold-microvolt:
+    minItems: 2
+    maxItems: 2
+    description:
+      Array containing minimum and maximum IO channel value for 4-pole
+      (with microphone/button) headsets. If the IO channel value is
+      outside of this range, a 3-pole headset is assumed.
+
+  samsung,headset-button-threshold-microvolt:
+    minItems: 3
+    maxItems: 3
+    description: |
+      Array of minimum (inclusive) IO channel values for headset button
+      detection, in order: "Media", "Volume Up" and "Volume Down".
+
 required:
   - compatible
   - cpu

-- 
2.45.0

