Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4528150F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Nov 2025 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763815697; cv=none; b=FPDGRdq6Xr1RvWaa6+EE1V88I9aJeeJUe7oxQlNWr9siLujAbZo+YafruwMIOW+6C5oe4hjQBjaWghTtRgNV6mG21LUew46BeGv7G+DbOkJtmlkxMFG68oCZQrzwBx/uaqAx8edSLwrJoxGPQYtwRrp+Ipqd++Fp7Fn+QEmDiXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763815697; c=relaxed/simple;
	bh=Cx5mm+LHEHThWpNfzPBSTyj6Ref7KHNCEdY/Q3eDbfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eLkNOXqrhl1XM846ZpJPgzmiZU9j783+AR6B9yvuwFamhONoyIS1lwmrS9dxI3B58iyYUkIbOGUvuyAALQMie/85m6c/+9ES4J3jmTqVRiCga4kSX/4xbFJqaDg8vbAwDLOxAX8Wh82qnAh59pfmDtOxwFIxhcFdfS/yTPCL0/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8teUgq+; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8teUgq+"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-880499b2bc7so28661596d6.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Nov 2025 04:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763815694; x=1764420494; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o8gqhbCltqdqbcHVKZyuU/IaHPWnbH5XRr5u6wrUOXw=;
        b=e8teUgq+XE6zG57Bnt7hQWKEHeL6VoqOYoAnZqWd7NYUuYV3tYvnXv4QLq5i8Gmygu
         F9cfIDh7qoCT8aeIHRQKievdbTZMEI2yS3+o8/1veXyLnVxDxv1XAhFkhshZr9BSOixz
         POPmb09OWEWXFpxziMmraEvA7Bn8ffbFAQIEfAgIfS1gyEyDXvAydp5FqmaqYDgLWfKi
         ZriXC1msaL/myuv2RYERIIAmVdxNB7Iylsbiso2DCwix8oqiXzQPlX3vhMAlTVYD/M3R
         XRrmVnBBsAsZkY1/wtj7AuhQwZhINfTlWVenh8ZqNhAB2AJJf048bRgYWMzWQ2ctuOFl
         7uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763815694; x=1764420494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8gqhbCltqdqbcHVKZyuU/IaHPWnbH5XRr5u6wrUOXw=;
        b=sSnqcKNJycgEhLnzqgP9DotCiXiePKE4HKcH+W5EEThpPw4vIapvIYMWIYaMHBuLy0
         CVchpyi0t5dNyuOXBmlEGg9siW6zUFLHq//pEfXAQFsZFhjJMOUQOw+ZEG6EwWqraNBC
         thDBiqiQyFe1ZLgHw8DuZiY6TAjNTfARqA2kvdy1s0X0HReATw8m4UAbbatStS/PgtSs
         rX0qlYomu0NylkxawJhqSgnG1mcveke7ahU25CWXB0MOPaj8nkqX+pFUXaGrrhpaSGr2
         vafhQ3AuPUjVPytQy0NgKAh9RtWKHIST23heNWBeBE+wUy5x1OcJeAZASX4YmMyRSWwE
         lC+g==
X-Forwarded-Encrypted: i=1; AJvYcCXCVklSlTefd28UWYKj2LC6phIFTFHj5yQnXf3+/ZyqUG2YtvF005SshV7gqMjujpGVOR6edizGhztkqG+5QRpWlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/cdlU5urxnEKRBtbgJHYl2iudFPqPJNBV417xb3kIJVSzvfXl
	WSgUNSrIse5gi0IEuhxQeZxw/1rQEp2FevRmkUyQBNLirQkleCwegRzql0pLhw6mMh9kGuZDhC5
	bZLfwAA8lkxN0k2JvZREDe60wKmwARcNg7ucSr2/Hkg==
X-Gm-Gg: ASbGncutEvLHnkKoTj6FsNj8StaHWXqKPJUv9gq6rSUpnOvU2vh1avg14clI6C73vbV
	BxYRRIQnVx5QXUncUPkTz1EJyL1YJm3K/Ofy6I+z8KvAqAsxqL5BQ+zl2ITwiH6HuMhAlfWIku2
	oORoIycDOzULfl8xkxt07n7gv8juXbnHuOappFqkstrfIEyhKZToL08h9QTWTdSt8SiAA8Uo0hs
	lBCjrjBb1Jcp/zvaFqIg432WbljmOVRtWS+ZiiTNhbrBfLVT33zeYvqp6hCdp9W2fVQKFU=
