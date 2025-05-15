Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705761F3FEB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320226; cv=none; b=bhiTSSMPQUm8Q53iJFQkaD0WUzjws2ZE1qC77/35Rcb8LVBaY/j/9thRWTUOuD1ZFspQrOWk0MjWLM8X7Fr6LB+lYtiYsk1IYN4SjnXkqBtYfoRMFodr2FXDRHKZUcNTE45AsEAFtWVpAQ6v5pyjppCbFSULvS8g9gYGud8WcIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320226; c=relaxed/simple;
	bh=7KnyBf6no0fpHB5ZlMQW0sPJAgngdx7mnb4tL9CM37I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iaeT+eNoZEHCLAu7WxU68yIrJ+J/JXedK5lkfh0bdLiPqYXwrquY8noR/kh5OIQAFsjsXgREJdQnJO6TjynjsKYUA1jGQPL4IYja83QEUVWlmNOra3W9pVbOLksa8JWXbn+jwr/+Dbn8dWRQhlSDgyzK23IOXwv55u7Q+4UVK5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=OyS5encP; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="OyS5encP"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=OyS5encPWeSpjfQSDR8d5+1EwUrba2JUY/JgWBvF1jJl9kZdsTqHg+FmHHNGYGzl8jDjOTQlZA063MIFup08AJBxfmRXaxxf47s4+0apX5wVF67Ys5Q8DGhQ2X/s4krTytK8/ADxZJdgx6fW2YZDRKbMPRxwIb7PGB/1mQVe/pMeCiLWaYtZZLDsvNnCkNDXFbK5dEJgrQIA4XP+ayjG1Nkr2VuG5SfC2ix0LNdlhwrBKE3ZNroUjuUu6AUCwhkZroeMuaTTASzfEb4yxvXC7u9C+hpeuAQnTmkyOSHVukgVEFz6bGdHu20a2pxTgubPmFyGIF9mH5BSphG/mmslJg==; s=purelymail1; d=purelymail.com; v=1; bh=7KnyBf6no0fpHB5ZlMQW0sPJAgngdx7mnb4tL9CM37I=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1985443548;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 15 May 2025 14:43:06 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v3 0/2] USB PHY support for Exynos990 SoCs
Date: Thu, 15 May 2025 16:43:00 +0200
Message-Id: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHT9JWgC/x2MQQqAIBAAvxJ7bsEMM/pKdDDdag9ZuBRF9Pek4
 wzMPCCUmAS64oFEJwtvMUNdFuAXF2dCDplBK22UqQweMmIioRgEV3djVt4H1zZGt9bWkMM90cT
 XP+2H9/0AeyV35WQAAAA=
X-Change-ID: 20250515-usb-resends-may-15-ccda86528773
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747320182; l=1423;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=7KnyBf6no0fpHB5ZlMQW0sPJAgngdx7mnb4tL9CM37I=;
 b=IJKR9zCW6SXgST6KqPgmHhLcdPwUDoyGtSq7TqaZGp8/rwJy1kT0pxDa0FC/nr8cvODAiJv7a
 Gfd9Hmoz7HuCbajakjvOqL/BBIH4pZO705lr0ZiBm6X64ySktCAfgdl
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
Changes in v3:
- rebase patch to apply cleanly again

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
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250515-usb-resends-may-15-ccda86528773

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>

