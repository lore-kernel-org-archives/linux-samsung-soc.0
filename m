Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F842D7DDC
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Nov 2025 10:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253794; cv=none; b=NTsBOlwUW5Y1M7jkPp1balYAWE/CQRgMV+9qop6JAI5Vgmpk2vIHcsQcb2LlJcIwFGB0blc0fLzM1p/ZIXsPcitCwg5ZRE+9eTm3dq3Wdk/V/XfjCc2CVUzoAUPTCkpdDVQJBbmfa9KzbpfJNGMkbzPEAAbW0Qz/TqkkEplX3NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253794; c=relaxed/simple;
	bh=BFi44eOkEipSe1+H2C7CwukP35f1ca/hvXiGSYbEoDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3qH95IfJyQqKFxyq1rIYR71+Y09AHZJ47DYIMc8eost3y59MS/k9Yaqbdi+NnY0Xz1ckhCbwI5KcQp8T/jctIff0RqSZ3fmgPe36nMNkfMmsYWZYN+GHAKLoqoWvOLqQ6AdO9BVKjimpqlQp0UHbcI/VLc/CNMGXlMT6Vs4sjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KXMxLAIY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KXMxLAIY"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b9a6ff216faso2051134a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2025 02:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762253792; x=1762858592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlqJVflI/4UV/nDfHHsxjzGlffKsFlH8kYL3PZuNyEQ=;
        b=KXMxLAIY2rv5YarsMPChEUuKUIgVGu/NF4d9COdfLpfF1iLa0WM7cgPS7vgrb6ofgK
         Z4AGcnLHk8SS12OB8sDyPAPqpMyofErmvLK9lAk33GtIRlq6xLIrB8g2oIguuHZ+Va7x
         KvlFprEiGltAu8Il5ilq3QMaHdcBVUON3Ni069Q0MC2RQdT4SKS6PzKyulEXH+ERudEs
         ojkra2pSsstW65yigJRrt7gYFWyIhwNta43VTu10yEcoU5BxU1gHSDyxkjzGBKgollEi
         EDSanSItS6lqv6VWaImJ/FKDNuqP9Rx8V1i1Qz+AfQzvD0fg7CxA8BTUBnHv/cGQwFNi
         hE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762253792; x=1762858592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlqJVflI/4UV/nDfHHsxjzGlffKsFlH8kYL3PZuNyEQ=;
        b=FSZfrQ0Eg/B1FnI1LOcPfSwrfD6/DjDkmUXGSxlRQeN6nkjQVY+az27k7750kr4zoJ
         4Y/s7o19scss4xVQ3PCM0A2a9cNoLDI1cMzCJlNvUmmbVrvLHJLm1ewP0UfuKdXhwtC/
         EfI6O1ZhjzCEIGtJB58dv9Sq4S1gRFhAjuiSoUwSaG3FE7zYQEPznBnZTTH7ygLZnpVj
         iypWLjbmuvdqw4SG92FykpoobLl+htqqiOThU8I32iAnwPgyaiYvM4O9QS6troQQ9OV9
         rhsfaLs2Dh4PFFkZR3WsVXcc0DVq4NXzI6wp4EhVXSeJo3XHySZXunfEW94CbdBhn6Vw
         Mm0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZ20+8DHpwF9C01cbRq0SAL0N2TzRjxB+JZ8XMQ5UhDVm39O6QVPsBE2bTyPy9S6cX9tznj0Rr7RGvC5oul0vTvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ZMvWmyAGWCNbER6+yprESpcsM3Wbn0fLK+dHRNMjer8DtqGn
	ABxJF7IdzrDrLSX2chuwgeoPeXmjoO8Jz7rUgtFSmI4ykQ6aWDm2fSKinXAZuXS6MehlLJ1eJn9
	83quj8CfoBDERZ12mTWglsdvMOO/yhQuzfAN1fyXs
X-Gm-Gg: ASbGncvDBYrCyZ/EAvpJSjWTFbJF5fkj46wTgy9/5kT5i0LhTP+Nn1i1k6w3ww2apRA
	dbevForpZchmTAAhp1hkeK5v/FA8CdAeyhZT/OgFMj9911rWH3w+FlhW8v3AXsujPKjs5Lx3H3h
	/AVUgJMqJp6JztUZ9BklBTuYoYPehYqaz2gjyAM2BREUzGuNwrPRiFLC7l1h+db5PcqUtZci2F1
	/9tcBDm1WkaLXiRiORQursEeK6GK0Q8xLCLom+e9gu3oTpSUSnNWoNcl69DSXZUlCxowtE=
