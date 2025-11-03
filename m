Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F3296BC3
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 19:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197287; cv=none; b=fcU95jApfqfqzG0r1C8CtMjoFmP+nQYy2fmZ7RG63BiXswhEqFgEiGdZmry0YRUBp/Jwc+kWmpIGWXns1Z4UQ2UkTzrlGGiy85B++ETPMOqrk0/dqgOr6oVWl+GWbu1O9fFFt6sbDhWQZrtO5qqbhPuHYVZSB3ollj+jhzoE0Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197287; c=relaxed/simple;
	bh=ejj9kJsYojTy8kY0emUovee3HgANnA/sFYcyWzPbjL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OZpElRBigPIyBooeHRc+Y7jQVx4H6cUKTgRbvwuAz81veGa/rYMMgYbGNXLaSED07s1H392kLaDehvEfJRZQ359Feac11hb2TdX/6MB4qAmdFWYQU69YnnaIn9E51jrkaxmqsKAMqa/WwpPlyaDU/6MBVO1AcNO1e6aQGcM09BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uHcHng2Q; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uHcHng2Q"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7200568b13so55943466b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 11:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197284; x=1762802084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAD+8NeyQVmzpy451OsrQR3u3cBqGgc3vr3oTrRtuug=;
        b=uHcHng2QWSK+Z2p/UtkA7xpbHwoq5fAIaerhq4SwEb0/jepxhldfL5dVvQnp/18ou8
         H9hwbwD4uTBx1MynJHrlbOn1MI6u5554IKbVymh1QWQ//nhxy7HOISVRUVHZa6kNvrqD
         Gx4lSHh4EV1w5NrsjszbQyNZ0j0E/8FVDDAQGx6waNkHybbBHiRJFEVjsmaF5ZxUh51o
         UoJfr5PuF+xN6VzZWnwLU9oJwJdW6SRllhILl5tqpZrI+MIQG4L9pJent7xzl5XPRJRB
         KB+XmtJWutrNeS5GZmj7ExanfF4J2kQjv8JgHbOQobhGJQ259NrQ5cYuvKAPA9/ey6lv
         UH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197284; x=1762802084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAD+8NeyQVmzpy451OsrQR3u3cBqGgc3vr3oTrRtuug=;
        b=jgsP8nTDvlrcjfbjowm8d3JSgvRqaRVzKMKABklEfDGjwXGe89NMfSyqtvhzcgJL9v
         mb9/YCtnDO7S/+r3a1Ue1eMGZYENwoOlcSADv5Qlm1ZLlRkfWzJjhLgmT22JWJRME6ms
         X5Xn7Y4MPA3d09q/JLYSI6koamdZGZjcsk+XYab21tGVdK2EDFLnGqNrE9ya2SwjnNiN
         we01deE4p4Zam7F8JIpLPMwypRAa61xAtz+QDYruV40vDFcEtMbc7E4h42JyMnUeIuCh
         gyee3ej9pDcHoZl2sf1gC3Mkf7FkG73LFDwucThxFAvp941GqWEUVIoG62PLyOaQRc3a
         PFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX27ZK5J0qmHdad/0f+XyKux9Y9PbLKs+2Mkkridgtpgu3AL5fbbowPRQ4BvxYNC6nAxZBdWLFksILm0p4/lYN9pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5SyLnKVqbSNwrqyzSGtBQnBVmCq2q1Rk+wTayewMi8JRKDy4W
	CIx81Ka1a/KfmDxZUe/mm1ZGUIGPIKYvnrdvvPMayUm6xrrLf4nZ33hwweNMYK1IUhQ=
X-Gm-Gg: ASbGncte9oX08JzYOEW95yDRBQwNMJ8bBwIHxf4ZUMjHU3aSgH4um53Wrw+6uOV8RMx
	2BJUpsnk3xDrK/K9i9VpdQRm9wrkt7SvGxZkJPcuogqMWBiLnZ+Ig0xq219ooPZspOdiqjMVOwR
	FA32sF7Mq5B0sxIyzOjQbR8/hMJLyriE2Zn1RgnZlWarH71bV/UiC8GLX2aMV3y3nZlA1ZucHMe
	kDcgkE/LDMmQPDjH/jmHe2WKqEUyzwMpcdMbE1gcgxi3jm2gBwpAWFZz1JT6yrUlC5fg1sycZPA
	6FaYJcjK6Qki4jRP12Nca/lWsiq7oC4j4xTQQRfJXpyYBIQtswgw6M+OLOo7iFfeW/xqidbtNIb
	oFwtGDG+QK3yEoWlh8Xi6njZggIk0hNMkdFi0c5RIgU/J4l79vJA2wAhlCvprBLpqJ6rX6nF9vG
	Z3YUE67QsW2aNkz4jRnch6IY5qi+9MryPXHTL7C+sRtACtbKa7pgdE9mdoYjp1ygLN0lWsYms=
X-Google-Smtp-Source: AGHT+IH1Jz8fqW76WNvYz44wUTW1tTql//vRV5mtFjB41+gy5qQDi25+8ZqrUFo6A5byoIUzomDssQ==
X-Received: by 2002:a17:907:5ce:b0:b6d:5c4e:b0b8 with SMTP id a640c23a62f3a-b70700ad41dmr1309354266b.8.1762197283933;
        Mon, 03 Nov 2025 11:14:43 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:40 +0000
Subject: [PATCH v3 01/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-1-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Using lowercase for the buck and ldo nodenames is preferred, as
evidenced e.g. in [1].

Convert the example here to lowercase before we add any bindings
describing the s2mpg1x regulators that will enforce the spelling.

Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5bcbf@krzk-bin/ [1]
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index d3bca6088d128485618bb2b538ed8596b4ba14f0..4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -75,7 +75,7 @@ examples:
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
             regulators {
-                LDO1 {
+                ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
@@ -84,7 +84,7 @@ examples:
 
                 // ...
 
-                BUCK1 {
+                buck8m {
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;

-- 
2.51.2.997.g839fc31de9-goog

