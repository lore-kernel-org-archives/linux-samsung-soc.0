Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EF21F419B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914727; cv=none; b=JaIPD89VZDvzYanoNo4848tN4LcPgwUgzsI+RyELNCbvFYdei2M1yoMZHh6UVQiG2yoH54cIUbWadPToW+dnDSo5IYXOk2/nR0JxQvNn3KLXOl6587FYpUA5kvYXLCZyWUCsTqxWQ8BsAIjSO3UykVmfPuH8T+c6WTMuKku320k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914727; c=relaxed/simple;
	bh=BRKY3GPe1+dBZ+eX+MLZ66l0mvit2jHge4hZNEeZzx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1wP/exqV4NYwE4cBmtcWXXgHCiTw8cSPk65hXZWZor2zId6mCyjyyO+gknmcaN1Ieww/nnqL5eqnrLyYQLnO5WxnmA5zKTghHLe1yrF5kzI//V7V9bTHqegxetk4jOFfgEfqRLdG5GL2n74oJOmTY34aCLwJ5V5xLb2hFeeQ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r21dU9u5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r21dU9u5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso18075175e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914722; x=1762519522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEEzVDPaPo+3opvcFtHcUqZXHRFcLJbK7RKFKgESsWk=;
        b=r21dU9u5HEoMAYmQNFOUW09/rZPM+Lo098a7nuG0KikNfEMxOpMnWox0ze8t/PTvQo
         7HxhuWMr4vZgfKUPQyY5YHazN6599J9FOzstFgRniveYbdZs4yUBddCU2c2gqoWK6d+5
         iTi5tmbdStm+lYGk2sSfhT6x5fefKAInGjHiNgpJHaCExPrjxNbx+KBgsNLivYNt6N4D
         kLuOOy4Jm7bpBefJtbmGn5u5yBz+ye1YSyb+hK39PUsDIsIpTBuZNV+pQbAWxF8LmoH7
         VjfLpvQpHMTlib1aTTddMY/F31s0w3iwlGWCnBV5Gvyq8KApYR/rinCoSk/DuZVh3UEM
         QVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914722; x=1762519522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEEzVDPaPo+3opvcFtHcUqZXHRFcLJbK7RKFKgESsWk=;
        b=XYe5/iznK1M6oXr8QlJdZX4Q8wAWH9RsOl79W6p/ydJik9ZBnv7JzrzveOTzSVSkIA
         fHFQwp2eir29CQhIl3GKKofVk5mwpsgXB7EusXwbUztBLYpXagw3WFPs4BqQFVcMG1Qu
         6Pzm0bA8pIFNuB63dwBvotCsD5AJAh5Kd+YU8Y8efAuYl21eP8icfzWYjRc+sxPuMMX6
         c5EwZ7NlW3q02KyUADJx+KMSCQ8ecO38Awcg7sGqXh5RwI5L4A4hs9a9FZ6qfPvI2oek
         TjgW0a7pdbCnmuG/DOOLxHQUcv7GGip34l+AT7YbAlNa28MabQjVL3ZlhbSXRmzT0Xo+
         QktQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaXmswYtVEROzgjEZgOQ6TWK96WofFsUNDnWVUc4uI1QVJC7kw+WQGWOL8Mv4BuD4dOwUw4iCYePbpwIbWIQX8kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyydebizhr+soltIsNYNYcrXtdrFy9ay9E9X3hRHasPiSCgrO4V
	7rcOPjaZYjifpRV9xK+2yapJdMuS72K3VmXf1ExbaAmbZybyhwo7L1oQA/94GbI3+mA=
X-Gm-Gg: ASbGncvk/zKJf/md4vmum15rZZr31KYV6VmnNNQf9Qfe4jvzTqHB0C32HCSmGP+6+6h
	7kF01RnujPLqNJ3T9r2v6itd4Oy2deaKAaDJ0rSJzc15bMhcJ1ckhr4yJxhGav1bcIwQP8S7p4v
	IKvlLK67+3dxXunaQvYyPOcOln11j6Of6DI9owtsqU2iFHgBh7hmvRtrYtf1P5DxX0QNc6pRZvK
	1CEfTYDUCASNUOy+xenIYfmZNCaBejb22TdsjfFz+ZA1cndH56wQbv2YrI//7R+mQVbYZHN9J+/
	rgvPT2j26NfMU/JWOd6N03XoG3oszoirRGMtklFHDJCZctKlbbrX70WOOeSexLxugH5oCvC1XjW
	KIf2wbIFz+hBJPFDCd8dO66zz0xJOWDr44lnuZYwczSei+o71LWcUxJp1vTbwUL+6SV3uTU4bML
	UCbY2HOI1JRWgqnOt/hYqgawStaBSuUd6Q2jQxZFyu7QwJMdYGCU22
X-Google-Smtp-Source: AGHT+IGudjMOXqaJcnSNpcKIftQR6nLMDH8mkpNCYaYHTE5PBNCG7YLAiVUUFPpv+vByeUUIkYFsMA==
X-Received: by 2002:a05:600d:4393:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-477331db3ccmr15144245e9.3.1761914722313;
        Fri, 31 Oct 2025 05:45:22 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ff7fdbsm31077535e9.16.2025.10.31.05.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:45:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:45:13 +0000
Subject: [PATCH 5/5] MAINTAINERS: add entry for the Samsung Exynos OTP
 controller driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-otp-v1-5-2a54f6c4e7b6@linaro.org>
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
In-Reply-To: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761914716; l=979;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=BRKY3GPe1+dBZ+eX+MLZ66l0mvit2jHge4hZNEeZzx0=;
 b=kaB+fFcB2Da40OLIuL4pYpifdRadcaa8Qg7wjSD6cQePf9r8H8vzcuSNE/jhnhWzXLFwTTsAf
 ljjUdOxSwlEA3FtVZA0GGk3QXkQ/RXgqhsL3tx8kww9VrOB6mnl68KR
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add an entry for the Samsung Exynos OTP controller driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ab00eca640e02d40dd80949986d6cd6216ee6194..813a098475ab7d5371c811020ea022f63d1acb35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22775,6 +22775,14 @@ F:	Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
 F:	drivers/mailbox/exynos-mailbox.c
 F:	include/linux/mailbox/exynos-message.h
 
+SAMSUNG EXYNOS OTP DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
+F:	drivers/nvmem/exynos-otp.c
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.51.1.930.gacf6e81ea2-goog

