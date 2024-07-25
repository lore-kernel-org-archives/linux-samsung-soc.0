Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7546A198E69;
	Thu, 25 Jul 2024 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904047; cv=none; b=b27tnyWrl3ZZsNbKiKsAwACFQRa6kXWYERUKwZrXba47bbK/fnuXuStGLhRwR2oKECivC+F+ZulmfcyStXXCTWkY4z/E/+vx86ASLHJlymb5tJFCYahevixxNltOegk9CyP+ijLIf7Yeug9W/ryKIUvLWpGMwD/RTrbmCNTw/pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904047; c=relaxed/simple;
	bh=KTkZsY91b0iIJMvb4V4gIHRHYTVzSRya4eCPvKugz6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLdY+AGGtxJzmSzdaHLU/jiYrfsHVe7j+rFsj80BEWlpoZ46wQ7TyxgpGoA3oYO9S5p5dKtEDXV1AUw16v3kEmwIbYwe+J3p6HpIxY5RkSWfelfNLbsSxtHzPdtS4VH6bI4lzzHeQC09rKoqzggbgT7pCkae+XdW+mimA9u6XaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGCw4q1v; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGCw4q1v"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7aa086b077so36131066b.0;
        Thu, 25 Jul 2024 03:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721904044; x=1722508844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dxd18IEPPCN0mdlU0anYLSOukmaQJ1jfiipuPAXFgc=;
        b=KGCw4q1vMn7CiOy2tC/lpe6SHhgMZahmk3vfbnbIqQPmAvP92O2dPzkFuGPfjlAbgd
         1yNIN1KEI1ETNUTDtWUE3ExlCEkZKciG0Effa9ULrGditgM5ZS0g5myx8/mYTd0sVxs5
         S6TssIJKtzcCh8AQe76jLNT7ZqzcgCwJ+6RTJeyKh3VPmzJaRL66tqo0H1daWSa1Tz3c
         Axov8PPNaU/airdTC8oTwQJx/4zttHS0h6t6BAsAA8t8fYEhcc7ZBiLNhXqhvKx65YTQ
         36uu38M5Y5UElwjAC77gjBWsAdlRmd/gJY/P1sgcE7Ampn6V2dUnIBJkucGBDUWcOQg6
         XjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721904044; x=1722508844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dxd18IEPPCN0mdlU0anYLSOukmaQJ1jfiipuPAXFgc=;
        b=ZeK1vF+G7IhGgy0ESGqT8kla/lZw4RqLL20IEGM2zubhj1EpwZ4w9/+Mc9XY4WwA+Y
         q4ZCTmwM8PpIRZ15ElqPadnJ441VFOsqc5r+Gg9mn8YHaWX3HbBgqCQ0zfM5ucBa1Hok
         7pDmXXHnB8YjFAUFXqR1kLlBrX7BFFbWgcuKQGiQRTLxMybt/VJPUFfNAHYFJ01fnm5Z
         fel7R3dNSIRIkpTA/Wsu0aMHbtqFqH93ehzQbK6HrwaGT2z6kIyjS0WsGJQdh/+6J2rG
         ZCjg14dBWdbpeMTnGklv7OWaEoqrfXq1L9mp7kPKHSVO4KNYyETW/m6P0WFu1pTgruF+
         AbBg==
X-Forwarded-Encrypted: i=1; AJvYcCWjhaRBoNkuyjPXeHQ0fyTcp7Dgr1fHeTK4e7PvmVIg7M3uTrltw2ockiMhtHordn4EBS21k6ZuIv7Joq1bZj7euMgojX68pqCM4bfmDztBDUk5AVDNQrRcm8S0RDkPDJTFq6sGfpQZj+jHfQP9faNdgc4e1ycicomq6CCybpO6yhJhqWybWsRur4C7mA==
X-Gm-Message-State: AOJu0Yx3Oln0ietLwZLmsbXMQYiUkIO5eKJMH45Vh4ahknCaYeFcdKq4
	u19h4TjMj7uK2ar3I6H/YhNbv3+L8r8YH593NJv4B2zVy2x0RNbjrnm6ug==
