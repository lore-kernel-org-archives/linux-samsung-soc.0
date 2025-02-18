Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA86271294;
	Tue, 18 Feb 2025 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904930; cv=none; b=kd7rI2rISauV5m1kdSb289EEgt8NtrJp9VSs/I9gv7CMDvg/ocwH98BnIz+wDPdw8dZEcNCC1lcgtuI05A558qI2iunhm5NbpCm/X+H9lhrn6TPcL6N3TG7zH/Vmnz6YYeGA5dsKEyYjRZ504JqoPS8gglbrqp0aZA9C5NcMdQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904930; c=relaxed/simple;
	bh=2uuzNDF6TRQwOUmOokoBVZvzfGe6+SMZJha/nrslQoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JzwKjrWFpGltV7RJvi3iahiLNpF2hXn59UE6seQQix1u4e7DCwyRxFY1vpzWM1bYtIWMjF7lD6qu8vLkF+r7aIZrnkxzjnP7gHP6LR1z7uK/kgiqjOIwKQyn4CR0PWufLRVAZcaBzeLKnC9XnVU9zk2WPLfHWyNO25eh+fSg5jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=azCDGikT; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="azCDGikT"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 681BD25F43;
	Tue, 18 Feb 2025 19:55:27 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Rq9FsMmw4DF; Tue, 18 Feb 2025 19:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904923; bh=2uuzNDF6TRQwOUmOokoBVZvzfGe6+SMZJha/nrslQoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=azCDGikTTOkVBEfcJtHreO+htcsv5WBdSgcF6PRV89z0jw1y33AINRxQLcvgioa55
	 N3VrauH9Fwqt4ee3cEKwXNSSa0fYkbg6ljdNVpPz88ioti+qsnjqw0Nx8BMNyKTgk4
	 lVchcJLYwGXAlZ/yF/spzfdZd+JUMTcHczCux8N59YoAc4H9R2AQ1jE04yV1G2iSP5
	 12bvg/EJU6Py8pZdI54DYyeFXWG5ANHnXtJZvDdMFbRK3RyNUel4qBjqzJqvE8/Z+2
	 UVUZlK6BsVcL9eUUDhnuQN+oSUC26Dz6ZXM3xFELhZ/jFt17IXqE8nx24TtM5hYJI8
	 9xuC/9veOrBIw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:24:43 +0530
Subject: [PATCH v2 2/2] usb: dwc3: exynos: add support for exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-usb-v2-2-1de41a89c9d4@disroot.org>
References: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
In-Reply-To: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904902; l=1429;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=2uuzNDF6TRQwOUmOokoBVZvzfGe6+SMZJha/nrslQoE=;
 b=RayIfUsA56+Ryke4XCCdqVp80lSZQhMVZho+Q5GWcSVGnEVaHCG08SN1ccbileBjBWOf0+2yb
 gtyygrTFZYqDz/UbxyQhze2XgO8e3Rhw0d6n5Es9bVbD/wZDFLvjnhx
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870 devices have a DWC3 compatible USB 2.0 controller.
Add support in the driver by:
 - Adding its own compatible string, "samsung,exynos7870-dwusb3".
 - Adding three USBDRD clocks named "bus_early", "ctrl", and "ref", to
   be controlled by the driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f5d963fae9e069e1bd145ff5bd1b704da89fb74c..ca8d2955303c589ea03a261944aadb6582c9cb9f 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -163,6 +163,12 @@ static const struct dwc3_exynos_driverdata exynos7_drvdata = {
 	.suspend_clk_idx = 1,
 };
 
+static const struct dwc3_exynos_driverdata exynos7870_drvdata = {
+	.clk_names = { "bus_early", "ctrl", "ref" },
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
+		.compatible = "samsung,exynos7870-dwusb3",
+		.data = &exynos7870_drvdata,
 	}, {
 		.compatible = "samsung,exynos850-dwusb3",
 		.data = &exynos850_drvdata,

-- 
2.48.1