X-Google-Smtp-Source: AGHT+IFui2/FcnPBmvVszPdhd9hT5kBneIF+kUNteMJLYssXVSAn66jfA8taiczKqofX0Om2tpq1Aqap3IRQ6R38HV4=
X-Received: by 2002:a05:6214:21e3:b0:87f:fee5:c3a6 with SMTP id
 6a1803df08f44-8847c533f24mr88483516d6.49.1763815694379; Sat, 22 Nov 2025
 04:48:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121-phyb4-v7-0-df644fa62180@google.com> <20251121-phyb4-v7-2-df644fa62180@google.com>
In-Reply-To: <20251121-phyb4-v7-2-df644fa62180@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 22 Nov 2025 12:48:03 +0000
X-Gm-Features: AWmQ_bkh4wl1u38i5d0nBSmX9Kkbsr0fGW0dbqVsgNFov-xmgwNb3n62zATaPv8
Message-ID: <CADrjBPpLn9qzg1y5_c_0CYL2U8p6taMWtPOw5RykAO4=4uNeUA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Roy,

On Fri, 21 Nov 2025 at 08:56, Roy Luo <royluo@google.com> wrote:
>
> Support the USB PHY found on Google Tensor G5 (Laguna). This
> particular USB PHY supports both high-speed and super-speed
> operations, and is integrated with the SNPS DWC3 controller that's
> also on the SoC. This initial patch specifically adds functionality
> for high-speed.
>
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/phy/Kconfig          |  13 ++
>  drivers/phy/Makefile         |   1 +
>  drivers/phy/phy-google-usb.c | 292 +++++++++++++++++++++++++++++++++++++++++++

Please add this new file to Tensor SoC MAINTAINERS entry so it's
easier to review future patches.

>  3 files changed, 306 insertions(+)
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 678dd0452f0aa0597773433f04d2a9ba77474d2a..af14ec74542a9879c856dee8236753990fdf3705 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
>           schemes. It supports all three USB 2.0 data rates: Low Speed, Full
>           Speed and High Speed.
>
> +config PHY_GOOGLE_USB
> +       tristate "Google Tensor SoC USB PHY driver"
> +       depends on HAS_IOMEM
> +       depends on OF
> +       depends on TYPEC

Add COMPILE_TEST for build testing.

> +       select GENERIC_PHY
> +       help
> +         Enable support for the USB PHY on Google Tensor SoCs, starting with
> +         the G5 generation. This driver provides the PHY interfaces to
> +         interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY, both
> +         of which are integrated with the DWC3 USB DRD controller.
> +         This driver currently supports USB high-speed.
> +
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..aeaaaf988554a24bb572d8b34b54638a6a3aed73 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)          += phy-snps-eusb2.o
>  obj-$(CONFIG_USB_LGM_PHY)              += phy-lgm-usb.o
>  obj-$(CONFIG_PHY_AIROHA_PCIE)          += phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_NXP_PTN3222)          += phy-nxp-ptn3222.o
> +obj-$(CONFIG_PHY_GOOGLE_USB)           += phy-google-usb.o
>  obj-y                                  += allwinner/   \
>                                            amlogic/     \
>                                            broadcom/    \
> diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..23b988cc5292111872c4acb32f7666e0ce9a39a3
> --- /dev/null
> +++ b/drivers/phy/phy-google-usb.c
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * phy-google-usb.c - Google USB PHY driver
> + *
> + * Copyright (C) 2025, Google LLC
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/mutex.h>
> +#include <linux/cleanup.h>
> +#include <linux/usb/typec_mux.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +

Sort headers alphabetically

