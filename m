Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E2118B47D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050748; cv=none; b=aSFyow7s2ACRqZil6Wj6B4pcio9GhSYAqGQoHAcdoDM3T7hipQ9orIEgncwYKuLsPhWvO4t+qsysyWiCPmLOJxrJ60Jm8sMs187a8r3hbs8zdIvam1eK9zN3gqM4CkRRo+SQqZcyHKMIDJECWAg0fAiCIfUmIdQvZnTlRELkZhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050748; c=relaxed/simple;
	bh=/zu0WY1mTLJkmQKe0QzKVdlleBAaRvg5u4/DVEDJoYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qri1V1PaNRJeHSmjs+a4X4gyMDZ8KNcIS0fBXJ/Kt+7O4yucm/ftNMEOCg+KVFOPtMDC9A2tiuw2RHCTtKymUy8v321ebatDWabw9CCo8KQCdC5iqOt9NU4vW0cnK2xKenvrfzCXSPku3GEV9HfbLL7oqlRYICgqSLkyRREioeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qI8omZnY; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qI8omZnY"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so13854117a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jun 2025 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050745; x=1749655545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tj36HcfLXbrHMi0m60w9d5+4mHUGkz0YH63xXCl7mlk=;
        b=qI8omZnYK63Gb3gfqVrMQYrcAeOkEb7jdjavka/WAWHIxL/QL5ypm1bm5xzQsrx2DV
         ljun/e+RnC0KerzAN1vGJ07NRXgwlz+wbzV+WsH3g8pzg3UrZfamdIySsqhV9aWnzXrB
         V3vbLMhg9JfSP/rSmTuu6iYGxwXw6KW5pT9DaJ1TBTqs583OYDJ+blmh80W9BZvWb6dE
         mEDCsvZuY0zj7+rwBxMs05Le9ZmeX9pY4At4EzMURjgqoo18iXr7m5Ztkgd5WE1pV9W6
         mR0QY7S4KwByWpvk92AiVpT4jS9MUKHA/2jHtwD1S4UTYUagd/Txp563a9yt3lzQDSGf
         5VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050745; x=1749655545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tj36HcfLXbrHMi0m60w9d5+4mHUGkz0YH63xXCl7mlk=;
        b=ty9eNuwAi0uBXx2mZcGuBO2htl8ZrrXMw/cU9O2vP/0PHOdfSXkB4LFDDUdsvH0hWE
         Eu6rSkHk0/TtZLjWTDuWxyqAZWPxIAcgtAvNjO2EZI+el8h1MmZ8J9gKT0NICMUXVOl3
         rkKq504oMzUYGgu7RdjMcQRLuH0Nfc4SxSNJCXGYJQgHXcLuxMS3MNfMZRxe+D3FtuOp
         Dn3iJmNao5PBw2Go3Gnnpeyyd0HSOZazKUYrWI1cMp0cfq/Si3QX0jc70OxNYn3p4LIJ
         IfE6rPod3deaTIl6aHNb/8SDEi+E+eJj+QwuZK//4MmkRsogZWgg8lK5SVhaMnorUPMc
         TqCw==
X-Forwarded-Encrypted: i=1; AJvYcCXPcnE6P8M9HLRU7Q7AUsaBWc50JkljV9XqxRy6iDm2dRj1E94OiNGsHRJezcaAWElxWt6WD4Y5/VSKUq36Xng+RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+zFR72hw7CPYwKRq3EHxeQdJZ3UyH+x/3jl1u12RZuFrdAWj
	+0gxwL3u+ozzEJZaxA2I5N0abgQyROk7X1awH6T7yJ/yIsgfDDfjKLEk6DBAntIpu/A=
X-Gm-Gg: ASbGncv4uJ1r0jGzqXgnQlAi6vFoMwh9/vgYAqzc9ioRUNxGW0ZyI7+RzcipSoExvC2
	jmSOwF3m5WcSVXLrkL8YGF9F7p+EY/FLOgwYl8jd6vbdxY7jDYXyLspnKeaaRaeRHEUxJWM8jOl
	P3briHhtahG8KSTKIPrqqAeY6pXwBqxCYSv4MU8WKHgvu79SiqzNDcFsAkYgX7m8s9e037TqKNx
	5OU2L0FQIWWWUhMTCKNkvYsRB6WhlolwA+jYxw4kPYzzeSORitL6+MKlrML8JLBM9Rd/fDvdngR
	QhZJ8asGloS5y+VCTGIOHjiQBV2fBSa+2WtP95jSrmTAs62vRWIgWvvwJH9S/HQSdk8fq7txrzT
	+GJCPecl5G7bnQGw2RRw0qj7JgG1/t7wwt7Hwe3P1yNp+xg==
X-Google-Smtp-Source: AGHT+IHDbl+PPXNilHwRHoApPiua2emH1u8FPEEM6gtKEx+PJ/5CtghVWo7/Vf4dwmLj4wdHx4mOIQ==
X-Received: by 2002:a05:6402:510a:b0:602:120c:f8d8 with SMTP id 4fb4d7f45d1cf-606ea179fb9mr3445618a12.18.1749050744799;
        Wed, 04 Jun 2025 08:25:44 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:40 +0100
Subject: [PATCH 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-1-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
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
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..62a3a7dac5bd250a7f216c72f3315cd9632d93e1 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -64,7 +64,7 @@ examples:
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
             regulators {
-                LDO1 {
+                ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
@@ -73,7 +73,7 @@ examples:
 
                 // ...
 
-                BUCK1 {
+                buck8m {
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;

-- 
2.49.0.1204.g71687c7c1d-goog

