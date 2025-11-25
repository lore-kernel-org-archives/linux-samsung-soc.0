Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4326327BE1;
	Tue, 25 Nov 2025 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083583; cv=none; b=IKg8SLajJrZjX9OgQL2tW+wjPANcwJDaw8oNzeUpnqEmlG1Vz0PyjkW4PFuw7iIxPnnsfdaa5pJpEfHp3gAksoapwDB15ZwN8lsc2lmls0+IHHYSyl3SsF3ZJ2kj5VOiwyezLg+UveoGASqJVycmBhydLNTlY5ahwDA7HhbhYGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083583; c=relaxed/simple;
	bh=KCZgr0GcNKE/fSY3UHCMx7N+GRWVx/CMX0v/hZZU+mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BmH4U67ef2xQDQN5K+Sc+8R3OQXrvrv/JRKInfN6r7TzyAEe5xGZgfIw5XdCzkNz7FXVjSzZ9RIs2gBC+T2V9QBPLS+ZRUnii8xmSnnQsb9C0Lmxj1GHuBHCoFf/YZmPldBiGJv+d2La9oLeEa8eMo1WyMh+kEffASS+3usYb5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dG5mB0VF5z9ssQ;
	Tue, 25 Nov 2025 16:12:58 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
Date: Tue, 25 Nov 2025 16:12:42 +0100
Subject: [PATCH v2 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
In-Reply-To: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>

From: Alexandre Marquet <tb@a-marquet.fr>

Add an exception to let the secondary CPU boot.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 arch/arm/mach-exynos/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index a5e22678e27b..80e645b4d338 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -61,10 +61,10 @@ static int exynos_cpu_boot(int cpu)
 	 * Exynos3250 doesn't need to send smc command for secondary CPU boot
 	 * because Exynos3250 removes WFE in secure mode.
 	 *
-	 * On Exynos5 devices the call is ignored by trustzone firmware.
+	 * On most Exynos5 devices the call is ignored by trustzone firmware.
 	 */
 	if (!soc_is_exynos4210() && !soc_is_exynos4212() &&
-	    !soc_is_exynos4412())
+	    !soc_is_exynos4412() && !of_machine_is_compatible("samsung,nexus10-manta"))
 		return 0;
 
 	/*

-- 
2.52.0

