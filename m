Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33FC2D6607;
	Thu, 20 Nov 2025 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649821; cv=none; b=UpHABkBe+zC5745own8rH3Qkg9FtmTmoMnyDh85o8Wm/GBspDbAPBb8SyERP71NVYBRDPN19hApsPe4jI7lXNVbQl0+K9sqJbL+L6omR5KUQXj4ZLXBU7MCX18HZI07XU0jscDUpGMUcBetY1I2OncejfPVCdqsLqAx+seIrj44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649821; c=relaxed/simple;
	bh=/586LIO4fxbt75y1LK2E+Q0Iaaun9XKrCSTLTur9qaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+JYKlhvAjLU4fU8h0wrdlfHFfosoF4KLntOc/ILefxoSdPvlHrZtt7taArGeNt1GZKDXZWoU5ZPAt0VA410a5yNk7oQ2aLxqCaAnlEubC+qnKuEs7YOazOyRC9Wg0nLI1yObJUwMRQz6Izxfme3u4fXqK0Qy9sDa+WGyIiMyx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dC1Lb4PKGz9tx2;
	Thu, 20 Nov 2025 15:43:35 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
To: Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Alexandre Marquet <tb@a-marquet.fr>,
	Lukas Timmermann <linux@timmermann.space>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Date: Thu, 20 Nov 2025 15:40:16 +0100
Message-ID: <20251120144018.961604-4-linux@timmermann.space>
In-Reply-To: <20251120144018.961604-1-linux@timmermann.space>
References: <20251120144018.961604-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

