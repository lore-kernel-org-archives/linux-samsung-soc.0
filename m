Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLR/WdWa"
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636F410C9
	for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Dec 2023 15:31:27 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40b5155e154so40171235e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Dec 2023 15:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164686; x=1702769486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tt3DlYOqBPGr+XD4+wWN4xoyocT73U+x7ydkizkAcB4=;
        b=vLR/WdWagP+sxVB3oZiIITDlKttKfVffSTZaG/3L8S7ZG8LF1XtSjGRWxvT9ntEAje
         NPqLrSCSZA1Hs4XmH/EwFOKQXzB3cYzY4SsCnyZ3qCm3Gxfl7dUyD8fjfl76lHH0FWRs
         iAUwv/RNxRC26rmD8KNrzpIGtAT+NE3p1jgV7JFLk6Kae6MkFOiP0xSgiU39xk9HNHYt
         gVei6iH+aDm09JEqqsjrVOvI8IL5TYTdgjv98bZsBd2Rs1ZeccE8485cugGkhEUR20yB
         ZPa+dhkv0rQktAWkBa4aSkWBEuu4E1Lq7q/XCCf5q8Z22ewSbTdr3O1lJPigHZH7akME
         H2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164686; x=1702769486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tt3DlYOqBPGr+XD4+wWN4xoyocT73U+x7ydkizkAcB4=;
        b=hRUMQa91rA+bYCIyiMLx7daCLuIKAP8HpdXeJeC52sSwqyAIcbB2Ht7uzdWtXhtPpr
         enc3EzQEMw6Q3XqGKC6AaClBkd5ah6Qeba6Cqf3HXE8bT0FD4ohemzDXfjox/oEgaD8Q
         m54A88najoiv7aoPSJ/F0y/JgTUBvmHj44w4aeZJWSP5MtB3snyFYXbUt2//lZ9ZpR0x
         KgJdiY0KNzc8wtZvCTmWCF/8itaWsHdcDMw9uOoeLJup1lCXKWkcbMlZiCCLSBeUo+tU
         MtkTWOuYJy2kzANcDeFQxjbY+9c7M4eFxAhkkbz9u6Lvt0bg1t5MgZ0vwR662hPKg+IO
         vgFQ==
X-Gm-Message-State: AOJu0YwViDTSfZlQKidOZ7dkOSrKCquamiAxOeJih9LVK+Zu2x4cKaQ4
	Ftdwp2q4IF8haDdofVID9t6+GA==
X-Google-Smtp-Source: AGHT+IGkgpwIOfGM4IWpdQ1In82Ab7ZPQ56XNX8tTri5eYcb+c64uzqd1e7frG0PG/Xau38IP7+5sA==
X-Received: by 2002:a7b:ce10:0:b0:40c:2c5a:da with SMTP id m16-20020a7bce10000000b0040c2c5a00damr962602wmc.191.1702164685792;
        Sat, 09 Dec 2023 15:31:25 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:25 -0800 (PST)
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
Subject: [PATCH v6 08/20] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Sat,  9 Dec 2023 23:30:54 +0000
Message-ID: <20231209233106.147416-9-peter.griffin@linaro.org>
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

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index e32c1b462836..ccc3626779d9 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
-- 
2.43.0.472.g3155946c3a-goog

