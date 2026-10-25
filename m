Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904602;
	b=AbEx7hvyD7rirI/Z4DekTqRLzdY+E0E2vHFHQv+K9h1cdt1qiyJuPxg1sD8wkzChaAm0
	 L9frRpPyFRw+dQqBvWJQFenv7CYCMFv8MqCNmk00ln0aSuHLFZRZSIDt7s6JPTQWH3r7h
	 ZCSGdXFW9gRvfZCYcfho+xwV1SWjH4LdYTVkV3aTGofOx4iNJabfSnO4X98DE2k7oWV6T
	 ryELETibj/WKXu/G9npP2E+jZIjLyja/bBN+pHcHKN7DubA6P3lP0fYavbkiV6g1ejZjw
	 CtEsEWmpGwakPTtAW4AZsJi96X+ZpZ3xvCkJkkTB1qUGOu2xPymOcNtxoARUhyyEtCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
	b=OuBjbKVrUpxHrHs2nkvQM9vUfk+7f8UNFEqwSw7dN4RHa9AeSQZAQ1WkkRUjQHdq/XmI
	 YniqfCzcWmpeG3h23+2btnFyrt8g8eT5N/QTP4oIo8BdBPrhmi1LhMS1hruM6i97njlVj
	 Nr9EWcWZx8KXLgpQBFHtWHUnavisCu4XQZKrZ+5aoifyWjXdCt3j7m+mhyEDMZUzsvG1u
	 wqb9L3Iv62r9nVoQtA59vWISgvC/uoPQaEGiCK2N/10PyJkGmOjoB65j+1wk6b4HTJ8Hn
	 sm9lqCo9tHY+B/5CMhjSJOHP0dn3A2v57Im3/ZREGkOS32ULd7snjOS1oSa3xDWsIjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rQAKUtli;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CBA606A323
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Oct 2026 05:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65CBA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rQAKUtli
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so4827299eec.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904600; x=1793509400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
        b=rQAKUtliJITBXwUGzzY7EU3EU8wlopChs94F3AdouTEhLusAIKPcGvWV41d3j2hcer
         o3uuXL+8B73uSppRrtT1YP8cI82mAGs151mM4rICjQ8ejH8JAD56vU7r0BJOAynh2VmD
         woQaqL/xvRddMuATZeTOjlCATZGReFVmVVOGY8Z8o3M0kzPD+S0YSTSR0iCRmIU6Ky22
         eD7kIHJE4dGYcVqmoJCyfpHrOAhz9Rz/8Gdo9iGJ/rQMF4C4o9hF9mlwOgir0gFNJ6Xp
         cXNthZ/SdYbhZepXs/KfUEboySxDTm8Xri7nwvJWDM1KBDqJvihCaz3X99J68crmJAqo
         +77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904600; x=1793509400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
        b=WjTE7HCUbwzPgE/RHPreBd8elVQZYjgr2h6MYeY3mP9QA2/rzmdVtmvXTu/ndi+ipa
         tG7yiW91/gI01WiNk0E8VIZQIgHuNU6YYu1UH0nm0aiw2OtaX7PB6AxIjrlFnifJhFv5
         lgg25fuEVw9xIa7T7Dv3z+buegbU1V8f6A7rckgkjRzLiCfCzpZD3adduQja1vD7LeAZ
         OWleBQ3LEfkF4jnoMUBRNKdHbQ3bw1RDpJl018ypuP/8RDAIePsdhUbK8NCjzU5jcxQ9
         +tXtsHHny4FeNX/EKTN3aBeFX8oI/TwFXcxzyRMLIPT5SXCbhuMQCLsPTwVlY+tfTL+9
         D/GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDTIejUeolp0mcwwbAQQY9D/ITD63FMKa1P8Mvz0E9DGRj/mEmW2sG86dtMSpuOogmrW8J8Gl+wKblRUQ7E76vdQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL2colLW05HeVdlI0diSs1x83tAQGHNpum6F9HIHMyO2+twJ676
	ghraYXa1v8m7cE0i7QHRNEmPA0l3hnlX5obyjmjQcVWL3zxGFCEe+CU2Lp/gnA==
