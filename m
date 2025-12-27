Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B138232E728
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838270; cv=none; b=cf7quz6RgH1lQuRl4reTqTH8PFpNkSEGyjCay6K3QjAAkAkNw6R/lG4XwsibxSOEppEV9JmPiDLm4m2JgNy4FVYx3+93NRtCozneFNMOPKd50G2BmvC8123dut6D4fvExesVPKKf0uRVKPxdqC3WOFgTvnA/gWbCjYQbYnSDjL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838270; c=relaxed/simple;
	bh=/tB8dmlRTUO4vkh5GgVdehbK8ogjmNaFBOWomDp+6hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5Cj9atj9QPpx9/u6K82QiwEHh6bR4EjukwnxrVJ6worPX6Pn/9SeAwmQClRfU/AB20iWBPYVPW1qvhz1Q5VuB8ksX6+5QmW9yt0PCts1Nv/aIWutmpKfMKcPFz4+nq9AEsmDzc4srZJUDeAKszYXdNiBpLaA6eFJPEG2+K8Krk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kT7COl8P; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kT7COl8P"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso12645286a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838267; x=1767443067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcAewfHh0ra+es5CHo0kMIivfjkLmLaLZDMh7cCTg/g=;
        b=kT7COl8PmHd00JLE9uJz44LGaWNGl76KzUAlWv+Z3ctrMo9Om9n4ZJr0ZYUZr7XUqu
         pt8bLFBZNLLxHmThCesk7e5gAQE5Jhu0Ss5DtepF796tRurfHy+yG2RML8J5SnRt3Q3r
         D8+pXbCzqfR0B4DAjCsg9rqxcZlZhnlP30Xrj6goDZe64yDiCKlByrLGRm0enzyLadQq
         zGxTQgasMQBWCE3tPpCW9EqtwfR53MBdhOaEwX5weIY0TJ2GkiLgrx7+vH8SQZIGmqeA
         09p9ZFAC9fhiDMy7dR0rMyEbS/byFYI4kQrCzcUieAoumO20sWeWa1LUzDbm4199ce75
         uGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838267; x=1767443067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QcAewfHh0ra+es5CHo0kMIivfjkLmLaLZDMh7cCTg/g=;
        b=a6BUiGAL0gbnENqc4ey2lR2bn38nGCvEVnPFfNw6PsEO0RUqCrVXKH99QCpYZljOTd
         5N1n2RsCHBOVwyWTnI6Wr5VbeZcgyebwipe+/0NJdBSwbAOme5anqF6qYuxrmEDGzh2X
         cruvz9V29EhY6BzSBw6umfxK7YwiJOZbd8j1Z59uP/uN2nH7zAVqHb03pPEwYUqbVrBF
         FJoYG2YKQc2SuNZ7cK1tEUPHwvV4EfFIpEFnIX0eKMQ7B6ncJmMY1pvO7OtoHbzF2gYl
         Z6ZXQ/7nPW0XuLyoUgNHLbJVkR86ikZY6QAZQhnR9zmXj1mCuru9r+KFKiramySd9sXk
         znAA==
X-Forwarded-Encrypted: i=1; AJvYcCXAYnZD4MnNThKIM7Ok+E2IRs+8JmnBWyCuTT/PX8sroNnCEKwVSjcT+EQ/mi8bTDifgftpBgMHb/IBS/rrjpVzsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymRfgP1dygTD41jGXVPCqojkdgdKAHPLVRYR74Tc3RdTKNSLO3
	m2OojZ0aWgcDO5bV30aW/f3yKnmQdeoJDK8AFl7pnDQw5o0k03JfZHDulGeNxLrzHb7YfltlDet
	tsxLZUww=
X-Gm-Gg: AY/fxX5a34Fc6vozWI3aVnT72T2QA0W2udCnTdANUAT1Jph10SF1xtkP0x2SAZokf68
	N7BpARKGx6j6IplMw22IDQSA7R84Vb54F4iDQPKH6JRoG0+AFjX1CQMQNU7oXQAEu/q+e2mnrQF
	cVGjyeKPGCyiu3OZrTIwkGq2IUnaeX2Vrr20E/7uyFeByosOpIjKf+nPzjjpkkwIJ5ckXhSzkcE
	nNBedcYOoE0OCuKFQ7EsBp5vblDfFjGn8dHD0HX4QkCB1D3aI+qY8oDu8kFzzXyq53vNac7pXu5
	nZGq1eRx8aVMjzyltFNbgvVgbCJSRGq30kvuzUdj6dc57e20eOCo33lTqQVOhGXfgqOU8QyKg/b
	uI+DKxQFd6Kd2JfZnh68yt/EjlWWPuJKdQ0GBn7xBUO5LbmFanxzrm470xHnf21k8iRh5lkSp3m
	68EdcQj3bSPV6Dpp1auFqJ5/WnI52Mir8kuTUuSIw4wVn1jfzWrcFO41rKFDNzSCYNJu28z04lG
	CDi1xNIYKzs8gak
X-Google-Smtp-Source: AGHT+IHfxIKkawssFAmJbt6V7WKCqao0Obp/Ho9JCvRAUKVxzP0PR8MNZQXegHjF1wJtOlHsDcU6Gw==
X-Received: by 2002:a05:6402:5107:b0:64b:474a:d295 with SMTP id 4fb4d7f45d1cf-64b8eb619bamr23379736a12.18.1766838266916;
        Sat, 27 Dec 2025 04:24:26 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:23 +0000
Subject: [PATCH v5 01/21] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-1-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
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
2.52.0.351.gbe84eed79e-goog

