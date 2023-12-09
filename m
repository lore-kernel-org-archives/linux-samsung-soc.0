Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yTdh+x3r"
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4784C10E6
	for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Dec 2023 15:31:30 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c0a0d068bso35368985e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Dec 2023 15:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164689; x=1702769489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8u+KNC2QWJAni+OUMFkynao6EoRKHV0N4H89jPXatR0=;
        b=yTdh+x3rVhWjndIVa6bkI1NPrGiFRpFZZLJEWO0yJ7isixhJZmQUKAcUBmvC1PAMI7
         XTW2d6RGynX41m5GfV+gCyL6BzRZ6kIlUeauhqWKW9EF7+oDm44VTExbTNUsMrFNZtQv
         Um90M+059Dl/ehrgQ560pD8OPfUcG0voeZDrV6AvARjTAKIMpqRfo4Qkn5yXz2ygM6au
         e6nEGG9XaZHtSj2wFbBrRZGanPqCVF/VJ0mz5JcJ++X39FrVXX0Wz+oS/cwWbo0HzD4K
         I5B4uleaFUmrytsP7G6IWecQ0sYp1PyaBDQZY9pjVpNWg/b3A+Udv3ZcqMUlsKrNBfnW
         8LAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164689; x=1702769489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8u+KNC2QWJAni+OUMFkynao6EoRKHV0N4H89jPXatR0=;
        b=U38rcAshDSEPEhYDnIbP0qn2AHKs2we06RaP1H6N2pPxMEclGWyg6Epl6f0M+t4/9l
         8ln4oG178AcUIcqK/lBA7rYa6YQJJdvKAv03QZcI5TGdtaX2b/126QQ51ZenWxjhP/3U
         7XIGskKNTy2M3zhjTNp4fbdoLRe3zlJUw9MQ5qeZEz9eFHGhCRupQVIBBVHFHknVIXgQ
         /mwZiVu2URV77/G+UWmSjF8w8yC5fA8JTq+G6Sd1ExJ5o4PPGPaAAWsh1XEuAlwk215q
         FFCOalK0iE1+Jsi/cqPmeTxSLNuzfuJrq3TL4gR2jxUXRQwfiO80f3Ry778DObS1yVwP
         uPcQ==
X-Gm-Message-State: AOJu0Yy316nKAAOUq0p6eYNvkhSqT1dLIJEHJQK6o2lFVWCbTWV5eAvz
	OtXoWi4xQbrqMeJVSl8qE0at+Q==
X-Google-Smtp-Source: AGHT+IFmkK/l3otAQWLZWdNOPyi0qyQR3FBPQnZvyIYfPqpwLPwcPYijtpqVYqcbP5kWNiX+fFjhdQ==
X-Received: by 2002:a05:600c:3784:b0:40b:5e1b:54a8 with SMTP id o4-20020a05600c378400b0040b5e1b54a8mr1211640wmr.52.1702164688813;
        Sat, 09 Dec 2023 15:31:28 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:28 -0800 (PST)
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
Subject: [PATCH v6 10/20] dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
Date: Sat,  9 Dec 2023 23:30:56 +0000
Message-ID: <20231209233106.147416-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Add google,gs101-usi dedicated compatible for representing USI of Google
GS101 SoC.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 61be1f2ddbe7..8b478d6cdc30 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - google,gs101-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
-- 
2.43.0.472.g3155946c3a-goog

