Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLdBGTd4"
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 065111720
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Dec 2023 08:10:56 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40b27b498c3so24013955e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2023 08:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447054; x=1702051854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1JAeCEVjgZk68Eq5bjRq8ACaz1sVDAww5ddLYt8WKU=;
        b=lLdBGTd48SWlsTYJk2vLBfjA8/0WkkGFJA0BlxMgV1jkUsdMtiDqJByCkPwZjGW6Wm
         Xps79vYVpUAO3N2bgrWmFdm5x76/q4s27FlvidZ7QkF7oKjhzZ7cXfMKSa5yLXGkVyo2
         UNE+XeFXnwfsfOzKdpCSBSqlzAsp6+/cIEf1ijLWVNJ2knnDrMtsOOzpkqg2yjoZpn1x
         8R2PuG6KIPgv9CIIf+Yp8/vafr9U8wa6X1ZDAAKhwxAoc5wtzZUUN/J7/iADRifYCW7C
         gU+OrhDLzx2mwMEWo3lpvyr3b+0KdqWPVB/FEiZotKBAq+fz2yCQzOP9yyj0utVvfKY3
         jDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447054; x=1702051854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1JAeCEVjgZk68Eq5bjRq8ACaz1sVDAww5ddLYt8WKU=;
        b=DEXNuUEG339BGkwgbUDBMIcsc1T0uWuLsFpyJubbDK/ZBO4dGa8VwpURJmxLQ2zzTc
         VwfFxFp36CeSJ7zqpMiXUAi1Kb7BNltTRjskgiuUmS8ahror7aPoOBnT9Ywp86Mt/0XK
         FEGQbwbOSJit5hWPFeRuoch4bzS/g6IMXBPhN87paKvcK8DKbZ/qkYjJI4yipXbm796C
         29vc/aK7JILNG6jC6Klm5vVPK+VQ4Q7ii1CVaaBZpDJZJmwPHw9gB1EowdrtJ1tFuDRC
         pJ7yVPML48eONtwV4I8d6eFNMfSCpnDJZmuVxGIpLWkcA9BsIcZBOaKtdIwqdpLIDW/q
         il9Q==
X-Gm-Message-State: AOJu0YyiJIC7vVtasYLqlstKvlMqaBs0z2VjvsnZ5GZzVBjeGyQWmX2C
	vRegbs5vM6a38aN+Y5AFmRP52g==
X-Google-Smtp-Source: AGHT+IE8dpPw2LTEdv4ELb+pk2xz+NejS+HBQ266o6P26fs1kcibxlGWDrw1GPkG3bTgo+OSe/jmSQ==
X-Received: by 2002:a05:600c:3d99:b0:40b:5e21:dd4e with SMTP id bi25-20020a05600c3d9900b0040b5e21dd4emr458905wmb.124.1701447054551;
        Fri, 01 Dec 2023 08:10:54 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:54 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 04/20] dt-bindings: watchdog: Document Google gs101 watchdog bindings
Date: Fri,  1 Dec 2023 16:09:09 +0000
Message-ID: <20231201160925.3136868-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-wdt" compatible to the dt-schema documentation.

gs101 SoC has two CPU clusters and each cluster has its own dedicated
watchdog timer (similar to exynos850 and exynosautov9 SoCs).

These WDT instances are controlled using different bits in PMU
registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 8fb6656ba0c2..57468c2c5ece 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -17,6 +17,7 @@ description: |+
 properties:
   compatible:
     enum:
+      - google,gs101-wdt                      # for Google gs101
       - samsung,s3c2410-wdt                   # for S3C2410
       - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
       - samsung,exynos5250-wdt                # for Exynos5250
@@ -42,13 +43,14 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+      Index of CPU cluster on which watchdog is running (in case of Exynos850
+      or Google gs101).
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7 and Exynos850).
+      Exynos5420, Exynos7, Exynos850 and gs101).
 
 required:
   - compatible
@@ -64,6 +66,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wdt
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
@@ -77,6 +80,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
     then:
-- 
2.43.0.rc2.451.g8631bc7472-goog

