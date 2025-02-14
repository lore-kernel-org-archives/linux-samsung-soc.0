Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1977B268687
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 17:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739553988; cv=none; b=kssh4DgQJBE7p6G05bsm3bYhbcRShnYYb+Z5v/ciz9RLME802JehRVzsPAkXc8gKs6DGHWL8iOvOjJPlDDXG6rsPmZJ64eowMGaODc+7P6QX4u5eXMFboApcHi8P1BhEOBwoqTY4IodyLzLKgPjN1C1M8eQCpPJongNULpzZiUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739553988; c=relaxed/simple;
	bh=5X9po93482aFLpIrgTxkENTzyprq/G/AXnwXeW493MQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q93ifBWSZMsUmTxuMKsHv7NcMGnrsZyf3tVRUUiMeY7lG1t1Rq40K5PV8QqRPWqMSzaTjf/hYN8cdsPyGK8oFIrnZEFtVk5bzAXIRcnN/EsUAPKBOlC97El87g+nr5uUjH2sfOjlSUad1QM+TxXtseHogyBRH5bMx5mjCkO+m+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=kYADpheO; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="kYADpheO"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=kYADpheOkBDJni8Szoosijy04sibwNBeGQWE6vO7rL/BnzUnasL9y0+BSK+2Y2bequjxW0dY8mrDVQ6GGQMXedpnchHOawMFYUx2lOqg1TPy+P2CJ53/obEdHc3UciJz1CUsJFfDY1q20HbP1JWlk1y03SyDOGxYWe71GCWnQ9w/W7E+H3xRdJ2j6cyzxuvSWAKAp+GibSYVni4g4sgyDKVi4PCIq3xxgCgYaAETr5zGsXJJFOJv/8WXJOANaYSU9Oh/vN7zZocWMpN/2vZPc8jA8824iS82U6OxT14t1V6REiPY0s2VTXTXxFCEsdU3YQCsSO3yXbBatu74Dei+QQ==; s=purelymail3; d=purelymail.com; v=1; bh=5X9po93482aFLpIrgTxkENTzyprq/G/AXnwXeW493MQ=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1457029256;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 14 Feb 2025 17:25:49 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] USB PHY support for Exynos990 SoCs
Date: Fri, 14 Feb 2025 18:21:06 +0100
Message-Id: <20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJ7r2cC/x3MPQ6AIAxA4auYzpIU1AGvYhxEqnYBQ+NfiHeXO
 H7DexmEEpNAX2VIdLJwDAW6rmDeprCSYl8MBk2HRreK7idEsRaVvw5xqnEasbPGOq+hVHuihe/
 /OIzv+wHja1l7YQAAAA==
X-Change-ID: 20250214-exynos990-dwusb-3b1005929bd1
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
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739553946; l=1223;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=5X9po93482aFLpIrgTxkENTzyprq/G/AXnwXeW493MQ=;
 b=6ZfuY4P71D86TEPrjhPZjctQE9+ZypUwPq2J3pR9ULWDbxiK2N+X4bZ+QTsdcnN8fRhpMtiuS
 VNy1XxJ654VCw2hwiOUwmEWUJMEVf8Mv/oFb8QAjlzIa7YoHhWgLZ//
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
Igor Belwon (2):
      dt-bindings: phy: samsung,usb3-drd-phy: Add exynos990 compatible
      phy: exynos5-usbdrd: Add support for the Exynos990 usbdrd phy

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  2 ++
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 32 ++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  3 ++
 3 files changed, 37 insertions(+)
---
base-commit: 5cbcf2652f4cd84eac21f5e88fe2a0baecc601fb
change-id: 20250214-exynos990-dwusb-3b1005929bd1

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>

