Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96161BBBE0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733384002; cv=none; b=f19+/JSnYTnthOgkLsdh06E5o76qkfTYjbCKnwUsLZzxwaJ/LEPjoT+ACpy9z6zEggeZ1urxEBKrtCymj2vbftnsbried9uFNuAO+PV5xeuXwUZ/HCuXuRyUy68Pk+AwqYqPkKJUuSqc92OjJVv0NFUL8Q8D7WHcZ0JhE/tnoVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733384002; c=relaxed/simple;
	bh=wB85TvHGNmOfHJ/mMWKC/8ms9JuX3aQUHHifkpUaQBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TLyaGpB2kAcTP7392trxOBcCfjaodCrYNLTBl/H2hwmEq6QYzJsTTZr3jK1IX1Tu66lVuku49Im84rDFHS8QPYAtMAQcaRCZ+TG3b8qppPRvxsUAMcgdaoqUxpBeOzCoNabVAQMSU3GL7gSEEqKM/CVkWhKnQ6Q/gqaXzhAtr5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cycQCvX+; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cycQCvX+"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a68480164so70354166b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2024 23:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383997; x=1733988797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6O3lCGzSUbOgWyay+aXa9djkwZjywsxQgF3zhLj0KI=;
        b=cycQCvX+0PwZJorSyfq6T5opZHAYSM61m6PVHaGqCBccztUA2aezN+r9KcLDucfbO2
         z7owfGjuB3LUtdpJ23PtkmRVYvqrDCasOP7qZS/a9DhEm0tnrYHooPU7HoX6nDBpVmpZ
         3uszl7bbHFu3NIGijAkH+mzVYyM1GfP4zsIATTdvnIxoK6uuGzsN6hDSFi7TrCd9KSob
         OfoU8+i5V7st4yzC3Kn9p+CwUtI+8fHUTQLfMCePDYWTT0Uuf4DuTqwBDvgBbO1yBmnS
         KGrJ0MLLxiUKoiILTpYPZ55DJ7IeoGc3oT66D7hf13wEVle/pdoShv9XR1WCO8eTCHPp
         t5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383997; x=1733988797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6O3lCGzSUbOgWyay+aXa9djkwZjywsxQgF3zhLj0KI=;
        b=GfOAOaon9hsld75MkJe9FGZ+t9OEiww7QBbtJloMGZXZbflWVwNTHHEJp+2ly3PYEm
         juk7WqI1KratHnHkvgq3WEpmgHfSDK0VAIwLKmfdMiDWmsUQmZwOhj0LSu69I3aAjaTU
         i5jbuqVmXYEBqzuD5sW50Zj5MMgBaq6rCwgiKaJCd++OsUEG+EeTiux9FAASXPvL+oGK
         PSBb91fLQnhuABhrBQLuZWg9n7GSWNal82TMOjqHMnzEiLJH7kkiPbZD2Wuz4BHgk8wV
         YVZPZ6n3sPKcg0nt9gbFgd4KcYcTdmLq6y/1jycqxgWxUyBXQxXsZBpujAAqq+sTpqRw
         saNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbVf6GoESGz9L0BmtOEi4T5H7K1nJDY1xbEA17owHOZBDXtsFQYjie3vuEkVJdH2uiMHf4o5WZ8L4bI4vDCg9FRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy2zv2oVkG1QzzoXGdOvU9LQUdZ7RyFySzhQrChFH/NG2rCPN1
	aExRO+bQBoIZtSBiSJOFd4LDiaJo+4KRxoCMrRJ7xlZrW7t73qDdD6c0gVhLnp4=
X-Gm-Gg: ASbGncte233Pr/n8j4VaVBauUXKrK4o9XgzHvMtvfwfamhMRDECpEtsLXc9NewvNg0w
	3PHDASlHGxeHmyM+dSws9bRjEh/CmqoASjQMSO2udIS50thvAreSHWpB73wmajOK30X18YC019Z
	EsQp4duZNetmg1sXz+UqgeiBbquFbrvv7lvw6+junIgiK3nVyo7FATs4ZKQnNnlXYXupw+Zq8d5
	8455xfWOn+KttP2yaW6em1CnmP8iWtNcYJ1NUUnsK7q8JyifAl1gCY9gL7WedQ6nC+GXEMwfaNS
	2tgzQnRmn95yciIYWnPFEVt4cjTJPmoOIA==
X-Google-Smtp-Source: AGHT+IEi/zCT7Ze2IPO+Cv0zWjyb+MBILaN1VwgbSpJ0ZibfzpwTs9mA6Loh2tFdluQCoQvAqduEeA==
X-Received: by 2002:a17:906:18a9:b0:aa5:391e:cad5 with SMTP id a640c23a62f3a-aa5f7d9a2a7mr737322566b.33.1733383996962;
        Wed, 04 Dec 2024 23:33:16 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:16 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:18 +0000
Subject: [PATCH v3 7/8] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-7-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
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

IS_ENABLED(CONFIG_TYPEC)
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
index 206483c7ca55..6dcc3c80c1d2 100644
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
 
@@ -1400,6 +1403,55 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
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
@@ -1789,6 +1841,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
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

