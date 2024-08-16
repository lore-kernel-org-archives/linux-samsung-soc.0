Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75FD7E563;
	Fri, 16 Aug 2024 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794682; cv=none; b=WDw2FGMx77U/Nsnc+y7baAwvVn6JOWuaUUMWrPthUJcqSMekn4DxtE5ahJRqAmXTmJ2G8t0lkldzhmuNqqy57cBTCVHAMdUkb+oLuTcGq9iwlCF72sdQ3QJ+Kqu4FhRisaMWdi8vuECv6fbXqzSWrUgwPwUIgzXIHNEMZ3UFGOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794682; c=relaxed/simple;
	bh=Xe/TeA+AqUFagpOwh/MxUzaXugTMKRQK8JWn91rUokE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gjfu2Dpxl6x2GLrB/1z63rnfi14acZFt/pQD8X39UCGjU5PdO4MVYPDIgQZBqmwA6kh+bG0Ye87on/ZMAwOXAhuZLeXJ/E2oySMF1yLcUVL3iKjB8LyLGp4tw/5ADf8m+wOoYjRdopQ7N/E5yvnLBtvt4DJZaHvFEdrcPjhbtDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXhY/uyM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXhY/uyM"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42803bbf842so17034725e9.1;
        Fri, 16 Aug 2024 00:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723794679; x=1724399479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nv52bY0EFnPEnlQPn67LspBrmp168OKPFuY1wn3c8Y0=;
        b=DXhY/uyMZrBsbx9P50esy9cKotkgT0GWOah52FSeyZZ3+wTPqwIIrMidx5y+7Yrvwu
         cyFRBL4J4j68jWqbL+Nw2vqX1tQa8By+Twi1Au6Fm9F6ZbdcAbeolnuZtQIMiVit5Tsm
         DR/yvi4NP71ARsFTnbgLK6gzp9eLPxm4Ll5iz74xEnAni0GV/ZL0kZEh966rITDAB6VQ
         0DphFZBwTojNDZYH4qOwrbnw6AB90FqQmPpbjEXEPw15QHm7+bWsHcrRkWkl6YzDotlN
         YNVYkqjApl5OIX484xgO0Yca6akFNVjgwQWyhzSP2aUqGX7swLja2hC0SzlcoWSpmMbX
         p10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794679; x=1724399479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nv52bY0EFnPEnlQPn67LspBrmp168OKPFuY1wn3c8Y0=;
        b=nzRPANRy3AU6Ndb3pDvZL/3e5kIQ4utAwQN9XUGALUXWRkTHEx1EPktyTpDNdTTP16
         skHT2IvkiPQvRLa/itm+2KKhaLtOQ/cUr9lVQRyTNw5IQ4E8o0La5TS0VmxtnYVSqe7t
         FpX2EqeidvZ01muZYbZiaW8Do9bMfbZU44gM98e8e+2jVIJz8YQiJ5CZ023/WSSkdPYP
         hu7HOyBuw2AIr8wn4iAytCcSdkZRkIDGBk3WMsOdd/FsiB9CS1OzBPUg8hUp4pa62+16
         CmOaDZGWAS3BNVsE464BwHN8UqPpmxf5R7tdh2sha6mhPnjH6Un1oJ8dFTfx0iHqFosn
         S5wA==
X-Forwarded-Encrypted: i=1; AJvYcCW9H7QQb62MIZ02tdEksarEvJ+G+Yxl6OMq8W+xvujyQaI27vmvYEFeIvVHvAWABEQHEdbdYrCrCW1A/N2C/4UMhLzDMLlVixrSm6zDWxjWaQ+HzSd9OlkD47R05TUL+N0vVfstYciej9GPY53/vo8VV/dJ4j4x5zBoAh1c2Y7G1OhKW3x9VbRLTNPgkQ==
X-Gm-Message-State: AOJu0YwJSWjV0f8y+tFUe+zHiqn8AVS2F1yNcOCI4u/XRKaUgppB2bII
	vF+uTJIpmPoblNpECngsIL/RWqGVlYqz3TufkoUPxi01Z9g3FIHP
X-Google-Smtp-Source: AGHT+IHxlk9O301eBiH5iSAuhU7SaBr9TuAH/N3Vlxr1jlIQybW8sbp8cOihJ627hwOLaKwZSo+w5A==
X-Received: by 2002:a05:6000:e4e:b0:371:8750:41a1 with SMTP id ffacd0b85a97d-371946aafcdmr1562452f8f.54.1723794678778;
        Fri, 16 Aug 2024 00:51:18 -0700 (PDT)
Received: from tablet.my.domain ([37.30.8.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a6c4sm3026201f8f.52.2024.08.16.00.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:51:18 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 16 Aug 2024 09:50:59 +0200
Subject: [PATCH RESEND v2 2/6] ASoC: dt-bindings: midas-audio: Add separate
 compatible for tab3 audio
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-midas-audio-tab3-v2-2-48ee7f2293b3@gmail.com>
References: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
In-Reply-To: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
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
 bh=Xe/TeA+AqUFagpOwh/MxUzaXugTMKRQK8JWn91rUokE=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmvwTnJNIkRw8GVodWAgJWPOfKBdCJAnZQbOuSc
 WfGPXlHnYGJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZr8E5wAKCRCzu/ihE6BR
 aLmnEACfIN2oDUT6Oi9VkEB5Kjoa/UPsY0NUr48cjf8uDVVfdGKrGvduJbLTvbE7SqqjgHCndp5
 xZcOWX9HsmwvQRkOp2nQoGfvH59v1MvtCjftmhrCUt8Xs3bI1+KvFZ05w/++tZIMHG85QTC1FLi
 qs+xxJFtGp4O1Fd1gLPVmdmkC6PhJwz6gOJdkKn1nxoDQeLfw85QVKB+zHlcnPFqF0aPjAIa+yw
 dSYhdC55kKQ9VrNiHbV4eUyZWxD8C/r1HDFX4g9R26VUzxaKB70cvneHEpEbjDQxwfPo+Rtyqj2
 gwWqeI1K2cTDrH5bez9zQyFVsSjQ8tIPDKz8nqDEdk946SxHWbt4qot5SjDcZY+70gUPzkd3h1g
 1yauOqyEAGdw8BDOeiK1kNVGijdIkzHNfikNKLPg8DRZ8Ov7734ikKy3LUZoqLjAgOIqvsoANaW
 9fad+ip6W/WQszMmRxL3so2DVH1I+Kfc5bAMr57CBnDOjgcmh8dgungzubTqr8MZBd/PzKUobp4
 luYNnpPPsdAiJmAf3op+ljhsHv43PnPwR+H2OxbN2MC/laSozX9oVQKz0tTYNL25Z89lSu/xaWM
 M+h1R7+e/om0YWWCYTi2A/CsKy4THIUyiqs/MAsW/n8LWGBDqTruS8O3zCZyHKHfOC+Psz8sWID
 hSm86kpN8v+m1QA==
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
2.46.0

