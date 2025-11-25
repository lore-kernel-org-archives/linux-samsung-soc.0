Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0A3254AD;
	Tue, 25 Nov 2025 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083580; cv=none; b=Z/tvQ63tfozIqskRr5VkTKApu3+K2W4cha4lR4S3+Nc9Br68HjJq5n+JoWQcKlly3JVqcB9dOK/p+GIMLWlKRBakXUdsmeXkcqWOF6FBXouo90cBMBAALLCiBMCqC9pQOAZ335hhB8XylSkX6F1IjaezIZdiqQAGQERonA7LDAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083580; c=relaxed/simple;
	bh=52nwkri5zEPXSLbRcRahQUz+KdOaiUGi1d7Hr32ZuHE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WCsuAG6H2MKRgzt0Xr8Pf6hGiHCaRFwRdL/e6Ujwc7dV4HscBRtpqsV98WVNPmD+wxJx+2mhU3GLFjULPbfT9VFfvfmEivsMObWlCePWTSsa5CuNuByYMb8LM+zvXJFmkbZ5L80bSHddmo91QRLRmw6z3W+9ENSCadPy5OuukGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dG5m31DRLz9twg;
	Tue, 25 Nov 2025 16:12:51 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Subject: [PATCH v2 0/3] Add support for exynos5250-manta (Google Nexus 10)
Date: Tue, 25 Nov 2025 16:12:39 +0100
Message-Id: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGfHJWkC/x3MQQqAIBBA0avIrBNUErGrRAvJyQZKQyMC8e5Jy
 7f4v0LBTFhgYhUyPlQoxQ41MFh3FwNy8t2ghNJSKs1DSuFAfrp4O26sHjVKY70U0JMr40bvv5u
 X1j5BFZOcXgAAAA==
X-Change-ID: 20251125-google-manta-79545e179d10
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Rspamd-Queue-Id: 4dG5m31DRLz9twg

This patch series adds initial support for the google-manta board, known
as Google Nexus 10 to users. The device is powered by
the Exynos 5250 SoC. The notification led driver (as3668) is already 
(tho not applied) in the kernel mailing list and can be found here:
https://lore.kernel.org/linux-leds/20251125114015.355487-1-linux@timmermann.space/

The first two patches add the necessary device tree files and
bindings, while the last patch makes a small modification to
allow CPU1 to boot, as it requires a call to it's underlying firmware.

This first iteration only provides basic support to get the board
up and running and usable via UART and with WiFi support. We will upstream additional 
features in future patches. All patches have been tested on real hardware.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
Alexandre Marquet (3):
      dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
      ARM: dts: exynos: Add Google Manta (Nexus 10)
      ARM: samsung: exynos5250: Allow CPU1 to boot

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm/boot/dts/samsung/Makefile                 |   1 +
 arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 516 +++++++++++++++++++++
 arch/arm/mach-exynos/firmware.c                    |   4 +-
 4 files changed, 520 insertions(+), 2 deletions(-)
---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251125-google-manta-79545e179d10

Best regards,
-- 
Lukas Timmermann <linux@timmermann.space>

