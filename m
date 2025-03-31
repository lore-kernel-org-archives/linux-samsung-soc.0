Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7962206BA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 23:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462057; cv=none; b=a3wRrZih5wUbJc5+hNeQbQwnq74X7Lou/8pLCqHUc1ofc8ZoFVYbkNRwKFoovYRFQY+gw4/ins0/y9Dxj3XgTaRWzmeTuX9bXoOSE2djn1PDIg4SHCgjDnewvwPrPQ+aonCcltSSU0hM7CwkLqP50NKBZCix2rv6CT2fFZDJL4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462057; c=relaxed/simple;
	bh=BHqjnEz8Bqub0+5tOgaodvHpe7VxxoEtAWRFbgVwkX4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PsPL5Gn1d/UUQLFMOr/1Y/fRib5K1WlAsFtTVWRnGMFxyRem4znzdV2DyVyIPW3sC3Lw/ICNdZVgGg1fC4tZHbMXzFJWKMJqJTGJHSTawYXPXE/uWa9TbWhdJcK5kn68MdSs7H24ZAGxNXEm2qHDsXmMRFBeTBtYcU6AVIifw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JVzwCa07; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JVzwCa07"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff798e8c93so8202697a91.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462055; x=1744066855; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=;
        b=JVzwCa07ULKllNkA4NAq28yzX29CDrNJkwpPA9OcKklGFxso2haopT1HH19HZvpRmo
         /hH+FHfWhfZfTiCidtD1MevbqeqeT/wcaeyYgEjLnz8dvh0d09SxtavLKghSlJJsOMn6
         HXnyvbDbYdwFdmWBEGCxxuRm0C40YOQS7iPBU22lnAr8TXZJVaWO06h1zaIfQsmsH9ZF
         YntP58HfB2w3BNu4VCq8p5SsfaGGphjm5JMmaNIceW5tJY2LOf0+PpNRvJr9eSOdIeY6
         p8gX2CHOgoP++F62MtJ4hypay1iG6pepMcquPI74iHTWOGdrpamhnsz8aU9Lv8wn1MWq
         MUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462055; x=1744066855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=;
        b=EY0qcMKj+rwARLWYqVkPkZ/NfOfkWGxWeciEzOFQPEYI3yhor7QRnnwmICSMmTSThN
         fWdaxM0Ll2xXZ8VB9jVVhLc2S2arQVI/JJCq9FI8ThDjvH3ad9zKgH871khnH7q/R9gp
         m/v4mTFiInaT3HszVewDKqg/urs9qjuAyAp3YkbITMroKQ8cGs3xfOB19I5ifHJhWyKu
         25MYEq90OzSSZcHdfIRXd4simP/9Yp0xG9Lp7cefJXqEEa4oUq4PQaJCGLg5z2j88G/r
         uGq3AzJV0JpXOA+iA2F8Lkf8Zs4K0kAk5SfXJh4Q69khcG/ad8VOjeV4VoQpfxkZ2QW8
         CDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNj8gAhg87VAZbZHQvx67Wk7sgRWsI1PnHRhFDmVM31f70nxlxI3DOs3cYW4VJvNilacuB1Ayn5r+UCyu2fT7sag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46oDqjUG7fgsZiNJ3ZbvxuoV8HG/de+Q/lzXwjjrQGiKup7li
	CdJH79JvqRgiyMBTa2V4gPZtTLxSQ1CtQbvHFr+x9WnD9m4Mf4NyKNGVenBh2p3gX/0xp/TvXXs
	3TvvUu8PQiWAdysVJPpKYPkIIGA==
X-Google-Smtp-Source: AGHT+IEx4n4bxYc/YGt82JQ6y5gWLCjA7rtOL1EcSQ5FOyxHXLQUeEqlUnQfPzSQjxNpXS/pD1jk7mi3qLuRMiZ4+F4=
X-Received: from pjbmj3.prod.google.com ([2002:a17:90b:3683:b0:305:2d68:2be6])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c06:b0:2fe:994d:613b with SMTP id 98e67ed59e1d1-3053215a3d8mr16944353a91.35.1743462055036;
 Mon, 31 Mar 2025 16:00:55 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:28 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-7-willmcvicker@google.com>
Subject: [PATCH v1 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
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

