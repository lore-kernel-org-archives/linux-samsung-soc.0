Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCEE3AE187
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 04:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572803; cv=none; b=UBJ7aS7clSjNgXbeftInyws4n05SgOgHF1RMYZknfNtnQwh6YrXL2gPiDcEjY57mSvss2WzMeKEx9ZpQ9m1KWTaDzkgM3mjJ9vKhoRuAWp3PsLNhOMkvbh8te/Puy5gXo8poaq0hsKsrdcCi88AwL/o5Nh4TK3ntn9Wo9jtj1Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572803; c=relaxed/simple;
	bh=weNKM+jKgF7ONLxec9vNuyvVd+aTiWgQiKrjcviOfOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SkvfUzXCmwFst2SxmhdnIdDafccBghNui6bUrIj9bZlHc4DrxUH/MVCJ8bBSDugxosUWPuJbkWZIJFL4F4o6kncoSOeS3D+l++MGml+ZEJSQxBK9S7ytm+ylYkZ5s40gFKOJ52v5gE70c83noGH0aBjxtIkZmDcHH28Qy39AhWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQ1vq4UT; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQ1vq4UT"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848593533cbso303741b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jul 2026 21:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572801; x=1784177601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrfkfcUdvCW3rBx7LBcGMDMGZ2FYcqBrKqnDysmumDI=;
        b=aQ1vq4UTrLe+tteQE7YhdW3TpR61nyw+lUnHdFoXgZslH03D9LZA6XwonPH3LixNEv
         FLxBiDruj1p40nfBZQy/s0+BTEKvq/XXO10b7BdOHDuRCUeNkacA35eWyg4LXZWwZgGF
         qGiam5VAhjQSUkp1NVLcnR5x0HSZ36SVRDetXslm2lrhGaWOKg7Tt2LPwI+zt2lSrw/C
         DG2bfgYt17yQ9pPX+mgobEVp1mfAwCkfjNU95yrR8gcrKWDOtYUGX7bxKgk+/P7Q2vS7
         3Ac3rtYFKha46/iFbF8Ux8ySN1kMavbdHXL7W6nZZUfkqeQphohOE2AcDdurknKKjOSX
         cpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572801; x=1784177601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrfkfcUdvCW3rBx7LBcGMDMGZ2FYcqBrKqnDysmumDI=;
        b=ODxAho7W0WdZEmhWIB4wJpnl+bmHzb7cWcZh4plNwVgbDv+bl50IORSjfUay0sqd6p
         d5khv4D0j36NFmKRkCbmkjTUy3+gDokeNK6MC0bnSnG7Viq8u/PARdlrKRLXwv32qmsW
         B2vxEJqBNZvcSpTjcmADmXMr9Tvxg3bwXRQ18Dym2V6vFh5o4QEa5Vg/hI8PjP8EjyiJ
         r+WResJw3zJmUUOZynHW0yjMTGKmMpGxpV7KF7sXfEx3t2U60YkCBcRauS888Um5mT34
         Bw/onw03fNhoweS8DlnU+T4vT9sfvsfFAcD4WHcZoS2pAff/b6Dk5W/As7L3VWZjU+sL
         Ogqg==
X-Forwarded-Encrypted: i=1; AHgh+RpolqMyWBMHnACN7PD0azovQZDCMq5lYogEeBj6gkrHopAtGGSeXdUVyfxHq6xcTPGm2F6sJ/+VlZVitF+4Iv++qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuXQRg9uOsWgQ1dZJmFJr4gWvTwYnatmlse/vgPvUXqkaxGNK+
	1X5JXqnbNpM21ERF8vgC8p9oSKqw66qjfoLKgP5Kd+4i48Nxn5f22I/6
