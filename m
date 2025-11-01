Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8EC1A08DB
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Nov 2025 00:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761958209; cv=none; b=PKUSn2TU/8cdJXWnvCucVf/6hI9VuN8IRuTg5d92ktCtE5+fI410FcvBeG96k9HRMJUvgp41KmkzZST9o/l12+vzuVaAd2f0YCXtFOaXLxawtTNSu/XbygmgTlcoLnUxzZWbhnF7iuZ9XCXYI2noddhR8/MQ+pFf8v+eX4exbAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761958209; c=relaxed/simple;
	bh=y2cBCgTbh49tdHvYFiJZDRBI6eTS5YSi+HclAKk3IoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjt2NFeS78TfyCL2xWN772v/h8aV2B7zVNMaU/K7F0pxjXechYSavzrlaYPlGlW5uD200rynPjdQ42pAI5dTDbdEFpF+yEBZQV1qrLpoIJSqWkZxY2TMVtaoGISaNdpPztJ9x5BxpfwuW4KWtXsRKhBq2lgq+BY5uA+g/zaMnC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YENJ19Jy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YENJ19Jy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29555b384acso2331135ad.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 17:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761958206; x=1762563006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prIDr0v83nBzK7ef5IsD2KTjS5+vPwH8hb6UKUtUflo=;
        b=YENJ19JyzYOovhj1imvnC2EE2uq+lS3EO3Xt8RNnOVNVf9CWqCuyp50R6An57jEwcj
         ygu5jq1UIshvFKJvAdTe6WmcR+eIfzotfg/Iwhgw6czoAMaoqI0UBaZeTb8KJ3OJJ4VG
         eFzUPTQITDJphk4Aj6+1OKwNSGZfXDQQcDhpz1vAtR8DfIb/5+A8+teoebQ18Zrc5jlG
         JbCDHw6iFd4by7LGbJ+T9OSg+5mzjhd+icX6/8Mg7HQ83+GGRtzR/Dknh5IuWj10Yc6s
         drOM0O4wur0IEzzWPSUMFYGgp9cX5g3jmbVq9GI28/xbtN6cBaU5N5j/7/NZd3MPCPv/
         mTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761958206; x=1762563006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prIDr0v83nBzK7ef5IsD2KTjS5+vPwH8hb6UKUtUflo=;
        b=c96g80jGDFtjvw2+8tK+PPnKyhaoa02+mFkZVVIpz3zWS7Uk+uHHynUt6t6mwbWTIu
         xd/W74I043V9rS+JItdWtOL4teILQo4+l2g13QjwJwR0bv5PQ2jur1/z+P0jJtU+YI2I
         WfQ1+M2jAcO4WZ5/Jw91iMb1Wm2Hb8uCmot+XsBWGPiNUOqNgPUsDWMfdyCbt9AFb7P6
         bjHRTFkt8/2NvW6fbCIrMZM+ZU0egymuZByTXXAsNWTzaw3Xg48TpScvBDoUNBmTdZpI
         P/qc0mlGdGSZCTS/tnZnJWP6hZk0oKm7+C6jR3gxrbqxODvHCAn3zh1KrfYuWr0YH75t
         FftA==
X-Forwarded-Encrypted: i=1; AJvYcCVvJPJwAO3a+U1ebhilgleQWIfOz5AQKwZBJNwlUaOxvxBs/GgIhCjoPHeup3y4KEV69z4AmEvq8kY1ZIchIR5bFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB7O4qPEcc27k9M1BQgR3I9wcyUA1e7IM1f5gkVPXpoD9rCxZ6
	+nxljIsnXmc1IzoggYgCxUWvsjCkUgKg0asUsCjTaps2/rG1Cvn0LmGUOCrJbS44x19axFa8NMx
	r63s4t5IQixqIeLaD40MyjFAcp/lkDc/tj+HvYbur
X-Gm-Gg: ASbGncvCbF7vEUgrpDGrSnSA3lUQEqacpXuRVGtJ5piEvUspdhXHU/EXb/0wWSdCJ+t
	VdplOk82sWY/6TiTAehfWABHTtISpSTDHmisgqz6T+hpKDcbLYht89vnatlm5I+5WdBPbK+saU4
	Lz+PvF3tYeNpC1CjMrSSiLO29GQ1cb2ufdIikiZ8aOvULY3pyV2J3zUGWjhpiQJsm4VE/eSEwkO
	fITUK5aJyl7pjpdYuBtKmgtqBs/okJMOLBMOPklXjWWxZwWOUI702jowRk3+WohuIsXgDM42Xh0
	PmxKQYyMCyG/oMnNbbwTLYhKvq8=