X-Google-Smtp-Source: AGHT+IF/mZbfu+qwl21CGnof/UHOhOM/AoVBM2J5sHP5zzGk+ZLCeJEelKisWC/ixRmMZRuh2PLccA==
X-Received: by 2002:a17:907:7296:b0:a77:db36:1ccf with SMTP id a640c23a62f3a-a7ac5049d22mr170757266b.42.1721904043764;
        Thu, 25 Jul 2024 03:40:43 -0700 (PDT)
Received: from tablet.my.domain (83.25.114.69.ipv4.supernova.orange.pl. [83.25.114.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab23d56sm58342066b.38.2024.07.25.03.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:40:43 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 25 Jul 2024 12:40:35 +0200
Subject: [PATCH v2 1/6] ASoC: dt-bindings: midas-audio: Declare required
 properties for GPIO jack det
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-midas-audio-tab3-v2-1-dbc055c27879@gmail.com>
References: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
In-Reply-To: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=KTkZsY91b0iIJMvb4V4gIHRHYTVzSRya4eCPvKugz6w=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmoiunWLve7myaMeuIovS4h1pW8U8xbvx9acrN/
 qVuhsjSsLKJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZqIrpwAKCRCzu/ihE6BR
 aC6gD/4uXF/Wqdaq+E/UKPCSJtW5sD0MMI5hJO/AEi2YsUdRTkvMTiq+QlBZ8U0qIfFGmoMwgtV
 dkaMh/H9I2AM2+WaDGzsujfyw3z32V3RleZ5khHTmpvkY5PS3rRqSFGKOe97986MDlXSuP3gO9u
 lnc787HkF2gGZNm0ncYQKwB5hIUZrwf+0vvMKifZoPwwfG2DvJzNCiUEOx65QCmETCU9ErNsc69
 WMyX3Y+K8HipJUl2gliPQBWKib7mDIJygI7vxeb/sTTzxbas+s60U4cnSYZDOsN/ie0MzDNIgx1
 IU+wzT9+ylJDLAdbaaVTroKlTcA+dF4rT4FQMwWXRcBQvkCrgmE1PdqRmp9gpgx1Hs6CPE+agAB
 g+a0Om2tQggxrB2RaSoP+GpFM+xFYy6D/uyN1bpV4I8ksDkstOOvZPnRpDL9BOz76bFlY+HhsEp
 WK149c2UYZ5HFaA9wCCfSxG/esHCpsQVe/uAhCwD2Is6zNz13wW42WcOWz+5lecDTmJ83wnFC8E
 TZNDboutQGxmO3aBrkNwhaM3eC/wmBEgISMYRGtHPjsPpC7qQhDatmMyqDr37xW9bwaRP/04D5X
 jIjOF+Ym1msRJRZnDFAEniXwzGUSWHbwERZiAG0hmWoYsGK3go5YsT1SaVQPeOs4BruOuJl5uRd
 UhcmDdCN+asxSvw==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

GPIO jack detection requires an IIO channel and the detection threshold
to work. Explicitly declare the requirement in DT schema.

Fixes: 0a590ecc672a ("ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection")
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Use anyOf instead of oneOf in headset-detect-gpios/headset-key-gpios
  if: statement
---
 .../bindings/sound/samsung,midas-audio.yaml        | 29 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 69ddfd4afdcd..5483421a6fd3 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -9,9 +9,6 @@ title: Samsung Midas audio complex with WM1811 codec
 maintainers:
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 
-allOf:
-  - $ref: sound-card-common.yaml#
-
 properties:
   compatible:
     const: samsung,midas-audio
@@ -102,6 +99,32 @@ required:
   - mic-bias-supply
   - submic-bias-supply
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
+  - if:
+      anyOf:
+        - required: [ headset-detect-gpios ]
+        - required: [ headset-key-gpios ]
+    then:
+      required:
+        - io-channels
+        - io-channel-names
+
+  - if:
+      required:
+        - headset-detect-gpios
+    then:
+      required:
+        - samsung,headset-4pole-threshold-microvolt
+
+  - if:
+      required:
+        - headset-key-gpios
+    then:
+      required:
+        - samsung,headset-button-threshold-microvolt
+
 unevaluatedProperties: false
 
 examples:

-- 
2.45.2

