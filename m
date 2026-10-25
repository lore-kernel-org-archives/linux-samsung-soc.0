Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904603;
	b=BUnu9qaCnRS2od7IsJe2bVQ9n7ca6X7hGKXqmLSfYoCD2aSacDBhJ5+VpfF7ltgXlKBN
	 Q6JegwXE0x89ng+sgjMmPCSv6EH5d44uOnG7WB5W1mijxQpB8LtAG6UBBKTIG2HpZyTAw
	 2nr/hjpC8uvGO+d5OtomGY266w4vvpgVvNe8gljvJOxeQZu8UG7Lwtv8ek9v2Ys2OWevn
	 mFRD7cGcyXn5o57E/qkb2iXY2zIegshJ/pkrsG08AbXRMMmzABuO97w+gY4ckdmQG2HFH
	 Y6TqYbJxQL66p7kvrMSWLy8+p4wGvRzvgUAPzxX1UsLx8zGhH63+BP/BXcAgFWxqoFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
	b=PnYUSCZRW881hgrZGG6ERKvdRkCJsFIig3dPCFecCBvrwl1ZCbK99saDCz1ndQHgYFXp
	 m4IMVEJERX0n2uUdQh7TR0FAZQC+u8QBddDAz8uG0EIVSgE1jTmDnFyO/qt9N0d39KAOV
	 Y1gUSlTZAmjSrN1CTH5TiIEesACD693MuF5gn1fmciENqw2Id9IEAtZVZ8s20xzMplWMV
	 kSKhyNaMnp8GfckwOTC0A2B0E2XFycjSl9Ca6siXP7kAbZ3R+pejwQEI5gdhqSSiPH4JG
	 19uYqZyT6MYcr3pBnPpF5Zl+wtlJKVnN2aiOYf9X+ScN2kXwuz9ilBzaWhrBpiAaAkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tJzUA6VS;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7E7606A330
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Oct 2026 05:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7E7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tJzUA6VS
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so3088255eec.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 22:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904602; x=1793509402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
        b=tJzUA6VSmSq07QqY86FTLNROXqjdilQpTq4znKxJr3PJlG+VDo7WfaAW1uWZ2RLEAN
         DWi2MjTy7FyD2jTPKuPrMv66Yew5s48tZdpQjAecLvs4V80Q3hwHmFzOqFMoFVHtC/1+
         joMJ+VnaPLH+RAgHCZDqncWsQCa2u15DmVUMJj9cNP3wUpN/Nf4RBpyPeBXntSGz8R2O
         s/yoO+Ru8qDFsFEmd6zyL7pEWDKsSJSC3wt9kYjC27au3XHoBAtC+OePjzQa6Ui1cePy
         7yo+MUBVQl6iCFoif6M42jaJzNd6g5c9GoP3e9HGlS+fk5/PkEN8cDLPv56HBBFVDl5u
         veAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904602; x=1793509402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
        b=SP/OmYDvujdZ8hRJwr1M+nQMINCA2u00lolFQ27wMqOtsxdUWMt1S3vCyKCiC3qzie
         Im8tGu/17RjTwa4VWC/IZl4u2oSMuKkQJZdNNHeHVuO0n9CcG52ADEdk9CW0YNcidEq0
         oDZ/9jZJ5ITkN4q8rDAaFBbMPCjSx8feg39CFfKxGof3ExgLrE3LdhvMRqip+TBZr6iE
         n25IPjvQKZOqSTYp9NVBrx1NB6WnOZ3konu36M5OdAPcpxCNwWBuPyHf71/4sNb27vUQ
         BiNor8MLRE9gTlaWM0JyeXlcLcFveiWw29EjkN1bttjgoz0FdQQJceGzz0rON0JR4LiT
         z/nQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD5LsK/02Ct9+nNdYbUsxcqc0vyLdiG897s7bDZrx1eV7XbIeiASGxzbk8d/RlS1d2MQAhoY4Zn4BwTpvfTjdlQw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJmQ9oBhSPrGJL3CINia2kjBWw1TrATn/2BNBC7pBhiRm99LeUz
	RNyjvGmYzrN1rHqKUSGKCMImY/xkV+z5aToSzRNW+n/nJQka4NghEpc61kVFkA==
X-Gm-Gg: AYBFou1A2A36MBkomGDx4hRvnQYyFSh9aQlg1hVQf3gWmMDnp9Yzd8JcS0D1hYWNy+b
	6gSUT3wTR5bTBMHBW7E326YkdUhPrYH9DBdZfcd8FaE/1729NcWkUO6zgIvXT1XM+lL/tVToQHp
	YvhiUZVRVJqFZCA4u+8RqO7jl5C8TYODTRm3DjhBaLlNafaYygGRhPnPUL/HcnFLSEgwZ1XkXIE
	xb15Wz/hwcZRtnjbmGqXk1eIdXcmkOqht92nxZjaxgZ1aJZHcH6LK9nNOFXd7M9KPeclkdKarLq
	YG+uKB9tHQFKaIprVHNUQhxhxijRln0NwJ9Bm2pjNGRDNtB+wiRxqv90MSCPzFBm4tLUzp/tsVq
	wrpdArrHwG2HvwRODyHgt5++CAadcfDtLQ66BzTMoPBO8kVPots2Q3LqwNK9DJb0vQuVaFPogG2
	OZwuZoy6BxRFpKYj95O32fZFgle5GtF/AgN449aKcZtx4sBRuDABAyhm+FEiLpQKj2I0c/U/nM/
	xtSZB7ppN1OHyj8ppfeJrVlsRRniGGTklfO+CPewfXrmB+baMqrF2jZl4uCwncVGiRVIiWCtsfb
	d/LQItDPfewJEr9jZb1ZjUoN9CaBQig3On9oVOxFo0tgQn8bRz5AuSd/yIAxiWlo
X-Received: by 2002:a05:7300:88:b0:367:3d68:8480 with SMTP id 5a478bee46e88-369e81ca340mr5718435eec.0.1792904601938;
        Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:13 -0700
Subject: [PATCH v4 2/4] ARM: s3c: crag6410: convert PMIC DVS GPIO to
 software properties
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Convert the PMIC DVS GPIO configuration from a legacy lookup table to
software properties. We use the new 'dcdc_swnodes' field in 'struct
wm831x_pdata' to pass the software node to the regulator driver.
We keep the DVS configuration parameters (control source, startup
state) in the platform data.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 2264beef6dda..d0ec7697f366 100644
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
2.56.0.257.gf7497c7d27-goog

