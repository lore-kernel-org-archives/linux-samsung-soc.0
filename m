Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F877314D0E;
	Mon, 15 Dec 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765811148; cv=none; b=CV+ztKNPr11mNovoGpwRaHuk1aZUmXPgzPTRAWxCT9U6n3A9zfZ+fn5qRBLDysEy4fOJfhLoFj9VjKajJ24Zm9SOorQcr0wgucw5LfEUs/jXWeW7eJd36KNNGmZUxMpb2H/DwBoj+yVc1sYw3q07NdjPeeTRwd5k0lPZe+JQXqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765811148; c=relaxed/simple;
	bh=r3suQozgcCgmmzPjxsON2tfMubesauxQ51FUd0nhCDQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LCFuGWNq8lUiD7Yj+oBGUZFjEpzPwe/3tUpIbPMICq+P+YBqDqU66uhkepdHDUpXoC5SLHBZhNULrKCb6QvGZ1Djqpcrw5BT4BR7SL5Y/vRIOf3UFzMUac6W8Ukrlml0mma1G8EehDgW5BUZqmy+Org5JOu6vkS0KIDXKA7EvOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dVNfT20K4z9ss9;
	Mon, 15 Dec 2025 16:05:37 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
Subject: [PATCH v3 0/3] Add support for exynos5250-manta (Google Nexus 10)
Date: Mon, 15 Dec 2025 16:05:21 +0100
Message-Id: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALEjQGkC/x3MTQqAIBBA4avIrBNSsb+rRAvJyQbCwpEIwrsnL
 b/Fey8wJkKGSbyQ8CamM1aYRsC6uxhQkq8G3WqrtLLycNlwlpxdoBikH9dRd35wvd2gRlfCjZ5
 /OC+lfBhQT4BgAAAA
X-Change-ID: 20251215-lat3st-staging-d9c926d8a75f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>

This patch series adds initial support for the google-manta board, known
as Google Nexus 10 to users. The device is powered by
the Exynos 5250 SoC. The bindings for the notification led are already 
in the kernel mailing list, got recently applied and can be found here:
https://lore.kernel.org/linux-leds/20251125114015.355487-1-linux@timmermann.space/

The first two patches add the necessary device tree files and
bindings, while the last patch makes a small modification to
allow CPU1 to boot, as it requires a call to it's underlying firmware.

This first iteration only provides basic support to get the board
up and running and usable via UART and with WiFi support. We will upstream additional 
features in future patches. All patches have been tested on real hardware.

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
 arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 511 +++++++++++++++++++++
 arch/arm/mach-exynos/firmware.c                    |   4 +-
 4 files changed, 515 insertions(+), 2 deletions(-)
---
base-commit: d5f0e9098499869354aacb5b080f602f0399d396
change-id: 20251215-lat3st-staging-d9c926d8a75f

Best regards,
-- 
Lukas Timmermann <linux@timmermann.space>