X-Gm-Gg: AfdE7cmsMYE6cASXVB/H++5py/wMbqpDIg8DKxbvJEd1cnzX3PpatGxdY/ejqPmr+yd
	OHx00xOJRhHqiJgRAwFrPYCc4m++rHoFF6eVCwQoFQETy9bCKey9mwn972wus/hc+/3tOFama3J
	Ws68zodiopJnI4ralKbdmIdnq6EX1ZIpZg/p/2BcPF4FBEaGuLXXOC12balErZ1IJXcE3/7FmEg
	9hC168bZvbIgLILc04TWejLlrNnxF4jXGkN2bqSXWwc2+3YQ8hBOZ4Bo5x/g5gRuY/SUy8Jfl7f
	Kp16As+pGSDVTQcumIExr0sWp46IZaIepurRYa06adOY1zbMPcPZCd/8cGMEi8aK1diOV00DssW
	wpGZfulEjl7m4mQt3VNj70JzeXDihj7rW4TAU23CBUxCkCikfCh/37K5FTaZExtVWwsNBQiJWCy
	UBp9sYNAVTaT/cK0m4LkF2bT1O0eUtOsdyprAwihRdLL+LrH986wilxTC9tvyVhe3mWwem6EvoK
	/W2p2Xx99q3VgU=
X-Received: by 2002:a05:6a21:697:b0:3c0:9c19:659c with SMTP id adf61e73a8af0-3c0bd206a8fmr6865916637.68.1783572801015;
        Wed, 08 Jul 2026 21:53:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:20 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:06 -0700
Subject: [PATCH v2 08/11] ARM: s3c: crag6410: convert PMIC to software
 properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-8-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f

Convert the PMIC DVS GPIO configuration from a legacy lookup table to
software properties. We use the new 'swnode' field in 'struct
wm831x_buckv_pdata' to pass the software node to the regulator driver.
The DVS control source is also passed via software node properties.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 9682ef67b866..4c9b8c1fb08e 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -456,9 +456,21 @@ static struct pca953x_platform_data crag6410_pca_data = {
 	.irq_base	= -1,
 };
 
+static const struct property_entry crag_dcdc1_properties[] = {
+	PROPERTY_ENTRY_GPIO("dvs-gpios",
+			    SAMSUNG_GPIO_NODE('K'), 0, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_U32("wlf,dvs-control-src", 1),
+	{ }
+};
+
+static const struct software_node crag_dcdc1_swnode = {
+	.name = "wm831x-buckv-dcdc1",
+	.properties = crag_dcdc1_properties,
+};
+
 /* VDDARM is controlled by DVS1 connected to GPK(0) */
 static struct wm831x_buckv_pdata vddarm_pdata = {
-	.dvs_control_src = 1,
+	.swnode = &crag_dcdc1_swnode,
 };
 
 static struct regulator_consumer_supply vddarm_consumers[] = {
@@ -656,23 +668,6 @@ static struct wm831x_pdata crag_pmic_pdata = {
 	.touch = &touch_pdata,
 };
 
-/*
- * VDDARM is eventually ending up as a regulator hanging on the MFD cell device
- * "wm831x-buckv.1" spawn from drivers/mfd/wm831x-core.c.
- *
- * From the note on the platform data we can see that this is clearly DVS1
- * and assigned as dcdc1 resource to the MFD core which sets .id of the cell
- * spawning the DVS1 platform device to 1, then the cell platform device
- * name is calculated from 10*instance + id resulting in the device name
- * "wm831x-buckv.11"
- */
-static struct gpiod_lookup_table crag_pmic_gpiod_table = {
-	.dev_id = "wm831x-buckv.11",
-	.table = {
-		GPIO_LOOKUP("GPIOK", 0, "dvs", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
 
 static struct i2c_board_info i2c_devs0[] = {
 	{ I2C_BOARD_INFO("24c08", 0x50), },
@@ -931,7 +926,7 @@ static void __init crag6410_machine_init(void)
 	s3c_fb_set_platdata(&crag6410_lcd_pdata);
 	dwc2_hsotg_set_platdata(&crag6410_hsotg_pdata);
 
-	gpiod_add_lookup_table(&crag_pmic_gpiod_table);
+	software_node_register(&crag_dcdc1_swnode);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
 	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));

-- 
2.55.0.795.g602f6c329a-goog

