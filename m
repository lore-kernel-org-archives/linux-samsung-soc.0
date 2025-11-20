Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D826ED53;
	Thu, 20 Nov 2025 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763670064; cv=none; b=nCqXFX4JaNAvZp1/H+LlOIROwLD23qMvUR89bOPfx9irifM+tNB3D4cTu6BF2Xpw6nd9HrsaLMRaltVvEausv6VYmPhElcPEfgb0VTud96xii0qA7xBKeJHnKCLvhBhHJJb5hoCwsHQeifY4vkJFCHUEqnL0ekS1upozZEkeXjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763670064; c=relaxed/simple;
	bh=ee1Ytl2M7w+MHKYd2Pq0/yUbIwpTOXGo+/MJwJx6BmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2PFYgiR+si6ChE3OK0p3B+Rbb+jU6QQpBbVViCHpqqyDMQVR2M+NbhlaVP+6iMiY34vlqa5OxtXVtGlh+yPQZ4ytevKO6Qz2oPl3gjxWYZPOicLbfYjNRU2fPbI4WsCJ3CeMa1QBqFhjxFURtAzlD7oH8x7XhdBlqkaPGvHPP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dC8qt0fJhz9tkd;
	Thu, 20 Nov 2025 21:20:58 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Timmermann <linux@timmermann.space>
Subject: [PATCH 0/3] Add support for exynos5250-samsung-nexus10-manta (Google Nexus 10)
Date: Thu, 20 Nov 2025 21:19:58 +0100
Message-ID: <20251120201958.1970828-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4dC8qt0fJhz9tkd

This patch series adds initial support for the samsung-manta board, known
as Google Nexus 10 to users. The device is powered by
the Exynos 5250 SoC. The notification led driver (as3668) is already 
in the kernel mailing list and can be found here:
https://lore.kernel.org/linux-leds/20251117020008.316648-1-linux@timmermann.space/

The first two patches add the necessary device tree files and
bindings, while the last patch makes a small modification to
allow CPU1 to boot, as it requires a call to it's underlying firmware.

This first iteration only provides basic support to get the board
up and running and usable via UART. We will upstream additional 
features in future patches. All patches have been tested on real hardware.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>

Alexandre Marquet (3):
  dt-bindings: ARM: samsung: Add Samsung Manta (Google Nexus 10)
  ARM: dts: exynos: Add Samsung Manta (Google Nexus 10)
  ARM: samsung: exynos5250: Allow CPU1 to boot

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm/boot/dts/samsung/Makefile            |   1 +
 .../exynos5250-samsung-nexus10-manta.dts      | 516 ++++++++++++++++++
 arch/arm/mach-exynos/firmware.c               |   4 +-
 4 files changed, 520 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos5250-samsung-nexus10-manta.dts

-- 
2.52.0

