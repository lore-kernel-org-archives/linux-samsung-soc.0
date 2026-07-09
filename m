Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54E33A783D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 04:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572805; cv=none; b=YJzFreV5sXgpjui5vDwilXBU/8QDGVulYA5VuyjUqZfLC3H0gWAfsswpCV0107q70UPLUxGQ9qJaYPeP2DPEgB0eb8LdIjNflgwKIQO4UkLvCpl2no7G7KiMQoKsdrBOYUMbS6xn8LQ6MZWQgZGe7x0yUC4uHB5L9ujdr5Ca8Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572805; c=relaxed/simple;
	bh=Svna67/rxF6DksoFBUX9w6XOFyVVHvkbN2umn96QZkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYa9V9ZQpOQYIeWjVoa/sg4W2Io2zQo1I943TMiPVTcw2XxJC5aAZRLiKUZ2paz9p4OuBlNhrUJdmM46ywetkRK6nMW8vDLXL239lAaxx9iX214yWHY7mOIwbFCubpJCHK47K/V/xdKeW3a65kzo8y0IDBwNEIJiLaCjJWt/VI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9lyiBHk; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9lyiBHk"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca80d708489so314900a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jul 2026 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572803; x=1784177603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2coInV2uMlLIpeqglM0vcfoc2SKHKrxAU98gxOM5VA4=;
        b=X9lyiBHkzjSoaVCFPY6NCEE+xP4jCuH1+IZ88hd7nkE1CoaHLZSnKEGW5t+CAy+ZnC
         tbeIZ+VXfDsgeyXYNxeyYd32PKOgbWeYH2OoFNIKzZVEpI9q/J3oXM9lHs4i2FFDsgBy
         s4d0mZXMNqQCcNgNPN8UKNv+jzwxli8Ha9zH95GJ3niAKf/sUTKnKQ4hwTTDCxZcB+12
         oD1ZlPcf2aH7mAvSTfyni4pXwc7PnHocPklyrBnP3//LGD3c3cpJWwVofkSJM6NWZZik
         iMgQ+MWc/Cb9BoEgkB4g7FL3liRoy5LQrwSJt0pwTr+uD8SfpkUv6Y2sRPutO77yfY1G
         ppcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572803; x=1784177603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2coInV2uMlLIpeqglM0vcfoc2SKHKrxAU98gxOM5VA4=;
        b=sQ7gOD0TGbmBnekgkxF60XAyOAY9+OAet4kHVekdOElTT5Zzn/shgxyM3TANfi/0gY
         Apj20pqq34oba4YZuOFIq6LN5MIi9+CjjOnyHr6VHCU8OgXyLT0ouQwvTBVwUXOkZRuR
         5VGD78nyAYNuGmSS/MsAkBSR7hhMbsTR589rTKAyFxlKmtwP1GD+XdwMyEtfvZFHHn8F
         C+dEkSlnEbmqT+3DricKRIxT4dVz6Y8pm7PV4q+oDFNfifmLr+FgCqnkAAKOlZfH+JLt
         zMg7Z31B9jlRUNurmjX3Wul+38efef3dd5ATl046Bc9wDTIi/E986uqGG9YR2FUXnUYm
         MSjw==
X-Forwarded-Encrypted: i=1; AHgh+RpkLC72knc3e9v2vHAGBooBk6GPAwBiccW7V01cnOz8fVogIiyNbclj9Nbyfnfs3dNJ2Awy+HPCAOqSxhmyVGce7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMRpN39fkvv1i+jxB0uI86G2+gM84mrpgZJBw2uB+TyYq5VpEw
	XuY14b7lp4SChaxM0mOgCHesPOTLe2PU/xWUKOePM8Ix3DeOvAF7i3Ny
