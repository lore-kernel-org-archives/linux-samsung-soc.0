Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62FF1A2567;
	Tue, 16 Jul 2024 19:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158577; cv=none; b=Tmggi/XbFkzgsjsr5iywRn2fbbhW/FTonNwHucmgVtpXz0brvEnTREzRLuu/oX9ZhKLqEfzOYwfu+bUj9EcQ3HsIx/Ri3aMLl5DCj+8PjfoRrh1i/peiGcob8ol6r36nAaza+Ztf1Kn5fuBlZlvd0ZyJXuDgH0i+u+Xk9zUVLJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158577; c=relaxed/simple;
	bh=kZc38XdF9J7Id3WKk5iS9WywnIhRIPd2R91vYOlsxIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ut068LOLUMrwRRrBcaVPfCGmRW0iQ6wGMU5skwxZcl2Lsn3H9FB3RH/rwTuibkOdswnNfokxpns+zqnW+H1cBGWNxDM+dtd0y+xyF7/2LE0k1IqikECBC+AWWZ8PcwvAN4mdohc6hNGSYFpQTgwaJpYzif8ko4koT5ovDNMvonA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hF8FSSyV; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hF8FSSyV"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52e9fe05354so8247799e87.1;
        Tue, 16 Jul 2024 12:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721158574; x=1721763374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnjxgp7kjcmRmm6EMnRppGXf/dgi+VwpwgW9tfRhMgE=;
        b=hF8FSSyVuKulYkPtByyZC2caGvs4rUbp9U3NNf9+DeBB/vWGWNqZJFer8GcCONHNv+
         75iSyWaKB7k4ZPhVa66VJxQmWjvCNGlXJwFU6p0RKevGGmjVw9DheKNLuIWuETVxcVbF
         X3vi32eBqKUGgVW31KobZ3wdDMhePYM9U7bdW0xB5lGuydK6gKtFBpXpqT3HeyRMAceG
         Ue76fLYW+0vxAu6lwkUuF43HfNzzeF+6GdldADZ5LHWgpzbzZgNgDRo4LVxkZ5pMXk2+
         e1UI0mH8I44xLMrndIc8Jakt0UPzlS5uw0fJFJoPyfIxufJGGaJflF5kyPd8sHDa/iBq
         axuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721158574; x=1721763374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnjxgp7kjcmRmm6EMnRppGXf/dgi+VwpwgW9tfRhMgE=;
        b=huNQkRHSe4Uv0yBfi0G/iNL7JJ/0nSdi2CbnaY+t/cHx263vGAC6c8SJZAYRpy72o5
         dYcS1cRxSG2Z2aARrKZNbucoAIdT7Qna0P5E2RTBDzySTVnJpP7U94Ut3Pc+NVsVNZjI
         ADSv+jvjv4szxfuyNBpXKOljpBgYk66ycnDEA0i2zk2U4R3xKgxV9F2u9cbcd6QbL5Lu
         SIuXQd+G72t5onKZ0nWfPQygBy8SXrnzC1ytHcRifH8vL6L5jc3A5eqYtdBbA8linUvG
         vPbfUvSRrocVQamoQPKv9NTLh/134cdyZeKHevqQeCq/HAG9XJQaU6Eh8CPCtFc09IqW
         3O0g==
X-Forwarded-Encrypted: i=1; AJvYcCUEnn1p5iVPCzlQacw4fDsvNxaxnO5sMkD9vpJChQXXrdWmle5+S+wn03M0O5fTNlpvnPMIcH1mZkXzqf6gGuMK/R+GbTNj+IGC1gmpyblKxHD3eDR92soQKzGidC4BP/tY7KPeieOBhrK3UuMM2nLQGf5du9gdteaQvAwycqaljBJoaxST9D9SVggqxA==
X-Gm-Message-State: AOJu0YxamallhuRZkFM9bMLTJUkqE/OcuKsHZH2c18mZdJIx1NshxJ40
	t0u4CyF8Vms1SopUtHifA2o0qtegWwl0ZcEcCtjICcQLX73cpqjy
X-Google-Smtp-Source: AGHT+IEeZ3SFWEj0QEXEEoO3+anCbcm3+7q0QDnCBkC0PvJ5cV0brC6ICCVAyuSjUqWufgfMk4F9jg==
X-Received: by 2002:ac2:4c51:0:b0:52c:df55:e11a with SMTP id 2adb3069b0e04-52edef0fd96mr2791413e87.9.1721158573816;
        Tue, 16 Jul 2024 12:36:13 -0700 (PDT)
Received: from tablet.my.domain (ip-37-248-155-75.multi.internet.cyfrowypolsat.pl. [37.248.155.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff888sm351179866b.159.2024.07.16.12.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 12:36:13 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 16 Jul 2024 21:36:06 +0200
Subject: [PATCH 2/6] ASoC: dt-bindings: midas-audio: Add separate
 compatible for tab3 audio
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-midas-audio-tab3-v1-2-a53ea075af5a@gmail.com>
References: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
In-Reply-To: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=kZc38XdF9J7Id3WKk5iS9WywnIhRIPd2R91vYOlsxIo=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmlsumsPoqCAI8cW0KbaScyKgmrrOduFOo76LFY
 7k5iNdmbwqJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZpbLpgAKCRCzu/ihE6BR
 aEl+D/98v0szvIvYfkIlyM9Ho2TMMq/P9iQp6dFi3ejlZGfpoRtanj55fwQooSHWCX4P494dyGc
 IpLiOa6/Q6uehbPrZu304EpAjVG0dwBPbcKxFfEWskXmUi3R756PX0SC+ySben/gsJS6t0J+hqI
 k+zMn764MIMdpcEYWIWDOXt3WtZ1EviGT9G6S72wn6Mhki8Q1HafINDYvY0ySJldqMfmdYHTBqd
 4UxhISrgIsK6eGgsqry3fmxxmufjnyNGjQ/FrgKTvvdcZ8bdXTwDBBxP2/Zecnx2zHXtQiinTNB
 IqEYBITzxGiik1ty6BnL3iV8WA7zU/vsjVJCB/eJaiTDVnIE5L5Y7IBZ90/CEUab/lLBtcv1f0p
 NzLt+b5Bby9AmE4N0yxEV/SbtiZmx+VX8WCyj6sNvO3IYiA1FjWP6Dfxb5LoJVdFGNGOPZadiXH
 XGRqxg8y8LFhADdiVW7pv+oGqvBlnbmuEo6RIT8OZU7bT5fn7c5harGXg2Hn9xPPopmpKgtNyCJ
 Ms6ox7qufUPyBAiG4NhBHavpewXxuWlNmVRV8E0OyBpGWtCVsA/f0DAGhYH9oRL1sJ5rSEU8gon
 qhIS+/F90H2b10yLISaeQVOEmcVq/1H2ykj7abSQmrPUwyT1gfVuXA6SN741EDsqcJh0Mk37zg+
 HDTE87vbf2UPpPA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Unlike the Midas, the Galaxy Tab 3 8.0 does not have a main/sub mic
bias regulator, but it does have a separate headset mic bias regulator.

Add a new compatible for the Tab 3's audio and declare required
regulators separately based on the provided compatible.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../bindings/sound/samsung,midas-audio.yaml        | 30 +++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index e7af3c09de38..fd9eb054a278 100644
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

