Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AEF1F4E39
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502669; cv=none; b=rQuxtgMWv8sCrTh4IqAvSgGKHSiIPLvHYD3dcmkmV/drPING7dD6tpFs7Jf+Hx8u8FAAY3O1Bs2enTda8WPyqig8g/MSHDR0lNjOhG6H6Mw8u1BoYJEkErPLIsf1r53VF2CrjN9K3sxmpJL1XIiTiqELkALW7i/bQ1yuKK518EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502669; c=relaxed/simple;
	bh=J6z5q62M8vmTkZ3jTBoKrO19txxGlcIk+1Ry1NXvBGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXAUtRMZXOgUe3oCxvbMwYSiCVvQb9J9CENfW25Kx4rACeEEng95+0uIohbqmIhyjKIuMCpRJV3AZHeNIxuNc++WDnWDvQ9F7zV3GTEGfKT5l7jK/VtAde7XPB1IxTU+OUOajUlVS6j6+en6MJWJ5KnZrXcQzcVGZxyQkaw8e3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0LG+Xnj; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0LG+Xnj"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa63dbda904so178179966b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 08:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502665; x=1734107465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFUL3kCwx3cUbzg7B5UVd/jZ4AQMlp0js1yIPxGumCU=;
        b=S0LG+XnjbJXITJXGXbMiIo3Q58qXxxiAswNrXoFZ0Gl0m+/fe/WX4yizhX0qIiZt/b
         G6vb4hNUnj6V5OHDolg6/JJGfzgnr7SCdvuSV8sOuc5Kb5peQ77dqlV5WhNRgkF/0OJp
         X2R34n6Rk0iLrW+ckbQOnipWAQpyoqWaVSSdH4BSwYV8862Jw93812+QVmCmr6Fb2gPI
         33/Q087NJE/lfsQCxiKuE2FKgxqWDpjiGIDWahD2DLNZ2pGFp+R6UC0KKuA6VHCfojQF
         WRXuv1aikEV50i2PFGoLxvZcClN0eTi41DQ04Ixwt3tn/qX6xxQ5OmS9B3WJi6iAfgzH
         5KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502665; x=1734107465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFUL3kCwx3cUbzg7B5UVd/jZ4AQMlp0js1yIPxGumCU=;
        b=TJ56+2PSO0upgBQw+mrMGzuxEkA/Ysx19nRmwjTAfPmtnlgrDq0++f6963EaUBz/5U
         l9DVXkgrHMITBUerNA5eYJ2hhY87dG+bflkVk//La6Mih/g5FoDFGLY/m/PEbsLnhTmM
         7g5VIpO3O030DwzYs6BgU5upr13oCvMb7Izf9k84lJYSqRK4LFNZkmFO2QNd0wVmAwrV
         lHj08RMJJFzt1pApoans5ynQFrkgCsRaP/yb/2sO+K5WPxVMI1SSpVgxP9hZBrQh/pq5
         KZ+wuSCyTMvW0HsUwa6GeWRTd8pjlq3/YiTxQlz7/w6IthPjx9hVGnRL05BqgYG6DFeS
         d1kA==
X-Forwarded-Encrypted: i=1; AJvYcCUuIcInGAPGlDCorfTmf/zZeoQsSFz+LGBpTHJC58PEuQ0uHZ7cv7ZGk7ZBi332CptnYyBj7eIGbprs5iIRgRtchw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8gW9F2JxQtiENhYHhURvKYewYMBJ/Pq/0rvggCwZwFIf5Mitb
	HTx/f7XBF72dWJ3I5mJu3v6eLbKHF3KPSeXJXye4P61IbegPwoaZGRSPzbC6zAY=
X-Gm-Gg: ASbGncujuB40X3/yspDPWPBzmbmgpJn5f2VHjzHc9NIDECLevP//h/Jq7r9VVQUqyDG
	JdPM+AH0XTc6LXtEXpDgms+yRU2C15TNGc3oPMfF9jKp/++DJpGZYtfKREtW4A/au+HIV006vkm
	pxsPvwzAMt+DM4FjS63K+bQ60YheXynhJt8tZSXZMzK+s0nZAgj5pkk+aWbFuszinLIUILv5GpB
	xzWDckMl9rJ/aF0gAV0NRypW7TSGRvcH5NajXOOWkFkt6IFZhrIbfn7ywY0tPDCkEYPn2qgVcqg
	zZV9M2GYjp5nruib4zfh+1aG3fhGCB5zeg==
