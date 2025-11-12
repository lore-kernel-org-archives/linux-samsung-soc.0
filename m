Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B682F5A0C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762936160; cv=none; b=hcw8q2WV3Ub7LUYociyfSZXyfywR4nMUOyFaM5revpl1RULn0TuRdtKMGWIcuGP4msJIE4Emsx+1rA8n+vovcTDPM2QpHF6MlTebBGrWYY7A4c4zLlLVILgCmEHibuih15o7Gtrj0mI7drOX4r910Enz63iCK1/mQ2VJp/15hO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762936160; c=relaxed/simple;
	bh=7rM6ipANT27ulRQJdHPgB/KMFu8QO3gc2s7q+k9b64Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQ5dBNcqh1g3MVUFj0gOQUx6BrUWJPxKqCjfEu3MdQvi95i11w4UzIDByWTm16MqfOOXats/mDxCmRh3jhH2MW7pJ1otB2vJpp7TPcWW1YQEd6pt/BWgBZWFQGt7BFhMAP1SHqoDxy+K2X1wEFrQuIA9bUy3qkOjxf8vpanndwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cqDX+qAt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cqDX+qAt"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3108f41fso288848f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936157; x=1763540957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLVC1yr/nkYxv5RM5OgIDp9oj0yRWmQJunkOHBdVjz8=;
        b=cqDX+qAtWNVu+9S0QQy84Cud+eXfAfxMj2gQUL0h2onk+GdGfyLkyLBk2aXhl4woG6
         88J5wpawkTzcGhJkHby0Lmc3wgFHzdgjdRFCpMl6B9sNBPa61ZpdTvA4JyKQKmGHQCCp
         ZCq84l0GK743TIzlISUgu6SzCBZZNtBq9xxlgIiwBBytF0z3+sPDX1aZH7RF9/pVmumS
         BQobX8SJNpgcxpRLpnV2WU6NcVt4k+oxdXzk4BVpFHDeTGuGG1eeJNpZmTME9efQnyms
         NCdVT94gj5WgwuQDgmklTI5XQt6Ax1AgBAjwTKfubTOkP76gEYyra145ygTrf4+uvGzn
         4/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936157; x=1763540957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nLVC1yr/nkYxv5RM5OgIDp9oj0yRWmQJunkOHBdVjz8=;
        b=w0+sgz5BErOBKPgUN1HylI6/omlqsAf10Lt3vtvO/eUe11uo/GVCQPCU0ITBVkcFfQ
         wi3PTt8WwfLhN1dNL22GVJ8B/moV8ETfvJmFUWFPLnELoK/ozUnzUr28KKecQ68iNAPq
         qqL8h02HxJ9OSAIIVR8r1Ivr0yA8kt1bjs52lbRM29s4KlS5/wEtDYF5jGBaSB+bX42L
         5bV2ZNp5hsk9BqqU+Cd/9mJK5r4+NoZgMima8K7FxemthUS3/YGc8gPee80nHHrrNuOW
         HBUtAnAdRUIB6CPV5msNZ8WOkBKxRgKvV8SPl2hSZtPLpSpvN/2yD0eHSqi0qapru3I7
         lMzA==
X-Forwarded-Encrypted: i=1; AJvYcCUSP83hXjtPZ88ubx9Ln0xPPMsEzcrbnGVves8x1SRxRRELrMpktt3dJRV3USr1tLKbQHUNiEWqEj8Y/ahWk2LKZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySs1uTXvoKNJqMT1Pyp4RNx1okMU7WOcsNcoLnXmjN/s+zo7j+
	h0s2hq6Ay3INmI4zxfFfvKH3YffAqnKOvMLovZQ540ixSR6ZVSorG2SkwLnTUnwyTEA5ERM1oet
	izZwdRJqvjQ==
X-Gm-Gg: ASbGncvAc6yOEvaImdS/Esldahv9LXLZ5sWbGiKd+m6Va9V4inCRvF5D/mYr0zS1rEl
	dkRhLfQRMfR4fyWkhAnnY8NM+QrkHwH0NF/3aabC3nygpWhMFLD757gsq2awffobZI6oesdhWQe
	jpHA9ff4k2C23Br8QNGe+lAI3gyaFqd37BqPBQ6K3QEp0Xphbe0AxF0GGtAmQidpaY/hA+41j+h
	Dh81O0HKeSlsiLouZH4d/iquW01x3ds7ZALhGinmCQbY55vhK3z4DbuOw4MdrBKave/YWylfu3U
	T+V/0bBMhYvvN0DT0276qAY87AwRv3M+VW/lGTJCFqI9iR7ZluJFd/RvvUbRZFGReCbGwgpJKHe
	amSb8sQAtQS2TetZUFJYv52Hp8MzEWl4PYHKW5IAZMx6aDY48kWZwuiMPHOKrqHYUBCw1lxi0kt
	CPcSZwrvUNrsBgLuJlp1kjIS507BeJOdIf4YzdW/YbU+VCbA7v0hGMO6WUiCbat7/FGms=
X-Google-Smtp-Source: AGHT+IHFW/GKxKCw0ILsA/SJT72Uei+QJ38/wrMr3u+rGJwwJXDKwY/90elYIzeiZ134HBFWWuCaMw==
X-Received: by 2002:a05:6000:40db:b0:42b:3c8d:1932 with SMTP id ffacd0b85a97d-42b4bba5627mr1678878f8f.23.1762936157486;
        Wed, 12 Nov 2025 00:29:17 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:17 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:29:09 +0000
Subject: [PATCH v2 5/5] MAINTAINERS: add entry for the Samsung Exynos OTP
 controller driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gs101-otp-v2-5-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
In-Reply-To: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=980;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7rM6ipANT27ulRQJdHPgB/KMFu8QO3gc2s7q+k9b64Y=;
 b=Lurn43cxRReGlo/BJV58dAB7nj1wlW2HtMqDlBqeLRMi1dZmQeHSO44u6JwfT0f2fBaR1GlW3
 aM4MGm3X4kVDqVIjmlIkpfG2dt6YhPsVYTKuB/TqOfTIpnjc+5/W5gh
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
2.51.2.1041.gc1ab5b90ca-goog

