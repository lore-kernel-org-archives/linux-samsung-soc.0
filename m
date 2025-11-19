Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8C9325739
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 09:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544983; cv=none; b=hu/gaaxJ0kU5s/tYLERVSinRSqQdYOptuarxOmNpbW/pEFhO6LuRVlbgmPX04X5VShA5J3GSGsXg8N5ALfVRqFa2DWFz1Vb6rrVaULHmL/Xn0wurpkCmMwbazvvD5AFrjQMSVMSMrmMDQG59gwbtyhZMkB4VSEA+7yqbFcMvhKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544983; c=relaxed/simple;
	bh=7cR4Pai35YcX+Mco49wMUHRm5PDV2NMuI5YscHcscas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RylvppOImeW6yWP2Gs5+amPpBIqh2zULekMsF3Vg3dMpyeev8lLqNisSVeus1ae2n7fawSCiYgBlLLMaIpCzy1R0EiH/+U0eR6Fh4yazTeY2wP2987dq5iNaKMbl+N9jn2Rma6fENQhrbjhXNaoQ8i4gwl2BRNO1zpYuRzZbd6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ECT9sK+G; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ECT9sK+G"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bc8ceb76c04so3311092a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 01:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763544980; x=1764149780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33MfFyN98aeFWujgvHOkxkqM1vGZMKyJKT2tMivvNZE=;
        b=ECT9sK+GnI3pUxM60cBVF538qJZJT7acjd2IYNXvgbaGuolWC8GkDGc+x+qy1VpqGp
         mf6S3ngeHEC3Qjo/ja51IfKkcpc89sfJpiJfpWpldYE+Lw88ydgAhvCx+nyLrE/GHTHH
         Y65P9y4UFT5MIGOqruGUpQ9BiBNybafHpPT4dFH6RAs1pnCCaojKsFFQc5vWDb5Rp+gk
         L9urVsZPscgHlHH7jVcTrp7uHMnFITehlpyP6ptUXPeMIjv4ZYc399MM7CQoELv04cjA
         XBg+8sDS9mPRIQOMU+G+QrP7B5dFWhZlLgNPM+ilwfWjrlsFfjoA+gPVEIiSmsh4H6sv
         3a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544980; x=1764149780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=33MfFyN98aeFWujgvHOkxkqM1vGZMKyJKT2tMivvNZE=;
        b=SVCy2gzo8vQFQXhuoF288wWQubldw4AFN7dJtEPwe176H+dK/ngAgXPt99lS+r8Q7e
         O5sFRdCAB2xo3xlsRELftjKknWlCJuoeVdU1d1+SCLps9816GVauIpfeYcRmkUcKvVQL
         ncTtYKCHi5HyuZnT6kHpaimenq7wE878G/D5AkYTPwXlvau4+e7+Xnbi5FlucMlioaGR
         AH4PBMONNnwZFWRAnGr3JKI4y6pT1MHstNPBMYQXx+NfkMuUs90MozlCoH3q3/i3kWIB
         Chz8G4s+mCX5vHjwpm0rVbPZTKw0V+z6HGXnt9D9CXMLB/hQOBKlwU8amo8UOHZxOqef
         vCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2y/nJvwzsnS+N0XkO57wpVvlowFXCPkUANPCrdpD3/dcEEdnhZAbEm4mr3yfMPDLydQkbiEet+V2XIJgaXl+aUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4nO/Q4eXT7YzQWPg892BMOWuDlEkevZpG2ZTnqXEryOFJErfj
	82HPPCG8FXItLdi7OWqW3JSKC0AtXkKHHPRqkV1HGoXddf/dt40FSoWPI1NQh1R414U6tNQtNhn
	dm9ELaSWLftbEURMVhEiCX8BWCPM8fNbI9qz++gR8
X-Gm-Gg: ASbGncuBjBQbDWUU8xaGFUgsOCEsCMT+3zQKyRk6DNmE5M7wF2Isud6+D0uVlDf06E7
	dtFRCRgdI9QqCsx3VfoZQlvsUW5lq8AaNrjq2xlv7UqPts37VHSEXsFd25/Q/ZZ21IvMgmXfAuE
	2tLoBqLZ76q+byrN6vshC3Z8V/CeGlL+PpeAymX5XdQ2vgPVqrSn4QWk9G8Fe266RydOMouMum3
	qcCEAy/C8+sibO/wBJNKj8HMH9MkpvmpxiYylD2Hp+lYJNkDQQOpGXR3hcpMuvnHaL3vo9SoRur
	vFkIRSSXh5WJtzg=
