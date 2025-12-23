Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C62C2C11D4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766512454; cv=none; b=iXA/DHewNaVMHbrK9UgvPCNSiPFmmRaaXO5AGWv/2c+UusU8NyCOQt1C5BhnfnmpJ5/uBzxnH0/ZcYoQKJbcmE2moRzzVyn3XfTRXrEqty+b4AD4JpTiLN88jNHM9rOEoVjpnNDmFApYOl9X+U+VkF24txxY+rNnLuBSEXzHhLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766512454; c=relaxed/simple;
	bh=FX2yXHq/x3IHpFUqMLZaUtN8HcEvov8huCrvSpNlNtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arEncFxmuvNTK/yaBOvw9z1QUro/6GCwRutg0i2xRTmPfHkVbJTkImIg3HBxeGFKZ5R899VPB5qit36KlMrC1twKN2M/NmDKV7r7J9hDQ9fbzB+5utiGd//NCVADD+pc6iW4qvu9tgAlS7YaD3smynLMz7ydMA8cYZyJNSHAM6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aTjmIkrl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aTjmIkrl"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0834769f0so52834445ad.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 09:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766512452; x=1767117252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUSjr7u0rdTFyM631T16fOHf9szF9tSI12okJbnzZg0=;
        b=aTjmIkrlL9eTQSpjeMwLgDu1ywh6Z2ADovyE62WISGjFPgGK6Ct6OcvKe4UxTjySFV
         uc3XdBgjrUY6PXEg1Uc9F/0V7BvjH2/M9nQAB6eYMW7qief8D0rvvwew8TBAVSnB+ja3
         a7ei6uTaYchGNbR7frGMH39X4g3rOeYD1GTH4hjhYnkiTafshb7+zlFwTgCYvyUBQnLW
         JnMDlt9jsyWLdQGPTzBu9PXflRKe0lE9AKlhfjOHXuxJMfF+yWjtNVNB4XEcbif+K5lK
         Dd3/E+pYIk/Pnd/YgHuSfCgQl1xdZyuDR+oLtsbLOrz/t6mfOoRsHapkI7TBYQLKCS++
         t9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766512452; x=1767117252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UUSjr7u0rdTFyM631T16fOHf9szF9tSI12okJbnzZg0=;
        b=kSZ9/bMr2YPrfzM/xNp+mLloZCV6TYeAabBIeoMoa+7wGrn8bKJCWusfmC4HKo/GYS
         EMDyAdtoGvUk9PKGr1ZpKGg1z5lCwGxVpfwTidIzxHwdkI5tt+83/WI8mjBK67d3qd5I
         tZBQKX5miMSTj59xuIluIlWzNJzCL7aroUhKCXga5qqO2pMA0vHYV5JUXRZngEm0fdto
         Squpw7683fVHr887zKHHkDKwVGP1ekDeFHM6DWyHwsu5Yrb8kxSV+wsPMWdCbAe/v8lQ
         viDcU91SQLk+dOWPIc4VhtRZbjQWFxAJoOF40Samux37cqQAZGwohGFyf/7g0jBeRIrH
         HCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvp1Jsd85TECrt+xIKVhp/3Aq6xpxjO3dlPZ02fzK7+MFOfq5obzWCch+VUdOfnjm/flCy3oeZFIL1uyE81395ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4UqMlnffUQoh+rZiiv0EWq9bDpiycObrdr14RC4uS712eN8Ny
	cIQGkXSa7wFqMoMecIIXgK3t6hZ7mZT6A2m6aobv3Z1e7rqA5AtAaI6F1uq141x8C4LWyZ4sC95
	mxptDpIMPk2kqhHRcGU3UebUA1DyccjhUg4QVZPmZ
X-Gm-Gg: AY/fxX4UeJULMnSvJ0IWh1FaIjBEtdNq3ROo2DStWnfmqvPR0X2z4Y+Z3k4hY5PkvvU
	0tdjJ1B6zTTfdFTDwPfI7Q9mLv87F6ih4FGG7Quj2F8eDE5KP48CnskUt8orjs90MjB3YGzNxgL
	kvsGm5+1FdSZ21ZytXPeUpgTJp5OW6xjhzuEeS6tsiqRVkFrvG1wNkmSex77AdQpJXFdLQt6m/v
	+q4jeuaRL1EIyqNK9DbeFgsXc5oQxuA/VrNhKKqcCytDELqoiZaqus73ajlDaef/Lx2dOyIgltC
	I70Iz5R7wO6XrSnHY84l0B98Ub8=
