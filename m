Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95F132573D;
	Tue, 27 Jan 2026 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769546483; cv=none; b=i2KxLuVLNvfc5bx90/Qk2jHOJaG3f4rS4vJXlOE8bAyvVy160ax3CaVyLZDUYqzexKs38psknjgGRQZ7nIVOZrQpefWQ5LQPoLjnn9IFKf74tahF3yp33aOSThVtpN9n/OCGh73KZN2HxFQo5xfS7DXxv0qqBYpsxFVkqNu3Qus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769546483; c=relaxed/simple;
	bh=6jXgBAXR6DmnocMVq9UjJxfZQt8p8wK2xq9VRcA+x1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGPJOAVKPifXlCP+M9wkfID9gZrjUD/uGZm/vmfCP/V225Y3JFaEXB5mudxE3jSSuQiZK6Z2k+ZXVSR/xIZqOuWNRA9aR6FAcwDiHvh8U+QJGFlJPofgTeVf4sv6J//QPkePj6LRuU1HeBwV3CUJ4wHuHKuga+X2Clgn1ipBtr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f0y3t0Zg4z9vL8;
	Tue, 27 Jan 2026 21:41:14 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Tue, 27 Jan 2026 21:40:58 +0100
Subject: [PATCH v4 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-lat3st-staging-v4-3-797469aaaf9d@timmermann.space>
References: <20260127-lat3st-staging-v4-0-797469aaaf9d@timmermann.space>
In-Reply-To: <20260127-lat3st-staging-v4-0-797469aaaf9d@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>, Henrik Grimler <henrik@grimler.se>
X-Rspamd-Queue-Id: 4f0y3t0Zg4z9vL8

From: Alexandre Marquet <tb@a-marquet.fr>

The firmware trustzone needs a special call to bring up the secondary
cpu core on the Manta board. This seems to be not needed on other
exynos5 boards and comes down to the available firmware on
a particular board.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
Reviewed-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm/mach-exynos/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index a5e22678e27b..e9b0ed07bb90 100644
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
+	    !soc_is_exynos4412() && !of_machine_is_compatible("google,manta"))
 		return 0;
 
 	/*

-- 
2.52.0

