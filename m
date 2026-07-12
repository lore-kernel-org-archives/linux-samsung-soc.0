Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EA3367B6D
	for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Jul 2026 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783822395; cv=none; b=OuP3Ju+Yb4rZV80nqHgWvh4QbHQ3maixx5q4cihyAiH7ddIK6agkadBCYqDGQLd7x3eCAU51mzXfI4mJePSjsm3sLJsgWSnPn2Q3wCq8IB6pSYxxLaBFZq7aXyGlYaVoWzzZgQyIsI2L1QQmp3JubjrNmkhTOgj0rPwrU5ulC1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783822395; c=relaxed/simple;
	bh=eq12R7NB8g3dejJk3OC3R9HbUZCictTcSDAGjAXeTbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nfv+VTWHwnjVS3vVUXQFLi56lPrHgYvujTMmXWgOh1CBT4r5PMg2e0Y6bD0XffLrF8up2Gtd5+j+3oVj78USL6tsTpzwYGMzYaMmmFvTE0751KqGrnUbkkYpR/TkoVtlUAImfijsTZI2JjrZ5JYI83nV/vSFPGFAT6cmnRkp9J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnymHQC1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnymHQC1"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1742443a91.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jul 2026 19:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822393; x=1784427193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnUG3JskAqM/JfRrK06JJsIVlYwHJ11zw3wV0jbg0eU=;
        b=VnymHQC1/GvrV99w5LqAdZD7lX1dTHrXdJ7A2gPFkzJUo0ZKkH0qlDJyZsejLt0fmN
         QqekvZLdlAJywHierQWTZ16XxJhA7WC/yzaiCt/FrS2J3O1PIScSatfzDgDhTg8R/wEt
         87XFGFmSlL35BrfT5GiAr62pnK+ImiPno8JEU1KsFu0xcoxE2DsKsLVEo+L15wh424nD
         ZwRXoBVM343Jb8UVngyhfCHvQ4Eap8CQj1u7wHYd/gHU+eZxEZh4aVvSlY35E9KLtEbD
         jYRm7dybVQQXq6qmLQQbDmeoWqe/2YrmdFgx/aqclHqElSLurn+LXC20UualzWL5ecih
         z9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822393; x=1784427193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnUG3JskAqM/JfRrK06JJsIVlYwHJ11zw3wV0jbg0eU=;
        b=hB471B+kgWmHgp5ijDNzR1LFacA+Gp2zf3wqrMqV3vaF9H1O2gnE/GogzMxLlitZy0
         UOMFrIRkElByZRo5/9k2prsSesoCI5VeOfeVDroW0I0qqqf8RqvWMhMGVcC2RCpgP30T
         tb+BIgeUj1P0AKnPtGbKRiPf88ZzrKJzwqZUbAsRaIdzi2a5f9GzT/USB8SETIJXH0ob
         IWY3HquGoY4bxdcLOV32GuFpuLtumRhxRLkmTU1LpF5UaVeYQDNC9CjUh30Mj4AoCyrX
         5U10FcFJEzxrqXQ686yS1jo/d1DEW/YtodJyWw05P831SvkuLqp5J1k3Nxs1wKp55ZA+
         C5CA==
X-Forwarded-Encrypted: i=1; AHgh+RobUrDYeDDdRozZjPMJzYswNIMThGS6st2WJXynYxgAw+FnkK8Y3+yXF0CI66V0lIQO55iNv5ow6uMBr/n3DwllFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeafTXgQ79tNSro2pKMMrhk6RJIItMiKSPOg9oz0YgAp2qD8wE
	NH4L54q+rcounU3QD+oTiKvZST8sFBR2Urgr0H0vuXIrq8jkXot5FEzR
X-Gm-Gg: AfdE7cm7S4J99YdPeRZ8wFg8iJpgWEWsPKxty6G+ejBDMtE3rVt4OFPBrAsH8WvfL5T
	W0zIWIqdgCyS7SQS5VvWYt26S1iWb/stnMJ+aGlU3xbENRol4l16Mpqqyc6y9b2UQPSYbp779Jd
	TwR/jc5nQtL/QG9tIVmDWfW1rLJG51SJDKW7taDA+vswV3NDj4tsUndGP4sH9YqnynnzPFD5ejb
	7K3pCzF+g/FZj0PfOfkFJsv05vIAyvtEH6r7xP4AVNpoleQvgDeSTUGLiDwISmGymd2Xg0i/trN
	jcQe9odSoueZbDdYNxCvL15fgstoRxVKkwMii7jk2ehP+e2gkJSPBxo4oFFWKe+NTlTA0GhCoTH
	0WSKcTkxguJl99Keg4XCsLubAf8ExuwjPyAoJuvDj3c+0n5ywUJtTAE3myUacu1mY9vp+jUsNWG
	DDaMuM7GmiWKQyi6f6B2MHlIUje2elNV8kWcyxcFEkyRPEEcXhMTMWHEyY/+seeaQK6dF3Csgvq
	rE=
X-Received: by 2002:a17:90b:5545:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-38dc74c4a32mr4437207a91.8.1783822393449;
        Sat, 11 Jul 2026 19:13:13 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:48 -0700
Subject: [PATCH v3 07/10] mfd: wm831x: support software nodes for DCDC
 regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-7-b2fcaba77aff@gmail.com>
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

Allow passing software nodes to wm831x DCDC regulators via PMIC platform
data. This is useful for non-DT/non-ACPI platforms that want to
associate device properties (like DVS GPIOs) with the regulator devices
using software nodes.

We add 'dcdc_swnodes' to the PMIC platform data 'struct wm831x_pdata' and
have the MFD core assign these software nodes to the buckv cells.

Assisted-by: Antigravity:gemini-3.5-flash
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
2.55.0.795.g602f6c329a-goog

