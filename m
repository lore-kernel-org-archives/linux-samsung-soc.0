Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592A71E572D
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228039; cv=none; b=J2rcaPNqrRL206+ZhOB/gi3vTrraeUPsR1dlFdtsy5khUeEbp6uOpTdBRO46m/7qfV1TE/Ms1GOnt6wsW5hPH2lHd+5OG4KUXLXm64RHil+Dr4Utw67u6x2cYsxu29hi+Tj50scKWuzJklIpLnE2WoAAHsi6XqjpnLrkszNKSYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228039; c=relaxed/simple;
	bh=rYYXqXh14CZExInpX/cEYMTHaFbubPjQbCNN5PmzSdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=homXRVdzt+s+yPx0o4PpgthezWWRlLUW9bKO+408XAfFPI5dWatuTHjE09jM98yiIS3rCZd9b5ks1fXrGWIlFUziXb/wUG9KxdSxrX4VVArpc8TbF1ddIFIQQw4NXE+upkwJ6s3mmtsfeFCoOf0ofVzgvi+u2o0WDoySr41mc7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHjDGTOr; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHjDGTOr"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so6469557a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228035; x=1733832835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54YjK1PSCj3noc28mh1Eh19wlGr7iBDWYo9sjvHvK0I=;
        b=DHjDGTOrZsHEqAuxJcA4hh4vaX9oVrALPnu3+2g1+egmd+kdyKZvYPZenEhp8qq9Qf
         cUc7AAc2HFpOcjjg243nT98bjQEOKW7HD4ZTASjDTDFnbMLbQTofdeq8DD9LmNJAuUGl
         +56FulpAjHercvRl1ggCO2hsmH0Kx5RGDodzNyRS788ngNx5a+Bz1JeIfu4MWS+i8jQa
         YzEaCW4Kbc4qpcc51ECjb3hgRrljDYvPz7LeEKj6FUx3Ibyi/rAd8A7SAixHWM1SclKO
         VYBW0vLePA3L7fHLXKM+r7Qp5CLdpmChnN3ddhXMoZfOEFzlH/SxSG+29j2HUs3Nzdtz
         P1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228035; x=1733832835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54YjK1PSCj3noc28mh1Eh19wlGr7iBDWYo9sjvHvK0I=;
        b=HyAHgt6hzFSGzTlmqnrVbmwfvhUiAjIuMdZZILPirJR7uvXVHdcd/V7erKCDitCGR4
         1cpFzzrnHXpSBFOpOmGx6D9vB2R6EEASrdtGcqybP8ArTRWIz3a5raWBQ2qHn6Wx753U
         XhFdt04ZiL1h92Wc1OK3eHX5BPCA25McdrNXyAxTLatnGZ5nGxQjx6/btRiPDgYZBBX1
         PTbCPgEfofvvTQZLPB0ykR7HjgcLExZ/uJrb8fh8HoD2u8HZ32w3LfZK2ryDQ5diVIXt
         4YtcrW85ksO0+YNWfRKrdmXYu/+sXc4oby5GP4sme7bp5YHIL0cnsfSnBBHZaI5o9c60
         nZlw==
X-Forwarded-Encrypted: i=1; AJvYcCUJcp6Q/zrv7dEOQ9XHPkeYM11GgqkVxiT+49ib8W2R8A3mPkLwR3OP3Oy9Yw0vOIXX/J/dDdKnZwn1NxY0ndi2kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweN8USaLMfx9YfZt220WT9XurUsNCzUWqmsBlgMJ1RO2Cf4V56
	7lOE8fMxkFu8/P657VkOR7ba6u2gvkMLFJisEvkNwOH/VPWogWkJuXAqeX3uDj4=
X-Gm-Gg: ASbGncvCXqrwAoSn40s3q/hUvuQ8wQzSXrTi5w7Ez/v0sv3nDP/e8xCnefKN0E2C2Pg
	nZ1l102jB1TlTyaZdN4viJxhX31PwqzfiTROWo8uleJfnAhkBecBaUVjt5xELyKLaRdT1GOL4+S
	sH5+dpIuPUA5oQM7yZGtobanH5Vch22WbS/MLkDWDOgUY5Yqs6q0cT8cRWbXf370lKzdC5Hs/9j
	59Mx+PHhATDXPWFCQAuzl3C0kxI0kUh97fCSJOTfxHRUedHXQkoExT7XcuT5ky85y4apIR/E/OF
	tf7sNOx5/pmWbKZz4RlHCxFt4kMrWsaSWA==
