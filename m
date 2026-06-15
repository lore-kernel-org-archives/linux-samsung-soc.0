Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73FC3B47E5;
	Mon, 15 Jun 2026 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555239; cv=none; b=mpmUVKjNwgi4LpStSgKkERHZioplmAw1ttlC4uQodhhorX1xeWiVG5fp0n0dcD1Rhrv9LWAXnf5zhbKE5blwdlHwpHX46YUtVssgCge+wAGJisJKxK1kdG5ML4vQiJus0JQjreXbUB9bvrJK/ouqnM4lB1dm3K6u1m3OkgT8PgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555239; c=relaxed/simple;
	bh=StJprQUXPLF2w+0F2m9K2mAV2YNA3SRi2UqMMHT9HXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MCkUrMP2+g8es+YaQ7BmAYgHL5ky56hc2Voby7L1JRpCyrXGRm8mUD0pICvZokaxMhqTkfsFKzkevFAaJzA2zllyClP0PrThptwsnIVv6Napo0Jmf18TS01bWDv+zqW/n+j7ZeznIUq+OL3LZQi/laHBSC7qeS8wkqj9hVyprqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Oo96zeec; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Oo96zeec"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 54F862745D;
	Mon, 15 Jun 2026 22:27:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-HTUCdQRqUh; Mon, 15 Jun 2026 22:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781555236; bh=StJprQUXPLF2w+0F2m9K2mAV2YNA3SRi2UqMMHT9HXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Oo96zeecAUWrTOD71oH/asz0aBEE+/g1nUp6b9fggQWC1INQ2f+4wvyjzxnXaFahL
	 pQg+Oej7jWxqft57j2OntsRFW3XAF6oeWqWQFgph1TkGuSqeSduD9YKduBFOi0kjhJ
	 V7U3wLWkr8izOy7/+Fz+k+usrygVIzTVQyC0pEGTvKgSQOrpCnUxzc3QD5px0J0aRk
	 k915ScXKU4CIKOVpbOvdLcAQ4EzD8EfoB9t2S3S4NtKx7bJjlVTvqwyB+wqS8F/5wb
	 W8VlYlf29vi7cUYfCRs8wYj8HYxf3hh6e+UrRKDoQxcD9o6AcC5drUrcXZGMYtXgu5
	 XdDOnucZjml9g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 16 Jun 2026 01:56:45 +0530
Subject: [PATCH 3/3] leds: rgb: s2m: use multi-led node of mfd as source
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-s2mu005-pmic-supplement-v1-3-41e84518b711@disroot.org>
References: <20260616-s2mu005-pmic-supplement-v1-0-41e84518b711@disroot.org>
In-Reply-To: <20260616-s2mu005-pmic-supplement-v1-0-41e84518b711@disroot.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>

With the provided compatible string, the driver is able to use the
respective node to initialize following the properties in said node.

However, the compatible node is removed from the devicetree schema.
Follow the same in the driver. The soruce node must be, as per schema, a
sub-node named "multi-led" in the parent MFD node. Initialize the LED
driver into the sub-system by fetching it from the parent node.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/leds/rgb/leds-s2m-rgb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/rgb/leds-s2m-rgb.c b/drivers/leds/rgb/leds-s2m-rgb.c
index d239f54eee901..aa7e739213568 100644
--- a/drivers/leds/rgb/leds-s2m-rgb.c
+++ b/drivers/leds/rgb/leds-s2m-rgb.c
@@ -366,6 +366,7 @@ static int s2m_rgb_probe(struct platform_device *pdev)
 	struct sec_pmic_dev *pmic_drvdata = dev_get_drvdata(dev->parent);
 	struct s2m_rgb *rgb;
 	struct led_init_data init_data = {};
+	struct device_node *multi_led_node __free(device_node) = NULL;
 	int ret;
 
 	rgb = devm_kzalloc(dev, sizeof(*rgb), GFP_KERNEL);
@@ -392,7 +393,11 @@ static int s2m_rgb_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to create mutex lock\n");
 
-	init_data.fwnode = of_fwnode_handle(dev->of_node);
+	multi_led_node = of_get_child_by_name(dev->parent->of_node, "multi-led");
+	if (!multi_led_node)
+		return dev_err_probe(dev, -ENODEV, "RGB LED node required but not found\n");
+
+	init_data.fwnode = of_fwnode_handle(multi_led_node);
 	ret = devm_led_classdev_multicolor_register_ext(dev, &rgb->mc, &init_data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to create LED device\n");
@@ -406,12 +411,6 @@ static const struct platform_device_id s2m_rgb_id_table[] = {
 };
 MODULE_DEVICE_TABLE(platform, s2m_rgb_id_table);
 
-static const struct of_device_id s2m_rgb_of_match_table[] = {
-	{ .compatible = "samsung,s2mu005-rgb", .data = (void *)S2MU005 },
-	{ /* sentinel */ },
-};
-MODULE_DEVICE_TABLE(of, s2m_rgb_of_match_table);
-
 static struct platform_driver s2m_rgb_driver = {
 	.driver = {
 		.name = "s2m-rgb",

-- 
2.53.0

