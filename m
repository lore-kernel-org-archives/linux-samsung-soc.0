Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7264D23EAAB
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760775236; cv=none; b=LpHadam5Ql7dwuPBrtDr795P5kNQEOTBPJWATbgBmsoB9r2CI+fq794e8mxJ8ddL/O+wxUvvXvnwheBOiQwGgC4bnNrRZ1tWH2+cwbo8tFgyrhdgHldW8kWtkM7t4qFEQHFDAjzXzuCDEGbI+YsTxUfPCxrQvowl37BnVvWVp40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760775236; c=relaxed/simple;
	bh=Da/aVxjsRIGx83gKjIdUHyyCDKnsf8FH4q0xEFl+Vqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5WDTl63XklGT0df6AvikNqkhrBkUC6GFJysb+xhzuKLYp62Nk+PKJhd2NIA2w+VSjWgEgNGssSvhvCq4c6eZm6bQhhRjFJ3wgxfZQUNVD1XqciBY0RY6XAN6t/h5o1lTlutzzQNuIwN8HYVh5XoYYClWGAt3HLwpJgi+qIsAhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpGs3Uku; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpGs3Uku"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so494294466b.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 01:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760775232; x=1761380032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BWm2fVryTSX7TLsnuCucMdyctrF8pcZJHdFO1Qboag=;
        b=LpGs3Uku7CeBHXWfsphXewFXpzv3K+4EQg07RoqN880YfHw69Pf3qtfIULrZsvb5Rv
         fAIcDYOrB4LnBgoT0Y+G7EKTCT1g+TxipgySf1GUnM7qKrJrY/W32/8gYEF8MflFZcjU
         Okk9EI35Esw7dVE5gm4SH56N0PpEwvnc6305vs47oqvBywgJWv0FFdjSSAN+rHsSwyA8
         72cXjWGfbT/w/Y5QWi0BDlS9Yz7K+fK2buaQxqBomSx+LKRx/w/OL/QNZBXnbtqDHRxr
         AMw7tzvWEVeQ7HAk4zneGnJ4P76/iCl6CDzrjVk01IHFdaUlYuDoLro/BaBgGSQbSqqP
         OWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760775232; x=1761380032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BWm2fVryTSX7TLsnuCucMdyctrF8pcZJHdFO1Qboag=;
        b=B56mrL+QAC3uZ1wc0ciZD+T36/HlN+dPmR7Jr/urN8C7IBfF5aqmTfCoPwucCxU1tP
         fXuulRsgyrEg6dJnaPtrsu2wBZnLmFtTbH1SPeerC+DGcfeTY85DpsDGjjg+coNzX/+c
         sz/REwD81ZnSQ1O0A5/vWRoqs+X/SRgaEUpee7TGr/a//FXcY148a+sifglFOno0/SeG
         y3C2YnO6zYbWMeVJdOtgSvkoLznII8v0CpgbtTkeh+/tupoBTHVHIHzkjEnkCul5w6so
         1P+P9XfFUhJuuj+KbynDE+Gx75GHyZq9RcI7hsYmMOyv9IWiKx8vGY02ddeZXaY83xVe
         w8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXmdRWzOeBYZ3vcv8JYQU4zK6FRdQFkQS1141w6aqyPfhM/wJnnWMmgV3oub5ca2NuKhF/rmrPDa3XIxNZ8ARG4dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD7GKKXdebGYp8iiA4GyMDhGcYTfXcz7ZLX8s1aZaIC77J5Gen
	L/zcUYucnHgHvDa7HjkI2N/0UKFDAKN+r6yq0nw2BIZslWhkmgv6tmmw