X-Google-Smtp-Source: AGHT+IFADlqoE+gmLWJ5HoqYP6H5AkiPCK+Y0nnr9gYWi1V22SdhLJv4bM4UZzI0IclP064eZzW3VrpaRsTS/fUVUnI=
X-Received: by 2002:a17:903:187:b0:295:1277:7926 with SMTP id
 d9443c01a7336-2951a4976f9mr77763365ad.23.1761958206013; Fri, 31 Oct 2025
 17:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com>
In-Reply-To: <20251030011659.bmgdry3wwf4kgjwv@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 31 Oct 2025 17:49:28 -0700
X-Gm-Features: AWmQ_bnDbnKPB7oHs3pBpVgtw3u9v6OtB24erRqsGt4E8wLlt1JMD7pWjT9wli4
Message-ID: <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
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

On Wed, Oct 29, 2025 at 6:35=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Fri, Oct 17, 2025, Roy Luo wrote:
> > Add support for the DWC3 USB controller found on Google Tensor G5.
> > The controller features dual-role functionality and hibernation.
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
> >  drivers/usb/dwc3/dwc3-google.c | 608 +++++++++++++++++++++++++++++++++
> >  3 files changed, 619 insertions(+)
> >  create mode 100644 drivers/usb/dwc3/dwc3-google.c
> >
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 310d182e10b5..467515d5f937 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -189,4 +189,14 @@ config USB_DWC3_RTK
> >         or dual-role mode.
> >         Say 'Y' or 'M' if you have such device.
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
> > index 830e6c9e5fe0..a94982630657 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)               +=3D dwc3=
-imx8mp.o
> >  obj-$(CONFIG_USB_DWC3_XILINX)                +=3D dwc3-xilinx.o
> >  obj-$(CONFIG_USB_DWC3_OCTEON)                +=3D dwc3-octeon.o
> >  obj-$(CONFIG_USB_DWC3_RTK)           +=3D dwc3-rtk.o
> > +obj-$(CONFIG_USB_DWC3_GOOGLE)                +=3D dwc3-google.o
> > diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-goo=
gle.c
> > new file mode 100644
> > index 000000000000..d3fec6fb4dcc
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-google.c
> > @@ -0,0 +1,608 @@
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
> > +     void __iomem            *host_cfg_base;
> > +     void __iomem            *usbint_cfg_base;
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
> > +     reg =3D readl(google->host_cfg_base + HOST_CFG1_OFFSET);
> > +     reg &=3D ~HOST_CFG1_PM_POWER_STATE_REQUEST;
> > +     reg |=3D (FIELD_PREP(HOST_CFG1_PM_POWER_STATE_REQUEST, state) |
> > +             HOST_CFG1_PME_EN);
> > +     writel(reg, google->host_cfg_base + HOST_CFG1_OFFSET);
> > +
> > +     ret =3D readl_poll_timeout(google->host_cfg_base + HC_STATUS_OFFS=
ET, reg,
> > +                              (FIELD_GET(HC_STATUS_CURRENT_POWER_STATE=
_U2PMU, reg) =3D=3D state &&
> > +                               FIELD_GET(HC_STATUS_CURRENT_POWER_STATE=
_U3PMU, reg) =3D=3D state),
> > +                              10, 10000);
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
> > +     irq_status =3D readl(google->usbint_cfg_base + USBINT_STATUS_OFFS=
ET);
> > +     irq_status &=3D (USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RAW |
> > +                    USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW);
> > +     if (!irq_status)
> > +             return irq_status;
> > +
> > +     reg_set =3D readl(google->usbint_cfg_base + USBINT_CFG1_OFFSET);
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
> > +     writel(reg_set, google->usbint_cfg_base + USBINT_CFG1_OFFSET);
> > +     writel(reg_clear, google->usbint_cfg_base + USBINT_CFG1_OFFSET);
> > +
> > +     return irq_status;
> > +}
> > +
> > +static void dwc3_google_enable_pme_irq(struct dwc3_google *google)
> > +{
> > +     u32 reg;
> > +
> > +     reg =3D readl(google->usbint_cfg_base + USBINT_CFG1_OFFSET);
> > +     reg &=3D ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
> > +              USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
> > +     reg |=3D (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
> > +             USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
> > +     writel(reg, google->usbint_cfg_base + USBINT_CFG1_OFFSET);
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
> > +     reg =3D readl(google->usbint_cfg_base + USBINT_CFG1_OFFSET);
> > +     reg &=3D ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
> > +              USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
> > +     reg |=3D (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
> > +             USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
> > +     writel(reg, google->usbint_cfg_base + USBINT_CFG1_OFFSET);
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
>
> Any handling of race condition with is_hibernation?

IIUC, you're referring to the race between
- pme irq handler: dwc3_google_resume_irq() reads is_hibernation
- suspend/resume work: sets and unsets is_hibernation

Possible scenarios:
1. Suspend into hibernation: everything is serialized.
        dwc3_google_suspend() sets is_hibernation
    -> usb psw pdom is turned off
    -> controller enters D3
    -> pme irq could be triggered
    -> pme irq handler
2.1 Resume from hibernation: irq handler wins the race.
           pme irq handler (is_hibernation =3D true) triggers resume
       -> usb psw pdom is turned on
       -> dwc3_google_resume() unset is_hibernation
2.2 Resume from hibernation: resume work wins the race.
           usb psw pdom is turned on
       -> dwc3_google_resume() unset is_hibernation
       -> pme irq handler (is_hibernation =3D false) does nothing

So far I don't see any issues in any of the scenarios, please
let me know if otherwise.

>
> > +         dr_role !=3D DWC3_GCTL_PRTCAP_HOST) {
> > +             dev_warn(google->dev, "spurious pme irq %d, hibernation %=
d, dr_role %u\n",
> > +                      irq, google->is_hibernation, dr_role);
>
> Should we limit this print and do we need this to be dev_warn? It may be
> noisy wouldn't it.

Ack, will make it WARN_ONCE in the next version.

>
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
>
> What happen when we failed to set the PMU state?

Apparently there must be something wrong with the hardware.
Currently we only throw some error logs as no reliable recovery
mechanism is known.

>
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
>
> I'm still trying to wrap my head around how usb_top_pd, usb_psw_pd, and
> the google->dev are working together in the glue here, particularly why
> usb_top_pd is needed. It seems usb_top_pd shouldn't be handled by this
> glued? Do you do anything except setting wakeup-capable?
>
> BR,
> Thinh

To provide more context, the underlying usb power domain has 3 power
states: Full Power, Power Gated, Off. The usb_top_pd and usb_psw_pd
are the logical power domains to represent the 3 power states.
- Full Power:     usb_psw_pd ON,   usb_top_p ON.
- Power Gated: usb_psw_pd OFF, usb_top_p ON.
- Off:                 usb_psw_pd OFF, usb_top_p OFF.

To enter hibernation, the usb power domain must enter Power Gated
state. To achieve this, this glue driver holds a handle to usb_top_pd
and would cast a vote to keep it ON when attempting to enter
hibernation. In addition, the usb_psw_pd runtime PM is directly tied
to google->dev so that usb_psw_pd would be OFF when google->dev
suspends. Together, the usb power domain would reach Power Gated
state when device suspends.

I hope this information helps.

Thanks,
Roy Luo

>
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
> > +     reg =3D readl(google->usbint_cfg_base + USBCS_TOP_CTRL_CFG1_OFFSE=
T);
> > +     reg |=3D USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE;
> > +     writel(reg, google->usbint_cfg_base + USBCS_TOP_CTRL_CFG1_OFFSET)=
;
> > +}
> > +
> > +static int dwc3_google_probe(struct platform_device *pdev)
> > +{
> > +     struct dwc3_probe_data  probe_data =3D {};
> > +     struct device           *dev =3D &pdev->dev;
> > +     struct dwc3_google      *google;
> > +     struct resource         *res;
> > +     int                     ret;
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
> > +     google->host_cfg_base =3D
> > +             devm_platform_ioremap_resource_byname(pdev, "host_cfg");
> > +     if (IS_ERR(google->host_cfg_base)) {
> > +             return dev_err_probe(dev, PTR_ERR(google->host_cfg_base),
> > +                                  "invalid host cfg\n");
> > +     }
> > +
> > +     google->usbint_cfg_base =3D
> > +             devm_platform_ioremap_resource_byname(pdev, "usbint_cfg")=
;
> > +     if (IS_ERR(google->usbint_cfg_base)) {
> > +             return dev_err_probe(dev, PTR_ERR(google->usbint_cfg_base=
),
> > +                                  "invalid usbint cfg\n");
> > +     }
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
> > +     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dwc3_=
core");
> > +     if (!res) {
> > +             ret =3D dev_err_probe(dev, -ENODEV, "invalid dwc3 core me=
mory\n");
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
> > +     { .compatible =3D "google,gs5-dwc3" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_google_of_match);
> > +
> > +static struct platform_driver dwc3_google_driver =3D {
> > +     .probe          =3D dwc3_google_probe,
> > +     .remove         =3D dwc3_google_remove,
> > +     .driver         =3D {
> > +             .name   =3D "google-dwc3",
> > +             .pm     =3D pm_ptr(&dwc3_google_dev_pm_ops),
> > +             .of_match_table =3D dwc3_google_of_match,
> > +     },
> > +};
> > +
> > +module_platform_driver(dwc3_google_driver);
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DesignWare DWC3 Google Glue Driver");
> > --
> > 2.51.0.858.gf9c4a03a3a-goog
> >