X-Google-Smtp-Source: AGHT+IHUXad6erRF8YvXLu5iHhvQirmWd1KhEP4Ox4XIWY/kSzKSQZoo1NFDc/5LbKt0hxEd/swF2y/0X8zLpqSolLI=
X-Received: by 2002:a05:7022:4288:b0:11b:9386:8256 with SMTP id
 a92af1059eb24-1217230196dmr15756076c88.43.1766512451120; Tue, 23 Dec 2025
 09:54:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-phyb4-v9-0-82c0b671b070@google.com> <20251222-phyb4-v9-2-82c0b671b070@google.com>
 <aUqhbVFHczpL9qnL@vaman>
In-Reply-To: <aUqhbVFHczpL9qnL@vaman>
From: Roy Luo <royluo@google.com>
Date: Tue, 23 Dec 2025 09:53:34 -0800
X-Gm-Features: AQt7F2qnxlEsNapTtaQcb62clqXsUnCBQRYwKyx76Qz7DAtvcglpofGX9V1VrwU
Message-ID: <CA+zupgxP+_2iRYABhPM1OOJtRdkrcOvrsKH=Sxk45XwsiamzTw@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 6:04=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 22-12-25, 21:31, Roy Luo wrote:
> > Support the USB PHY found on Google Tensor G5 (Laguna). This
> > particular USB PHY supports both high-speed and super-speed
> > operations, and is integrated with the SNPS DWC3 controller that's
> > also on the SoC. This initial patch specifically adds functionality
> > for high-speed.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  MAINTAINERS                  |   1 +
> >  drivers/phy/Kconfig          |  10 ++
> >  drivers/phy/Makefile         |   1 +
> >  drivers/phy/phy-google-usb.c | 295 +++++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 307 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8a2e94be2f5c5e6e7315bb7bec385798dbd52493..afd0d7484ffe5fa652798c9=
b3c86ae6d83302382 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10725,6 +10725,7 @@ F:    Documentation/devicetree/bindings/phy/goo=
gle,lga-usb-phy.yaml
> >  F:   Documentation/devicetree/bindings/soc/google/google,gs101-pmu-int=
r-gen.yaml
> >  F:   arch/arm64/boot/dts/exynos/google/
> >  F:   drivers/clk/samsung/clk-gs101.c
> > +F:   drivers/phy/phy-google-usb.c
> >  F:   drivers/soc/samsung/gs101-pmu.c
> >  F:   drivers/phy/samsung/phy-gs101-ufs.c
> >  F:   include/dt-bindings/clock/google,gs101*
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 678dd0452f0aa0597773433f04d2a9ba77474d2a..5a642e04caeeea9d40ac583=
767622cff2ef5e80c 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -101,6 +101,16 @@ config PHY_NXP_PTN3222
> >         schemes. It supports all three USB 2.0 data rates: Low Speed, F=
ull
> >         Speed and High Speed.
> >
> > +config PHY_GOOGLE_USB
>
> This does not seem sorted!
>
> > +     tristate "Google Tensor SoC USB PHY driver"
> > +     select GENERIC_PHY
> > +     help
> > +       Enable support for the USB PHY on Google Tensor SoCs, starting =
with
> > +       the G5 generation (Laguna). This driver provides the PHY interf=
aces
> > +       to interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo P=
HY,
> > +       both of which are integrated with the DWC3 USB DRD controller.
> > +       This driver currently supports USB high-speed.
> > +
> >  source "drivers/phy/allwinner/Kconfig"
> >  source "drivers/phy/amlogic/Kconfig"
> >  source "drivers/phy/broadcom/Kconfig"
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..aeaaaf988554a24bb572d8b=
34b54638a6a3aed73 100644
> > --- a/drivers/phy/Makefile
> > +++ b/drivers/phy/Makefile
> > @@ -13,6 +13,7 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)                +=3D phy-=
snps-eusb2.o
> >  obj-$(CONFIG_USB_LGM_PHY)            +=3D phy-lgm-usb.o
> >  obj-$(CONFIG_PHY_AIROHA_PCIE)                +=3D phy-airoha-pcie.o
> >  obj-$(CONFIG_PHY_NXP_PTN3222)                +=3D phy-nxp-ptn3222.o
> > +obj-$(CONFIG_PHY_GOOGLE_USB)         +=3D phy-google-usb.o
>
> and here!
>
> >  obj-y                                        +=3D allwinner/   \
> >                                          amlogic/     \
> >                                          broadcom/    \
> > diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.=
c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..97e345fdab9b3679e7a76f6=
957ae3814ef3420e8
> > --- /dev/null
> > +++ b/drivers/phy/phy-google-usb.c
> > @@ -0,0 +1,295 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * phy-google-usb.c - Google USB PHY driver
> > + *
> > + * Copyright (C) 2025, Google LLC
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> > +#include <linux/usb/typec_mux.h>
> > +
> > +#define USBCS_USB2PHY_CFG19_OFFSET 0x0
> > +#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
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
>
> maybe use unsigned?
>
> > +     struct phy *phy;
> > +     int num_clks;
>
> here too?
>
> > +     struct clk_bulk_data *clks;
>  +      int num_rsts;
>
> and here?

