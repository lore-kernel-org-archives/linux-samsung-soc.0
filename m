Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084062ED84A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 18:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443477; cv=none; b=bGMD9cYXCizveLqIiOsZpdmoYFJgF6bYRKScq873OetFWWubDVfJYyHWzIkRkJ9pou6p6/zdwWN+rGeR9doRCbaLgE/N4bZuFb6K/lgPCNxW2Mmn+jGTBqS3P6AzXB5RuDib4Q05CHrk/glwahp3z6HZbsW+XR3WuQ0taV6Wp0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443477; c=relaxed/simple;
	bh=FXb5Ooh1SoKLFB+GF1YDuF7hepy8ALKLUWQZf6h1mvk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tVORXoATKcRbmepcOeysLAV8v7Q1zY10UeXR7RdDKx+gzyyF7ZNZdkrCbBkfOFPMDOPWe3tCiAORuV9GEXFoEEJON3YUivCnSPHFw+HppyEkuSOSDs2AKpi6V3o0Vz+F+jC+zB8Ubgy2ZldtGR41fcZ4wMsNdMNtILo3LXUIjz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s+a/oUsk; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s+a/oUsk"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2eea1c2e97so1667803a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 11:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443475; x=1751048275; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qsGE8lw3KH/D0SLaONE7VxsA+KaDyJNSSOZHiKLjPmQ=;
        b=s+a/oUskKmcHuRT2SSVKgz62vOwzlPIDfpB2UmecpycwElDkDzMHteeJ7S/IPoihGS
         HYsbDLMELB4M2PSQyLSY+joLpN8OlXQ5RRw9+GZGvseZr4jXVEDXt5aXgc+wDoxygoO7
         KxZUmmCAM2exo89e2d4g1DF77yiGQw4g2ZaIS0vCiLaazsGaP/qDU9k7ajMa1NhTAcgq
         JrDSd7/VwjfyF2zqKMWK+rLUz+hW+MvoHZkLZPlGUBg8jk2Bnj0yd4XKKUCXaTpSHgP4
         m7e8CMSj5K0gghN0QcA1BQfqBfd+gh0VHXJPPJO0LdMIQf8XXDzhH4JOzJxgZObQ8pIH
         1NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443475; x=1751048275;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsGE8lw3KH/D0SLaONE7VxsA+KaDyJNSSOZHiKLjPmQ=;
        b=Cump6qC8PnYYFNJ9ywqeGjZeuLg6JOdefxkSVLPcdv2IIVXI2jVDdw/lsYiajwa+k2
         CrEiGlnu87+EDOKbO1jVPof+RChBBJFkQtfGnSRHSUxBhYAiAFp9nFrXMB8aVKCYJ5j5
         VB7Q03Rge0kYtNgWQ76PJRKS7eTMoJY/Ccc0maoNuPVoXhPVDW2pGtPu58Nkl3RycEAI
         irEIYwynbm0K0TAHhxwJr3ggjYKMVUtfMQk+fproBqR6uIUjyGfSS/WP+G4JE+fV46Kl
         b2h7sLghM5B0oPNcHA6aV4/f+V/0NMT3gHRh+7zqzWct0YpMGX1mUxH41IIRZ/2lEFib
         +zQg==
X-Forwarded-Encrypted: i=1; AJvYcCV0OdnD45CiksZhbkoaPSwHotpSP4mbTpwQ9klSbbM1YVS1oKJCAr2ak6FM27OJqkRiPzz3wKYvkJYhQEyoj5HWhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3mUXNFv1z5qUuNQRSlgfhuKb6qXgNkwN96S80ZuwItehCfmkD
	CcxJNI2+2EL0dYD7JxDnFLhBvVkj7DOli4CLV8FVIuO+e60lqApmnEKheDVM32egf+N5+rqwoJp
	TpPdof0qfA3wsWrok9aRAGVbzJHRJ+w==
X-Google-Smtp-Source: AGHT+IHypcBEXCfetti6ZSKrWADvOCJp2Q3YDfRe9x9eHf0/IU91QwPfM1r/wCQjgAiUHhCtBoksoPLTGqQX3VT8HmY=
X-Received: from pfiv28.prod.google.com ([2002:aa7:99dc:0:b0:746:2ceb:2ec0])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7f8a:b0:220:eef:e8f0 with SMTP id adf61e73a8af0-22026e479cdmr6696633637.23.1750443475053;
 Fri, 20 Jun 2025 11:17:55 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:09 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-7-willmcvicker@google.com>
Subject: [PATCH v4 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
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

