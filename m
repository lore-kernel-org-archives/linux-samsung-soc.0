Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5520E02E;
	Mon,  3 Feb 2025 20:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615233; cv=none; b=to5RoeHKQRISET71srs5IvRoIbMFv9q7KaTOyMEKTdaqU9D/NuZovjoGVnujg3OWOWGXQd0SaawnDFEUZ58u5PxSDy+/5Lrysk0ALOHyteXgaEKi87aQBzDI1T3iSK8ePUqi3nE8g/+x9TzpEJL9oN3gaDIm3qrHaUnhtwLloBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615233; c=relaxed/simple;
	bh=AkPRmblrUOOVXZ91gnc52sI3tgoBiuHlcUurwYVKLY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bw85WbxtaIafGz7h0s/JsqhvXOl4QqWTHeqFyEnX8TEN35VYDyUelQSL/1NiT4d5jMNSkOfNheQM+9QyKQl663wo2Gu+FC51PvDVwy+m47bSgiaJeIcYTGcEXuyf6arn0xo8TmWWAjhfRUTMgg9hsavRlpEmMkPqW/LRpF+jTFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fHtnpKiD; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fHtnpKiD"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CF7B725BBD;
	Mon,  3 Feb 2025 21:40:30 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfZRGKwjVLFZ; Mon,  3 Feb 2025 21:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615230; bh=AkPRmblrUOOVXZ91gnc52sI3tgoBiuHlcUurwYVKLY0=;
	h=From:Subject:Date:To:Cc;
	b=fHtnpKiDOv28oFR7JVPqLvyt59QVIzHKJmPv7rvnS4zqiQZic7IKkhAHOmyaiGxBB
	 zIqp9YHq4hlr9JrmwnOfNDPqV1MpXR2YdWgVhjRP1ww35UxCtcuqz0y03VqHy2NhTA
	 8jRmv1P8XbAxL4uBGpzFRALM1KvNjIizSI3VvGE6VnfBg3mEOHEci25G0s/H7F4jwo
	 v1WiM+ylflQioY62JwDjCj2sMioiAZ1Mu/cvP+zIYmNLpvIHkc8oOU8CfWH1XHRQQf
	 isiz+2xYQXsnFaexHnsoZI+7yGSj+WWJeM53Rx+RPfJCBn/oT/OZ+/fYcAEL14ONlQ
	 OwUuq0AxC120g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/4] Introduce USBDRD-PHY support for Exynos7870 SoC
Date: Tue, 04 Feb 2025 02:10:11 +0530
Message-Id: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKspoWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3dSKyrz8YnMLcwPd0uKkgoxKXbMkSwtLY7M0ExPDFCWgvoKi1LT
 MCrCZ0bG1tQDfBpWXYwAAAA==
X-Change-ID: 20250203-exynos7870-usbphy-6b98936f441d
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Vivek Gautam <gautam.vivek@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615219; l=1055;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=AkPRmblrUOOVXZ91gnc52sI3tgoBiuHlcUurwYVKLY0=;
 b=nZ4OheKh0t1I4Djk2ZABEi1usrJZA4r9kSOSyOS3OeA388Wk9tRtYq4a96VjUCnYGi9UjEd+o
 ar6RvYqtM0IDhMQy3xWW1DmIufvI+ZwlTTxZYZnq2blK5Q0tenvdMNo
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Apart from introducing driver support and documentation, this patch series
also introduces a masking fix and non-functional changes.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (3):
      phy: exynos5-usbdrd: fix MPLL_MULTIPLIER and SSC_REFCLKSEL masks in refclk
      phy: exynos5-usbdrd: use GENMASK and FIELD_PREP for Exynos5 PHY registers
      dt-bindings: phy: samsung,usb3-drd-phy: add exynos7870-usbdrd-phy compatible

Sergey Lisov (1):
      phy: exynos5-usbdrd: add exynos7870 USBDRD support

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |   2 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 407 +++++++++++++++++----
 include/linux/soc/samsung/exynos-regs-pmu.h        |   2 +
 3 files changed, 339 insertions(+), 72 deletions(-)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-usbphy-6b98936f441d

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