X-Gm-Gg: ASbGncsx/f/XQcBHGdP4jjRTYEdjK6CBYeY9GvzCZorMq8cmDYHCP0K/XjN1vTzpooJ
	u+5TekcqYIhP0Nw1PwNNonkQqpm8Th9sgYi3hOYbTyMtlhUreTLjrixOTJHUdyV+FeX6k72tjwY
	dSmgLGqjOqzYKsHqkGFwgnI1ZzA+3YwJ3P2NyA0rKkL3rcIlBmHeLdBA643aTdJ9bjr1TwiodZ9
	Eu8pxLc5+ZaH7CNQLSeK1tibtHAunygdvcR1U6gshjrh/kHgT5X6ouK9uvm3yAMF8Xmp7QaqpRv
	zJzsRoQwAsX2ZSQeld2ASNFEV1RpTAD3bG/X8GCEH6kXXGL5wBIlMYxYKsUIlPFfmtstJPwflKa
	E6as+Uf7W4g5F5tOpNpI1AnxBOHtERa+s1dHdw5+Tu62bxC7hEC0ACbURNQvvp4puV3crIDA+oE
	p9Vz0bLjioGY8GPkOKQW8qnB+t9H60AX1w3tIYcaeM+ErfsOy83ybgKg==
X-Google-Smtp-Source: AGHT+IGNDixJtPAW8Oef1zChTYomkbozhZ1mWKG9sYnl651V3ZzOLY2THmU+caOxpLoTq8ZVNQRwBQ==
X-Received: by 2002:a17:906:f58b:b0:b49:2021:793f with SMTP id a640c23a62f3a-b64764e4b0amr723616466b.53.1760775231364;
        Sat, 18 Oct 2025 01:13:51 -0700 (PDT)
Received: from [192.168.1.103] (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb035b81sm182545366b.51.2025.10.18.01.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 01:13:50 -0700 (PDT)
Message-ID: <37daba64-5233-4573-95de-38612c2358f2@gmail.com>
Date: Sat, 18 Oct 2025 11:13:49 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>,
 Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20251017235159.2417576-1-royluo@google.com>
 <20251017235159.2417576-3-royluo@google.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20251017235159.2417576-3-royluo@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/25 02:51, Roy Luo wrote:
> Support the USB PHY found on Google Tensor G5. This particular USB PHY
> supports both high-speed and super-speed operations, and is integrated
> with the SNPS DWC3 controller that's also on the SoC.
> This initial patch specifically adds functionality for high-speed.
>
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/phy/Kconfig          |  13 ++
>  drivers/phy/Makefile         |   1 +
>  drivers/phy/phy-google-usb.c | 271 +++++++++++++++++++++++++++++++++++
>  3 files changed, 285 insertions(+)
>  create mode 100644 drivers/phy/phy-google-usb.c
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 58c911e1b2d2..fe32d1356002 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
>  	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
>  	  Speed and High Speed.
>  
> +config PHY_GOOGLE_USB
> +	tristate "Google Tensor SoC USB PHY driver"
> +	depends on HAS_IOMEM
> +	depends on OF
> +	depends on TYPEC
> +	select GENERIC_PHY
> +	help
> +	  Enable support for the USB PHY on Google Tensor SoCs, starting with
> +	  the G5 generation. This driver provides the PHY interfaces to
> +	  interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY, both
> +	  of which are integrated with the DWC3 USB controller.

So it's more like a DRD controller, since it encapsulates multiple phys?

> +	  This driver currently supports USB high-speed.
> +
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index c670a8dac468..1d7a1331bd19 100644
...
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/mutex.h>
> +#include <linux/cleanup.h>
> +#include <linux/usb/typec_mux.h>
> +
> +#define USBCS_USB2PHY_CFG19_OFFSET 0x0
> +#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)

I'd suggest implementing the eUSB support in the existing snps-eusb2
driver for the sake of clarity. That way, you can pass it as a phandle
to this driver and probe it when drd is probing.

> +
> +#define USBCS_USB2PHY_CFG21_OFFSET 0x8
> +#define USBCS_USB2PHY_CFG21_PHY_ENABLE BIT(12)
> +#define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
> +#define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
> +
> +#define USBCS_PHY_CFG1_OFFSET 0x28
> +#define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
> +
> +enum google_usb_phy_id {
> +	GOOGLE_USB2_PHY,
> +	GOOGLE_USB_PHY_NUM,
> +};
> +
> +struct google_usb_phy_instance {
> +	int index;
> +	struct phy *phy;
> +	int num_clks;
> +	struct clk_bulk_data *clks;
> +	struct reset_control *rsts;
> +};
> +
> +struct google_usb_phy {
> +	struct device *dev;
> +	void __iomem *u2phy_cfg_base;
> +	void __iomem *dp_top_base;
> +	struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
> +	/* serialize phy access */
> +	struct mutex phy_mutex;
> +	struct typec_switch_dev *sw;
> +	enum typec_orientation orientation;
> +};
> +
> +static inline struct google_usb_phy *to_google_usb_phy(struct google_usb_phy_instance *inst)
> +{
> +	return container_of(inst, struct google_usb_phy, insts[inst->index]);
> +}
> +
> +static void set_vbus_valid(struct google_usb_phy *gphy)
> +{
> +	u32 reg;
> +
> +	if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
> +		reg = readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> +		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
> +		writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> +	} else {
> +		reg = readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> +		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
> +		writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> +	}
> +}
> +
> +static int google_usb_set_orientation(struct typec_switch_dev *sw,
> +				      enum typec_orientation orientation)
> +{
> +	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
> +
> +	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
> +
> +	gphy->orientation = orientation;
> +
> +	if (pm_runtime_suspended(gphy->dev))
> +		return 0;
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	set_vbus_valid(gphy);
> +
> +	return 0;
> +}
> +
> +static int google_usb2_phy_init(struct phy *_phy)
> +{
> +	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +	struct google_usb_phy *gphy = to_google_usb_phy(inst);
> +	u32 reg;
> +	int ret = 0;
> +
> +	dev_dbg(gphy->dev, "initializing usb2 phy\n");
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	reg = readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> +	reg &= ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
> +	reg &= ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
> +	reg |= FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
> +	writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> +
> +	reg = readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
> +	reg &= ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
> +	reg |= FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);

