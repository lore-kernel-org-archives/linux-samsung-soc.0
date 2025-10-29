Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB830ACEC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 21:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761775016; cv=none; b=Hzds3Tq4D0V87zya1dlCftDdYoaRsDHtoIOXPv+vPSIGx8jBsx6uJm38YZMXi2afynC+6Hv6kmSzHjTSn6pUfwW1HEB9l7eiZ/sdEXfntDkGBqV1T573p9rWINhCxuEVvXVHGt1mdE/YoEwKeKB+Hk/feZg6y85y9n+3WiEcw60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761775016; c=relaxed/simple;
	bh=pc8MWSenSbrjlakZ4BTNZ5oyU4Qr0k6vYW6lu4WTNh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RlwAvx7Yyk1vUyVSQ4EaFNRrJF66AGRhR65On4pe5ydu0vojFxRgen2hMowK+je0/PMQz0CM4Xw5VbLi91f222+3/VufSa16WfzclOs+CZQ9vgHSmqPRyUY6ng2Ke6DBHop/bY/0F62ms5c1wfq7n9sKQXIGjqZph22jHvcEf90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=grrI8IpM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="grrI8IpM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27ee41e074dso2976005ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761775014; x=1762379814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJTLgOh8jsaRPCjdQQVu2n3V/rJ9ZSz5eRUC9ZjNuFk=;
        b=grrI8IpMnLxk6h9JZbCVGxw4w3+d5WKdrCl9qehbS6eODz6N4KKa5TLEzRmuH/SjgB
         zWj42S0XejbA0WY8PAg50PI2uHI9Jr6EV/xOv7J9R6cH6gtdy71n54hmcyTU2oJ0gl5m
         Ct30ZztFR6VnXtyGASuqwW9GVNOv9fAhRwhPsM1vR/aAaqBH9PHd0XOffhvIc608GtIT
         8oz4Y8tuWKdpcRNvT97qM4c4U/YXeE0UYtrTXsw5MN4IB7rKQbU9/a4ONroaZk/iRkGV
         jHmn8zBnapiI8g0C9KYmTkM3j4CfVeUPIRW/72n9Jqc3jJtWVVA3Zc6ckgxzdxm/0YeX
         KfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761775014; x=1762379814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJTLgOh8jsaRPCjdQQVu2n3V/rJ9ZSz5eRUC9ZjNuFk=;
        b=K5v62X5qXR7VD7rL0FnpFgn89hWqOJkMNkaC8Te7Jao9Lh5doA2VtqAIwGfQdaiRt+
         +X6jvCtPc4H0TBqx5J0hq2iOYR5CdRJDSEt6EVm1nJMAdX0riwXgA3CtkwbQtR7cEupQ
         yfHGr6RVPzS1dL0lQCDRvo1Q6Tks6qWNndTUKoxNdXab+sonBtVwlo6fidKZHvYiTXc9
         7IpIVcoGouR+DFgBUzU/GA54DvBxRrIW2T78ZCeBJ3PMeHUseADd4cp/j3XFWuMlH3wl
         M2L5RufpZ3Q0rsYjmr1IX05U7oHzvhjQgVovrrIORmuwav3koal1gxAgkdi+228PosAn
         n/Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWxSFStaOMHfd44AB/ZqcuRTeSghZ82V+MB2G53YeADBBVtxNlJ2Yv+8lxNl1bdlGPjTkCl3RR10QKBgeqUG6M/8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJXb8UTtj8ySqYLitZE/lwnxat0FYzeiqtMnB9Nlh64hmUZECM
	yPGQVKTghAFD2zzaLMbiesrR1NQdI96MXfFJ3PAeZU4l/49zLDnimADnhAKi5b3jK1mU27AhjJV
	jTTWFOEe9Y/ASEEI3rlhNFAgDrt5b04kV45TjbPn4