Ack to all the comments above, will fix them in the next version.

>
> > +     struct reset_control_bulk_data *rsts;
> > +};
> > +
> > +struct google_usb_phy {
> > +     struct device *dev;
> > +     struct regmap *usb_cfg_regmap;
> > +     unsigned int usb2_cfg_offset;
> > +     void __iomem *usbdp_top_base;
> > +     struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
>
> so you have an array for one phy?

While the current patch only supports usb2, I used an array
to simplify future support for usb3 and DP. I understand this
might seem like over-engineering for now, and we could
certainly wait to implement the array until the second phy
support is added. I=E2=80=99m happy to move away from array if
you=E2=80=99d prefer a simpler approach for this iteration.

>
> > +     /*
> > +      * Protect phy registers from concurrent access, specifically via
> > +      * google_usb_set_orientation callback.
> > +      */
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
> > +             reg =3D readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSE=
T);
> > +             reg &=3D ~USBCS_PHY_CFG1_SYS_VBUSVALID;
> > +             writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET)=
;
> > +     } else {
> > +             reg =3D readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSE=
T);
> > +             reg |=3D USBCS_PHY_CFG1_SYS_VBUSVALID;
> > +             writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET)=
;
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
>
> superfluous init

Ack, will fix it in the next version.

>
> > +
> > +     dev_dbg(gphy->dev, "initializing usb2 phy\n");
> > +
> > +     guard(mutex)(&gphy->phy_mutex);
> > +
> > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_U=
SB2PHY_CFG21_OFFSET, &reg);
> > +     reg &=3D ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
> > +     reg &=3D ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
> > +     reg |=3D FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
> > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_=
USB2PHY_CFG21_OFFSET, reg);
> > +
> > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_U=
SB2PHY_CFG19_OFFSET, &reg);
> > +     reg &=3D ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
> > +     reg |=3D FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
> > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_=
USB2PHY_CFG19_OFFSET, reg);
> > +
> > +     set_vbus_valid(gphy);
> > +
> > +     ret =3D clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
> > +     if (ret) {
> > +             clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > +             return ret;
> > +     }
> > +
> > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_U=
SB2PHY_CFG21_OFFSET, &reg);
> > +     reg |=3D USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_=
USB2PHY_CFG21_OFFSET, reg);
> > +
> > +     return ret;
>
> would it not be return 0 here? can it be any other value

No it cannot be any other value, will change it to "return 0".

>
> > +}
> > +
> > +static int google_usb2_phy_exit(struct phy *_phy)
> > +{
> > +     struct google_usb_phy_instance *inst =3D phy_get_drvdata(_phy);
> > +     struct google_usb_phy *gphy =3D to_google_usb_phy(inst);
> > +     u32 reg;
> > +
> > +     dev_dbg(gphy->dev, "exiting usb2 phy\n");
> > +
> > +     guard(mutex)(&gphy->phy_mutex);
> > +
> > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_U=
SB2PHY_CFG21_OFFSET, &reg);
> > +     reg &=3D ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_=
USB2PHY_CFG21_OFFSET, reg);
> > +
> > +     reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> > +     clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct phy_ops google_usb2_phy_ops =3D {
> > +     .init           =3D google_usb2_phy_init,
> > +     .exit           =3D google_usb2_phy_exit,
> > +};
>
> Only two ops? I would expect more... No power_on/off or set_mode?
>
> --
> ~Vinod

No, configuring usb2 phy is pretty straightforward. The hardware
does not distinguish between "initialized" and "powered on" states,
it also does not distinguish phy mode.

Thanks,
Roy
