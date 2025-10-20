Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2B43321A3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 19:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990160; cv=none; b=hFgmLI4grDn4mroGBqYH89Er4NA9fQhrHKlibMCy2643d8lGijI0TJ1mtUM8Y19qsd+wWSEXsBNvt92qnGv8ZFIJaCpRpor4B/35ZdsMW6/Fow3UnFg1fWXgoVus+Aow3u5PQ+z00Et9U4JCKXvjAVzEVgznKpbOZNwHkikoKzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990160; c=relaxed/simple;
	bh=RSGGfdz00yOxnxQA4Z1SSj0g3YI91ZVBTSlGsDWb49w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faVWZsGPxBSMQ3xAWhPyqzRmuNWmEphPrD8WTm63yHq1aTgnvM1lvqnx5L55Zstfk8C6e5kKZF6QT96pfUFZ4HEU+gVVKUmiDixnp1eRYXNB8OFI/cjAlxVdZ15QQ68lMdzDHCgS8XK5sajWnD6eu/qVM25E+LLi9UGcrvR22Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0R3yGGv0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0R3yGGv0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-290d14e5c9aso42586265ad.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 12:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760990155; x=1761594955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGDb4j5YD7gzcoOdyZ8DfUuxVA6AmwZO6D17kiLjgUk=;
        b=0R3yGGv0qGaRGmEIdQVLk2Ex8Yvf/CLcZuH1EEQFKuOYW9SQPJOhlNLLK/hlXwUHt1
         tBTaRnzjpT8qgzoKiymim9Tc6vEdgwL6/phqFz9xla9YuXNSmYJ+YjJXknDGcNZ3u3Ad
         BES9bQJbIm3GgWzxwBzcAmqrIgaR24B6dBiOJIHlUWbykqcytUL7DZSI7WVebSG3aM7X
         xjPurlsHRpflnMSnqropLsnVUTKVsqdA/0bYZPJoP0becwIC8QJQa1ii33mzBqX/aEwT
         r54JIaDhFcS4MJRyKgj27FyOHpvfyhEjz6g2PaoTP/S7SpBoonFtWqiwlRfam19hqXz+
         s4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990155; x=1761594955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGDb4j5YD7gzcoOdyZ8DfUuxVA6AmwZO6D17kiLjgUk=;
        b=JuT3cqHvax+vfOU0JvRMF4O5UlmkZAT0BbsgAYReaGvIOuPmTX3XHfbyBfk8gzX624
         0jcs646Hqsjb+6xaL7rECOMdazz0kkpRBT7VZeU3j3lVRDxB/MaZbhuZDHqTu4j2tp2j
         73jfjqSRxxS0+JTwXd/M14rfLxIxrf8HbJP10SLmPdaFB/va8Ve5Z/ZsKNWp5Z3VwcmW
         mKx5MHWVORxUl/HpZiZKkQ6O0eRwPFr2vO8BtrYNa7Yoce4VFh6kb4AExQ5sT8w4YRsT
         d5wRyb/+4Zd6lkXHTh0ZuBcD2x6qgWjSYql3phaqoZaQ046PoN5ANV6pesxLp/NikRzQ
         bLEg==
X-Forwarded-Encrypted: i=1; AJvYcCWZkIBmgUD9x8B7C4KhThLC9vWEZrolBm9NOm6ExPkfoJjAJDRYeBy2EDO2wxDmtJsPNf21Dr5wSap2zt78MioKHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvSd901C8GkaM1soV3EapLLQ4TYDu9ygmQi1oskxQQfjibMn/m
	IF/SCC40B3IiCKzLFm4l868tqxOS4hzByJsAEHv2dyeXZOePdcODBAeEObwChHPsBGHgwYtvnXz
	ZGb/aDxaygnYcTttTHMTmKh1/NqLcef6wfmfsEJQS
X-Gm-Gg: ASbGncvxckEm9LHU7J+lTZFOrZN/+qclAwNL7Cd3kt9dDdOA/CoMusiFwwHXEhcFnQg
	qV73j+QaCaA3ut2u8q+V04TBdbBLBnxQ72oO/IVyT7VGCNlOQBIeF6Cvz3ySJdg+OZ65lD0O4qk
	T6bsGgQlOLMRPzjroXGBX8b9cDQ4brVV2rOtaoUvnQGVdwBYH7dWxxT8VjuvFPJ2gP8lOFMiH60
	lDz/Ec0V9zpwmBt5UneHlqhfQXNpoTDWmVhsHDyBLy/mOQPBBwHdYAcFtyh/nwaTJgOs13PZNDJ
	CbkJNKXodODTkZ95sg==
