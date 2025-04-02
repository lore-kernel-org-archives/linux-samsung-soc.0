Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60291FAC33
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 23:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636899; cv=none; b=QelUks9HqXfwBEak2uj6PZ2VpnLQITwpMI/3jwbb9PtQTJwjAlvjTLVz0bAPOwwKvXdZ+9xe2Lp5w1mdr0CJwqEV0aULDmLlCEg0i6xxw7sx9PEX5SxOC/4JULXaa0YroPQAIPnHdqqhHvxRMlqO4AcM6AxjrWS1GMs7GwJ/krg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636899; c=relaxed/simple;
	bh=BHqjnEz8Bqub0+5tOgaodvHpe7VxxoEtAWRFbgVwkX4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vAdrBXkNc+Bo8PUYjK6xCqu2D+fNYYmxT49u6KMhgh9P2yApr2NBWdwzQ4AY/aj9BGzs3HNfP56Hi97K0G8dBRMBNQGZsuJiJRnYBj7/qzcWiyetaJjW9wB9rBPFXnp3gwVubd4pnWZAvauqVGCejRrG4p/1aT1SlwMCGslVwJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4UcdrfyL; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4UcdrfyL"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so463046a91.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 16:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636897; x=1744241697; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=;
        b=4UcdrfyLO6lyFuhkBTdxNC/z2Ht8B3bBMZbqD6KyAw4B1bq6oTv7wfO511EFtNDsbd
         hoVRsXO3arf56YP1+FJXcQyfjNEnZp/YBf09fhujfaSFtCZfCD3IwoAr1TP49x6Ij17X
         j+bdC/YYZ8zBGk6eJHdHt7AVYQFZoMRc8HrJxNl9QO9UDS0l4EeRE0IyAZqRFzhbXoba
         FdoTbDaGtHVoSvIBnHqRzFz1YT2T82vLwWYu/sKXQWHyM+eLZTkxFuGWIk0b1Jl8Nw9O
         JMQd+vkNDTUlIv75JujMs9+MDHLO9mwAdr/bkBisr/7jVOa8aiDdOcKwSNbr1E9L/kvy
         cjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636897; x=1744241697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=;
        b=nAB7PycshQHLMzsIPUaXE5OYl236QMVAVpkOFGR2pm2gRP2ijlKSR9sZvEwCIi5akd
         oRTJYblWEXcM3gTL+f1yJebKd+bM82jQh9/3+wg/vRVTAeEAUo2sR3up5ijgeXB+IETD
         WbIM+gKL/MLvMSgKa23H3MnhDdYEc3Qb/nPZQPsO2VifptA3Uz2gjL0Z5Vy9ew/Efw+q
         /e5R16+ssC2tUvaMCkLDXcm9Axxkz0J3mpuNKqsNLplVa6nNh/0+8nwIqA+gV+qLWtcx
         +ec72eVsH95asX0kBOMfOp/OrXO+XyyPEh/EZ7e/AM9UKCexF4+SRN05fXoPctPAPTN0
         USrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPBg19s4lPYW/v37ZS60mZ5EqU5eYvFOd7hB+/pisk1ZaUcAJhci5semATU8xlQMEFW4jNiGX8DfrrP4bJ99JBzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8JJ4+xPqapqg38KjPcn9YzORi8AAucciftrNNNZp/jrQ5T+II
	1qv0dM0ql8JBDMYWX3IrdkDHCh7z6bycYOdEYQVvd6KzooK+qGLkRzKklEiIvkJiRnmPGb/YZ9U
	ZZdLkVQ4L6Qn//w1B0RYsIEHnwg==
X-Google-Smtp-Source: AGHT+IHNjNoLSXpuoWq8MvyOWd0aQH4vReKV9zSqeimLC//wD66A6paRAKR65MmP1wxkBUjus4xLZlsJIhNOroJPqoE=
X-Received: from pjbov3.prod.google.com ([2002:a17:90b:2583:b0:2f7:d453:e587])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:56cf:b0:2f9:c56b:6ec8 with SMTP id 98e67ed59e1d1-3056ee3608dmr6316456a91.10.1743636897333;
 Wed, 02 Apr 2025 16:34:57 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:58 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-8-willmcvicker@google.com>
Subject: [PATCH v2 7/7] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Since the Exynos MCT driver can be built as a module for some Arm64 SoCs
like gs101, drop force-selecting it as a built-in driver by ARCH_EXYNOS
and instead depend on `default y if ARCH_EXYNOS` to select it
automatically. This allows platforms like Android to build the driver as
a module if desired.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..325279193e2c 100644
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
2.49.0.472.ge94155a9ec-goog