X-Gm-Gg: ASbGncsAKYsUwnoiFYKKiju2E1QI/W5D/kyIR+GpR/el47R6sOXwP0VFjCDvOzeY2Ej
	z+ABQAWY4cpLj244g0zezoVdEukFQ9whZ4ByA9KpljKNSt8CZO2vdcBj0PHaOURbYxh7eehI1sv
	0vDorZIBHWviAPjYNHUIr5lJaV+t826ER7c3M4IWD/2GE5WaO6z/Knbrw0ekjTrnI+xmJjAMALq
	YvyuJ2WrKCswo8TOlPDJLSriErpZoT9hewiKmYAT/Uaw1sedSlX40wHZSL+QwVrQkk/Z/5b58ku
	geIgnSTFUlOWdtM=
X-Google-Smtp-Source: AGHT+IE7MK0ouzOxdgxbbJICpwKKB/m/kuER8QUSyeE8WkSLtloBkkEzSk6YhBjjZ6+dAw+dHj+t4Lwls8B0wpVK58k=
X-Received: by 2002:a17:903:41c1:b0:276:d3e:6844 with SMTP id
 d9443c01a7336-294ede84e2cmr10876965ad.33.1761775013281; Wed, 29 Oct 2025
 14:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017235159.2417576-1-royluo@google.com> <20251017235159.2417576-3-royluo@google.com>
 <37daba64-5233-4573-95de-38612c2358f2@gmail.com> <CA+zupgwbmKt8BhHEM-76CLLH_dE_vmyHvKwqpC2WzwED9irEVw@mail.gmail.com>
In-Reply-To: <CA+zupgwbmKt8BhHEM-76CLLH_dE_vmyHvKwqpC2WzwED9irEVw@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 29 Oct 2025 14:56:16 -0700
X-Gm-Features: AWmQ_blXw1Xn8pKPUfoc6ad6zDhTM7hi1hzEqd7lDJfXI9Cm3_Ji6rmIfYSQ3kQ
Message-ID: <CA+zupgyywiKajEbTf34P1E0kz_1hni_gApXG+ObrjTHaBRRdWA@mail.gmail.com>
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

On Mon, Oct 20, 2025 at 12:55=E2=80=AFPM Roy Luo <royluo@google.com> wrote:
>
> On Sat, Oct 18, 2025 at 1:13=E2=80=AFAM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
> >
> > On 10/18/25 02:51, Roy Luo wrote:
> > > Support the USB PHY found on Google Tensor G5. This particular USB PH=
Y
> > > supports both high-speed and super-speed operations, and is integrate=
d
> > > with the SNPS DWC3 controller that's also on the SoC.
> > > This initial patch specifically adds functionality for high-speed.
> > >
> > > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > > Signed-off-by: Roy Luo <royluo@google.com>
> > > ---
> > >  drivers/phy/Kconfig          |  13 ++
> > >  drivers/phy/Makefile         |   1 +
> > >  drivers/phy/phy-google-usb.c | 271 +++++++++++++++++++++++++++++++++=
++
> > >  3 files changed, 285 insertions(+)
> > >  create mode 100644 drivers/phy/phy-google-usb.c
> > >
> > > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > > index 58c911e1b2d2..fe32d1356002 100644
> > > --- a/drivers/phy/Kconfig
> > > +++ b/drivers/phy/Kconfig
> > > @@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
> > >         schemes. It supports all three USB 2.0 data rates: Low Speed,=
 Full
