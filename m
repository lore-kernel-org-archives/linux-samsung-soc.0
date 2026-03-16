Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591533921E3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Mar 2026 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773666694; cv=none; b=RoCPtRSzpNoAuf5IlZuYdFoPC6MRkG2Wb0u3lJ/htC+6Hbo6aDF+Z7p/U0cZ3urVF8J4sFaUjtjd7rDewMlz131T2R94YPIum4PYv6p3XKK50mO9yDq03KL86gQepqjyYMPyHNoB2VtEhyHJ2in0kR+W60cPhMrFN8Oyc14H9dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773666694; c=relaxed/simple;
	bh=grNch3YEfme4XX2YLfL8Yx6byNhRmXe/JTenfdWfyZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ugyU4u18x3o7f7jWpMfFblq7lKfX3RHTmW4BbkhAmgvxACiTyIWymIufChdjEQ40ZTM7BC/b6e11RHIU0KnT1w9XLhSQHMWWgGz9BwZ6cELY7LwVjc1IX48Cp/tz/2SgjTaxEokiL/Vr1H8bFOIRbCgiTz7qyObw3VLZX3MgW8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzMp1t8F; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzMp1t8F"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b05761bec1so3995165ad.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Mar 2026 06:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773666693; x=1774271493; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1b1jbbseevrfxoqPkF+lAWkN6R2Yw+sAuGiH3k9yEI=;
        b=RzMp1t8FYSB9MrbafAUwN6ckheYov7KMXIT63vQngsz848FSAsPLasOuMnIqkOL5Xv
         /OgeppB9yqzmvnprIjHMWwBmfCRRn9D703KJKy+GulolC0aTAk+BtuPYOfAQ8kWed716
         5JcYKJ7K//UEFsVCHYvtqhS1WoO0U98OIFnc96hnIhHOKWzNWpzIrc52G9v5rsucZQSs
         E+BPR27tXOlU+J474QrTxae+spCO0u+PnI7md0bZVfHu7EqBEoHqw79sKHIW+FiF+GGE
         WVJw9PZgG+KOEx8e+30Ed0FrImNMk5N8Px1iJK/QwUDRw15SN5I6vr85ntW4CGZ0/FJI
         ZBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773666693; x=1774271493;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1b1jbbseevrfxoqPkF+lAWkN6R2Yw+sAuGiH3k9yEI=;
        b=pVMJ+PDABiGamaBWVhp6tUuXIalmebtq2ByLzBmejeYIZRhOUFqS24VKEn+KO48qsQ
         AQhC74Ovn2JRWjfx4U2oDlPnOQbt0+ygYMGpZpK8pScOniAbwPZZeU6rDQb57KpGJRmN
         cexbJCKi832lyfSlI2l73k3YuniLUHEBQyAHiELfzpL01IRdF0bGYeMFPsyaMpGis89b
         YVFHYwHPNbi6oUlG9BohrPJjrMLpM3bmzZEiTvryEAREsnEdQ9Fvh1W5BcaqKaGotrer
         FxyXTcKSB6sKjfArXvr19bwjwXVpTeVZF9Az4RqT5lAE/OXjTmNpbQOTWWs22HC6r9la
         TBDg==
X-Forwarded-Encrypted: i=1; AJvYcCUFB0k/lUPUex95QK6zf9r3I5WxutZoI8pAY0ODvgFzw4R1lgYoLFA1b23znd8Kbdqa3TmhA7DASJNW59NYstQlrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkrieLT5eCooF9wliE5oLCR8K4cW+sw9oQ+7EMTbgSbbgN+Jqr
	Ivica/sus6S5/7olC1UwPfV5oCl7uTd65GzMf8fR6wkveFv5l2ykbbN9tUOcZWI1BBo=
X-Gm-Gg: ATEYQzw3fb8HCz2llpdld9snA8tZcYUXSbzif3cLMfVORskdAa1rCJpTOWePb2yk3aJ
	jo2kzq/BqkOaCrBcl6DsQ89eXeRlJAg7JPI0JQpX5yOxpLazdrfT0fyHE5q1y9l6UQEXGIvkRJS
	BztaJW0rTxeyXYFXogOzCx4x3rRGwEazlgeEIgIdGHd3R1oHD72bZUl/BTn0hmiUcq5JBhVuYpM
	1Qm20MQY1c6Xtw+bIRIMYLHMogcbtCvVKAc2Pjl0fBM3dArJr2evvd2sRliNDeEgjtNusWRX7mJ
	7wQtsFDm3sIfQeUVsxV53ggDkRTEUXTLWZ7tfp74gUOqdoG7tSzYleuVNhkt0pnlZFJOOn/oVw1
	P32/r/SeOu5yEJOKybrglEif/xrBk9mK5tcsZT4fqSj+CBGKAJTbTuvpdoxUZ8I29anV0ILuiJE
	oOFStXQDh4WYherqVbnPOv8yAgBaFdbpLg5lcF
X-Received: by 2002:a17:903:1a0b:b0:2b0:4d7d:fb9a with SMTP id d9443c01a7336-2b04d7e03famr53040625ad.26.1773666692409;
        Mon, 16 Mar 2026 06:11:32 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee3d6sm110144905ad.57.2026.03.16.06.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:11:31 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 16 Mar 2026 21:11:26 +0800
Subject: [PATCH] phy: google-usb: Fix runtime PM cleanup on probe failure
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-google-v1-1-30a034e87a2a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH0BuGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3fT8/PScVF3jxOS0RKM045RUyxQloOKCotS0zAqwQdGxtbUAer6
 7BVgAAAA=
X-Change-ID: 20260316-google-3acfa2f3de9d
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Naveen Kumar <mnkumar@google.com>, Joy Chakraborty <joychakr@google.com>, 
 Roy Luo <royluo@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773666688; l=1551;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=grNch3YEfme4XX2YLfL8Yx6byNhRmXe/JTenfdWfyZA=;
 b=sP8QxL06sH+Slw6m9BD5RTi2uMzfGj1T1foGh8SmtqPEkOB/2wc388Tqw4bIOUUQbOdBNIIz3
 MNRj8JVFU+DCPWHNmwF36TX1jYZZ07sf5SJyoMTTGKZqzD3RY82YNH+
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

In google_usb_phy_probe(), if typec_switch_register() fails,
pm_runtime_disable() is not called, leading to an unbalanced
runtime PM state on probe failure.

Switch to devm_pm_runtime_enable() to ensure that runtime PM is
automatically disabled both on probe failure and during driver
removal.

Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/phy-google-usb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
index ab20bc20f19e..79480f8b110e 100644
--- a/drivers/phy/phy-google-usb.c
+++ b/drivers/phy/phy-google-usb.c
@@ -251,7 +251,9 @@ static int google_usb_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy_provider),
 				     "failed to register phy provider\n");
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
 	sw_desc.fwnode = dev_fwnode(dev);
 	sw_desc.drvdata = gphy;
@@ -271,7 +273,6 @@ static void google_usb_phy_remove(struct platform_device *pdev)
 	struct google_usb_phy *gphy = dev_get_drvdata(&pdev->dev);
 
 	typec_switch_unregister(gphy->sw);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id google_usb_phy_of_match[] = {

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-google-3acfa2f3de9d

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

