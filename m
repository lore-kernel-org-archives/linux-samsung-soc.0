Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3F6334C08;
	Mon, 15 Dec 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765811160; cv=none; b=UHL2gENs7/6YwJeZinnWqyxHqGGy0ye20CE2azSFzP1VLfAyIUNRR1u6Tik9E4zVA3WfPMw/qcPJSk2CSX8N+JF7/+h1d8adzpiT4Nmnxaay10y9M1pIbSmw1i5kbsOz2+/B6bo4U9bVbjWkL76QtGs7e1oXYVQQKby99QeDL2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765811160; c=relaxed/simple;
	bh=AsuqJm8mkPTMoDsTrdHY+1C/20T7/ZHHgDoKkqlVBkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQOxucBBUQAVRzfvhA7cSP8iD8lVaycxjhA4CN8KqTdFPX1K7P/hIiUvMsAz1s/jbnE66fQP2NaT9ZqGtzO2ExN9I6xUIU2+VPIrUGqDDtTxtHcKgsZs09lPkgTYmmCx7nkkrqDJC/FPXmZsUIfDWuLBxjbnNyeBsVeTIP2FPc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dVNfj3xxBz9tkJ;
	Mon, 15 Dec 2025 16:05:49 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
Date: Mon, 15 Dec 2025 16:05:24 +0100
Subject: [PATCH v3 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-lat3st-staging-v3-3-2e4914b64dd8@timmermann.space>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
In-Reply-To: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>

From: Alexandre Marquet <tb@a-marquet.fr>

The firmware trustzone needs a special call to bring up the secondary
cpu core on the Manta board. This seems to be not needed on other
exynos5 boards and comes down to the available firmware on
a particular board.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
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