> > >         Speed and High Speed.
> > >
> > > +config PHY_GOOGLE_USB
> > > +     tristate "Google Tensor SoC USB PHY driver"
> > > +     depends on HAS_IOMEM
> > > +     depends on OF
> > > +     depends on TYPEC
> > > +     select GENERIC_PHY
> > > +     help
> > > +       Enable support for the USB PHY on Google Tensor SoCs, startin=
g with
> > > +       the G5 generation. This driver provides the PHY interfaces to
> > > +       interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PH=
Y, both
> > > +       of which are integrated with the DWC3 USB controller.
> >
> > So it's more like a DRD controller, since it encapsulates multiple phys=
?
>
> Yes, it's a DRD controller, I will make it clear in the next version.
>
> >
> > > +       This driver currently supports USB high-speed.
> > > +
> > >  source "drivers/phy/allwinner/Kconfig"
> > >  source "drivers/phy/amlogic/Kconfig"
> > >  source "drivers/phy/broadcom/Kconfig"
> > > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > > index c670a8dac468..1d7a1331bd19 100644
> > ...
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/phy/phy.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/usb/typec_mux.h>
> > > +
> > > +#define USBCS_USB2PHY_CFG19_OFFSET 0x0
> > > +#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
> >
> > I'd suggest implementing the eUSB support in the existing snps-eusb2
> > driver for the sake of clarity. That way, you can pass it as a phandle
> > to this driver and probe it when drd is probing.
>
> If I understand it correctly, you're referring to the pattern used in
> Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml a=
nd
> Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml.
> Please correct me if I'm wrong.
>
> At first glance, this approach seems feasible. Custom logic, such
> as vbus valid handling, would need to stay within this driver. Most
> of the eUSB block configuration in google_usb2_phy_init() could
> be moved to the snps-eusb2 driver by adding one more compatible
> for Google's version of the SNSP eUSB IP. However, I'd argue
> 1. This approach would introduce an extra layer of PHY interface,
>     which adds unnecessary complexity.
> 2. Not much of the code is reused in snps-eusb2 driver: the register
>     definition and programming sequence are specific to Google,
>     hence the logic in google_usb2_phy_init() would have to be
>     moved to snps-eusb2 driver almost word-by-word.
>
> I understand this approach was suggested for the sake of clarity,
> but I'm not sure whether that makes for the best trade-off. Since
> there is a precedent for this approach, I do not have a strong
> objection. It would be helpful if the maintainers could also provide
> their input on this specific point.

Hi Ivaylo,

I'm still hesitant to make the changes you suggested without
maintainer input as it involves significant changes in the driver
architecture. I've Incorporated enough changes for review in
the other patch in this series, hence I've sent out a new version
v5 [1] to keep the review process going. Hope I can get some
feedback from phy maintainers there.

Thanks,
Roy Luo

[1]  https://lore.kernel.org/linux-phy/20251029214032.3175261-1-royluo@goog=
le.com

