Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731922ECEB9;
	Mon, 23 Feb 2026 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861248; cv=none; b=P3oSEOAYBPDbscbAy2YI0WsPtSegDuwuI7BAhlpLbpB3RsZj3JcSCz5rBJXQCuQwiun4b1fUN/u4vE4BMDCzp7fnM4Ylkfoh6fmHszEWVXIkoQmAEZYRGqYsX3m5e7jC80KJaEPUKee1a/0JPRkB1Idt6CK2pPFpt7eaatjYL9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861248; c=relaxed/simple;
	bh=J7TrUkJ10ZPlFSfZ/EvR7bLJaQkkANP/Pmv4iXB8JrI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jPv/kErhg/tCma36GNCq2bOjXV4UJP8K6GHsS7fUgwztkofPSHpVI3lJP47Q6lEMbW6ApV57oKPK4BT5snAzsA9orh10kf1qdLRWYfSYi3BgrnMnyXYPgn2wiDZe64S8f6IRYpxaLb8/e1l/ItmjykhvR3lEnRum9xbfCwjtDSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fKQ6Y1d0Zz9tQk;
	Mon, 23 Feb 2026 16:40:37 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
Subject: [PATCH RESEND v4 0/3] Add support for exynos5250-manta (Google
 Nexus 10)
Date: Mon, 23 Feb 2026 16:40:25 +0100
Message-Id: <20260223-lat3st-staging-v4-0-219638defb01@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>, Henrik Grimler <henrik@grimler.se>

This patch series adds initial support for the google-manta board, known
as Google Nexus 10 to users. The device is powered by
the Exynos 5250 SoC. The bindings for the notification led are already
in the linux-next tree and can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/leds/ams,as3668.yaml

The first two patches add the necessary device tree files and
bindings, while the last patch makes a small modification to
allow CPU1 to boot, as it requires a call to it's underlying firmware.

This first iteration only provides basic support to get the board
up and running and usable via UART and with WiFi support. We will upstream additional
features in future patches. All patches have been tested on real hardware.

Changes in v4:
- Changed copyright years to 2026
- Rearranged includes
- Added comments to bmp180 voltage sources
- Refactored serial2 output
- Rearranged multiple properties of nodes. (@krzk)
- Rearranged nodes and subnodes. (@krzk) (@david)
- Fixed mismatch with firmware address.
- Fixed dtb check errors
- Added cpu1 power supply node.
- Renamed multiple subnodes.
- Removed i2c_0 for now as it isn't used.
- Fixed wifi interrupt.
- Added empty lines where applicable. (@krzk) (@david)
- Deactivated serial_1 for now.
- Link to v3: https://lore.kernel.org/r/20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space
Changes in v3:
 - Added a better patch description for firmware patch. (@krzk)
 - Reorganized nodes in DT. (@krzk)
 - Fixed memory node to use separate entries. (@krzk)
 - Renamed pwrseq node. (@krzk)
 - Fixed firmware checking for old dt compatible string. (@pavel)
 - Link to v2: https://lore.kernel.org/all/20251125-google-manta-v2-0-0f097cfff39c@timmermann.space/
Changes in v2:
 - Renamed to google-manta (@krzk)
 - Link to v1: https://lore.kernel.org/all/20251120144018.961604-2-linux@timmermann.space/

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
Alexandre Marquet (3):
      dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
      ARM: dts: exynos: Add Google Manta (Nexus 10)
      ARM: samsung: exynos5250: Allow CPU1 to boot

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm/boot/dts/samsung/Makefile                 |   1 +
 arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 564 +++++++++++++++++++++
 arch/arm/mach-exynos/firmware.c                    |   4 +-
 4 files changed, 568 insertions(+), 2 deletions(-)
---
base-commit: d5f0e9098499869354aacb5b080f602f0399d396
change-id: 20251215-lat3st-staging-d9c926d8a75f

Best regards,
-- 
Lukas Timmermann <linux@timmermann.space>