X-Google-Smtp-Source: AGHT+IFy7RPLrTjaJAmRvl/up+5yT0Xi35K2QAP5mH7buXJTH15rh6ZR8w+Jx06TkvEyKKVVV9FaRQNwaH2E98irt9s=
X-Received: by 2002:a17:903:1746:b0:24e:95bb:88b1 with SMTP id
 d9443c01a7336-290caf8510cmr156895345ad.34.1760990154949; Mon, 20 Oct 2025
 12:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017235159.2417576-1-royluo@google.com> <20251017235159.2417576-3-royluo@google.com>
 <37daba64-5233-4573-95de-38612c2358f2@gmail.com>
In-Reply-To: <37daba64-5233-4573-95de-38612c2358f2@gmail.com>
From: Roy Luo <royluo@google.com>
Date: Mon, 20 Oct 2025 12:55:18 -0700
X-Gm-Features: AS18NWCgbE77LSFDkUG8Ht5NtPdNWshuYiiufgQjSFfeg5-XcBLfdhlCz7phu9U
Message-ID: <CA+zupgwbmKt8BhHEM-76CLLH_dE_vmyHvKwqpC2WzwED9irEVw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 1:13=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> On 10/18/25 02:51, Roy Luo wrote:
> > Support the USB PHY found on Google Tensor G5. This particular USB PHY
> > supports both high-speed and super-speed operations, and is integrated
> > with the SNPS DWC3 controller that's also on the SoC.
> > This initial patch specifically adds functionality for high-speed.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/phy/Kconfig          |  13 ++
> >  drivers/phy/Makefile         |   1 +
> >  drivers/phy/phy-google-usb.c | 271 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 285 insertions(+)
> >  create mode 100644 drivers/phy/phy-google-usb.c
> >
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 58c911e1b2d2..fe32d1356002 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
> >         schemes. It supports all three USB 2.0 data rates: Low Speed, F=
ull
> >         Speed and High Speed.
> >
> > +config PHY_GOOGLE_USB
> > +     tristate "Google Tensor SoC USB PHY driver"
> > +     depends on HAS_IOMEM
> > +     depends on OF
> > +     depends on TYPEC
> > +     select GENERIC_PHY
> > +     help
> > +       Enable support for the USB PHY on Google Tensor SoCs, starting =
with
> > +       the G5 generation. This driver provides the PHY interfaces to
> > +       interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY,=
 both
> > +       of which are integrated with the DWC3 USB controller.
>
> So it's more like a DRD controller, since it encapsulates multiple phys?

Yes, it's a DRD controller, I will make it clear in the next version.

>
> > +       This driver currently supports USB high-speed.
> > +
> >  source "drivers/phy/allwinner/Kconfig"
> >  source "drivers/phy/amlogic/Kconfig"
> >  source "drivers/phy/broadcom/Kconfig"
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index c670a8dac468..1d7a1331bd19 100644
> ...
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mutex.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/usb/typec_mux.h>
> > +
> > +#define USBCS_USB2PHY_CFG19_OFFSET 0x0
> > +#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
>
> I'd suggest implementing the eUSB support in the existing snps-eusb2
> driver for the sake of clarity. That way, you can pass it as a phandle
> to this driver and probe it when drd is probing.

If I understand it correctly, you're referring to the pattern used in
Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml and
Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml.
Please correct me if I'm wrong.

At first glance, this approach seems feasible. Custom logic, such
as vbus valid handling, would need to stay within this driver. Most
of the eUSB block configuration in google_usb2_phy_init() could
be moved to the snps-eusb2 driver by adding one more compatible
for Google's version of the SNSP eUSB IP. However, I'd argue
1. This approach would introduce an extra layer of PHY interface,
    which adds unnecessary complexity.
2. Not much of the code is reused in snps-eusb2 driver: the register
    definition and programming sequence are specific to Google,
    hence the logic in google_usb2_phy_init() would have to be
    moved to snps-eusb2 driver almost word-by-word.

I understand this approach was suggested for the sake of clarity,
but I'm not sure whether that makes for the best trade-off. Since
there is a precedent for this approach, I do not have a strong
objection. It would be helpful if the maintainers could also provide
their input on this specific point.

