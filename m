Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C15D1F37B6
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502669; cv=none; b=umOJJuHIMOcfeQAbUsK/uAQIDzIwr8TAxVXjkUrkqhy02yo2qMZ4ektd1msG992QikKPSEpbAWOi7E+fBTB1gFCUZNXuQ6PqVHUBKwyc9f3nEyK7Kpin+VexIgj8wdqfs76q2u3muSgTNsMPhDFERocw22ZOtKuoV9wiVmqrs10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502669; c=relaxed/simple;
	bh=MI1pXFy+YIXyOBj4VYqO3It4g4viQYj6QlpmQiGlHho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StcOiaQs9J+rx65XWnaMXHeLfchUieJPRYZMVt4WvSXRDdKUWgrSQ8+sMT4PY8MRZpuYLI7NaTbh+bguTcw3aiKeDJtdH+TbdjM16OFimY7NBDlsIBmDn7JLOB0xzpY0Q/KdBuWwZlaxLJ1R1g11s32tpQx64dcEnp4Y+Gmifco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rOD3A1b9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rOD3A1b9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9e44654ae3so365599366b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 08:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502665; x=1734107465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXCLmnvsdZndLgej1FOJpSFQm/25z8Ym6KzN52uYasw=;
        b=rOD3A1b9KRf7GVo3wc1ORLPvQ5OE9LiFLvMLla8veGK+WVx7VjiXPR0OGA+R2rZ6Ud
         l6yBwB0XxLyQw2HPG+SfOEeRvKm+2v3bz6C4sENpT0zzfTy6atmvTZvvOD9Nt5zvxH2/
         zpoEwU4tHkU7AUi4oPGJcwNDYWHkKthS/fbqveUafEyGYvvLyNQ44Q1VpxncJHsqC6XF
         tvjmI2yUXD9zr7PkS9HQg8DTZupvM4pMt91mzHw5m3zerdI5JZylhBzXULqdQ8QXQk5C
         P/9E5j4GIBt/k84oXREbkf0ziMbyYI8RpFwc+xGrMRwA5j4cRy4hpeRevhmwQFAphSVZ
         CZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502665; x=1734107465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXCLmnvsdZndLgej1FOJpSFQm/25z8Ym6KzN52uYasw=;
        b=J2bqCzRAXqHjfjHuXXWTEUlqoQcjckR1dSGKvV4J2M+sWqbBhD13dEemRxTKMl+E8b
         JXrIvhp7MIAaka4zpBye/aXETSM4IBAoCRBzEUXhVYG9BDETAU6qN/a9p/zda/+yv2kA
         FQAvfPqc1+cpJG8LA6n5jyd4D7fb8O3y7ryC07uhIfGX3NUdzaXgLe7Q1sVw32cpGw59
         7Kcy2TffNxxFNB95Y4tn4G9EIKUmrp1CsuiwSY3QERiP5IOa0gm9kR1PU5pquTV5AxPo
         F6LtvNnH83W+oZGp7X/2NYve8Q4earwa4ScFhfnCswoEGFJQ4fY1lM3FnqUckGQbXDoo
         mRpw==
X-Forwarded-Encrypted: i=1; AJvYcCXjPxh3B5+Cb9LmgGgA5OOg4HQUu7oaCvCEGK7wbhPozJYDDyQNDsr4AxcNv+/Myw72rLnkcj87Mrf3/UL4WKytvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGQzfaxc4qpHVdUrCo5esgCCawieDM4FyZtRyRJEVesrYym9bh
	PJoOngixXAEZahMcMvQr0+mbZlHsHevO9nbPpIJXlgZKzW6CwPzHw+uEl5LOXn0=
X-Gm-Gg: ASbGncucO8KeNEfGQyUHrs1hAyXG9mMKKJ2WGqcK+54/swXExgD1RvWtSYdVKLH0INc
	XEGX7sKSOX4c7FaYPY8TUvc4/DSnpZC7V5UN3lpgNKF8YhBIbFUs8UklzluwomEquyHcFGcnUVK
	Gq+Iufr4g9quYKA8aROQZxJ+mkrPSrN2DMjSZlcfYTpvsBKA8oz4uRsyQaz8s7t/9H3ii98cZWE
	6tUNtWn4195mELXR3MmGekqNj2/eHDyoJBpPHbYnOcjVNL1sbn1mwwqxAG/sNnIjgsNGFiSg27Q
	l1YOcpII3mEfZp/TXGnUCrGsJciLR87ryw==
X-Google-Smtp-Source: AGHT+IE3dSSPOFbEcuaDJ4aqvtGwpINMyqS4vaGKxwRrqFEWJNjc/LOYtTgNWvcadsFJ1ENxhoDVuw==
X-Received: by 2002:a17:907:6196:b0:aa4:a3be:28dd with SMTP id a640c23a62f3a-aa63a254ab9mr340005666b.55.1733502664857;
        Fri, 06 Dec 2024 08:31:04 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:04 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:06 +0000
Subject: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
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
v3:
* drop init to -1 of phy_drd->orientation (Vinod)
* avoid #ifdef and switch to normal conditional IS_ENABLED() for
  CONFIG_TYPEC

v2:
* move #include typec_mux.h from parent patch into this one (Peter)
---
 drivers/phy/samsung/Kconfig              |  1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 56 ++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

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
index 61e0de4b3d4b..8fc15847cfd8 100644
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
 
@@ -1397,6 +1400,55 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 	return 0;
 }
 
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
+	if (!IS_ENABLED(CONFIG_TYPEC))
+		return 0;
+
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
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_exynos5[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -1786,6 +1838,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
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