X-Google-Smtp-Source: AGHT+IFlqZcZI3gQTzh4PfwxmMVw/FPjzMsWE+CItZPw6W1wDbfHxGcIVAcsLxOv4zJrPMPC1U8jX5nSYtK54I2+UEQ=
X-Received: by 2002:a05:6a20:748e:b0:343:af1:9a5a with SMTP id
 adf61e73a8af0-348ca2519b4mr20331473637.5.1762253791485; Tue, 04 Nov 2025
 02:56:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com> <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
 <20251104020713.orax7rk6qhko5p4m@synopsys.com>
In-Reply-To: <20251104020713.orax7rk6qhko5p4m@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Tue, 4 Nov 2025 18:55:54 +0800
X-Gm-Features: AWmQ_bkGs51fSU2qUid3Bn4WWpaCIfj6EyjNKfCiaXsb9dUJtMfE57YOpRV31mk
Message-ID: <CA+zupgy4qO9X=R7KqEru5kr7tYhgdw=9Z70sLNKj5DTS_J7KZw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 10:07=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Fri, Oct 31, 2025, Roy Luo wrote:
> > On Wed, Oct 29, 2025 at 6:35=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Fri, Oct 17, 2025, Roy Luo wrote:
> > > > Add support for the DWC3 USB controller found on Google Tensor G5.
> > > > The controller features dual-role functionality and hibernation.
> > > >
> > > > The primary focus is implementing hibernation support in host mode,
> > > > enabling the controller to enter a low-power state (D3). This is
> > > > particularly relevant during system power state transition and
> > > > runtime power management for power efficiency.
> > > > Highlights:
> > > > - Align suspend callback with dwc3_suspend_common() for deciding
> > > >   between a full teardown and hibernation in host mode.
> > > > - Integration with `psw` (power switchable) and `top` power domains=
,
> > > >   managing their states and device links to support hibernation.
> > > > - A notifier callback dwc3_google_usb_psw_pd_notifier() for
> > > >   `psw` power domain events to manage controller state
> > > >   transitions to/from D3.
> > > > - Coordination of the `non_sticky` reset during power state
> > > >   transitions, asserting it on D3 entry and deasserting on D0 entry
> > > >   in hibernation scenario.
> > > > - Handling of high-speed and super-speed PME interrupts
> > > >   that are generated by remote wakeup during hibernation.
> > > >
> > > > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > > > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > > > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > > > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > > > Signed-off-by: Roy Luo <royluo@google.com>
> > > > ---
> > > >  drivers/usb/dwc3/Kconfig       |  10 +
> > > >  drivers/usb/dwc3/Makefile      |   1 +
> > > >  drivers/usb/dwc3/dwc3-google.c | 608 +++++++++++++++++++++++++++++=
++++
> > > >  3 files changed, 619 insertions(+)
> > > >  create mode 100644 drivers/usb/dwc3/dwc3-google.c
> > > >
> > > > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > > > index 310d182e10b5..467515d5f937 100644
> > > > --- a/drivers/usb/dwc3/Kconfig
> > > > +++ b/drivers/usb/dwc3/Kconfig
> > > > @@ -189,4 +189,14 @@ config USB_DWC3_RTK
> > > >         or dual-role mode.
> > > >         Say 'Y' or 'M' if you have such device.
> > > >
> > > > +config USB_DWC3_GOOGLE
> > > > +     tristate "Google Platform"
> > > > +     depends on OF && COMMON_CLK && RESET_CONTROLLER
> > > > +     default n
> > > > +     help
> > > > +       Support the DesignWare Core USB3 IP found on Google Tensor
> > > > +       SoCs, starting with the G5 generation. This driver includes
> > > > +       support for hibernation in host mode.
> > > > +       Say 'Y' or 'M' if you have one such device.
> > > > +
> > > >  endif
> > > > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > > > index 830e6c9e5fe0..a94982630657 100644
> > > > --- a/drivers/usb/dwc3/Makefile
> > > > +++ b/drivers/usb/dwc3/Makefile
> > > > @@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)               +=3D =
dwc3-imx8mp.o
> > > >  obj-$(CONFIG_USB_DWC3_XILINX)                +=3D dwc3-xilinx.o
> > > >  obj-$(CONFIG_USB_DWC3_OCTEON)                +=3D dwc3-octeon.o
> > > >  obj-$(CONFIG_USB_DWC3_RTK)           +=3D dwc3-rtk.o
> > > > +obj-$(CONFIG_USB_DWC3_GOOGLE)                +=3D dwc3-google.o
> > > > diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3=
-google.c
> > > > new file mode 100644
> > > > index 000000000000..d3fec6fb4dcc
> > > > --- /dev/null
> > > > +++ b/drivers/usb/dwc3/dwc3-google.c
> > > > @@ -0,0 +1,608 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * dwc3-google.c - Google DWC3 Specific Glue Layer
> > > > + *
> > > > + * Copyright (c) 2025, Google LLC
> > > > + * Author: Roy Luo <royluo@google.com>
> > > > + */
> > > > +
> > > > +#include <linux/of.h>
> > > > +#include <linux/bitfield.h>
> > > > +#include <linux/irq.h>
> > > > +#include <linux/clk.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/reset.h>
> > > > +#include <linux/pm_domain.h>
> > > > +#include <linux/iopoll.h>
> > > > +#include "core.h"
> > > > +#include "glue.h"
> > > > +
> > > > +/* HOST CFG registers */
> > > > +#define HC_STATUS_OFFSET 0x0
> > > > +#define HC_STATUS_CURRENT_POWER_STATE_U2PMU GENMASK(1, 0)
> > > > +#define HC_STATUS_CURRENT_POWER_STATE_U3PMU GENMASK(4, 3)
> > > > +
> > > > +#define HOST_CFG1_OFFSET 0x4
> > > > +#define HOST_CFG1_PME_EN BIT(3)
> > > > +#define HOST_CFG1_PM_POWER_STATE_REQUEST GENMASK(5, 4)
> > > > +#define HOST_CFG1_PM_POWER_STATE_D0 0x0
> > > > +#define HOST_CFG1_PM_POWER_STATE_D3 0x3
> > > > +
> > > > +/* USBINT registers */
> > > > +#define USBINT_CFG1_OFFSET 0x0
> > > > +#define USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK BIT(2)
> > > > +#define USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK BIT(3)
> > > > +#define USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN BIT(8)
> > > > +#define USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN BIT(9)
> > > > +#define USBINT_CFG1_USBDRD_PME_GEN_U2_INTR_CLR BIT(14)
> > > > +#define USBINT_CFG1_USBDRD_PME_GEN_U3_INTR_CLR BIT(15)
> > > > +
> > > > +#define USBINT_STATUS_OFFSET 0x4
> > > > +#define USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RAW BIT(2)
> > > > +#define USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW BIT(3)
> > > > +
> > > > +#define USBCS_TOP_CTRL_CFG1_OFFSET 0xc
> > > > +#define USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE BIT(5)
> > > > +
> > > > +#define DWC3_GOOGLE_MAX_RESETS       4
> > > > +
> > > > +struct dwc3_google {
> > > > +     struct device           *dev;
> > > > +     struct dwc3             dwc;
> > > > +     struct clk_bulk_data    *clks;
> > > > +     int                     num_clks;
> > > > +     struct reset_control_bulk_data rsts[DWC3_GOOGLE_MAX_RESETS];
> > > > +     int                     num_rsts;
> > > > +     struct reset_control    *non_sticky_rst;
> > > > +     struct device           *usb_psw_pd;
> > > > +     struct device_link      *usb_psw_pd_dl;
> > > > +     struct notifier_block   usb_psw_pd_nb;
> > > > +     struct device           *usb_top_pd;
> > > > +     struct device_link      *usb_top_pd_dl;
> > > > +     void __iomem            *host_cfg_base;
> > > > +     void __iomem            *usbint_cfg_base;
> > > > +     int                     hs_pme_irq;
> > > > +     int                     ss_pme_irq;
> > > > +     bool                    is_usb2only;
> > > > +     bool                    is_hibernation;
> > > > +};
> > > > +
> > > > +#define to_dwc3_google(d) container_of((d), struct dwc3_google, dw=
c)
> > > > +
> > > > +static int dwc3_google_rst_init(struct dwc3_google *google)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     google->num_rsts =3D 4;
> > > > +     google->rsts[0].id =3D "non_sticky";
> > > > +     google->rsts[1].id =3D "sticky";
> > > > +     google->rsts[2].id =3D "drd_bus";
> > > > +     google->rsts[3].id =3D "top";
> > > > +
> > > > +     ret =3D devm_reset_control_bulk_get_exclusive(google->dev,
> > > > +                                                 google->num_rsts,
> > > > +                                                 google->rsts);
> > > > +
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     google->non_sticky_rst =3D google->rsts[0].rstc;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int dwc3_google_set_pmu_state(struct dwc3_google *google, i=
nt state)
> > > > +{
> > > > +     u32 reg;
> > > > +     int ret;
> > > > +
> > > > +     reg =3D readl(google->host_cfg_base + HOST_CFG1_OFFSET);
> > > > +     reg &=3D ~HOST_CFG1_PM_POWER_STATE_REQUEST;
> > > > +     reg |=3D (FIELD_PREP(HOST_CFG1_PM_POWER_STATE_REQUEST, state)=
 |
> > > > +             HOST_CFG1_PME_EN);
> > > > +     writel(reg, google->host_cfg_base + HOST_CFG1_OFFSET);
> > > > +
> > > > +     ret =3D readl_poll_timeout(google->host_cfg_base + HC_STATUS_=
OFFSET, reg,
> > > > +                              (FIELD_GET(HC_STATUS_CURRENT_POWER_S=
TATE_U2PMU, reg) =3D=3D state &&
> > > > +                               FIELD_GET(HC_STATUS_CURRENT_POWER_S=
TATE_U3PMU, reg) =3D=3D state),
> > > > +                              10, 10000);
> > > > +
> > > > +     if (ret)
> > > > +             dev_err(google->dev, "failed to set PMU state %d\n", =
state);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +/*
> > > > + * Clear pme interrupts and report their status.
> > > > + * The hardware requires write-1 then write-0 sequence to clear th=
e interrupt bits.
> > > > + */
> > > > +static u32 dwc3_google_clear_pme_irqs(struct dwc3_google *google)
> > > > +{
> > > > +     u32 irq_status, reg_set, reg_clear;
> > > > +
> > > > +     irq_status =3D readl(google->usbint_cfg_base + USBINT_STATUS_=
OFFSET);
> > > > +     irq_status &=3D (USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RA=
W |
> > > > +                    USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW)=
;
> > > > +     if (!irq_status)
> > > > +             return irq_status;
> > > > +
> > > > +     reg_set =3D readl(google->usbint_cfg_base + USBINT_CFG1_OFFSE=
T);
> > > > +     reg_clear =3D reg_set;
> > > > +     if (irq_status & USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RA=
W) {
> > > > +             reg_set |=3D USBINT_CFG1_USBDRD_PME_GEN_U2_INTR_CLR;
> > > > +             reg_clear &=3D ~USBINT_CFG1_USBDRD_PME_GEN_U2_INTR_CL=
R;
> > > > +     }
> > > > +     if (irq_status & USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RA=
W) {
> > > > +             reg_set |=3D USBINT_CFG1_USBDRD_PME_GEN_U3_INTR_CLR;
> > > > +             reg_clear &=3D ~USBINT_CFG1_USBDRD_PME_GEN_U3_INTR_CL=
R;
> > > > +     }
> > > > +
> > > > +     writel(reg_set, google->usbint_cfg_base + USBINT_CFG1_OFFSET)=
;
> > > > +     writel(reg_clear, google->usbint_cfg_base + USBINT_CFG1_OFFSE=
T);
> > > > +
> > > > +     return irq_status;
> > > > +}
> > > > +
> > > > +static void dwc3_google_enable_pme_irq(struct dwc3_google *google)
> > > > +{
> > > > +     u32 reg;
> > > > +
> > > > +     reg =3D readl(google->usbint_cfg_base + USBINT_CFG1_OFFSET);
> > > > +     reg &=3D ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
> > > > +              USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
> > > > +     reg |=3D (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
> > > > +             USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
> > > > +     writel(reg, google->usbint_cfg_base + USBINT_CFG1_OFFSET);
> > > > +
> > > > +     enable_irq(google->hs_pme_irq);
> > > > +     enable_irq(google->ss_pme_irq);
> > > > +     enable_irq_wake(google->hs_pme_irq);
> > > > +     enable_irq_wake(google->ss_pme_irq);
> > > > +}
> > > > +
> > > > +static void dwc3_google_disable_pme_irq(struct dwc3_google *google=
)
> > > > +{
> > > > +     u32 reg;
> > > > +
> > > > +     reg =3D readl(google->usbint_cfg_base + USBINT_CFG1_OFFSET);
> > > > +     reg &=3D ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
> > > > +              USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
> > > > +     reg |=3D (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
> > > > +             USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
> > > > +     writel(reg, google->usbint_cfg_base + USBINT_CFG1_OFFSET);
> > > > +
> > > > +     disable_irq_wake(google->hs_pme_irq);
> > > > +     disable_irq_wake(google->ss_pme_irq);
> > > > +     disable_irq_nosync(google->hs_pme_irq);
> > > > +     disable_irq_nosync(google->ss_pme_irq);
> > > > +}
> > > > +
> > > > +static irqreturn_t dwc3_google_resume_irq(int irq, void *data)
> > > > +{
> > > > +     struct dwc3_google      *google =3D data;
> > > > +     struct dwc3             *dwc =3D &google->dwc;
> > > > +     u32 irq_status, dr_role;
> > > > +
> > > > +     irq_status =3D dwc3_google_clear_pme_irqs(google);
> > > > +     dr_role =3D dwc->current_dr_role;
> > > > +
> > > > +     if (!irq_status || !google->is_hibernation ||
> > >
> > > Any handling of race condition with is_hibernation?
> >
> > IIUC, you're referring to the race between
> > - pme irq handler: dwc3_google_resume_irq() reads is_hibernation
> > - suspend/resume work: sets and unsets is_hibernation
> >
> > Possible scenarios:
> > 1. Suspend into hibernation: everything is serialized.
> >         dwc3_google_suspend() sets is_hibernation
> >     -> usb psw pdom is turned off
> >     -> controller enters D3
> >     -> pme irq could be triggered
> >     -> pme irq handler
>
> In dwc3_google_suspend(), looks like is_hibernation is set after you
> enable pme irq, probably very unlikely, but can the interrupt be
> asserted then? If so, will there be another interrupt asserted?
> Otherwise the current logic may think it was spurious interrupt a miss
> an event.

The pme interrupt can only be asserted after controller is in
hibernation, that is, after the usb psw dom is turned off and
the dwc3_google_usb_psw_pd_notifier() callback is
completed. So no, the interrupt won't fire before is_hibernation
is set.

>
> > 2.1 Resume from hibernation: irq handler wins the race.
> >            pme irq handler (is_hibernation =3D true) triggers resume
> >        -> usb psw pdom is turned on
> >        -> dwc3_google_resume() unset is_hibernation
> > 2.2 Resume from hibernation: resume work wins the race.
> >            usb psw pdom is turned on
> >        -> dwc3_google_resume() unset is_hibernation
> >        -> pme irq handler (is_hibernation =3D false) does nothing
> >
> > So far I don't see any issues in any of the scenarios, please
> > let me know if otherwise.
> >
> > >
> > > > +         dr_role !=3D DWC3_GCTL_PRTCAP_HOST) {
> > > > +             dev_warn(google->dev, "spurious pme irq %d, hibernati=
on %d, dr_role %u\n",
> > > > +                      irq, google->is_hibernation, dr_role);
> > >
> > > Should we limit this print and do we need this to be dev_warn? It may=
 be
> > > noisy wouldn't it.
> >
> > Ack, will make it WARN_ONCE in the next version.
>
> As Greg noted, don't use WARN_ONCE. I don't know how often spurious
> come, if there are many, perhaps use dev_dbg_ratelimited? If not, just
> stick to dev_dbg(). The regular user doesn't need to know about this
> right?

This case should be very very rare, I haven't seen it on the field.
And yes, this log isn't for regular end users.
I will change it to dev_dbg() as suggested in the next version.

>
> >
> > >
> > > > +             return IRQ_HANDLED;
> > > > +     }
> > > > +
> > > > +     if (dwc->xhci)
> > > > +             pm_runtime_resume(&dwc->xhci->dev);
> > > > +
> > > > +     return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +static int dwc3_google_request_irq(struct dwc3_google *google, str=
uct platform_device *pdev,
> > > > +                                const char *irq_name, const char *=
req_name)
> > > > +{
> > > > +     int ret;
> > > > +     int irq;
> > > > +
> > > > +     irq =3D platform_get_irq_byname(pdev, irq_name);
> > > > +     if (irq < 0) {
> > > > +             dev_err(google->dev, "invalid irq name %s\n", irq_nam=
e);
> > > > +             return irq;
> > > > +     }
> > > > +
> > > > +     irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > > > +     ret =3D devm_request_threaded_irq(google->dev, irq, NULL,
> > > > +                                     dwc3_google_resume_irq,
> > > > +                                     IRQF_TRIGGER_HIGH | IRQF_ONES=
HOT,
> > > > +                                     req_name, google);
> > > > +     if (ret < 0) {
> > > > +             dev_err(google->dev, "failed to request irq %s\n", re=
q_name);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     return irq;
> > > > +}
> > > > +
> > > > +static int dwc3_google_usb_psw_pd_notifier(struct notifier_block *=
nb, unsigned long action, void *d)
> > > > +{
> > > > +     struct dwc3_google *google =3D container_of(nb, struct dwc3_g=
oogle, usb_psw_pd_nb);
> > > > +     int ret;
> > > > +
> > > > +     if (!google->is_hibernation)
> > > > +             return NOTIFY_OK;
> > > > +
> > > > +     if (action =3D=3D GENPD_NOTIFY_OFF) {
> > > > +             dev_dbg(google->dev, "enter D3 power state\n");
> > > > +             dwc3_google_set_pmu_state(google, HOST_CFG1_PM_POWER_=
STATE_D3);
> > >
> > > What happen when we failed to set the PMU state?
> >
> > Apparently there must be something wrong with the hardware.
> > Currently we only throw some error logs as no reliable recovery
> > mechanism is known.
>
> Just checking here because you did not return early and error out. If
> it's already in a bad state and no known recovery mechanism, either way
> is fine.

Ack.

>
> >
> > >
> > > > +             ret =3D reset_control_assert(google->non_sticky_rst);
> > > > +             if (ret)
> > > > +                     dev_err(google->dev, "non sticky reset assert=
 failed: %d\n", ret);
> > > > +     } else if (action =3D=3D GENPD_NOTIFY_ON) {
> > > > +             dev_dbg(google->dev, "enter D0 power state\n");
> > > > +             dwc3_google_clear_pme_irqs(google);
> > > > +             ret =3D reset_control_deassert(google->non_sticky_rst=
);
> > > > +             if (ret)
> > > > +                     dev_err(google->dev, "non sticky reset deasse=
rt failed: %d\n", ret);
> > > > +             dwc3_google_set_pmu_state(google, HOST_CFG1_PM_POWER_=
STATE_D0);
> > > > +     }
> > > > +
> > > > +     return NOTIFY_OK;
> > > > +}
> > > > +
> > > > +static void dwc3_google_pm_domain_deinit(struct dwc3_google *googl=
e)
> > > > +{
> > > > +     if (google->usb_top_pd_dl)
> > > > +             device_link_del(google->usb_top_pd_dl);
> > > > +
> > > > +     if (!IS_ERR_OR_NULL(google->usb_top_pd)) {
> > > > +             device_set_wakeup_capable(google->usb_top_pd, false);
> > > > +             dev_pm_domain_detach(google->usb_top_pd, true);
> > > > +     }
> > > > +
> > > > +     if (google->usb_psw_pd_dl)
> > > > +             device_link_del(google->usb_psw_pd_dl);
> > > > +
> > > > +     if (!IS_ERR_OR_NULL(google->usb_psw_pd)) {
> > > > +             dev_pm_genpd_remove_notifier(google->usb_psw_pd);
> > > > +             dev_pm_domain_detach(google->usb_psw_pd, true);
> > > > +     }
> > > > +}
> > > > +
> > > > +static int dwc3_google_pm_domain_init(struct dwc3_google *google)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     /*
> > > > +      * Establish PM RUNTIME link between dwc dev and its power do=
main usb_psw_pd,
> > > > +      * register notifier block to handle hibernation.
> > > > +      */
> > > > +     google->usb_psw_pd =3D dev_pm_domain_attach_by_name(google->d=
ev, "psw");
> > > > +     if (IS_ERR_OR_NULL(google->usb_psw_pd)) {
> > > > +             dev_err(google->dev, "failed to get psw pd");
> > > > +             ret =3D google->usb_psw_pd ? PTR_ERR(google->usb_psw_=
pd) : -ENODATA;
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     google->usb_psw_pd_nb.notifier_call =3D dwc3_google_usb_psw_p=
d_notifier;
> > > > +     ret =3D dev_pm_genpd_add_notifier(google->usb_psw_pd, &google=
->usb_psw_pd_nb);
> > > > +     if (ret) {
> > > > +             dev_err(google->dev, "failed to add psw pd notifier")=
;
> > > > +             goto err;
> > > > +     }
> > > > +
> > > > +     google->usb_psw_pd_dl =3D device_link_add(google->dev, google=
->usb_psw_pd,
> > > > +                                             DL_FLAG_STATELESS | D=
L_FLAG_PM_RUNTIME |
> > > > +                                             DL_FLAG_RPM_ACTIVE);
> > > > +     if (!google->usb_psw_pd_dl) {
> > > > +             dev_err(google->usb_psw_pd, "failed to add device lin=
k");
> > > > +             ret =3D -ENODEV;
> > > > +             goto err;
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * usb_top_pd is the parent power domain of usb_psw_pd. Keepi=
ng usb_top_pd on
> > > > +      * while usb_psw_pd is off places the controller in a power-g=
ated state,
> > > > +      * essential for hibernation. Acquire a handle to usb_top_pd =
and sets it as
> > > > +      * wakeup-capable to allow the domain to be left on during sy=
stem suspend.
> > > > +      */
> > >
> > > I'm still trying to wrap my head around how usb_top_pd, usb_psw_pd, a=
nd
> > > the google->dev are working together in the glue here, particularly w=
hy
> > > usb_top_pd is needed. It seems usb_top_pd shouldn't be handled by thi=
s
> > > glued? Do you do anything except setting wakeup-capable?
> > >
> > > BR,
> > > Thinh
> >
> > To provide more context, the underlying usb power domain has 3 power
> > states: Full Power, Power Gated, Off. The usb_top_pd and usb_psw_pd
> > are the logical power domains to represent the 3 power states.
> > - Full Power:     usb_psw_pd ON,   usb_top_p ON.
> > - Power Gated: usb_psw_pd OFF, usb_top_p ON.
> > - Off:                 usb_psw_pd OFF, usb_top_p OFF.
> >
> > To enter hibernation, the usb power domain must enter Power Gated
> > state. To achieve this, this glue driver holds a handle to usb_top_pd
> > and would cast a vote to keep it ON when attempting to enter
> > hibernation. In addition, the usb_psw_pd runtime PM is directly tied
> > to google->dev so that usb_psw_pd would be OFF when google->dev
> > suspends. Together, the usb power domain would reach Power Gated
> > state when device suspends.
> >
> > I hope this information helps.
> >
>
> Yes. This is very helpful.
>
> So, while the glue driver is bound, usb_top_pd is always ON? Even when
> xhci driver is not bound or when in device mode?

Since usb_top_pd is the parent power domain of usb_psw_pd, and
usb_psw_pd RPM is directly tied to glue device, usb_top_pd would
be ON when glue device is active (because usb_psw_pd is ON)
and would be OFF when glue device suspends in non-hibernation
scenarios (because usb_psw_pd is OFF). In hibernation scenario,
a vote is casted for usb_top_pd to keep it on even when the
glue device is suspended and usb_psw_pd is OFF.

To your question, usb_top_pd is not always ON because it would be
turned off when the glue device suspends in non-hibernation scenario.
When in device mode and provided dwc3 dev is active, usb_top_pd
would be ON because its child usb_psw_pd is ON.

Regards,
Roy Luo

>
> BR,
> Thinh
