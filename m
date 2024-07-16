Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BE31A0AE1;
	Tue, 16 Jul 2024 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158576; cv=none; b=ZaYYdWYlXVmcP8ACktjPFOAZHH20jcw5eQpISuxnP8rqFLg87fztTn5OFnlQryiATlP31OFQmg5UMvO7+WIEJJnc0O4poH3QfMKWFUo1QkDMDDbJH053Uv1ozZQypHC2i+wmOqFGC0yczI8ijaFYxpubGQMaBqvkgK1CBhRgW0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158576; c=relaxed/simple;
	bh=kRA4IN8ePpMhvEmnz3nL0gqG3GSrRJhVEROFFuuelnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEulexWJbO0lBHmvQDIusvyjmI52gFsUHxcjau8m2ElPRSds4Ld3vG84sYIEXeLfgC03hHyxWZSgmhX63bAidrOwwsyLhexIkUnAqBFg4qd00y8cDheotPN40MzKBswqt9CUghGxOuJtytO986EJ9dUEI2TILbHQIrLiaiMICNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/iw3FJW; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/iw3FJW"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea3e499b1so6757637e87.3;
        Tue, 16 Jul 2024 12:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721158572; x=1721763372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkVqmaJ3bQDbMwukoPoGZjFlLSEsjSTGIlSAZx5ZdTc=;
        b=A/iw3FJWsugQG/sWDdillegxBl5Lf5tAIUOP3hH3pIqDzwuQ+nDQob0ssgn5g7EQXk
         dlQP96jnFA5wx4cKRn+BF5RsnScIFoAGR0RG5Q1/X62Od13eekTnFs/osx/gVsPZCxzr
         8fQGEc8MzlzUb8bH4nYfCpj5fjffl7axzqAwSGf+1ndTLd1I18TwhzZh4FWn417d96CY
         lQvRw3q7pyS5sMv/WZCQH4gniSADj25moXQbFYp766NrEvR0s2W9unDG7V5KOMA6JGsb
         3cLSSOE82/gOhyAAC4NKM8mPMIsqAy0s4QnB4l2Q8WKEHZY6YaI792uws8aR6LLEuREw
         Crsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721158572; x=1721763372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkVqmaJ3bQDbMwukoPoGZjFlLSEsjSTGIlSAZx5ZdTc=;
        b=YbWa/0uFcdlmy//Kr7yAeW3PiBJOEKXmK2WOLB7cj09tQV6v+CbwQmDMwit6HciEmV
         Sl0zgF0tNzLrEPnEDpFlLL0UVeOtw6m6Us5ANDQhaz21VxMrWTPTYil03i0DtLRqxBgA
         ywRMLYSDW3RL2fjzYtDS8kwvIXIJgRAa5zHTnUJuPhW+wMtOhFdYQfBY9bjpw1OirrN8
         x97ef0VnvcX8c0VzTVFUAcZt74AiNwfcL/psFbO2AA7Ai6F5iYL+2eKGqA1ATg0gu+um
         c81FBqEUUiNv05TTrurzyr0n8hYUz7lVRv57chHDBgM9CCaa8PAakFstRJtkaTw156yI
         zYOA==
X-Forwarded-Encrypted: i=1; AJvYcCXcn6K3uM2OIZp0n4rX6zQU6es18R92wAeZXBVHaRkrHe0hTiAQ6yZJjUJ1aZc6gGw6PHCqoSN2y0UbvEzsEsjKmnF1M9mQqYfrs2GtbQlsmBRPUew3+fXUc4glb/pwFsn8fjrx2nKldUlN6ewyBoGrpODBWEkzsUiWd+5CGAB3wr0PT4amtiyEQBqIpA==
X-Gm-Message-State: AOJu0YzbrbEi11EU7rJTl77hJ0G63BeIo0fa/1bSNdECF6IvdPltGx8e
	2d2fKtib/06TWkHf/vOqVFad3DjbMDwTnDIjNLJozN6ptU7cScutC5/s+ZCK
X-Google-Smtp-Source: AGHT+IGnX3CLorykajazWKWogJk2rX8Y//FVpxzsXuFPvUFjaHwLasjuA1fP2OqPdHVhBphICnVTfQ==
X-Received: by 2002:a05:6512:ea5:b0:52e:e3c3:643f with SMTP id 2adb3069b0e04-52ee3c3678dmr100229e87.2.1721158572198;
        Tue, 16 Jul 2024 12:36:12 -0700 (PDT)
Received: from tablet.my.domain (ip-37-248-155-75.multi.internet.cyfrowypolsat.pl. [37.248.155.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff888sm351179866b.159.2024.07.16.12.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 12:36:11 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 16 Jul 2024 21:36:05 +0200
Subject: [PATCH 1/6] ASoC: dt-bindings: midas-audio: Declare required
 properties for GPIO jack det
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-midas-audio-tab3-v1-1-a53ea075af5a@gmail.com>
References: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
In-Reply-To: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=kRA4IN8ePpMhvEmnz3nL0gqG3GSrRJhVEROFFuuelnw=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmlsumJ0V+COUPAxavH67ZS0qnpcO76wHZHK5lv
 geo2L0oxQeJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZpbLpgAKCRCzu/ihE6BR
 aPPOD/wKi/Nb2uSx6AOwG9LvT3LXHsOPLW3mZR/q7VRFoal+IN4cxdmskcvO4LmOofT+suNcxcY
 JU5dHuYzlhHx+MM9uW7WbQjRwJfKpWzCJ55eTsoS4KHGWOpZeVzi6WmSsVQpbqrWovuoA/W0hKB
 BxcWaJWDhWXEjsiX1t7/A9lZ4g7rmB0uliy+H7uFHb9QOgRV6psbTghHkZv7Te3xKQvMgN9Mqw8
 567U7/WVpPhsSLWgbJkbjfpPSp+4zEAIfiyvi/bm9Mq3U5CDh37cKorsarrnAADQ5eh260mw1a2
 eijOzom4xnWqhL2YfGbZ1zaaODZLsZzd3l6IfV2cFAN1Tu7qbHZLqW6xkb5/m/G7/btNKpeSDCw
 3j5vO07I6e+ztsAge0Zdqa0JvPJ6tovcFtNVNxqDuP+BQVZC4YNnS0AtHjSNlAz+04yBltbSL4U
 iHnVBBoZkfmbjo/wAbX4RP6VvPQvHLMYnoaJkMLs2XTYuW4p9Rnblorkv5+LVIH6zrAVUTAYszQ
 u0/Yq0XmF3gTNHoE21FR9gffxZEQPT5mlsFySCcJ2w0xlqO/o5h1v6tTxIoDRIK2nz7vThIZfnW
 iLWb8osU+7tFtGEnR6BBSSainBA9wTrefrWInn4ut773iy1ClzzhxTK2BoEPdfjYVdzlrS6Z4Ll
 efxDhawJ080G2BA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

GPIO jack detection requires an IIO channel and the detection threshold
to work. Explicitly declare the requirement in DT schema.

Fixes: 0a590ecc672a ("ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection")
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../bindings/sound/samsung,midas-audio.yaml        | 29 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 69ddfd4afdcd..e7af3c09de38 100644
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
+      oneOf:
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

