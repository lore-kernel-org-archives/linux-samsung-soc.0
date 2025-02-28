Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80BD1C175A;
	Fri, 28 Feb 2025 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771663; cv=none; b=CvxdhDMyjNOpYuXI8TIhAP3++yZUvbMx+sWg6ZaOqOzie8jpo8A6mSW4Hs+4KuECfASKPRDQ/a6oUh416m98RapQ3R7pfj+NSaJc+otF8LTgzDVoH7swL5xP76g2dZVN0B0GBAjjUTuR6FEIBMpT1mql1R7m0u8etRXq9BjYd3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771663; c=relaxed/simple;
	bh=qU9iA+vOEzeMzvDuuOahSaEm6XWe+bK8zvzRf3k0HB8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tAYPdXaiMNMPTjt7+wkHlQNNtqlUiQwcvvj2Z/9YX1rJAMiFHOQNE7OZiKI42708VzmE0BNfyEaIzjRTr/dkUqE6kThKArsQS85P/7rAVthE4pfxe+O+/B7em5z/0XitiX+LbQBr/j8UhmDKQbr4C3XY5AG8oRAOH948Z39eWNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=E7yY5a1Q; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="E7yY5a1Q"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4575C25E98;
	Fri, 28 Feb 2025 20:41:00 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CP8WZkex-2mA; Fri, 28 Feb 2025 20:40:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771653; bh=qU9iA+vOEzeMzvDuuOahSaEm6XWe+bK8zvzRf3k0HB8=;
	h=From:Subject:Date:To:Cc;
	b=E7yY5a1Q7oZfqavegTjbD/PLDQRnN6cc4E8ASgnqLVOSJ4SW/RsuiztIjb+/xqCVg
	 Jx4/rSJ6wtutrloYrYvAUNKZUWhY7epgvDfoPEh4ZxVi5MyZemazZfu4Ajx9+IjzBP
	 OLPnqPnJk3UIrRsHRweq+vHybMq7UM+kwDGO1Da7kp3aRRwHUvRHmEnWevvKP6DafZ
	 PepAH1Nrr3Uwme+dF0MtOcJCrsCQOaiZcC1EAPdQXrG0XsE/1+/M4DRLPEKZdodvwj
	 ZBYOUkq94KvtAUTMfT7g7qFzNaFzf963hbrWGrfg3BeWSzwyjvYAeu9n9RPZg8vrgU
	 98WcoRpQFrkMA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/2] Introduce DWC3 support for Exynos7870
Date: Sat, 01 Mar 2025 01:10:32 +0530
Message-Id: <20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADARwmcC/2XMSwqDMBSF4a1Ixk3Jw5CkI/dROkjNVe/ElMQGR
 dx7o1AodvgfON9KEkSERG7VSiJkTBjGEvJSkXZwYw8UfWkimFBMMElhXsaQtNGMvtOT2k46BV4
 DWEXK6RWhw/kA74/SA6YpxOXwM9/XL1Wfqcwpo05rJTvDjXR14zHFEKZriD3ZsSx+AG7/AFEA7
 qHmztjW+hOwbdsH31MVuO8AAAA=
X-Change-ID: 20250203-exynos7870-usb-9f3a5ed7ee95
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771646; l=1071;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=qU9iA+vOEzeMzvDuuOahSaEm6XWe+bK8zvzRf3k0HB8=;
 b=HdyHH2oS4+fYxV/sBoU6KiRXywgEMncCSjxdSQ5dnur8HRqdnsL+GcHXAMImN9MhWfJuuPBNK
 CYqkKhHcxjJCvtXlpprtMcSWBFEGN0yGLvgEbPKTVM2NiVFnG00KQ6/
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Switch positions of "ctrl" and "ref" clock names.
- Link to v2: https://lore.kernel.org/r/20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org

Changes in v2:
- Change compatible string (s/dwusb2/dwusb3).
- Rename clocks to "bus_early", "ctrl", and "ref".
- Set 3.0V regulator as mandatory.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: usb: samsung,exynos-dwc3: add exynos7870 support
      usb: dwc3: exynos: add support for exynos7870

 .../bindings/usb/samsung,exynos-dwc3.yaml          | 28 +++++++++++++++++++++-
 drivers/usb/dwc3/dwc3-exynos.c                     |  9 +++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250203-exynos7870-usb-9f3a5ed7ee95

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

