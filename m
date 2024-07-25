Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74D51990CD;
	Thu, 25 Jul 2024 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904048; cv=none; b=Hbjy1ru7WWZrj5ToadUIhhTq18mvYcDR3FUABqz7bJDrNGn+egbv//ejosvBFgOCf2NYTcgOzOXBncDhttqypzWYetO8bbgsKThR8cTCfxyL/gNgE546URor0wBnsKr+/MLs43+S5tk0ad5zwNSM1r6ph5RFoT8KabtHSXF9WDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904048; c=relaxed/simple;
	bh=/IfLGEvhoqbrXs/mPhWyyuqb+s7Bk3eCuOnYTVRjQvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t8ie35GIFtuCEF1Sc1toiXgZ3ozJL3zQ1UgLkFxcsd/gC4No3T/KKevfqbLTnrVkk3hHviCZSSIom9mP1BDqcaJiEYiWUm8pe6kEIZB+H770ZloTR7C2qIHBOzJkK4LAJ9pUQUqPSFXgWDcCfwHiQeswRdtdrT0cCvahN/k9Qf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IP5PgDgs; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IP5PgDgs"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a3458bf989so922118a12.0;
        Thu, 25 Jul 2024 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721904045; x=1722508845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BT1ETjGdxc1ofYe6xfqubr4qkHhr85Rz6D2FNj+D4g=;
        b=IP5PgDgsAcJXAu9ViIrikJ+qXJGyxK66b8DKFHGeskW98TO6ok4GUxDFu6rfkz77F8
         LqbfernDhpLxiTJHR0MhRwbII1DMn2IndELpw8N0Gre3JfGhSlimwxByu2bwkHaip3gC
         zo0qzZCDeqYHEKdBPsbj0ClbsYNA4fh/sDJ1Kr+HUqQFV1Gm7lagwBBwCO6tzFW78TT7
         oDiUhD57JRoX97NNUZEazDx2bL7EF4QnzMk6qEIuAvQm5tsF18uXhDV94pO3SVd3dNQ7
         CnFuzt7y5Ml8AKYo9/zAfpymH7RNI4PIQYvJnwoabSiNmK/tpGYi0qWEb2QrC2XE/mYO
         MeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721904045; x=1722508845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BT1ETjGdxc1ofYe6xfqubr4qkHhr85Rz6D2FNj+D4g=;
        b=o1anXAeDKz8YrAfGIq4kjRt8H2JTH/Pq3NA8+WH06HuNmUmsWVn7K//6a2WN9OoUzk
         wTo0cfhhsLMtDxDEl9pycF51XH05asrEkFRokUujq0FxY+mTCkfLTVQGQRhOGVnvfS+9
         7bd4JJQI9oX6EA7zTud+6k/vNvmWVOJNFYOFeafyM/dJsBo7+x2NuLwXr5+28UWaf8up
         wim8+ofw3Dl5QINlmi2RjfzayKG84mpgQ0/1zq89hw7/GGqOKQV/0T6O1gOfFjwxSQtM
         4e91v3ZHqihxghsCIw3jHuOkhzNXNQuDvnqGlK7YalKiK9DgZQzllW4d7OIAV6ZUgl/L
         ZU2w==
X-Forwarded-Encrypted: i=1; AJvYcCUYPg41QJAkCE5lZnr0JF35LnwPfUaymMchrlivFazYORZ3EpUVMo/obx81nzyM/eKz4GkG2eRzZu0yDtAqwDtBpYhs+5kjyqB5iWa45paNQ18jgJMIZN88+CVmoxudzZKjbtXFhKmWMR6e/NI63fqEdoSCF22ZBM9afdPbfhrgsI2d0C48K+4cH6LDXA==
X-Gm-Message-State: AOJu0YyILy6ED0PuamO/o/SavQC7sAM+iCdjPR3jIiOTFfeC1Mu462+7
	YJJkhy8yJ20etUmWVHfyx8Ill2QFpnnuBmHiy/XXsq2oIOrtGvYY