X-Gm-Gg: AYBFou2wBxQU5yXHPw3Hxa8PaBqkgVyvZSeTGZmGcYT6oH18olFPH60zxa5AzGYWGws
	2Yf1E270EO3cNdSRB9ncBfc4fYXEiY1BiXxZ04JEi2iqsLYhhdQaZtvJMYjlXb33riECDbs2l6J
	PhHsSmjDC4NoX+vCiUdqGVNl8wYTY7PPjTv+t7Ben/07oQ4snfEFxsDQ6DqtEFBdWfeB2W5yOh/
	MyFWxjzNdXYYfv3KdgjDQqJKRBQWIMB3a8uo5N9fuiZdT2a2dKgwRipNHiVOjGl3CFc/hcOqSnU
	z37BwbjKiGnoyF9w1dZ//NlJR/k9JVH3s9WoEHeOzhUmRELRjm/QjU0o5ufRPk9BuSqvJitQMsh
	aBz8chH7bANlw92I0TO9ajbJbYCmZZWfCkkIqQP9mMivfGnVo3JdVRATgNbIbW3PdzI19JDhTNi
	oG4jNPrsFn59IwVF1s30h86eg195wYkk96HDL7SYm+G3T2VMqCW9jPOQ0p8N275EtaV8td6HyIa
	UHpa7M7asoOyrukNqP0RESBVhZ65NCgOInos6fAzUIYfTTa1BoXxbT003GEtSIaAtDE3gDNdURk
	jkkSnwgOK0pXErTVpViYCa8Z5W5nYWho5EN17fjRQgE=
X-Received: by 2002:a05:7022:2513:b0:196:7742:3928 with SMTP id a92af1059eb24-1991b420832mr7262785c88.0.1792904600247;
        Sat, 24 Oct 2026 22:03:20 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:12 -0700
Subject: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
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
Message-Id: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
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

Allow passing software nodes to wm831x DCDC regulators via PMIC platform
data. This is useful for non-DT/non-ACPI platforms that want to
associate device properties (like DVS GPIOs) with the regulator devices
using software nodes.

Add software node pointers to the PMIC platform data and have the MFD
core assign them to the buckv cells.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
 include/linux/mfd/wm831x/pdata.h |  2 ++
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index df8e76e000cc..c4793be419ba 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/mfd/core.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/err.h>
 
 #include <linux/mfd/wm831x/core.h>
@@ -1449,6 +1450,32 @@ const struct of_device_id wm831x_of_match[] = {
 };
 EXPORT_SYMBOL_GPL(wm831x_of_match);
 
+static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
+			      const struct mfd_cell *cells, int num_cells)
+{
+	struct wm831x_pdata *pdata = &wm831x->pdata;
+	int i;
+
+	struct mfd_cell *local_cells __free(kfree) =
+		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
+	if (!local_cells)
+		return -ENOMEM;
+
+	for (i = 0; i < num_cells; i++) {
+		struct mfd_cell *cell = &local_cells[i];
+
+		if (strcmp(cell->name, "wm831x-buckv") == 0) {
+			int id = cell->id - 1;
+
+			if (id >= 0 && id < WM831X_MAX_DCDC)
+				cell->swnode = pdata->dcdc_swnodes[id];
+		}
+	}
+
+	return mfd_add_devices(wm831x->dev, wm831x_num, local_cells, num_cells,
+			       NULL, 0, NULL);
+}
+
 /*
  * Instantiate the generic non-control parts of the device.
  */
@@ -1620,15 +1647,13 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	/* The core device is up, instantiate the subdevices. */
 	switch (parent) {
 	case WM8310:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8310_devs, ARRAY_SIZE(wm8310_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8310_devs, ARRAY_SIZE(wm8310_devs));
 		break;
 
 	case WM8311:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8311_devs, ARRAY_SIZE(wm8311_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8311_devs, ARRAY_SIZE(wm8311_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1636,9 +1661,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 		break;
 
 	case WM8312:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8312_devs, ARRAY_SIZE(wm8312_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8312_devs, ARRAY_SIZE(wm8312_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1649,9 +1673,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	case WM8321:
 	case WM8325:
 	case WM8326:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8320_devs, ARRAY_SIZE(wm8320_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8320_devs, ARRAY_SIZE(wm8320_devs));
 		break;
 
 	default:
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 75aa94dadf1c..d5d9d9600756 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -12,6 +12,7 @@
 
 struct wm831x;
 struct regulator_init_data;
+struct software_node;
 
 struct wm831x_backlight_pdata {
 	int isink;     /** ISINK to use, 1 or 2 */
@@ -132,6 +133,7 @@ struct wm831x_pdata {
 	struct wm831x_status_pdata *status[WM831X_MAX_STATUS];
 	/** DCDC1 = 0 and so on */
 	struct regulator_init_data *dcdc[WM831X_MAX_DCDC];
+	const struct software_node *dcdc_swnodes[WM831X_MAX_DCDC];
 	/** EPE1 = 0 and so on */
 	struct regulator_init_data *epe[WM831X_MAX_EPE];
 	/** LDO1 = 0 and so on */

-- 
2.56.0.257.gf7497c7d27-goog

