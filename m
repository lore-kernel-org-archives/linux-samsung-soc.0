Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95069231A55
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756552628; cv=none; b=iup7iYUmKiijJNVEL9IFGEVLaZiwiycaeIziwyJHBiwvn1MNBtXBbKtX6X9+v+pPEYo40lKvj0m1ZnPk14Kf1SGdFQEY71HZV29UmPz80zQN7IHm/jppUfrDvXf+CefXfcv2wkFZOqodNjT+aBbyWZ3hT7IQCQqe54ARUKC4nSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756552628; c=relaxed/simple;
	bh=BRm9jhP8w8rU/kwHuy64JB8q87TYx9kSQxPNxxu95xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUL/93qlztKpwMYlgOIJlZ5w+BfWg7QxqyG2D4mUg6R4zvbpF9bvoxYTRe3tNlutxfzwseVJf/T9eiQZT1FmJ2p59qjJX4GkIb7GTYGx9tUBcnJ/rItoLxdCjwO5PTGJrWv2U27zLO++06bn1PGvimw5mHJRxlK8lF36NzDkHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/giByel; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/giByel"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61cb4348ac4so365754a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552625; x=1757157425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60upd+BKvn0xz+C5I56bG/z3TpNZllLyLlel/0JDTmo=;
        b=e/giByelnyKYzs33k+NsKjTfX51Hp54AMtrxaeE8xXHuu5r1q+ffhEONkG7jjpOYk2
         tJHtEpPB4ILsDukKIWW2yreKXl91mzC6DE3IIt+9Ggq6MLdh3oXc4rQ+oD2PgLe5Vf8V
         9a1AUe2L8YVE3N2GYmRls2IJPOeFVeb7MmA4AhQGY4DNBs2Vr4lbKgl206gr1Be2LMuB
         I7umnyLjbshnuEpBFRqZf2SNLUdXtxG0YpWGvZQaSGPfbB8haOn0vCaL62vuS39Mn+xL
         tODzUplMYVrulgQRWfUrHDXMGvyjOsKPT0t5ZRwjcs2dPbIkjUwlwY0nRV457q3QrsnM
         OSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552625; x=1757157425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60upd+BKvn0xz+C5I56bG/z3TpNZllLyLlel/0JDTmo=;
        b=bjtKiUamg1TYitxgcuDvi+z81dFjynRj/E49vFoYyx9O6HMWeDDcgYD/K7iBX5vJ0Q
         VWbCtTheo6wagMjdutOaNPbTvDSveEwsMuHR2KG34nRLDuxq12IJOz5ygWUEUkkyByvm
         y8Ua3Yvo/fEQcoisETEzrG+3gWwbENqicslHhaLxBhpScT+SrSfo5Zg7LzQbMxQ/0RiX
         yUB8j2ChdqKXlS6qDauCPKwObLkaXEgJSqMikPxsLB1S1YgPNADtym7wZSXn+d0uPd8f
         fQ+uQn1Ggo2dGUkrYlatwmTt7aBo0CN+fMjkH+3ZtHfZmJrGYg3/wZvR5KRNq3XYabwm
         5MZw==
X-Forwarded-Encrypted: i=1; AJvYcCV2IQ4bVLy+Ws3gFv/s1sCkhljo3CmGyIWJgdrypo2fNYSFvXL2bEoo5ono4GlLNJ8WzfoKDxV4V/7+DE7wzQNKbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwKL1ix75oEpJR8UoM/naMUcXuAlIiOMWs7pGMVkcBX1wTI7+L
	YbafgjkGylSG8gVwd41LKCDsooJBDw7W+WRFMkDhDukpSdMbfFanDSSHx5WBM9b+yug=
X-Gm-Gg: ASbGncvdZtYKQ80+oH7ARaO5nXWxxp2nLP+kUyRGEuCywG+X6lDu0YBdubg6PiDe2ej
	2X7JR4XBAbq1YjnTKhJdrcv1Z0gndOHHJtm//AyTewozlsLl4QHFfwkNA9QaIwSSDPmgbSyl8tT
	L6BbSskRvifZHuqymX4NPhMfEHENtpv4lvwApSxA63RS7WvVZyzPo5h4y2TugXJd7h8AmJi02Y0
	H77pJH9O2ozO9DqY6Zqa04bgEMpyw985z4ebyAKhy1cDBUSSlJefiXlfDFXUwIRr7vjzTWA3ZoZ
	Ze7GCfbwmMFxUwidHEKt5FdatGq6JhwlQrzKeCQGwzG93FG1R3Ng5TBLkwlNQiRm3x2xDNAKwDE
	w82TElsWirg4RlU4hDwSS6GqVhbmaacbOsA==
