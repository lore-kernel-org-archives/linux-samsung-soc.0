Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozW74SMY"
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FF4DF
	for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 05:48:39 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3360ae2392eso2037210f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 05:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216118; x=1702820918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3064XmdITzZhPjLLGnjAD2LPSNczuONCpTaBgiThtlU=;
        b=ozW74SMYErSiAOdKNaS4fRVIHiDxvu0elJCcVpN/PSKbrJ0/mGB1DbvBEDqDfaWehb
         W5rOUn/efJVgl4JRyGfBLpo1ASXbzCWBCn1sdcNUwam9Iej8Isuk4MRsQFcs/tZD6WPh
         3JRolH1A2Gc4J5mibJalaSoDSuBFFeyz8ZjthpAC+ZgMRE7UdHcOeSrEJwS3tpqbye6V
         riDklu+X/wKjt/5plIy1hd/azrCrXFFNsYXrx4lr1/ISgoOUyi4gSQ7v5ztLPtOlHY4O
         BrpLhEwK6k5HGOveBGxjYLXwL+z/lAUCkXeijO2LutulD3QlH3BqJjf9ZLkP3M69xXd0
         gtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216118; x=1702820918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3064XmdITzZhPjLLGnjAD2LPSNczuONCpTaBgiThtlU=;
        b=v5MauEFZKm1NRukGfqVwy4oRtaF800+sU/erLLoBkN+lbapUxLjbrfHXmntkjgfij4
         MEAsP4qdAEENzcZOleR3HCPlgidsMPt+zj5tAP3P5oCWYK1zvGBDkyZcgJ8dycy6zv5t
         RyhaTseOifTnwK3EW3RvWuY6LoHCRH4OKeZUC7mfv8bQ1tBJURq7mjlKcxewsvVv4CP3
         U1ml1KinbPzI3d/p+Z6DPmnp34IqPt8kEHsOxqTX29pnDj5dANkm/PGO7vmaPUlJXgxs
         dmJ6Jicd4DI0aLwEP1BgDZMBzo/F33QYutanMVHiIDcerKUCjRbTztyqXtD6htFXanlh
         RUKA==
X-Gm-Message-State: AOJu0YxVxtretCJ8bACeGOCwv7wDUVtpiGQ7t5qmK1o4s6mdZnJMV9x3
	4SD4vIxVKP1iW07raeyp8EaE/g==
X-Google-Smtp-Source: AGHT+IEYQWyFLps+8a1ktVUX5+xvwEHwYnJq6SULwm1krEw6dm0X1VeyTvwbJRq3QCqZsYXhNWCVrg==
X-Received: by 2002:a05:600c:3107:b0:40c:2dd8:3a38 with SMTP id g7-20020a05600c310700b0040c2dd83a38mr1452502wmo.80.1702216117646;
        Sun, 10 Dec 2023 05:48:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id be9-20020a05600c1e8900b0040596352951sm12062097wmb.5.2023.12.10.05.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 05:48:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: samsung: exynos-sysreg: combine exynosautov920 with other enum
Date: Sun, 10 Dec 2023 14:48:34 +0100
Message-Id: <20231210134834.43943-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to create a new enum every time we bring-up new SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 2de4301a467d..b00f25482fec 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -17,6 +17,8 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynosautov920-peric0-sysreg
+              - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
               - tesla,fsd-fsys0-sysreg
               - tesla,fsd-fsys1-sysreg
@@ -50,11 +52,6 @@ properties:
               - samsung,exynosautov9-peric1-sysreg
           - const: samsung,exynosautov9-sysreg
           - const: syscon
-      - items:
-          - enum:
-              - samsung,exynosautov920-peric0-sysreg
-              - samsung,exynosautov920-peric1-sysreg
-          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.34.1