>
> >
> > > +
> > > +#define USBCS_USB2PHY_CFG21_OFFSET 0x8
> > > +#define USBCS_USB2PHY_CFG21_PHY_ENABLE BIT(12)
> > > +#define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
> > > +#define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
> > > +
> > > +#define USBCS_PHY_CFG1_OFFSET 0x28
> > > +#define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
> > > +
> > > +enum google_usb_phy_id {
> > > +     GOOGLE_USB2_PHY,
> > > +     GOOGLE_USB_PHY_NUM,
> > > +};
> > > +
> > > +struct google_usb_phy_instance {
> > > +     int index;
> > > +     struct phy *phy;
> > > +     int num_clks;
> > > +     struct clk_bulk_data *clks;
> > > +     struct reset_control *rsts;
> > > +};
> > > +
> > > +struct google_usb_phy {
> > > +     struct device *dev;
> > > +     void __iomem *u2phy_cfg_base;
> > > +     void __iomem *dp_top_base;
> > > +     struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
> > > +     /* serialize phy access */
> > > +     struct mutex phy_mutex;
> > > +     struct typec_switch_dev *sw;
> > > +     enum typec_orientation orientation;
> > > +};
> > > +
> > > +static inline struct google_usb_phy *to_google_usb_phy(struct google=
_usb_phy_instance *inst)
> > > +{
> > > +     return container_of(inst, struct google_usb_phy, insts[inst->in=
dex]);
> > > +}
> > > +
> > > +static void set_vbus_valid(struct google_usb_phy *gphy)
> > > +{
> > > +     u32 reg;
> > > +
> > > +     if (gphy->orientation =3D=3D TYPEC_ORIENTATION_NONE) {
> > > +             reg =3D readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET=
);
> > > +             reg &=3D ~USBCS_PHY_CFG1_SYS_VBUSVALID;
> > > +             writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> > > +     } else {
> > > +             reg =3D readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET=
);
> > > +             reg |=3D USBCS_PHY_CFG1_SYS_VBUSVALID;
> > > +             writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> > > +     }
> > > +}
> > > +
> > > +static int google_usb_set_orientation(struct typec_switch_dev *sw,
> > > +                                   enum typec_orientation orientatio=
n)
> > > +{
> > > +     struct google_usb_phy *gphy =3D typec_switch_get_drvdata(sw);
> > > +
> > > +     dev_dbg(gphy->dev, "set orientation %d\n", orientation);
> > > +
> > > +     gphy->orientation =3D orientation;
> > > +
> > > +     if (pm_runtime_suspended(gphy->dev))
> > > +             return 0;
> > > +
> > > +     guard(mutex)(&gphy->phy_mutex);
> > > +
> > > +     set_vbus_valid(gphy);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int google_usb2_phy_init(struct phy *_phy)
> > > +{
> > > +     struct google_usb_phy_instance *inst =3D phy_get_drvdata(_phy);
> > > +     struct google_usb_phy *gphy =3D to_google_usb_phy(inst);
> > > +     u32 reg;
> > > +     int ret =3D 0;
> > > +
> > > +     dev_dbg(gphy->dev, "initializing usb2 phy\n");
> > > +
> > > +     guard(mutex)(&gphy->phy_mutex);
> > > +
> > > +     reg =3D readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET=
);
> > > +     reg &=3D ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
> > > +     reg &=3D ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
> > > +     reg |=3D FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
> > > +     writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> > > +
> > > +     reg =3D readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET=
);
> > > +     reg &=3D ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
> > > +     reg |=3D FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368=
);
> >
> > Yeah, it's definitely the eUSB IP, but wired differently.
> >
> > phy-snps-eusb2.c:
> > #define EXYNOS_USB_PHY_CFG_PLLCFG0 (0x8)
> > #define PHY_CFG_PLL_FB_DIV_19_8_MASK GENMASK(19, 8)
> > #define DIV_19_8_19_2_MHZ_VAL (0x170)
> >
> > > +     writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
> > > +
> > > +     set_vbus_valid(gphy);
> > > +
> > > +     ret =3D clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret =3D reset_control_deassert(inst->rsts);
> > > +     if (ret) {
> > > +             clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > > +             return ret;
> > > +     }
> > > +
> > > +     reg =3D readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET=
);
> > > +     reg |=3D USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > > +     writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > ...
> > > +
> > > +     gphy->sw =3D typec_switch_register(dev, &sw_desc);
> > > +     if (IS_ERR(gphy->sw))
> > > +             return dev_err_probe(dev, PTR_ERR(gphy->sw),
> > > +                                  "failed to register typec switch\n=
");
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void google_usb_phy_remove(struct platform_device *pdev)
> > > +{
> > > +     struct google_usb_phy *gphy =3D dev_get_drvdata(&pdev->dev);
> > > +
> > > +     typec_switch_unregister(gphy->sw);
> > > +     pm_runtime_disable(&pdev->dev);
> > > +}
> > > +
> > > +static const struct of_device_id google_usb_phy_of_match[] =3D {
> > > +     {
> > > +             .compatible =3D "google,gs5-usb-phy",
> >
> > Did the naming scheme also change from gs{N}01 to gsN?
>
> Starting from Tensor G5, there's no model number [1], hence
> the change. The prefix "gs" is kept as their family name.
>
> [1] https://en.wikipedia.org/wiki/Google_Tensor
>
> >
> > > +     },
> > > +     { }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, google_usb_phy_of_match);
> > > +
> > > +static struct platform_driver google_usb_phy =3D {
> > > +     .probe  =3D google_usb_phy_probe,
> > > +     .remove =3D google_usb_phy_remove,
> > > +     .driver =3D {
> > > +             .name           =3D "google-usb-phy",
> > > +             .of_match_table =3D google_usb_phy_of_match,
> > > +     }
> > > +};
> > > +
> > > +module_platform_driver(google_usb_phy);
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_DESCRIPTION("Google USB phy driver");
> >
> > Great work!
> >
> > Best regards,
> > Ivaylo
>
> Thank you for the review!
>
> Regards,
> Roy Luo