X-Google-Smtp-Source: AGHT+IGV5STZLw87HTmp51t5/YRKLVMWBZVnchanMigxTA6+DYmh2GOpfpud+QG6bDPjnYECDGQPhw==
X-Received: by 2002:a17:907:3fa4:b0:a7a:9144:e256 with SMTP id a640c23a62f3a-a7ac4d7bf13mr189732966b.6.1721904044993;
        Thu, 25 Jul 2024 03:40:44 -0700 (PDT)
Received: from tablet.my.domain (83.25.114.69.ipv4.supernova.orange.pl. [83.25.114.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab23d56sm58342066b.38.2024.07.25.03.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:40:44 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 25 Jul 2024 12:40:36 +0200
Subject: [PATCH v2 2/6] ASoC: dt-bindings: midas-audio: Add separate
 compatible for tab3 audio
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-midas-audio-tab3-v2-2-dbc055c27879@gmail.com>
References: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
In-Reply-To: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=/IfLGEvhoqbrXs/mPhWyyuqb+s7Bk3eCuOnYTVRjQvM=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmoiuoO0ZE2wk3i+nYkt8Ex24aMWi3VFBpdFQCH
 A9vUABb0DeJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZqIrqAAKCRCzu/ihE6BR
 aPM3D/9DuGk/DVvmkKZFs7V6thby1GbdhHaTN4tv22CBr/GctAXE5hXXS4sc9yxw7OIcIwgmTEB
 yKHS5JGvJ1ie3vKM2ATVt0J9RKyJLeoPc0lftseWw958rmbpKHbOa+Vec6bWIOOS31bQ244fTrj
 Xo4qY1Q2cuFJEzta6dILYzdcs66/jU3hafxGNWLfBkp6flE+BsSwgiPK8X/MJqPLvdRRmpRDxi5
 j0gLZieogu48aRVKlxIRBXiHzSXCaCb68q/4iY0i9BVN+QimdKkJlUxjF2kRhlmr4eyzEYKucnb
 BvjIKjSr3Q+TeCV0bw+37EPiyrxGshzRLCKj/NQDa+dFVq2rwo574RcL2S/mZQidVVg3D8/U/P7
 LImrSvFMCG+ZrKxAc+VyD+UJSjYAXEHGPK9Y3w2Sb8/R0ZetrtE+tck3ai2NP8WZVjNS13+DMPa
 qUI6bSu3Vo0EyrrjTVYykgvxXXVYq9N3T7c1eb81Ua/ziGamV4o7J3jvbyHsrYvmnqId8tL5o/5
 77n0K9uvx9z/vGq2QoiMgYqJrKxRmtXeQ6KtqrFOGcltePtKnQcWOHvoP5yR8ZF0vcJnuILm7wF
 WPeRf5rDc0PUK67nj8l6PeC/wvsnGoPlxUbqH3wuKWp2t4FFBYq/UmriyehsjGcFmbG1+7zC9hV
 tdHhEHpieUYWpLw==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Unlike the Midas, the Galaxy Tab 3 8.0 does not have a main/sub mic
bias regulator, but it does have a separate headset mic bias regulator.

Add a new compatible for the Tab 3's audio and declare required
regulators separately based on the provided compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../bindings/sound/samsung,midas-audio.yaml        | 30 +++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 5483421a6fd3..cb6105a6b216 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: samsung,midas-audio
+    oneOf:
+      - const: samsung,midas-audio
+      - items:
+          - const: samsung,tab3-audio
+          - const: samsung,midas-audio
 
   cpu:
     type: object
@@ -96,8 +100,6 @@ required:
   - cpu
   - codec
   - audio-routing
-  - mic-bias-supply
-  - submic-bias-supply
 
 allOf:
   - $ref: sound-card-common.yaml#
@@ -125,6 +127,28 @@ allOf:
       required:
         - samsung,headset-button-threshold-microvolt
 
+  - if:
+      properties:
+        compatible:
+          const: samsung,midas-audio
+
+    then:
+      required:
+        - mic-bias-supply
+        - submic-bias-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,tab3-audio
+
+    then:
+      required:
+        - headset-mic-bias-supply
+        - headset-detect-gpios
+        - headset-key-gpios
+
 unevaluatedProperties: false
 
 examples:

-- 
2.45.2