X-Google-Smtp-Source: AGHT+IFqeB764bq/JCY5itMnbDht9/P3hMF6cMpQNXxRfvBc1ARSmIUbJh+ZLwt/2VdPsSYFewGiH3+ZcGWNxlG01mM=
X-Received: by 2002:a05:7022:f516:b0:119:e569:f61b with SMTP id
 a92af1059eb24-11b41408c1cmr4946704c88.20.1763544979708; Wed, 19 Nov 2025
 01:36:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112123257.3755489-1-royluo@google.com> <20251112123257.3755489-3-royluo@google.com>
 <20251114002404.kxht5p7fkdnxnkhh@synopsys.com>
In-Reply-To: <20251114002404.kxht5p7fkdnxnkhh@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 19 Nov 2025 17:35:42 +0800
X-Gm-Features: AWmQ_blZDX691mZU1ULcoFtoJnPeA9YwJpgA6KJyEy96F49uW1nst4ZU6AabWYI
Message-ID: <CA+zupgzAOMM7ezGX9L3iG_18Zprd=EDSdLur-_saDVcqWqd5-A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 8:24=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Wed, Nov 12, 2025, Roy Luo wrote:
> > Add support for the DWC3 USB controller found on Google Tensor G5
> > (codename: laguna). The controller features dual-role functionality
> > and hibernation.
> >
> > The primary focus is implementing hibernation support in host mode,
> > enabling the controller to enter a low-power state (D3). This is
> > particularly relevant during system power state transition and
> > runtime power management for power efficiency.
> > Highlights:
> > - Align suspend callback with dwc3_suspend_common() for deciding
> >   between a full teardown and hibernation in host mode.
> > - Integration with `psw` (power switchable) and `top` power domains,
> >   managing their states and device links to support hibernation.
> > - A notifier callback dwc3_google_usb_psw_pd_notifier() for
> >   `psw` power domain events to manage controller state
> >   transitions to/from D3.
> > - Coordination of the `non_sticky` reset during power state
> >   transitions, asserting it on D3 entry and deasserting on D0 entry
> >   in hibernation scenario.
> > - Handling of high-speed and super-speed PME interrupts
> >   that are generated by remote wakeup during hibernation.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/Kconfig       |  10 +
> >  drivers/usb/dwc3/Makefile      |   1 +
> >  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++
> >  3 files changed, 639 insertions(+)
> >  create mode 100644 drivers/usb/dwc3/dwc3-google.c
> >
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 4925d15084f8..bb0e4dc97da3 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -200,4 +200,14 @@ config USB_DWC3_GENERIC_PLAT
> >         the dwc3 child node in the device tree.
> >         Say 'Y' or 'M' here if your platform integrates DWC3 in a simil=
ar way.
> >
> > +config USB_DWC3_GOOGLE
> > +     tristate "Google Platform"
> > +     depends on OF && COMMON_CLK && RESET_CONTROLLER
> > +     default n
> > +     help
> > +       Support the DesignWare Core USB3 IP found on Google Tensor
> > +       SoCs, starting with the G5 generation. This driver includes
> > +       support for hibernation in host mode.
> > +       Say 'Y' or 'M' if you have one such device.
> > +
> >  endif
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index 96469e48ff9d..cf1cd408d938 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -58,3 +58,4 @@ obj-$(CONFIG_USB_DWC3_XILINX)               +=3D dwc3=
-xilinx.o
> >  obj-$(CONFIG_USB_DWC3_OCTEON)                +=3D dwc3-octeon.o
> >  obj-$(CONFIG_USB_DWC3_RTK)           +=3D dwc3-rtk.o
> >  obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)  +=3D dwc3-generic-plat.o
> > +obj-$(CONFIG_USB_DWC3_GOOGLE)                +=3D dwc3-google.o
> > diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-goo=
gle.c
> > new file mode 100644
> > index 000000000000..428adf7d6049
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-google.c
> > @@ -0,0 +1,628 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * dwc3-google.c - Google DWC3 Specific Glue Layer
> > + *
> > + * Copyright (c) 2025, Google LLC
> > + * Author: Roy Luo <royluo@google.com>
> > + */
> > +
> > +#include <linux/of.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/irq.h>
> > +#include <linux/clk.h>
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +#include "core.h"
> > +#include "glue.h"
> > +
> > +/* HOST CFG registers */
> > +#define HC_STATUS_OFFSET 0x0
> > +#define HC_STATUS_CURRENT_POWER_STATE_U2PMU GENMASK(1, 0)
> > +#define HC_STATUS_CURRENT_POWER_STATE_U3PMU GENMASK(4, 3)
> > +
> > +#define HOST_CFG1_OFFSET 0x4
> > +#define HOST_CFG1_PME_EN BIT(3)
> > +#define HOST_CFG1_PM_POWER_STATE_REQUEST GENMASK(5, 4)
> > +#define HOST_CFG1_PM_POWER_STATE_D0 0x0
> > +#define HOST_CFG1_PM_POWER_STATE_D3 0x3
> > +
> > +/* USBINT registers */
> > +#define USBINT_CFG1_OFFSET 0x0
> > +#define USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK BIT(2)
> > +#define USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK BIT(3)
> > +#define USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN BIT(8)
> > +#define USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN BIT(9)
> > +#define USBINT_CFG1_USBDRD_PME_GEN_U2_INTR_CLR BIT(14)
> > +#define USBINT_CFG1_USBDRD_PME_GEN_U3_INTR_CLR BIT(15)
> > +
> > +#define USBINT_STATUS_OFFSET 0x4
> > +#define USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RAW BIT(2)
> > +#define USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW BIT(3)
> > +
> > +#define USBCS_TOP_CTRL_CFG1_OFFSET 0xc
> > +#define USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE BIT(5)
> > +
> > +#define DWC3_GOOGLE_MAX_RESETS       4
> > +
> > +struct dwc3_google {
> > +     struct device           *dev;
> > +     struct dwc3             dwc;
> > +     struct clk_bulk_data    *clks;
> > +     int                     num_clks;
> > +     struct reset_control_bulk_data rsts[DWC3_GOOGLE_MAX_RESETS];
> > +     int                     num_rsts;
> > +     struct reset_control    *non_sticky_rst;
> > +     struct device           *usb_psw_pd;
> > +     struct device_link      *usb_psw_pd_dl;
> > +     struct notifier_block   usb_psw_pd_nb;
> > +     struct device           *usb_top_pd;
> > +     struct device_link      *usb_top_pd_dl;
> > +     struct regmap           *usb_cfg_regmap;
> > +     unsigned int            host_cfg_offset;
> > +     unsigned int            usbint_cfg_offset;
> > +     int                     hs_pme_irq;
> > +     int                     ss_pme_irq;
> > +     bool                    is_usb2only;
> > +     bool                    is_hibernation;
> > +};
> > +
> > +#define to_dwc3_google(d) container_of((d), struct dwc3_google, dwc)
> > +
> > +static int dwc3_google_rst_init(struct dwc3_google *google)
> > +{
> > +     int ret;
> > +
> > +     google->num_rsts =3D 4;
> > +     google->rsts[0].id =3D "non_sticky";
> > +     google->rsts[1].id =3D "sticky";
> > +     google->rsts[2].id =3D "drd_bus";
> > +     google->rsts[3].id =3D "top";
> > +
> > +     ret =3D devm_reset_control_bulk_get_exclusive(google->dev,
> > +                                                 google->num_rsts,
> > +                                                 google->rsts);
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     google->non_sticky_rst =3D google->rsts[0].rstc;
> > +
> > +     return 0;
> > +}
> > +
> > +static int dwc3_google_set_pmu_state(struct dwc3_google *google, int s=
tate)
> > +{
> > +     u32 reg;
> > +     int ret;
> > +
> > +     regmap_read(google->usb_cfg_regmap,
> > +                 google->host_cfg_offset + HOST_CFG1_OFFSET, &reg);
> > +
> > +     reg &=3D ~HOST_CFG1_PM_POWER_STATE_REQUEST;
> > +     reg |=3D (FIELD_PREP(HOST_CFG1_PM_POWER_STATE_REQUEST, state) |
> > +             HOST_CFG1_PME_EN);
> > +     regmap_write(google->usb_cfg_regmap,
> > +                  google->host_cfg_offset + HOST_CFG1_OFFSET, reg);
> > +
> > +     ret =3D regmap_read_poll_timeout(google->usb_cfg_regmap,
> > +                                    google->host_cfg_offset + HC_STATU=
S_OFFSET, reg,
> > +                                    (FIELD_GET(HC_STATUS_CURRENT_POWER=
_STATE_U2PMU,
> > +                                               reg) =3D=3D state &&
> > +                                     FIELD_GET(HC_STATUS_CURRENT_POWER=
_STATE_U3PMU,
> > +                                               reg) =3D=3D state),
> > +                                    10, 10000);
> > +
> > +     if (ret)
> > +             dev_err(google->dev, "failed to set PMU state %d\n", stat=
e);
> > +
> > +     return ret;
> > +}
> > +
> > +/*
> > + * Clear pme interrupts and report their status.
> > + * The hardware requires write-1 then write-0 sequence to clear the in=
terrupt bits.
> > + */
> > +static u32 dwc3_google_clear_pme_irqs(struct dwc3_google *google)
> > +{
> > +     u32 irq_status, reg_set, reg_clear;
> > +
> > +     regmap_read(google->usb_cfg_regmap,
> > +                 google->usbint_cfg_offset + USBINT_STATUS_OFFSET, &ir=
q_status);
> > +
> > +     irq_status &=3D (USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RAW |
> > +                    USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW);
> > +     if (!irq_status)
> > +             return irq_status;
> > +
> > +     regmap_read(google->usb_cfg_regmap,
> > +                 google->usbint_cfg_offset + USBINT_CFG1_OFFSET, &reg_=
set);
> > +
> > +     reg_clear =3D reg_set;
> > +     if (irq_status & USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RAW) {
> > +             reg_set |=3D USBINT_CFG1_USBDRD_PME_GEN_U2_INTR_CLR;
> > +             reg_clear &=3D ~USBINT_CFG1_USBDRD_PME_GEN_U2_INTR_CLR;
> > +     }
> > +     if (irq_status & USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW) {
> > +             reg_set |=3D USBINT_CFG1_USBDRD_PME_GEN_U3_INTR_CLR;
> > +             reg_clear &=3D ~USBINT_CFG1_USBDRD_PME_GEN_U3_INTR_CLR;
> > +     }
> > +
> > +     regmap_write(google->usb_cfg_regmap,
> > +                  google->usbint_cfg_offset + USBINT_CFG1_OFFSET, reg_=
set);
> > +     regmap_write(google->usb_cfg_regmap,
> > +                  google->usbint_cfg_offset + USBINT_CFG1_OFFSET, reg_=
clear);
> > +
> > +     return irq_status;
> > +}
> > +
> > +static void dwc3_google_enable_pme_irq(struct dwc3_google *google)
> > +{
> > +     u32 reg;
> > +
> > +     regmap_read(google->usb_cfg_regmap,
> > +                 google->usbint_cfg_offset + USBINT_CFG1_OFFSET, &reg)=
;
> > +     reg &=3D ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
> > +              USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
> > +     reg |=3D (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
> > +             USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
> > +     regmap_write(google->usb_cfg_regmap,
> > +                  google->usbint_cfg_offset + USBINT_CFG1_OFFSET, reg)=
;
> > +
> > +     enable_irq(google->hs_pme_irq);
> > +     enable_irq(google->ss_pme_irq);
> > +     enable_irq_wake(google->hs_pme_irq);
> > +     enable_irq_wake(google->ss_pme_irq);
> > +}
> > +
> > +static void dwc3_google_disable_pme_irq(struct dwc3_google *google)
> > +{
> > +     u32 reg;
> > +
> > +     regmap_read(google->usb_cfg_regmap,
> > +                 google->usbint_cfg_offset + USBINT_CFG1_OFFSET, &reg)=
;
> > +     reg &=3D ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
> > +              USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
> > +     reg |=3D (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
> > +             USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
> > +     regmap_write(google->usb_cfg_regmap,
> > +                  google->usbint_cfg_offset + USBINT_CFG1_OFFSET, reg)=
;
> > +
> > +     disable_irq_wake(google->hs_pme_irq);
> > +     disable_irq_wake(google->ss_pme_irq);
> > +     disable_irq_nosync(google->hs_pme_irq);
> > +     disable_irq_nosync(google->ss_pme_irq);
> > +}
> > +
> > +static irqreturn_t dwc3_google_resume_irq(int irq, void *data)
> > +{
> > +     struct dwc3_google      *google =3D data;
> > +     struct dwc3             *dwc =3D &google->dwc;
> > +     u32 irq_status, dr_role;
> > +
> > +     irq_status =3D dwc3_google_clear_pme_irqs(google);
> > +     dr_role =3D dwc->current_dr_role;
> > +
> > +     if (!irq_status || !google->is_hibernation ||
> > +         dr_role !=3D DWC3_GCTL_PRTCAP_HOST) {
> > +             dev_dbg(google->dev, "spurious pme irq %d, hibernation %d=
, dr_role %u\n",
> > +                     irq, google->is_hibernation, dr_role);
> > +             return IRQ_HANDLED;
> > +     }
> > +
> > +     if (dwc->xhci)
> > +             pm_runtime_resume(&dwc->xhci->dev);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int dwc3_google_request_irq(struct dwc3_google *google, struct =
platform_device *pdev,
> > +                                const char *irq_name, const char *req_=
name)
> > +{
> > +     int ret;
> > +     int irq;
> > +
> > +     irq =3D platform_get_irq_byname(pdev, irq_name);
> > +     if (irq < 0) {
> > +             dev_err(google->dev, "invalid irq name %s\n", irq_name);
> > +             return irq;
> > +     }
> > +
> > +     irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > +     ret =3D devm_request_threaded_irq(google->dev, irq, NULL,
> > +                                     dwc3_google_resume_irq,
> > +                                     IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> > +                                     req_name, google);
> > +     if (ret < 0) {
> > +             dev_err(google->dev, "failed to request irq %s\n", req_na=
me);
> > +             return ret;
> > +     }
> > +
> > +     return irq;
> > +}
> > +
> > +static int dwc3_google_usb_psw_pd_notifier(struct notifier_block *nb, =
unsigned long action, void *d)
> > +{
> > +     struct dwc3_google *google =3D container_of(nb, struct dwc3_googl=
e, usb_psw_pd_nb);
> > +     int ret;
> > +
> > +     if (!google->is_hibernation)
> > +             return NOTIFY_OK;
> > +
> > +     if (action =3D=3D GENPD_NOTIFY_OFF) {
> > +             dev_dbg(google->dev, "enter D3 power state\n");
> > +             dwc3_google_set_pmu_state(google, HOST_CFG1_PM_POWER_STAT=
E_D3);
> > +             ret =3D reset_control_assert(google->non_sticky_rst);
> > +             if (ret)
> > +                     dev_err(google->dev, "non sticky reset assert fai=
led: %d\n", ret);
> > +     } else if (action =3D=3D GENPD_NOTIFY_ON) {
> > +             dev_dbg(google->dev, "enter D0 power state\n");
> > +             dwc3_google_clear_pme_irqs(google);
> > +             ret =3D reset_control_deassert(google->non_sticky_rst);
> > +             if (ret)
> > +                     dev_err(google->dev, "non sticky reset deassert f=
ailed: %d\n", ret);
> > +             dwc3_google_set_pmu_state(google, HOST_CFG1_PM_POWER_STAT=
E_D0);
> > +     }
> > +
> > +     return NOTIFY_OK;
> > +}
> > +
> > +static void dwc3_google_pm_domain_deinit(struct dwc3_google *google)
> > +{
> > +     if (google->usb_top_pd_dl)
> > +             device_link_del(google->usb_top_pd_dl);
> > +
> > +     if (!IS_ERR_OR_NULL(google->usb_top_pd)) {
> > +             device_set_wakeup_capable(google->usb_top_pd, false);
> > +             dev_pm_domain_detach(google->usb_top_pd, true);
> > +     }
> > +
> > +     if (google->usb_psw_pd_dl)
> > +             device_link_del(google->usb_psw_pd_dl);
> > +
> > +     if (!IS_ERR_OR_NULL(google->usb_psw_pd)) {
> > +             dev_pm_genpd_remove_notifier(google->usb_psw_pd);
> > +             dev_pm_domain_detach(google->usb_psw_pd, true);
> > +     }
> > +}
> > +
> > +static int dwc3_google_pm_domain_init(struct dwc3_google *google)
> > +{
> > +     int ret;
> > +
> > +     /*
> > +      * Establish PM RUNTIME link between dwc dev and its power domain=
 usb_psw_pd,
> > +      * register notifier block to handle hibernation.
> > +      */
> > +     google->usb_psw_pd =3D dev_pm_domain_attach_by_name(google->dev, =
"psw");
> > +     if (IS_ERR_OR_NULL(google->usb_psw_pd)) {
> > +             dev_err(google->dev, "failed to get psw pd");
> > +             ret =3D google->usb_psw_pd ? PTR_ERR(google->usb_psw_pd) =
: -ENODATA;
> > +             return ret;
> > +     }
> > +
> > +     google->usb_psw_pd_nb.notifier_call =3D dwc3_google_usb_psw_pd_no=
tifier;
> > +     ret =3D dev_pm_genpd_add_notifier(google->usb_psw_pd, &google->us=
b_psw_pd_nb);
> > +     if (ret) {
> > +             dev_err(google->dev, "failed to add psw pd notifier");
> > +             goto err;
> > +     }
> > +
> > +     google->usb_psw_pd_dl =3D device_link_add(google->dev, google->us=
b_psw_pd,
> > +                                             DL_FLAG_STATELESS | DL_FL=
AG_PM_RUNTIME |
> > +                                             DL_FLAG_RPM_ACTIVE);
> > +     if (!google->usb_psw_pd_dl) {
> > +             dev_err(google->usb_psw_pd, "failed to add device link");
> > +             ret =3D -ENODEV;
> > +             goto err;
> > +     }
> > +
> > +     /*
> > +      * usb_top_pd is the parent power domain of usb_psw_pd. Keeping u=
sb_top_pd on
> > +      * while usb_psw_pd is off places the controller in a power-gated=
 state,
> > +      * essential for hibernation. Acquire a handle to usb_top_pd and =
sets it as
> > +      * wakeup-capable to allow the domain to be left on during system=
 suspend.
> > +      */
> > +     google->usb_top_pd =3D dev_pm_domain_attach_by_name(google->dev, =
"top");
> > +     if (IS_ERR_OR_NULL(google->usb_top_pd)) {
> > +             dev_err(google->dev, "failed to get top pd");
> > +             ret =3D google->usb_top_pd ? PTR_ERR(google->usb_top_pd) =
: -ENODATA;
> > +             goto err;
> > +     }
> > +     device_set_wakeup_capable(google->usb_top_pd, true);
> > +
> > +     google->usb_top_pd_dl =3D device_link_add(google->dev, google->us=
b_top_pd,
> > +                                             DL_FLAG_STATELESS);
> > +     if (!google->usb_top_pd_dl) {
> > +             dev_err(google->usb_top_pd, "failed to add device link");
> > +             ret =3D -ENODEV;
> > +             goto err;
> > +     }
> > +
> > +     return 0;
> > +
> > +err:
> > +     dwc3_google_pm_domain_deinit(google);
> > +
> > +     return ret;
> > +}
> > +
> > +static void dwc3_google_program_usb2only(struct dwc3_google *google)
> > +{
> > +     u32 reg;
> > +
> > +     regmap_read(google->usb_cfg_regmap,
> > +                 google->usbint_cfg_offset + USBCS_TOP_CTRL_CFG1_OFFSE=
T, &reg);
> > +     reg |=3D USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE;
> > +     regmap_write(google->usb_cfg_regmap,
> > +                  google->usbint_cfg_offset + USBCS_TOP_CTRL_CFG1_OFFS=
ET, reg);
> > +}
> > +
> > +static int dwc3_google_probe(struct platform_device *pdev)
> > +{
> > +     struct dwc3_probe_data  probe_data =3D {};
> > +     struct device           *dev =3D &pdev->dev;
> > +     struct dwc3_google      *google;
> > +     struct resource         *res;
> > +     int                     ret;
> > +     u32                     args[2];
> > +
> > +     google =3D devm_kzalloc(&pdev->dev, sizeof(*google), GFP_KERNEL);
> > +     if (!google)
> > +             return -ENOMEM;
> > +
> > +     google->dev =3D &pdev->dev;
> > +
> > +     ret =3D dwc3_google_pm_domain_init(google);
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "failed to init pdom\n");
> > +
> > +     google->usb_cfg_regmap =3D
> > +             syscon_regmap_lookup_by_phandle_args(dev->of_node,
> > +                                                  "google,usb-cfg-csr"=
,
> > +                                                  ARRAY_SIZE(args), ar=
gs);
> > +     if (IS_ERR(google->usb_cfg_regmap)) {
> > +             return dev_err_probe(dev, PTR_ERR(google->usb_cfg_regmap)=
,
> > +                                  "invalid usb cfg csr\n");
> > +     }
> > +
> > +     google->host_cfg_offset =3D args[0];
> > +     google->usbint_cfg_offset =3D args[1];
> > +
> > +     if (device_property_match_string(dev, "phy-names", "usb3-phy") < =
0) {
> > +             google->is_usb2only =3D true;
> > +             dwc3_google_program_usb2only(google);
> > +     }
> > +
> > +     ret =3D devm_clk_bulk_get_all_enabled(dev, &google->clks);
> > +     if (ret < 0) {
> > +             ret =3D dev_err_probe(dev, ret, "failed to get and enable=
 clks\n");
> > +             goto err_deinit_pdom;
> > +     }
> > +     google->num_clks =3D ret;
> > +
> > +     ret =3D dwc3_google_rst_init(google);
> > +     if (ret) {
> > +             ret =3D dev_err_probe(dev, ret, "failed to get resets\n")=
;
> > +             goto err_deinit_pdom;
> > +     }
> > +
> > +     ret =3D reset_control_bulk_deassert(google->num_rsts, google->rst=
s);
> > +     if (ret) {
> > +             ret =3D dev_err_probe(dev, ret, "failed to deassert rsts\=
n");
> > +             goto err_deinit_pdom;
> > +     }
> > +
> > +     ret =3D dwc3_google_request_irq(google, pdev, "hs_pme", "USB HS w=
akeup");
> > +     if (ret < 0) {
> > +             ret =3D dev_err_probe(dev, ret, "failed to request hs pme=
 irq");
> > +             goto err_reset_assert;
> > +     }
> > +     google->hs_pme_irq =3D ret;
> > +
> > +     ret =3D dwc3_google_request_irq(google, pdev, "ss_pme", "USB SS w=
akeup");
> > +     if (ret < 0) {
> > +             ret =3D dev_err_probe(dev, ret, "failed to request ss pme=
 irq");
> > +             goto err_reset_assert;
> > +     }
> > +     google->ss_pme_irq =3D ret;
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     if (!res) {
> > +             ret =3D dev_err_probe(dev, -ENODEV, "invalid memory\n");
> > +             goto err_reset_assert;
> > +     }
> > +
> > +     device_init_wakeup(dev, true);
> > +
> > +     google->dwc.dev =3D dev;
> > +     probe_data.dwc =3D &google->dwc;
> > +     probe_data.res =3D res;
> > +     probe_data.ignore_clocks_and_resets =3D true;
> > +     ret =3D dwc3_core_probe(&probe_data);
> > +     if (ret)  {
> > +             ret =3D dev_err_probe(dev, ret, "failed to register DWC3 =
Core\n");
> > +             goto err_reset_assert;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_reset_assert:
> > +     reset_control_bulk_assert(google->num_rsts, google->rsts);
> > +
> > +err_deinit_pdom:
> > +     dwc3_google_pm_domain_deinit(google);
> > +
> > +     return ret;
> > +}
> > +
> > +static void dwc3_google_remove(struct platform_device *pdev)
> > +{
> > +     struct dwc3 *dwc =3D platform_get_drvdata(pdev);
> > +     struct dwc3_google *google =3D to_dwc3_google(dwc);
> > +
> > +     dwc3_core_remove(&google->dwc);
> > +
> > +     reset_control_bulk_assert(google->num_rsts, google->rsts);
> > +
> > +     dwc3_google_pm_domain_deinit(google);
> > +}
> > +
> > +static int dwc3_google_suspend(struct dwc3_google *google, pm_message_=
t msg)
> > +{
> > +     if (pm_runtime_suspended(google->dev))
> > +             return 0;
> > +
> > +     if (google->dwc.current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) {
> > +             /*
> > +              * Follow dwc3_suspend_common() guidelines for deciding b=
etween
> > +              * a full teardown and hibernation.
> > +              */
> > +             if (PMSG_IS_AUTO(msg) || device_may_wakeup(google->dev)) =
{
> > +                     dev_dbg(google->dev, "enter hibernation");
> > +                     pm_runtime_get_sync(google->usb_top_pd);
> > +                     device_wakeup_enable(google->usb_top_pd);
> > +                     dwc3_google_enable_pme_irq(google);
> > +                     google->is_hibernation =3D true;
> > +                     return 0;
> > +             }
> > +     }
> > +
> > +     reset_control_bulk_assert(google->num_rsts, google->rsts);
> > +     clk_bulk_disable_unprepare(google->num_clks, google->clks);
> > +
> > +     return 0;
> > +}
> > +
> > +static int dwc3_google_resume(struct dwc3_google *google, pm_message_t=
 msg)
> > +{
> > +     int ret;
> > +
> > +     if (google->is_hibernation) {
> > +             dev_dbg(google->dev, "exit hibernation");
> > +             dwc3_google_disable_pme_irq(google);
> > +             device_wakeup_disable(google->usb_top_pd);
> > +             pm_runtime_put_sync(google->usb_top_pd);
> > +             google->is_hibernation =3D false;
> > +             return 0;
> > +     }
> > +
> > +     if (google->is_usb2only)
> > +             dwc3_google_program_usb2only(google);
> > +
> > +     ret =3D clk_bulk_prepare_enable(google->num_clks, google->clks);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D reset_control_bulk_deassert(google->num_rsts, google->rst=
s);
> > +     if (ret) {
> > +             clk_bulk_disable_unprepare(google->num_clks, google->clks=
);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int dwc3_google_pm_suspend(struct device *dev)
> > +{
> > +     struct dwc3 *dwc =3D dev_get_drvdata(dev);
> > +     struct dwc3_google *google =3D to_dwc3_google(dwc);
> > +     int ret;
> > +
> > +     ret =3D dwc3_pm_suspend(&google->dwc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return dwc3_google_suspend(google, PMSG_SUSPEND);
> > +}
> > +
> > +static int dwc3_google_pm_resume(struct device *dev)
> > +{
> > +     struct dwc3 *dwc =3D dev_get_drvdata(dev);
> > +     struct dwc3_google *google =3D to_dwc3_google(dwc);
> > +     int ret;
> > +
> > +     ret =3D dwc3_google_resume(google, PMSG_RESUME);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return dwc3_pm_resume(&google->dwc);
> > +}
> > +
> > +static void dwc3_google_complete(struct device *dev)
> > +{
> > +     struct dwc3 *dwc =3D dev_get_drvdata(dev);
> > +
> > +     dwc3_pm_complete(dwc);
> > +}
> > +
> > +static int dwc3_google_prepare(struct device *dev)
> > +{
> > +     struct dwc3 *dwc =3D dev_get_drvdata(dev);
> > +
> > +     return dwc3_pm_prepare(dwc);
> > +}
> > +
> > +static int dwc3_google_runtime_suspend(struct device *dev)
> > +{
> > +     struct dwc3 *dwc =3D dev_get_drvdata(dev);
> > +     struct dwc3_google *google =3D to_dwc3_google(dwc);
> > +     int ret;
> > +
> > +     ret =3D dwc3_runtime_suspend(&google->dwc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return dwc3_google_suspend(google, PMSG_AUTO_SUSPEND);
> > +}
> > +
> > +static int dwc3_google_runtime_resume(struct device *dev)
> > +{
> > +     struct dwc3 *dwc =3D dev_get_drvdata(dev);
> > +     struct dwc3_google *google =3D to_dwc3_google(dwc);
> > +     int ret;
> > +
> > +     ret =3D dwc3_google_resume(google, PMSG_AUTO_RESUME);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return dwc3_runtime_resume(&google->dwc);
> > +}
> > +
> > +static int dwc3_google_runtime_idle(struct device *dev)
> > +{
> > +     return dwc3_runtime_idle(dev_get_drvdata(dev));
> > +}
> > +
> > +static const struct dev_pm_ops dwc3_google_dev_pm_ops =3D {
> > +     SYSTEM_SLEEP_PM_OPS(dwc3_google_pm_suspend, dwc3_google_pm_resume=
)
> > +     RUNTIME_PM_OPS(dwc3_google_runtime_suspend, dwc3_google_runtime_r=
esume,
> > +                    dwc3_google_runtime_idle)
> > +     .complete =3D pm_sleep_ptr(dwc3_google_complete),
> > +     .prepare =3D pm_sleep_ptr(dwc3_google_prepare),
> > +};
> > +
> > +static const struct of_device_id dwc3_google_of_match[] =3D {
> > +     { .compatible =3D "google,lga-dwc3" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_google_of_match);
> > +
> > +static struct platform_driver dwc3_google_driver =3D {
> > +     .probe          =3D dwc3_google_probe,
> > +     .remove         =3D dwc3_google_remove,
> > +     .driver         =3D {
> > +             .name   =3D "google-dwc3",
>
> Usually the name follow this convention: dwc3-<vendor>
>
> > +             .pm     =3D pm_ptr(&dwc3_google_dev_pm_ops),
> > +             .of_match_table =3D dwc3_google_of_match,
> > +     },
> > +};
> > +
> > +module_platform_driver(dwc3_google_driver);
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DesignWare DWC3 Google Glue Driver");
> > --
> > 2.51.2.1041.gc1ab5b90ca-goog
> >
>
> Beside the minor naming nit:
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>
> BR,
> Thinh

Hi Thinh,

Sending out a new version with the corrected naming and the Acked-by
tag appended.

Thanks,
Roy Luo