X-Gm-Gg: AfdE7clrOxXXhF3/gyaAzrO3y+XlZxPciob65HenwBX7GVODm2OA9eugQMGaI97YnHK
	zS/u+Iff2V6p5kV942RZae8oVqE3wJ74McDS6XLWwFaLCywGoimKWk5pMrF1nLAz42RtR2hNmby
	I40kzCbMwqQmw7lpe5tCGAbJ44uTZ70pXR4IfK50KjZtQLsTi0p23Zmy/Gmc6W4UnUJOCes6yCT
	fcn9Ugsz5Ru+Qp2YECcrdYOCkyM6R7wsguRE1uL69fKin442XkJSVCdFZTJMOyowbAoUPNRO63f
	tKqOGl9MaKXrc/8i/ijKCe3ifxkvtbpKDpd3S9Xc+svY3O0vsgKh4JCt+Rnr3qDAL8bjJT1eQ+x
	CYVIN/mIFxdIx4nyOLAuIsMxlpuLSd+zDkQCqJQYDBbdkfqNMbE8Q5BWiA2a+/QKVXwgWpdk+vx
	+zcZ5e5jBlB5+CGix05uf6qZLUf9FVyHW8wpdqr6B6s+vWqtndpyvcHyV+CpnP0O4FODWFfbsmE
	qgD
X-Received: by 2002:a05:6a21:6daa:b0:3c0:9acb:3fb with SMTP id adf61e73a8af0-3c0d6a8ab01mr1403688637.32.1783572802842;
        Wed, 08 Jul 2026 21:53:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:22 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:07 -0700
Subject: [PATCH v2 09/11] regulator: wm831x: remove legacy DVS platform
 data
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-9-3c6ed4c9b3b6@gmail.com>
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

Now that the only board file in mainline using wm831x buckv DVS has been
converted to use software properties, we can remove the unused legacy
DVS fields from 'struct wm831x_buckv_pdata'. Also remove the fallback
logic from the regulator driver, making DVS support purely
property-based when software nodes are used.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/regulator/wm831x-dcdc.c  | 22 ++++++++++------------
 include/linux/mfd/wm831x/pdata.h |  3 ---
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/wm831x-dcdc.c b/drivers/regulator/wm831x-dcdc.c
index ce43c51c0170..05f49b2f5bad 100644
--- a/drivers/regulator/wm831x-dcdc.c
+++ b/drivers/regulator/wm831x-dcdc.c
@@ -336,15 +336,10 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 	int dvs_control_src;
 	u32 val;
 
-	if (!pdata)
+	if (!pdata || !pdata->swnode)
 		return;
 
-	if (pdata->swnode) {
-		struct fwnode_handle *fwnode = software_node_fwnode(pdata->swnode);
-
-		if (fwnode)
-			device_set_node(&pdev->dev, fwnode);
-	}
+	device_set_node(&pdev->dev, software_node_fwnode(pdata->swnode));
 
 	/* gpiolib won't let us read the GPIO status so pick the higher
 	 * of the two existing voltages so we take it as platform data.
@@ -352,7 +347,7 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 	if (device_property_read_u32(&pdev->dev, "wlf,dvs-init-state", &val) == 0)
 		dcdc->dvs_gpio_state = val;
 	else
-		dcdc->dvs_gpio_state = pdata->dvs_init_state;
+		dcdc->dvs_gpio_state = 0;
 
 	dcdc->dvs_gpiod = devm_gpiod_get(&pdev->dev, "dvs",
 			dcdc->dvs_gpio_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
@@ -362,10 +357,13 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 		return;
 	}
 
-	if (device_property_read_u32(&pdev->dev, "wlf,dvs-control-src", &val) == 0)
-		dvs_control_src = val;
-	else
-		dvs_control_src = pdata->dvs_control_src;
+	ret = device_property_read_u32(&pdev->dev, "wlf,dvs-control-src", &val);
+	if (ret) {
+		dev_err(wm831x->dev, "Failed to read DVS control source for %s: %d\n",
+			dcdc->name, ret);
+		return;
+	}
+	dvs_control_src = val;
 
 	switch (dvs_control_src) {
 	case 1:
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index d73a04c82ca1..c48333552f5a 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -48,9 +48,6 @@ struct wm831x_battery_pdata {
  * I2C or SPI buses.
  */
 struct wm831x_buckv_pdata {
-	int dvs_control_src; /** Hardware DVS source to use (1 or 2) */
-	int dvs_init_state;  /** DVS state to expect on startup */
-	int dvs_state_gpio;  /** CPU GPIO to use for monitoring status */
 	const struct software_node *swnode; /** Software node for properties */
 };
 

-- 
2.55.0.795.g602f6c329a-goog