>
> > +
> > +#define USBCS_USB2PHY_CFG21_OFFSET 0x8
> > +#define USBCS_USB2PHY_CFG21_PHY_ENABLE BIT(12)
> > +#define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
> > +#define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
> > +
> > +#define USBCS_PHY_CFG1_OFFSET 0x28
> > +#define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
> > +
> > +enum google_usb_phy_id {
> > +     GOOGLE_USB2_PHY,
> > +     GOOGLE_USB_PHY_NUM,
> > +};
> > +
> > +struct google_usb_phy_instance {
> > +     int index;
> > +     struct phy *phy;
> > +     int num_clks;
> > +     struct clk_bulk_data *clks;
> > +     struct reset_control *rsts;
> > +};
> > +
> > +struct google_usb_phy {
> > +     struct device *dev;
> > +     void __iomem *u2phy_cfg_base;
> > +     void __iomem *dp_top_base;
> > +     struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
> > +     /* serialize phy access */
> > +     struct mutex phy_mutex;
> > +     struct typec_switch_dev *sw;
> > +     enum typec_orientation orientation;
> > +};
> > +
> > +static inline struct google_usb_phy *to_google_usb_phy(struct google_u=
sb_phy_instance *inst)
> > +{
> > +     return container_of(inst, struct google_usb_phy, insts[inst->inde=
x]);
> > +}
> > +
> > +static void set_vbus_valid(struct google_usb_phy *gphy)
> > +{
> > +     u32 reg;
> > +
> > +     if (gphy->orientation =3D=3D TYPEC_ORIENTATION_NONE) {
> > +             reg =3D readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> > +             reg &=3D ~USBCS_PHY_CFG1_SYS_VBUSVALID;
> > +             writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> > +     } else {
> > +             reg =3D readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> > +             reg |=3D USBCS_PHY_CFG1_SYS_VBUSVALID;
> > +             writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> > +     }
> > +}
> > +
> > +static int google_usb_set_orientation(struct typec_switch_dev *sw,
> > +                                   enum typec_orientation orientation)
> > +{
> > +     struct google_usb_phy *gphy =3D typec_switch_get_drvdata(sw);
> > +
> > +     dev_dbg(gphy->dev, "set orientation %d\n", orientation);
> > +
> > +     gphy->orientation =3D orientation;
> > +
> > +     if (pm_runtime_suspended(gphy->dev))
> > +             return 0;
> > +
> > +     guard(mutex)(&gphy->phy_mutex);
> > +
> > +     set_vbus_valid(gphy);
> > +
> > +     return 0;
> > +}
> > +
> > +static int google_usb2_phy_init(struct phy *_phy)
> > +{
> > +     struct google_usb_phy_instance *inst =3D phy_get_drvdata(_phy);
> > +     struct google_usb_phy *gphy =3D to_google_usb_phy(inst);
> > +     u32 reg;
> > +     int ret =3D 0;
> > +
> > +     dev_dbg(gphy->dev, "initializing usb2 phy\n");
> > +
> > +     guard(mutex)(&gphy->phy_mutex);
> > +
> > +     reg =3D readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> > +     reg &=3D ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
> > +     reg &=3D ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
> > +     reg |=3D FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
> > +     writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> > +
> > +     reg =3D readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
> > +     reg &=3D ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
> > +     reg |=3D FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
>
> Yeah, it's definitely the eUSB IP, but wired differently.
>
> phy-snps-eusb2.c:
> #define EXYNOS_USB_PHY_CFG_PLLCFG0 (0x8)
> #define PHY_CFG_PLL_FB_DIV_19_8_MASK GENMASK(19, 8)
> #define DIV_19_8_19_2_MHZ_VAL (0x170)
>
> > +     writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
> > +
> > +     set_vbus_valid(gphy);
> > +
> > +     ret =3D clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D reset_control_deassert(inst->rsts);
> > +     if (ret) {
> > +             clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > +             return ret;
> > +     }
> > +
> > +     reg =3D readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> > +     reg |=3D USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > +     writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> > +
> > +     return ret;
> > +}
> > +
> ...
> > +
> > +     gphy->sw =3D typec_switch_register(dev, &sw_desc);
> > +     if (IS_ERR(gphy->sw))
> > +             return dev_err_probe(dev, PTR_ERR(gphy->sw),
> > +                                  "failed to register typec switch\n")=
;
> > +
> > +     return 0;
> > +}
> > +
> > +static void google_usb_phy_remove(struct platform_device *pdev)
> > +{
> > +     struct google_usb_phy *gphy =3D dev_get_drvdata(&pdev->dev);
> > +
> > +     typec_switch_unregister(gphy->sw);
> > +     pm_runtime_disable(&pdev->dev);
> > +}
> > +
> > +static const struct of_device_id google_usb_phy_of_match[] =3D {
> > +     {
> > +             .compatible =3D "google,gs5-usb-phy",
>
> Did the naming scheme also change from gs{N}01 to gsN?

Starting from Tensor G5, there's no model number [1], hence
the change. The prefix "gs" is kept as their family name.

[1] https://en.wikipedia.org/wiki/Google_Tensor

>
> > +     },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, google_usb_phy_of_match);
> > +
> > +static struct platform_driver google_usb_phy =3D {
> > +     .probe  =3D google_usb_phy_probe,
> > +     .remove =3D google_usb_phy_remove,
> > +     .driver =3D {
> > +             .name           =3D "google-usb-phy",
> > +             .of_match_table =3D google_usb_phy_of_match,
> > +     }
> > +};
> > +
> > +module_platform_driver(google_usb_phy);
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("Google USB phy driver");
>
> Great work!
>
> Best regards,
> Ivaylo

Thank you for the review!

Regards,
Roy Luo
