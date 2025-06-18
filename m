Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F156267713
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 21:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280962; cv=none; b=JbkStKAM7PgfYHBMcfJlVcEQqDqSgglUoR6BtUi16khtwr18bBwYIFeIkWazfmq54H8GoNTvzafjVJPoYJSBXP4pIB2MY6NrI4mu/+cixUwVwtGaiOVKnUmJ035Zeb1R7SSM9pnSFKBrgHQkDs6lKpfl7MayIWswOH6Ne0/72Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280962; c=relaxed/simple;
	bh=FXb5Ooh1SoKLFB+GF1YDuF7hepy8ALKLUWQZf6h1mvk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fQu/xqfah/HrsmjpktGn6FF2eTezm+xRqQAFVuqlEtpwPh20AncQsFlnklzzWYRJ91vY+ZW9E38LYr5gz8sJlhwAC8a6aFOGww6a/LvYomsLmLDjf6f33aiI29eBqsbyVaoT2tkru0p/BY4TCK+EppRhh1/sM8jyLZ7UHT0Wstw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RdAjw1GQ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RdAjw1GQ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b31c487e1cbso78439a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 14:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280959; x=1750885759; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qsGE8lw3KH/D0SLaONE7VxsA+KaDyJNSSOZHiKLjPmQ=;
        b=RdAjw1GQmLoiyB5hyBWcoD6R85Y3CXu2kO+sDt4EqJyZ90b2OR1BX4X3L1y/TIzcKy
         AZybyR8UqNGNeSuS6g92UWfkVp8pT3BEVbDdZlNYaBu03cZ1sQYW4P+po4N3CaHZ6lEK
         DhgQyCus9rYpO3BddekEPyvvTbowtR69DzNXjX88kTOr6A1Snk/8OsEnswpmD2bGJR74
         2NSF1udqTKaDhN9exgpRSPgWxo6CL05EhbPj57dztADmLwG91OhHkvo/l03RCjDK0KOs
         xQ6bL9b2cygCvtrURtKTJ9xYcFdp3hHKaifOkoA0FsXWjlObeo6JR/nKDrViEdV+rZS0
         7Sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280959; x=1750885759;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsGE8lw3KH/D0SLaONE7VxsA+KaDyJNSSOZHiKLjPmQ=;
        b=QkbiqJ5sdk9cBXVdAUnGDNyzCUQh6Y8blT7NKWR0IwPTFzDeIgEi8O9O2wwh8Znq98
         6ZxWzQfm2W8ntfTChI2PpI56tvq7XwPt4tVXqjoBld6330Dv4s18VlULAKOgRnLeT7xW
         Nm5YFt/pwBGEJ1DzXAgTEyp5Zwz2ilt3ELVB2LKSTcmiEnn1u0JwS0Gdsi6xRu7dQpKy
         5xNUiw2EwSF+ZMS+OOPFWVnvfzfIL7eyjBbCb/5F6696cp3eJUSi+FL1p+dzr1IZkoiU
         QzBaF4Ztb/txdA2f7qu5qUc/EuUefp8B9XpZlQd+4w9VIG1zYduyUH0fzPET5bqHSUbI
         2fpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKDkhBZ5uLIy6lJpSYY+5lFka8A/7P4ATMQPOPB9PiCCis2teR+Fui9InvTmZ8oQ/Qqk6UertDq50bWz/wiJlT4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE8aeywq2XKOian0d9A0OzwzMnwbr1zw/A7Sc0tN1MEU6hI0V/
	iBuil8+xWsGaW/T5Bhtowuv657jiV1Y5GqC3obfoVldvCqHBWL45HFHrQMG7Wj4dPUNHRUytSCk
	5lqawFKKLcylF3/Y6qWtD+RYcKcBIPg==
X-Google-Smtp-Source: AGHT+IGY3GT0ocfBJmJq08AJGD95U1laah8rswBwXGAH9V+lUNOhBR7Cym5NnrFN413oXgb7BGxavodvCRnnP6tKZZo=
X-Received: from pfbjs2.prod.google.com ([2002:a05:6a00:9182:b0:748:da37:7e37])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:790:b0:1f5:7f56:a649 with SMTP id adf61e73a8af0-21fbd57fc15mr29674578637.13.1750280959620;
 Wed, 18 Jun 2025 14:09:19 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:43 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-7-willmcvicker@google.com>
Subject: [PATCH 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Since the Exynos MCT driver can be built as a module for some Arm64 SoCs
like gs101, drop force-selecting it as a built-in driver by ARCH_EXYNOS
and instead depend on `default y if ARCH_EXYNOS` to select it
automatically. This allows platforms like Android to build the driver as
a module if desired.

Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..46825b02d099 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -109,7 +109,6 @@ config ARCH_BLAIZE
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-	select CLKSRC_EXYNOS_MCT
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
 	select PINCTRL
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

