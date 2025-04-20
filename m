Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BE020B80F
	for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Apr 2025 19:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745177354; cv=none; b=NZdbfQuztOJCqprvr0A88mY5XAiUw42tXTNOdE6JsttI1hPpQxCYRC6sv83nNKW4RGg8Ptc9r/PIlaFQG7XPhenEJ+U1plM/YxuaJEHXQJjyF0JHXSaPSYlgE6eP+Voad1bbS8iJ0W0A/S2be0vz8GIy5/f43jeBHoukCd5xRts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745177354; c=relaxed/simple;
	bh=yhkfGEEcnbf9CwY/Rpk+yRBtiyW3R/ZeFCf3WAeNpmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KlBg78ZBXbptNYkOEWnQ0K2w9qH/bvCy8Dgv+Nm2gfkBqMVxwwSUj1fNV35LO/l8eCWdp/nTjJ8wsEsR/LHRprnGGlWU3p63wSZUKZKSdOmz2BsoLKPpoLZVgvo9+zUXD5PLXU48tPCRWaLg7pH1NnN40BNPutcyUWMGc0KY3/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=kC6Om7iF; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="kC6Om7iF"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=kC6Om7iFg7lgKg7K5cMA+4Pbk0/FtwzWNG+TTZqCGTBYZp8n2i084deJ+iC5ktCHwblTxMyIvxEqWwfsCjqmEKnLoAQ+IMKQmlXU6GIWitrnVOE+HsaglWd9z3rKOfOoB0MbEMTRNhbS5/WYkvJvKrxGcdjVVL9CcGaeGSyQF7FBIb8/ZYXdnX8uATmvnjHBAnXpGRk3pwltGO2Ze0QaOnIcDIYMdpu/DRZidKYFOyB1h/nWbW/Gb3Okg0wK5bii/6vEjcnL7VhHD1JMhdEk5kEDsfE4z/IZQaX8ndyZDurZLkG9UMIhWkSROzJ/C5JeCTGkvFChDUHr3/RxJ5zSVA==; s=purelymail3; d=purelymail.com; v=1; bh=yhkfGEEcnbf9CwY/Rpk+yRBtiyW3R/ZeFCf3WAeNpmw=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1149203934;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 20 Apr 2025 19:28:42 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v2 0/2] USB PHY support for Exynos990 SoCs
Date: Sun, 20 Apr 2025 21:28:20 +0200
Message-Id: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRKBWgC/x3MzQpAUBBA4VfRrE3dxk/yKrLADKZ0aSZS8u5ul
 t/inAdcTMWhzR4wudR1jwmUZzCtQ1wElZOBAlWhpICnj2jiEtlxOEw3LOuJuBgbDlxD6g6TWe/
 /2fXv+wEXGZFoYwAAAA==
X-Change-ID: 20250420-usb-resends-april-46c2d3b8d0d6
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745177319; l=1365;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=yhkfGEEcnbf9CwY/Rpk+yRBtiyW3R/ZeFCf3WAeNpmw=;
 b=YakDTBXcfdEyDqqwA7lSGKU4ju4xj728i4uc7zQTWyGqm86FxAyUgW2/dQ/+HWaqf+z1E5oeE
 ael57tIvXlEA0pcobeavz05qm1KdMVsR1Hbk0M6OdVIhinscYz2/ML1
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Hi all!

This patchset adds support for the USB 2.0 PHY of the Exynos990 SoC.
This SoC has a combo PHY that supports highspeed, superspeed USB and
DisplayPort, however due to my inability to test the superspeed part of
the combo phy (device always enumerated as high-speed, even on the
vendor kernels/bootloaders) only the highspeed part is brought up.

These changes have been tested and confirmed working (with the USB_ETH
gadget and telnet/ssh in a ramdisk) on a device from the hubble family
(x1s) and also a device from the canvas family (c1s).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Changes in v2:
- rebase patch to apply cleanly after Exynos7870 merge
- collect Reviewed-by tags by Krzysztof Kozlowski (thanks!)

---
Igor Belwon (2):
      dt-bindings: phy: samsung,usb3-drd-phy: Add exynos990 compatible
      phy: exynos5-usbdrd: Add support for the Exynos990 usbdrd phy

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  2 ++
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 32 ++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  3 ++
 3 files changed, 37 insertions(+)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250420-usb-resends-april-46c2d3b8d0d6

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>

