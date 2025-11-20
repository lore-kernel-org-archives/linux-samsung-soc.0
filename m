Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E536C591
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 18:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664184; cv=none; b=tIrprLfAlnWAWK/MrulORt6z5sa5vwHKQWN6/9BpBCN9zM3N/+MjIPklmf+HsgwcyfwahMOvMCEGBfEAnZefMXfFfDPzoPgg80ryDHo5lfsbTS/hOKXLC4d+ABn3G/Te0s5xPziDitNSCgBH7P4d+3dwrZ/HlyOgHpDIaUUjM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664184; c=relaxed/simple;
	bh=PPLIEDyHUtk7qahJ1dpQJZQHzZbivp1Tlxcb2qSuB/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u4/zSf7JVeK6UGlcbMgNXlvGbHrsewCRivvE6h0nInnljQVfkn40luEsZBooMzBwuf8BlcLETT1Fl8ITKUTgCQNLzuZ8uL9nlzYvY7MtLWebWBajnqebfI9zAibx2r1kWLY5tgYaYcWv6Cn+pynxDahTdQZ5wRbFFD8X14vp0yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B9lpDMmQ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B9lpDMmQ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3437863d0easo2085262a91.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 10:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664182; x=1764268982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGcCdHbDbTIl/UPp/4b9lzfyFAtmrTaBAs1wcxj1OgM=;
        b=B9lpDMmQfxOhBN48b8xkQmNGzXkoHX5p8monqPG0PHe8mgjYdSWhYPh8LB7scNLBID
         sZBu5edRzrcyt8Ry4NDsCfdaXZ2R9oZ/HuLHGeBctBVopzxxbbokZpoqvb1mE4Uy9Btk
         mwYL2Mt4VhbsmlBV/s1TK1QKz9rhNy1dIl3JnCk7XDkYvXnhNDIT4mJt3zh+L0CgbVRH
         xDG8B0yVKk9vQ1Pbh5/pklxnidj3WJgm0kyTTef4lhYGvbbR1ffpwiKOorIZqTfUTHyn
         2N+R59VSmMU5PRGafUkGHyXy5+QyP8NpbD5cyDWbNsTPtYqo9A3J8AbHsmqQpAtdBQ0b
         DESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664182; x=1764268982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGcCdHbDbTIl/UPp/4b9lzfyFAtmrTaBAs1wcxj1OgM=;
        b=R6eTWvO0miuvhhKaWTYIjU7EG5vIT7BjqpBRuGLqgiRUoguG2ByJt9jCmWaJ0JNO83
         m7bw7q2odJKOJr/cMD/a3ZUXlg+esHClBQBkljFLqG5KhoeZTUgyp5Mtiwt10cAZ4XXz
         uiXalSz5kT60GLoG9GRMaJBg4sTUpID872SOe+LwcA8dcGbD1Kyz9lr5o+TFb4hUl0wq
         acU4ZLcwSN6llxc8E0IHvpcW9PCxv1on3ElXLQdO+Z/3Ezwgo0rUVvjxLAK/IHyjbfVt
         NCAhKB5klfYPe1cqinCu8o1/7dMhi55YbZDCMxiznxYGxOhwLMLQuZIobB5iaanoP921
         KcOA==
X-Forwarded-Encrypted: i=1; AJvYcCXKz+fF4UOc/7VThjpve805ucKgmx7pAsw47cEDGzL4yT6pReXiPhj+AuN363CAsPQA8iiTcGEMjfTcEmG1itLIOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfV9ndL64qYA8LTFmyLX5kNeJEg6aIfA5Kp4Q/ySBzWwrK91vR
	5LnJ5sgGjiVUf5lA3sGS5aNr7lTRcDZK5IQz32lC7/SZBR2A5OKE/k6c5mfh2tbgsaOxWRME5TJ
	CfQwUDAbbs+LhACZqRICibZNg3bD8Mg==
X-Google-Smtp-Source: AGHT+IFt5QfE8e5NXxmnZJ0/iQdAGNuMSvT4BtRRro1MfwvfVu6kdP0H+7ZtU7YhUZh+wKkjO47g10Q354uCZT6CnAQ=
X-Received: from pjwx3.prod.google.com ([2002:a17:90a:c2c3:b0:343:af64:f654])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a51:b0:340:bfcd:6af3 with SMTP id 98e67ed59e1d1-34731c82829mr327779a91.33.1763664182070;
 Thu, 20 Nov 2025 10:43:02 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:34 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-7-willmcvicker@google.com>
Subject: [PATCH v6 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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
2.52.0.rc2.455.g230fcf2819-goog

