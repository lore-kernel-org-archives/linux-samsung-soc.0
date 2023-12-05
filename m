Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0HxNWHl"
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1104C18C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Dec 2023 01:22:42 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c0fc1cf3dso8939195e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Dec 2023 01:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701768160; x=1702372960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqatM4kM7wKwmicGW+gEqjAkzatGSFvjDGMOBx55ZZQ=;
        b=g0HxNWHllGCPgVSvlHjmBBOVKuOhGsi3mnEC2ux9hWSPzA1cGSifernzpJz46lrinF
         YCAEPXnhEDFpJnfuLlXD/ErOCVViixO2Hya/f2NbReLz+L5nDoo0jywHTMdhSjFi9EV5
         /ZLGrlW7c8i1YoG3mwQGayfp+0hiOrzzNNrEkoWWj3nerZBbZHWBdpw3oCCHdqbEh2ew
         XBL5B4ayRSzS1tP3Iz/D9dD/S2fZMOHLA9jTG71Z5y8gFtkzt1b4ytR7/d4DsST7vZ06
         uQF/vERrbsP3BroOUr+1h9vjg7QT+iCdauZunoecXciLbQk2uuw1Xa6Lj4fNyd+QiqYy
         GxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701768160; x=1702372960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqatM4kM7wKwmicGW+gEqjAkzatGSFvjDGMOBx55ZZQ=;
        b=Tg5XigVDt+QJHad/UyfkC2GfCb1z59uKqFljylVZm1qtfkLhbDypEM9lrdFXar84LO
         Xg2aUCvdpdrJa0K71KY2nVMTuPIYPVOorsMeKgeRxyZasfJRYugDik2R0nkEsNNyVOtL
         wlDKIMBY5cdvedmdDHmaUPrNG26+sw8m3GN4qBh7nCGydpJCUD6C4fhWYxNOIAXsA7L9
         0Gljyh2T/jV8PbyMwatY60SoK1uKTX1d2IKeAH+qffARWWEySmHtn4hYjJ1vhF8tmgpK
         +p9HIl3OfoZWf+uv55fe6nWvA8G3/pYQAuPOv2J03ik9A/7QlywEpcJequ2q3BUMy5Tq
         Pg/g==
X-Gm-Message-State: AOJu0YwB7hzitEncRseKh/DIk3vToQ/sMKrj7rPC1cWMBIWnx9olIRQk
	nIuJw0AdMxHZ1Oyt7LST7V6j+Q==
X-Google-Smtp-Source: AGHT+IHqyN8tJW4uNXwX8E44R4xlrs75N7Gnw2ZbdArJtH83tIrCDBScW+hJB9uRKBPtLaYT5LHlCw==
X-Received: by 2002:a05:600c:4508:b0:40b:47f0:66b5 with SMTP id t8-20020a05600c450800b0040b47f066b5mr294797wmo.26.1701768160649;
        Tue, 05 Dec 2023 01:22:40 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c4eca00b0040596352951sm21692287wmq.5.2023.12.05.01.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 01:22:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-fsd@tesla.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/6] dt-bindings: pwm: samsung: add specific compatible for Tesla FSD
Date: Tue,  5 Dec 2023 10:22:25 +0100
Message-Id: <20231205092229.19135-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
References: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tesla FSD is a derivative of Samsung Exynos SoC, thus just like the
others it reuses several devices from older designs.  Historically we
kept the old (block's) compatible only.  This works fine and there is no
bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add Tesla FSD compatible specific to be used with an existing fallback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
index 16de6434693b..17a2b927af33 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
@@ -33,6 +33,7 @@ properties:
               - samsung,exynos7-pwm
               - samsung,exynosautov9-pwm
               - samsung,exynosautov920-pwm
+              - tesla,fsd-pwm
           - const: samsung,exynos4210-pwm
 
   reg:
-- 
2.34.1

