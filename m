Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A01B36729D
	for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Jul 2026 02:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783822399; cv=none; b=RfSunj6v/o1Z+sFjEPEPH6rAvRpiTrwgh0loQaaR5BUz9GnpMGJAWWVcS3gJ7oS7qjSrxNWmVldrS2+kYjqcYKoDnG9Ff4Hh70REFMfipIkW0JLQR2yiF9F+po6ZJwkFFHR4HlAgluTt5SnRaZueXLFPsuu8PpDm5fMIQ/Wt12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783822399; c=relaxed/simple;
	bh=N5rky33EdvhViGwsioGmj36G2N6vGTwasrTYZZH/8o4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nbm0309nJz4M2iYWYouZed3YYev32R/lmLK5Vj0TH1bZ0/FJt5iAgCKgZjywxkTvLHCtMY+X+90aO2Xt5bebLRADdUsq7MBSRYxWXbkRjJ8g/ubcEGluFqnJqRhDOLkJYCoB9wGLfng7uyH2vrSHy5012gSBWGb4yxFy3xTBDcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alll0lai; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alll0lai"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2470916a91.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jul 2026 19:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822395; x=1784427195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeKrQCOQwCtSB3eQzRia+4BzTdZbJgllKrvOfao2+VE=;
        b=alll0laitPrNKGPiujKduM5WO6O6cOcbDYHlocGjKgyqoC9vcxhRqnywxj15jtQLuk
         gWJOcfOuTxUyqJmYpe69Qtv01GmUjh0d6RGNTXVLU5BOTFVtdC4AoOIhAfT4KIVGyH31
         e/auX9J53Nqay9VZW6dzwam5pVa5Ht91FEywDRHEBHONh7aRkf1+5AGEFEQjkgLKDl6p
         bsfoF8JODmeZVMrepKi8QazubhJ+Dudu3Lk83dI8arrseZ7h/N1c63QleTNYqy/2Ah75
         HspG/dCSWIURYIuJb60S0MuP9yqTfJ/h1QLbzNT5YRHLMHV7dgKSlEJaPB5l739ZNsRy
         vu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822395; x=1784427195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeKrQCOQwCtSB3eQzRia+4BzTdZbJgllKrvOfao2+VE=;
        b=BXEW7d1Xrm5yhMYcMA1YGnkiKGfvWFz0jJzOvVA3GLU4YIpWRS2LbLYVcGTWeSyhx3
         urSnVV0DnRVglK7zehSNXK5j1uzHik5n1NUSTmHBMPMfQCBTSOQVm9MJzySoefSZrssG
         2iuSEU7K+qOTMGHyic49irbIQwQ1E+4yfxla2RO2VRnN9P57urK6t1vQ+zA4Azj0JKSt
         4i+hATtS7UMz/jzhVhPncFDL5SBSSy6xJPnkCmlsr0tSMTIlq0DM6t4abbzLCBCu+h4C
         HxHzKWzwBVGT/nXXOTE7h9Pu0xjM6xHnuJTWm8tCvITXhA6XqsFKVeU5Q9h4IopuH/e2
         SYbA==
X-Forwarded-Encrypted: i=1; AHgh+RrUZBA5Rxbz5Haq+i/FOA3k1m/dttJWYewr03CppboLT+D11VSiySmbCJ+529DS1clvXbce57D3HxKB6T3QftnZPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDLG9Zfm+xwm1bqfCwFu732v+OhJu7/LOXj+FaJg19bJwZ7uB
	YsdJ7pXs/ZXk3RKQu9Iai+cJ4yd5JK6B6OOxerEoyNkjeocGlE9PRAF1
X-Gm-Gg: AfdE7ckMGUJ2LnwVFuIMpVMAvSWdV3+TrouYtV+v2DB3LfOsgJcX931ooebQiAfSbH3
	sMkZZPeJtAzL+HSdD7ol0zKWxPwebMS23+kZec7mB5yDglBJeWTwDipKlIBrB6eE76iYr7+k5AF
	EU1y4Hxdz4w34KexSHivfdQIddADMfPXqq2z1Uw/4EyqhGyjg8PAyaj+Q818ZCP83eMASuYscH5
	ews4UwIxMIRS/+VEXqygzZCL7EKBxbVPJMKFYMUxhGoQcMWYvoAuErkE3+XCRCaFTHNiHS3fdtP
	KsmQnZ7A25v1YDJWuESZIyKTQ/iFiIuy8OGRSXo+gZzE5OodqhSLllixbfk6bstRqOr6Isa+wpM
	u56TF2YbWd/V6lW1jCQGRa4vHu4SNKRFYp7VJ2rKGY9EU2wtQGVSffGySljmwkR54vG2dPT7xtO
	y+SXkS+RX/M27U6s3FMjUrpzp39jg7lim1vjWZ/vbeX8I1hL9lJ6TiykYWldNUaU6FGwe1dibwy
	GE=
X-Received: by 2002:a17:90b:3c4d:b0:37f:d70a:9605 with SMTP id 98e67ed59e1d1-38dc73bccedmr4361831a91.9.1783822395623;
        Sat, 11 Jul 2026 19:13:15 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:14 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:49 -0700
Subject: [PATCH v3 08/10] ARM: s3c: crag6410: convert PMIC DVS GPIO to
 software properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-8-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
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
software properties. We use the new 'dcdc_swnodes' field in 'struct
wm831x_pdata' to pass the software node to the regulator driver.
We keep the DVS configuration parameters (control source, startup
state) in the platform data.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 757c0f383ff1..1abf08fdb543 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -456,6 +456,17 @@ static struct pca953x_platform_data crag6410_pca_data = {
 	.irq_base	= -1,
 };
 
+static const struct property_entry crag_dcdc1_properties[] = {
+	PROPERTY_ENTRY_GPIO("dvs-gpios",
+			    SAMSUNG_GPIO_NODE('K'), 0, GPIO_ACTIVE_HIGH),
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
 	.dvs_control_src = 1,
@@ -633,6 +644,9 @@ static struct wm831x_pdata crag_pmic_pdata = {
 		&vddint,  /* DCDC2 */
 		&vddmem,  /* DCDC3 */
 	},
+	.dcdc_swnodes = {
+		&crag_dcdc1_swnode,
+	},
 
 	.ldo = {
 		&vddsys,   /* LDO1 */
@@ -656,24 +670,6 @@ static struct wm831x_pdata crag_pmic_pdata = {
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
-
 static struct i2c_board_info i2c_devs0[] = {
 	{ I2C_BOARD_INFO("24c08", 0x50), },
 	{ I2C_BOARD_INFO("tca6408", 0x20),
@@ -931,7 +927,7 @@ static void __init crag6410_machine_init(void)
 	s3c_fb_set_platdata(&crag6410_lcd_pdata);
 	dwc2_hsotg_set_platdata(&crag6410_hsotg_pdata);
 
-	gpiod_add_lookup_table(&crag_pmic_gpiod_table);
+	software_node_register(&crag_dcdc1_swnode);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
 	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));

-- 
2.55.0.795.g602f6c329a-goog