X-Google-Smtp-Source: AGHT+IESzw14SfBx5ze5UZKu76aylPC6/8IATI5aiR9tuQyDgPAZqo4yCWAwk6R7aQI2r6EYS73T+w==
X-Received: by 2002:a17:907:d17:b0:af9:8748:2bb0 with SMTP id a640c23a62f3a-aff045d17ebmr294201866b.10.1756552624846;
        Sat, 30 Aug 2025 04:17:04 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0236d310casm117780166b.44.2025.08.30.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:17:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: pinctrl: samsung: Drop S3C2410
Date: Sat, 30 Aug 2025 13:16:59 +0200
Message-ID: <20250830111657.126190-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
References: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=BRm9jhP8w8rU/kwHuy64JB8q87TYx9kSQxPNxxu95xA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBost2qIP+/+3cfZa+euI3pngE+iT+a+WHylVNyo
 UKZDkyDRr2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLdqgAKCRDBN2bmhouD
 15g7D/4uTfN6vaakcLmeYTWcMPINmB+4QHznc3DmRIsvt/HwJlEfzF3cf9vWU0kan2QhXIVns+q
 osqNMKWIneBJC3JaHTi9sTGnUGW9cj/SIuOKolDRvHS70gxzN+l7IQoJDVO0N01F1GgTFSolDIF
 Oq1RMQw1uwSgG0gGI5xTlLeTmcnCIe8NQ881Gh9TTzL/e26qUKQUWm+O+ITpje5wIUYCfxGP3BC
 xfLKdAEI6PFqAj97TaWtOt7uOsK2IUjvnahfTgaI3wiSrqfQH19tx+DTd2eSQP83hiQZtZqXqtE
 bBUZrdiYpIaZ/jaSNkt397mWi5QqHvw58QqUu6FpoPA7NkZ2F0Ak2rZ03ff7+jcLdIy6W2cGRTN
 O1ladZxpP8BIsUM3aPCFmLFf/Bo8LnYD+CMsCFRHuBTH0BTRMS1PJRDPeLNVdadIuY7VQOcEtrs
 FhiOv0agVPkld1UV8kwakqAwNSWWDIriYUZu0TdxjoUCXfuTRqyFg+ieR8znv6hxfW5Rw3AyO5p
 2SQjgT+PKM4cT9wSIN0y/EFqdTiupaB6keiPPwxdVxJFkDQYxv3Lxmv3aIccKPFUWSqY+IqcVWD
 WmN/pvjTj707/EFVbyzRxJyKHFWhL+sNh36dTmJTv9E58DdWMDhTFppTm5Bp/7k7XQ52MIWyj41 rCOtHz+e2oSiWQQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 19 +------------------
 .../bindings/pinctrl/samsung,pinctrl.yaml     |  4 ----
 2 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 0da6d69f5991..dd11c73a55da 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -30,8 +30,6 @@ properties:
   compatible:
     oneOf:
       - enum:
-          - samsung,s3c2410-wakeup-eint
-          - samsung,s3c2412-wakeup-eint
           - samsung,s3c64xx-wakeup-eint
           - samsung,s5pv210-wakeup-eint
           - samsung,exynos4210-wakeup-eint
@@ -59,27 +57,12 @@ properties:
     description:
       Interrupt used by multiplexed external wake-up interrupts.
     minItems: 1
-    maxItems: 6
+    maxItems: 4
 
 required:
   - compatible
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - samsung,s3c2410-wakeup-eint
-              - samsung,s3c2412-wakeup-eint
-    then:
-      properties:
-        interrupts:
-          minItems: 6
-          maxItems: 6
-      required:
-        - interrupts
-
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de8460856141..e48c4f467a28 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -36,10 +36,6 @@ properties:
   compatible:
     enum:
       - google,gs101-pinctrl
-      - samsung,s3c2412-pinctrl
-      - samsung,s3c2416-pinctrl
-      - samsung,s3c2440-pinctrl
-      - samsung,s3c2450-pinctrl
       - samsung,s3c64xx-pinctrl
       - samsung,s5pv210-pinctrl
       - samsung,exynos2200-pinctrl
-- 
2.48.1