X-Google-Smtp-Source: AGHT+IFdGgwrC3n71nQi/9MjgKXvQ3xt8s29XoT1ICJHQ14fSF1EZzWFJtu/VD99oVNhBiVQ1DgX2Q==
X-Received: by 2002:a17:906:310d:b0:aa6:2ff8:d62d with SMTP id a640c23a62f3a-aa63a2419ccmr313287766b.45.1733502665369;
        Fri, 06 Dec 2024 08:31:05 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:05 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:07 +0000
Subject: [PATCH v4 7/7] phy: exynos5-usbdrd: allow DWC3 runtime suspend
 with UDC bound (E850+)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-7-f5961268b149@linaro.org>
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

To make USB runtime suspend work when a UDC has been bound, the phy
needs to inform the USBDRD controller (DWC3) that Vbus and bvalid are
gone, so that it can in turn raise the respective gadget interrupt with
event == DWC3_DEVICE_EVENT_DISCONNECT, which will cause the USB stack
to clean up, allowing DWC3 to enter runtime suspend.

On e850 and gs101 this isn't working, as the respective signals are not
directly connected, and instead this driver uses override bits in the
PHY IP to set those signals. It currently forcefully sets them to 'on',
so the above mentioned interrupt will not be raised, preventing runtime
suspend.

To detect that state, update this driver to act on the TCPC's
orientation signal - when orientation == NONE, Vbus is gone and we can
clear the respective bits. Similarly, for other orientation values we
re-enable them.

This makes runtime suspend work on platforms with a TCPC (like Pixel6),
while keeping compatibility with platforms without (e850-96).

With runtime suspend working, USB-C cable orientation detection now
also fully works on such platforms, and the link comes up as Superspeed
as expected irrespective of the cable orientation and whether UDC /
gadget are configured and active.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* update exynos5_usbdrd_orien_sw_set() to not test against previous
  orientation
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 50 +++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 8fc15847cfd8..bac1dc927b26 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1137,13 +1137,15 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg |= LINKCTRL_BUS_FILTER_BYPASS(0xf);
 	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
 
-	reg = readl(regs_base + EXYNOS850_DRD_UTMI);
-	reg |= UTMI_FORCE_BVALID | UTMI_FORCE_VBUSVALID;
-	writel(reg, regs_base + EXYNOS850_DRD_UTMI);
-
-	reg = readl(regs_base + EXYNOS850_DRD_HSP);
-	reg |= HSP_VBUSVLDEXT | HSP_VBUSVLDEXTSEL;
-	writel(reg, regs_base + EXYNOS850_DRD_HSP);
+	if (!phy_drd->sw) {
+		reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+		reg |= UTMI_FORCE_BVALID | UTMI_FORCE_VBUSVALID;
+		writel(reg, regs_base + EXYNOS850_DRD_UTMI);
+
+		reg = readl(regs_base + EXYNOS850_DRD_HSP);
+		reg |= HSP_VBUSVLDEXT | HSP_VBUSVLDEXTSEL;
+		writel(reg, regs_base + EXYNOS850_DRD_HSP);
+	}
 
 	reg = readl(regs_base + EXYNOS850_DRD_SSPPLLCTL);
 	reg &= ~SSPPLLCTL_FSEL;
@@ -1404,9 +1406,41 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 				       enum typec_orientation orientation)
 {
 	struct exynos5_usbdrd_phy *phy_drd = typec_switch_get_drvdata(sw);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret) {
+		dev_err(phy_drd->dev, "Failed to enable PHY clocks(s)\n");
+		return ret;
+	}
+
+	scoped_guard(mutex, &phy_drd->phy_mutex) {
+		void __iomem * const regs_base = phy_drd->reg_phy;
+		unsigned int reg;
+
+		if (orientation == TYPEC_ORIENTATION_NONE) {
+			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+			reg &= ~(UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID);
+			writel(reg, regs_base +  EXYNOS850_DRD_UTMI);
+
+			reg = readl(regs_base + EXYNOS850_DRD_HSP);
+			reg |= HSP_VBUSVLDEXTSEL;
+			reg &= ~HSP_VBUSVLDEXT;
+			writel(reg, regs_base + EXYNOS850_DRD_HSP);
+		} else {
+			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+			reg |= UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID;
+			writel(reg, regs_base +  EXYNOS850_DRD_UTMI);
+
+			reg = readl(regs_base + EXYNOS850_DRD_HSP);
+			reg |= HSP_VBUSVLDEXTSEL | HSP_VBUSVLDEXT;
+			writel(reg, regs_base + EXYNOS850_DRD_HSP);
+		}
 
-	scoped_guard(mutex, &phy_drd->phy_mutex)
 		phy_drd->orientation = orientation;
+	}
+
+	clk_bulk_disable(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }

-- 
2.47.0.338.g60cca15819-goog

