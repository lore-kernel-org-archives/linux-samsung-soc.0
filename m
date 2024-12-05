Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC98A227BA9
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421236; cv=none; b=ZjA8e9Pw7Va/ISC1mPwJbYzoh9TIWlanoeuOJGEKxzhYT5+jwGmvsIG/MOPlT84NsSQo3RV+EXlGKIMA50W1JsGjljoALSUgfDDTbejmSorZj0cbvhgbU9FNsxpbqhtQlFQDjqyR0WZY2qIT+C/nNZwiUL+zPtO2DSO04XsOLwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421236; c=relaxed/simple;
	bh=8/1zyw3Y2D1EAPmlvkuWT0eqZ0o1r4sI1K0ufpWK6b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KA2TnS/OCY9gIBpRkl3+SECYQ/TzmAEDpv1IfZRCD2qlv1+P9Sre2fnwuL0nxyPLSWLTqHNMpulw/P/8PFVVk8r4XX0H71DQZCbBZRhRaZ3L92D3nlXq1wOnRFC8RRuadmLnn04IgcsMqeeCkRy8xw8Q7bWMtQwusbcnPdIAdt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EXY5r2CL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EXY5r2CL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso12216875e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 09:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421233; x=1734026033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUjYGZM8Wn9lXxLMeS6SbGdYzdUSKeJjfxwmycYz8PI=;
        b=EXY5r2CLXQ2400Juovm2sIS5YM2q+v5bT+JxqdUJx0ZQW4gJ3W1BG5IwC4ieLluKH0
         nbeyRW98UW3Zv2MV0E/iyulywftheXUqHhgqyqCeJT4Sq/RJ2EBQmOpjD1RroJ5PTqFZ
         nWbzqE05t4t9idBO+Y8jNB2o3W0+iuFJZoCKkOLCcI63zwtmdvndgZ1G5j3Q3m3Y3BEO
         aldsQfCfZ0bQizpdAxwRJxtKUm421adJ2GAVjMrMF7wLwUdpX0uP2a7d4Edp3peSFhqF
         6EqN5KEm5Qe1WbmfZwoJ/2gROl8uohueS9F1HSlvWa7AfGF8PKAcvrxBIBFOVgxXyesN
         i6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421233; x=1734026033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUjYGZM8Wn9lXxLMeS6SbGdYzdUSKeJjfxwmycYz8PI=;
        b=ayOAFvwZUbyEF8syO3Y01iSny3+Tf7iwOiIP2yeutvqRQi2lZf2eZBCMb2x6rMTgcD
         RxqIgtCRE0utfjFBbQoc48MU0HIYvUkXmbpbPoa86RlpbEp4YhYXm+h0vVJO5Y9gVEnA
         eflnZqo4Hitu3N301+C+lblrlD/z+ltf0mZ17p9uLrVtQYaG0T42bLxBaNbxIuv4eQ6u
         afqowhQELWhf5oIJyAMKSmE0fSHJ9+spqWwlBunQUnwah4JUWmB8C+jy3pkpFfLPUWFO
         3Aao1i5NRwNFatmaA+o2GxmhjnQN9vuO3nmZmLNUVnVkS2e6ZMpQ40uwTpJU1VnUtmBr
         /52Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrM1u+vDNgtREnJRAS1fbG+GGEHQosm9i8D3EekMTyHU2HkqAkP5eZfBCtiwiHP5H2BCzy9kX5qihPrtfEwd3d6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBcbv2aiqAo9IO5TJKVX4f8r+fdUlcvtjEyTCWagmNXzoKJxsX
	k6kM8HXPf5lkmTOXkWvKAUWfZ+wYrM4Bqs3qoLdXMVhMe8NJEJJh14H1/ZLD3hM=
X-Gm-Gg: ASbGnctlH5Q9zVjcAyWv44fZjGX0vYnitKo2tKSgiWY6KNokQ9rORzn5o959/6yh7+f
	lVju40UX6elgvquuy+VZXs3CjAyKNCV/W2MSL77VyUUjz0qh99k+yiGm9GUTaqbZ2tRG57eJAYV
	dPoPty0Y9KkvB2jjlh3cKK7AO8Cy+O0qTGZ2k5yHMAD2NzTV7ge9GPKTHLfOrehCv+/5lj8gS6w
	EVH6vUq5b8OEl+rNMG38kFi+6ipSbuSJRm2lXxLor3fpxKnFf34YMPms9HzJnANVDoj4/EbGUFt
	xIx9KChFb7/GMknnS5sCS9IcT/SCyw5c
X-Google-Smtp-Source: AGHT+IGVQz+uq4dtBtqtBu1Y8X22ebMDa5YP2r6YCdjfCnpf2qvqcplq7ge2zv2BqYCM+IMoonQK5w==
X-Received: by 2002:a05:6000:188f:b0:385:fa3d:1988 with SMTP id ffacd0b85a97d-3862b33d273mr12625f8f.8.1733421233156;
        Thu, 05 Dec 2024 09:53:53 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280fc4sm67882835e9.24.2024.12.05.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:53:50 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for the samsung exynos ACPM mailbox protocol
Date: Thu,  5 Dec 2024 17:53:45 +0000
Message-ID: <20241205175345.201595-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205175345.201595-1-tudor.ambarus@linaro.org>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entry for the samsung exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..5cff01641f23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3023,6 +3023,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/firmware/samsung/
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20712,6 +20713,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml
+F:	drivers/firmware/samsung/exynos-acpm*
+F:	include/linux/soc/samsung/exynos-acpm-protocol.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org
-- 
2.47.0.338.g60cca15819-goog

