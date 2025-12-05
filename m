Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C84B2192F2
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 01:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764897046; cv=none; b=YqzaOFeC0j41lvodYOSUEyXfPkc3t8Pwxc/iQL1IyEtZRpiGQ4uI4cTucGyjZ/JFLOZEtHuq9QJltUO49HYcl5zEp1yUU070sNUpi2XixseB/FTUtLYnknx/6c2S0xCxVSqmcNC9yMshrN9Ggc4MpVEcYIhj33Cun+PawmdniKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764897046; c=relaxed/simple;
	bh=DUKQ48f45DCoRbynorykc9RwkPByZWAUVU5Q2dM0yYU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d6lIvPT/mfhgO1GlswHo7eBTMmW8BQhoqdfsA2K/kHOVKeJSOx6e3ZBhU1Y8hG3XYGWIyHkD6v/kguVP8w5aQpye4osfnJrvk1QubhvLOiTLCI7VSd5D4IPGFBA94ICeqFa+sxF+QQ3EN14K+8tFMHC3HXYF8gbToHoU6cmjSyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f1xLFyaS; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f1xLFyaS"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34566e62f16so1775238a91.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 17:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897045; x=1765501845; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGzNZAgSmf1hKexSS7kscyRDWNyrH6DCvG9Q4nvREV0=;
        b=f1xLFyaS83hrh9IgoKE7YZxX4HCtNWXz7JJa6W9N6JJ+yZB+zRZeVVy63dQASV7sWK
         YLleEKq//rc6m4PujVYxgmwzF5YLyl/jNQUVY/No2xbJx3LZFHTEoyrNj7rqHex7urF8
         q7058RXUU2jttx5UBwHw1zRe0pe4dSX5k+DTETs2oONJIn2bSGLGIcyA84ZGcHN7GleP
         IafkmbkTsx0NxpbYBiqVkexSPEEHywF+QKKmtnS+oKzsdtOqgfwYWKwiRJGp2WR918jo
         DHiD+cXfiluZqnpJ2PZNvr6Kq0ZO/L1ATpLFjJS6SdQhi3j0z9ivRAYCMpMW/1SUfzK0
         irtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897045; x=1765501845;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGzNZAgSmf1hKexSS7kscyRDWNyrH6DCvG9Q4nvREV0=;
        b=CYWoBuOM3R9qRCVmcoeu+fX9VCTE8mmWc/uNWcEh9T/ePKIkxZXfDLRH9CgiNVQ+pm
         X4h85Oo97EnzzOpZuPQBiUVneKAgTmF8YT1Piq5RnUAh1bazed40iRRqlEgliMzo9KvO
         Pm9BooRyTLcDkwbcoMdU+UoEWqWpPvnqXmVB5g2rz3bDDB22BeR5ZEVlR4VGyOk5M48l
         Md3CS2RXUvVIi0qotTI7UfjsJWY27q7ZpTID5NflizUFKMtfKml5AolTvWSCFoGJqFSC
         xdD5J/UjeE681Ta9NU92j/FIfNUCkDphEfpbPgRH4A73POf8Mr0irPnfX8Rz0Dznnsu7
         k1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCU64AGbyFaV/NbjD8WiwsJ6a1/o4QNdKjzTR7+9ZZmojpudysph+aCUQk8z5B6KmzPaAFaB7gQoTrOZN671ZXU71w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqlgtPxpFipt1e0OP7wbYTeFUaOsFBs2zYRQ2I3AFpdU595F7B
	JjGm/flvdKc/MvvfmDacX4jC6OUEjZXjpFJfAJuzB1O801C/GIsLG01GIA94h2mun0Pt6yFucxf
	oiXaM0fUlfB3pmY7r7EWp/OIPdv1MRg==
X-Google-Smtp-Source: AGHT+IEshhpLrp+m+z5Lio7zTtyyfuyj3rt2WlZv8C9AbKaTeKWuFxioSmKqiZC+EdgZW5b6KBHOwrLop22uhDqYJzo=
X-Received: from pjbmt14.prod.google.com ([2002:a17:90b:230e:b0:33b:d40a:d93a])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:9f84:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-349125d3475mr6578882a91.11.1764897044574;
 Thu, 04 Dec 2025 17:10:44 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:19 +0000
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251205011027.720512-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-7-willmcvicker@google.com>
Subject: [PATCH v7 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Rob Herring <robh@kernel.org>, John Stultz <jstultz@google.com>, 
	Youngmin Nam <youngmin.nam@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
index 13173795c43d..fc6026c368ca 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -128,7 +128,6 @@ config ARCH_CIX
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-	select CLKSRC_EXYNOS_MCT
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
 	select PINCTRL
-- 
2.52.0.223.gf5cc29aaa4-goog

