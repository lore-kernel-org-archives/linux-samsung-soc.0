Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED32230BE0;
	Fri, 28 Feb 2025 19:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771682; cv=none; b=eBymowVvuE/wq0Zv9kQcukZM06ifur+IbrQ4MgUH2TCt+rhFr6PbTK895NgFv6EWvvwElfMxpaUZ6sy0ECg9njI6OOtGlVhClLPiNVyas9UTObHNsl5EVsoeEhs4AIUUf+gKxE1chHCxJX8jYwARfdpIjt96/Q9QzbRJq6zJjAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771682; c=relaxed/simple;
	bh=BiBigTqt8TxXxiRZ0NYHm86L7pUNCmwu0CPsw+p8UqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UDViUiyPWmz8Om3ZhqRo4nySkl4o1TG8CwwajPgNpqgZ/3pmi+9i0gJkXsBtlfxnpQayVe+2hrEio9fajWDE4tqd3qZMVjfHZGnizTssaHfr7wDuvVHAKssxbUPPB7KimwzJkghkoiMTscn7xjJQEtRblZl1AWAZOGwdHcx4CVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=R5T1sqae; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="R5T1sqae"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B6D8A25CD9;
	Fri, 28 Feb 2025 20:41:19 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPnDd409B9_6; Fri, 28 Feb 2025 20:41:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771666; bh=BiBigTqt8TxXxiRZ0NYHm86L7pUNCmwu0CPsw+p8UqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R5T1sqaeEwRSA3aKrXdM6bg0s9JriYy5R1fmUMz2JZlyaZbmuJKsEB/TRAUQNtEXD
	 OST4sZojIjlkefktL7Z+LiMtZz2fRUYTVItKcsVFJ/ekh8z46A0KvweRsHvEaFbiAN
	 xtlSDQEb0KxhwzXR0ibh8opBFhCjvlVba7+0THhIEPKDNlOvaBpV/+rMlX9Ya7DRmP
	 d+XAlh+xxwru+M+QksmAFiLfQQsspdoNnMEI0OyPdnyo3vTphKdASXR35XqjxJC+aL
	 dqgPdHOmbQdARUzTbrPaOrDJPNk/9C/VyMCFtVgJr3qwuA2yemdcgr0NsHzl65oFaW
	 HxHpmwfDLA/sw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:10:34 +0530
Subject: [PATCH v3 2/2] usb: dwc3: exynos: add support for exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-usb-v3-2-f01697165d19@disroot.org>
References: <20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org>
In-Reply-To: <20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771646; l=1481;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=BiBigTqt8TxXxiRZ0NYHm86L7pUNCmwu0CPsw+p8UqU=;
 b=l0L0dn1tIo7hFnxq4a00quf2NREVzikRU26jic1aXw3waKV/qaUPKdq5+/xCNMIeGD/ZfQuia
 ba9V6DJBF4BAZ+QMRMtQJDTOZmiR9ChOCiPYMKl/N/0fLEj3HrMcB4g
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870 devices have a DWC3 compatible USB 2.0 controller.
Add support in the driver by:
 - Adding its own compatible string, "samsung,exynos7870-dwusb3".
 - Adding three USBDRD clocks named "bus_early", "ref", and "ctrl", to
   be controlled by the driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f5d963fae9e069e1bd145ff5bd1b704da89fb74c..de686b9e64046be12e52c87d80282558ac5b5f52 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -163,6 +163,12 @@ static const struct dwc3_exynos_driverdata exynos7_drvdata = {
 	.suspend_clk_idx = 1,
 };
 
+static const struct dwc3_exynos_driverdata exynos7870_drvdata = {
+	.clk_names = { "bus_early", "ref", "ctrl" },
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