> +#define USBCS_USB2PHY_CFG19_OFFSET 0x0
> +#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
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
> +       GOOGLE_USB2_PHY,
> +       GOOGLE_USB_PHY_NUM,
> +};
> +
> +struct google_usb_phy_instance {
> +       int index;
> +       struct phy *phy;
> +       int num_clks;
> +       struct clk_bulk_data *clks;
> +       int num_rsts;
> +       struct reset_control_bulk_data *rsts;
> +};
> +
> +struct google_usb_phy {
> +       struct device *dev;
> +       struct regmap *usb_cfg_regmap;
> +       unsigned int usb2_cfg_offset;
> +       void __iomem *usbdp_top_base;
> +       struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
> +       /* serialize phy access */

Be more specific with the mutex comment, which code or variables are protected?

> +       struct mutex phy_mutex;
> +       struct typec_switch_dev *sw;
> +       enum typec_orientation orientation;
> +};
> +
> +static inline struct google_usb_phy *to_google_usb_phy(struct google_usb_phy_instance *inst)
> +{
> +       return container_of(inst, struct google_usb_phy, insts[inst->index]);
> +}
> +
> +static void set_vbus_valid(struct google_usb_phy *gphy)
> +{
> +       u32 reg;
> +
> +       if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
> +               reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +               reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
> +               writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +       } else {
> +               reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +               reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
> +               writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +       }
> +}
> +
> +static int google_usb_set_orientation(struct typec_switch_dev *sw,
> +                                     enum typec_orientation orientation)
> +{
> +       struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
> +
> +       dev_dbg(gphy->dev, "set orientation %d\n", orientation);
> +
> +       gphy->orientation = orientation;
> +
> +       if (pm_runtime_suspended(gphy->dev))
> +               return 0;
> +
> +       guard(mutex)(&gphy->phy_mutex);
> +
> +       set_vbus_valid(gphy);
> +
> +       return 0;
> +}
> +
> +static int google_usb2_phy_init(struct phy *_phy)
> +{
> +       struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +       struct google_usb_phy *gphy = to_google_usb_phy(inst);
> +       u32 reg;
> +       int ret = 0;
> +
> +       dev_dbg(gphy->dev, "initializing usb2 phy\n");
> +
> +       guard(mutex)(&gphy->phy_mutex);
> +
> +       regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
> +       reg &= ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
> +       reg &= ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
> +       reg |= FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
> +       regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
> +
> +       regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG19_OFFSET, &reg);
> +       reg &= ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
> +       reg |= FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
> +       regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG19_OFFSET, reg);
> +
> +       set_vbus_valid(gphy);
> +
> +       ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> +       if (ret)
> +               return ret;
> +
> +       ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
> +       if (ret) {
> +               clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +               return ret;
> +       }
> +
> +       regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
> +       reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
> +       regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
> +
> +       return ret;
> +}
> +
> +static int google_usb2_phy_exit(struct phy *_phy)
> +{
> +       struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +       struct google_usb_phy *gphy = to_google_usb_phy(inst);
> +       u32 reg;
> +
> +       dev_dbg(gphy->dev, "exiting usb2 phy\n");
> +
> +       guard(mutex)(&gphy->phy_mutex);
> +
> +       regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
> +       reg &= ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
> +       regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
> +
> +       reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> +       clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +
> +       return 0;
> +}
> +
> +static const struct phy_ops google_usb2_phy_ops = {
> +       .init           = google_usb2_phy_init,
> +       .exit           = google_usb2_phy_exit,
> +};
> +
> +static struct phy *google_usb_phy_xlate(struct device *dev,
> +                                       const struct of_phandle_args *args)
> +{
> +       struct google_usb_phy *gphy = dev_get_drvdata(dev);
> +
> +       if (args->args[0] >= GOOGLE_USB_PHY_NUM) {
> +               dev_err(dev, "invalid PHY index requested from DT\n");
> +               return ERR_PTR(-ENODEV);
> +       }
> +       return gphy->insts[args->args[0]].phy;
> +}
> +
> +static int google_usb_phy_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct google_usb_phy *gphy;
> +       struct phy *phy;
> +       struct google_usb_phy_instance *inst;
> +       struct phy_provider *phy_provider;
> +       struct typec_switch_desc sw_desc = { };
> +       u32 args[1];
> +       int ret;

Consider reverse christmas tree ordering.

regards,

Peter
