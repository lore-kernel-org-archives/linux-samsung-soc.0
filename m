Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B530620E6EE;
	Mon,  3 Feb 2025 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615209; cv=none; b=Lz3tIPwe0gVKAye3MSR/Ys+4+PjbZNt9bVtO7FaesJwXlySWt5Xg1swW98nIqWNnWCVZG+n37NIr+NoBL6dl5/cJN/IrrDVKVkHxj3M2yKzStjp4+sjDFKk7CPjmxKos2b8ZUEJqcldFnLi3P1W/+kM27W4em3hXfOOCLyK2a08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615209; c=relaxed/simple;
	bh=yRoaCKNEQlD6o0GKHQouyJC7CdOjXR24VD3WPrh3Op8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vfjji46BMKYUHrq1zdm8IvfEg0udhQIDKlyxgI/p8TB41Hh21IjOGxaNzLpyDu7XHyCpuvbkuZp2TI8MCX/TDnfhgPbOGmASxQrrpPkrr9FwU2As2eo+t2ctPtEZRiCuNXrbitARHZISRqXvSC3RsK1nBT0KtH9bApGSTI8EzM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IDdOGTvA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IDdOGTvA"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3A2FB25B82;
	Mon,  3 Feb 2025 21:40:06 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNoaU0_hr59U; Mon,  3 Feb 2025 21:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615204; bh=yRoaCKNEQlD6o0GKHQouyJC7CdOjXR24VD3WPrh3Op8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IDdOGTvAMvXbAWeRujMvrxtrF989Lr2k9KefDry2wCfNmfSQxsnTyYk/wL3jSLFA1
	 1ZZG6xaviVLL0PIW1vBmaw5HuworkNAQYn+fMFDOmxz031spFCWdAYZNbpFM0PX7RL
	 vq/RV7eZTtdDBjaseVgWK19o27qDbhmLjlhQBm1YWxiwHqZrYaqKR7Cw0FSeCAKS7j
	 NP0xCKjzehJydxCFRocvlagPwTBMZUWVDuKUIqq5v3aIV2tCQj5jKXCF2aecg5BxnI
	 HCXic/ysjW/moIl2TBPLD9S3EqJLTnZcO3EVBjuf/RlluYbjhql2U4Mn3oyKV1AChX
	 KfrKmeWEW4joA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:09:30 +0530
Subject: [PATCH 2/2] usb: dwc3: exynos: add support for exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-usb-v1-2-a7753f8183a4@disroot.org>
References: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
In-Reply-To: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615179; l=1479;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=yRoaCKNEQlD6o0GKHQouyJC7CdOjXR24VD3WPrh3Op8=;
 b=+ktiE4SZjhVNoYoBk+EPGLxPzpZux+LGOV85hHQifZ6XAfc/lFlX9je3XhSmHK9V6qHfn3Wpn
 fxVgysCtnITANmlXT/K7jZ2xlLqCLDmJo5ZyKuHsg19eHP2I+CcoZ4P
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870 devices have a DWC3 compatible USB 2.0 controller.
Add support in the driver by:
 - Adding its own compatible string, "samsung,exynos7870-dwusb2".
 - Adding three USBDRD clocks named "usbdrd20", "usbdrd20_ctrl_clk", and
   "usbdrd20_ref_clk", to be controlled by the driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f5d963fae9e069e1bd145ff5bd1b704da89fb74c..34f2b9e8529303cd2a957baed5819a45cbcf3309 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -163,6 +163,12 @@ static const struct dwc3_exynos_driverdata exynos7_drvdata = {
 	.suspend_clk_idx = 1,
 };
 
+static const struct dwc3_exynos_driverdata exynos7870_drvdata = {
+	.clk_names = { "usbdrd20", "usbdrd20_ctrl_clk", "usbdrd20_ref_clk" },
+	.num_clks = 3,
+	.suspend_clk_idx = -1,
+};
+
 static const struct dwc3_exynos_driverdata exynos850_drvdata = {
 	.clk_names = { "bus_early", "ref" },
 	.num_clks = 2,
@@ -185,6 +191,9 @@ static const struct of_device_id exynos_dwc3_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-dwusb3",
 		.data = &exynos7_drvdata,
+	}, {
+		.compatible = "samsung,exynos7870-dwusb2",
+		.data = &exynos7870_drvdata,
 	}, {
 		.compatible = "samsung,exynos850-dwusb3",
 		.data = &exynos850_drvdata,

-- 
2.48.1