X-Google-Smtp-Source: AGHT+IGlYONH0INC2ObUF4IvK3DPpOMeryroZsQD2npmBCwLgaYdxtB/m6WRr2IlPYlTnp1MvA4eXw==
X-Received: by 2002:a17:906:3ca2:b0:aa5:f39a:bd7b with SMTP id a640c23a62f3a-aa5f7ccdc77mr167906966b.4.1733228034789;
        Tue, 03 Dec 2024 04:13:54 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:55 +0000
Subject: [PATCH v2 7/8] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-7-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

gs101's SS phy needs to be configured differently based on the
connector orientation, as the SS link can only be established if the
mux is configured correctly.

The code to handle programming of the mux is in place already, this commit
now adds the missing pieces to subscribe to the Type-C orientation
switch event.

Note that for this all to work we rely on the USB controller
re-initialising us. It should invoke our .exit() upon cable unplug, and
during cable plug we'll receive the orientation event after which we
expect our .init() to be called.

Above reinitialisation happens if the DWC3 controller can enter runtime
suspend automatically. For the DWC3 driver, this is an opt-in:
    echo auto > /sys/devices/.../11110000.usb/power/control
Once done, things work as long as the UDC is not bound as otherwise it
stays busy because it doesn't cancel / stop outstanding TRBs. For now
we have to manually unbind the UDC in that case:
     echo "" > sys/kernel/config/usb_gadget/.../UDC

Note that if the orientation-switch property is missing from the DT,
the code will behave as before this commit (meaning for gs101 it will
work in SS mode in one orientation only). Other platforms are not
affected either way.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* move #include typec_mux.h from parent patch into this one (Peter)
---
 drivers/phy/samsung/Kconfig              |  1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 61 ++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index f10afa3d7ff5..fc7bd1088576 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -80,6 +80,7 @@ config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
 	depends on HAS_IOMEM
+	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
 	depends on USB_DWC3_EXYNOS
 	select GENERIC_PHY
 	select MFD_SYSCON
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 206483c7ca55..b1914c6c806d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -24,6 +24,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/usb/typec.h>
+#include <linux/usb/typec_mux.h>
 
 /* Exynos USB PHY registers */
 #define EXYNOS5_FSEL_9MHZ6		0x0
@@ -394,6 +395,7 @@ struct exynos5_usbdrd_phy_drvdata {
  * @extrefclk: frequency select settings when using 'separate
  *	       reference clocks' for SS and HS operations
  * @regulators: regulators for phy
+ * @sw: TypeC orientation switch handle
  * @orientation: TypeC connector orientation - normal or flipped
  */
 struct exynos5_usbdrd_phy {
@@ -415,6 +417,7 @@ struct exynos5_usbdrd_phy {
 	u32 extrefclk;
 	struct regulator_bulk_data *regulators;
 
+	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
 };
 
@@ -1400,6 +1403,60 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_TYPEC)
+static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
+				       enum typec_orientation orientation)
+{
+	struct exynos5_usbdrd_phy *phy_drd = typec_switch_get_drvdata(sw);
+
+	scoped_guard(mutex, &phy_drd->phy_mutex)
+		phy_drd->orientation = orientation;
+
+	return 0;
+}
+
+static void exynos5_usbdrd_orien_switch_unregister(void *data)
+{
+	struct exynos5_usbdrd_phy *phy_drd = data;
+
+	typec_switch_unregister(phy_drd->sw);
+}
+
+static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
+{
+	int ret;
+
+	phy_drd->orientation = (enum typec_orientation)-1;
+	if (device_property_present(phy_drd->dev, "orientation-switch")) {
+		struct typec_switch_desc sw_desc = { };
+
+		sw_desc.drvdata = phy_drd;
+		sw_desc.fwnode = dev_fwnode(phy_drd->dev);
+		sw_desc.set = exynos5_usbdrd_orien_sw_set;
+
+		phy_drd->sw = typec_switch_register(phy_drd->dev, &sw_desc);
+		if (IS_ERR(phy_drd->sw))
+			return dev_err_probe(phy_drd->dev,
+					     PTR_ERR(phy_drd->sw),
+					     "Failed to register TypeC orientation switch\n");
+
+		ret = devm_add_action_or_reset(phy_drd->dev,
+					       exynos5_usbdrd_orien_switch_unregister,
+					       phy_drd);
+		if (ret)
+			return dev_err_probe(phy_drd->dev, ret,
+					     "Failed to register TypeC orientation devm action\n");
+	}
+
+	return 0;
+}
+#else /* CONFIG_TYPEC */
+static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
+{
+	return 0;
+}
+#endif /* CONFIG_TYPEC */
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_exynos5[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -1789,6 +1846,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
+	ret = exynos5_usbdrd_setup_notifiers(phy_drd);
+	if (ret)
+		return ret;
+
 	dev_vdbg(dev, "Creating usbdrd_phy phy\n");
 
 	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {

-- 
2.47.0.338.g60cca15819-goog