Yeah, it's definitely the eUSB IP, but wired differently.

phy-snps-eusb2.c:
#define EXYNOS_USB_PHY_CFG_PLLCFG0 (0x8)
#define PHY_CFG_PLL_FB_DIV_19_8_MASK GENMASK(19, 8)
#define DIV_19_8_19_2_MHZ_VAL (0x170)

> +	writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
> +
> +	set_vbus_valid(gphy);
> +
> +	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(inst->rsts);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +		return ret;
> +	}
> +
> +	reg = readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> +	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
> +	writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> +
> +	return ret;
> +}
> +
...
> +
> +	gphy->sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(gphy->sw))
> +		return dev_err_probe(dev, PTR_ERR(gphy->sw),
> +				     "failed to register typec switch\n");
> +
> +	return 0;
> +}
> +
> +static void google_usb_phy_remove(struct platform_device *pdev)
> +{
> +	struct google_usb_phy *gphy = dev_get_drvdata(&pdev->dev);
> +
> +	typec_switch_unregister(gphy->sw);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static const struct of_device_id google_usb_phy_of_match[] = {
> +	{
> +		.compatible = "google,gs5-usb-phy",

Did the naming scheme also change from gs{N}01 to gsN?

> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, google_usb_phy_of_match);
> +
> +static struct platform_driver google_usb_phy = {
> +	.probe	= google_usb_phy_probe,
> +	.remove = google_usb_phy_remove,
> +	.driver = {
> +		.name		= "google-usb-phy",
> +		.of_match_table	= google_usb_phy_of_match,
> +	}
> +};
> +
> +module_platform_driver(google_usb_phy);
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Google USB phy driver");

Great work!

Best regards,
Ivaylo
