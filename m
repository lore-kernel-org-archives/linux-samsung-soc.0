Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E42FD692
	for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Nov 2025 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763812734; cv=none; b=vCdna36ATdPKEfbTC/fsIzbkmuVxSgn4WQ2oRi8We2KhJQukEXDF/hmaXTm8C1AHu0lfuS/5jLhODZbsZxlcZVFWNxHccrbaOqOwVqzPgYDBwHwhtvea0wCfTUPDaWdLxB+N9ZG0MRlX4t22nwkWARvCM0LKALHXiW/7FwDol1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763812734; c=relaxed/simple;
	bh=jWHXjaaGYky2DaB1MpNNCj1bQDGpHoWv0BoWUYp+rQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FC2iA5Kw/rGUYr8jOA8HjtfMdJiX/Aa40kmmCOs8UNEL2AwL/+Qwmxe1g3ebzLzpxpyT+Jsz/Fc8IFhYIGIBdLYMdcubw2UB4GuGeq1wORIuqx25BuY5LscnRWlc5k+65lMZmDxwbjSD0Td3ag0hPAhsPEsEZg/P851gjcqd+oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ETVmZu3H; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ETVmZu3H"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b21fc25ae1so274492985a.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Nov 2025 03:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763812730; x=1764417530; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MBrm3JMtHLy7FDNmdG9NnfjfQSeL7J0SNX9N6hNH2js=;
        b=ETVmZu3HY5OeL1UkHeLxB/0LVpNTi9tojGCnrcoE1r2mYAPfUfoC7yOH4gNyTkAJMP
         y5dfJaHqiLcZ+A6znO6eKlm3i12Tt8yXgytI2qRNb2BbSVuIW86/3zqZMAzti0d5Gyc9
         5D17RjfGmvBQ5BAm5RTNSQbjK75oIDypoWFd1d+Kg5sAScS7ex6tU1VK7NN5B0R75hzm
         AXAy7avY69GbeU5vs2KgU8FQLyKsiQcOOSv5r++F1eet+3XVKwQJJftM+2PM97y12d/H
         DwLJEJF8cL6b7e8LbjvqgwJh4KCnWhGQ6txvTHilgI0D2jJcou3ZbSf7On8ujdwiz/pn
         ebng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763812730; x=1764417530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBrm3JMtHLy7FDNmdG9NnfjfQSeL7J0SNX9N6hNH2js=;
        b=W/ZSQOWjQZGl3O8OQg/oL8iJzJoTApHQx7ry5okW0hETVNuVdCfIL5/GqiySDtZkNd
         odND/6fiOE0+VvTdEmakUrKQdeeD+6KD+7/SnW0+YFumuNMdpZ9r7uK1JdAIpriuVgDT
         NxR3CjOIk5Rhs06Q3AzF2/W6bm3/MFk/pLCjaK4KbZtqZcov6l+K4fXwE2nXgfrdyR0b
         6mRRR2Oe6naSEfJyiWFg9tgtkk1DGJD5BQGP5owi4pX2uBzS+11AIdVWurLCDTlxBOG6
         XfnulkKcwSs9TEIRUbkvzSLQsjyzdtcn7xepynWrpX193pi8yz18tE6gPElR/p34KoQ5
         MOUw==
X-Forwarded-Encrypted: i=1; AJvYcCWManLy8cYheE1kf3i+5dQmxbrFfDEz7LAj2XVdoEkDyjF4RdOHfCuVGoIslocBMvi7/HA4x/o5puzYKAB/zcQH6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA5nUkJzLtwwLhIIK8OagrmwDXiT6IKJbH346bABCi//lkFVEh
	Je/QxTx9ora0wuvzsSt1JC6v4kbKCz/wniy4yrc1cBVu0q8r4mXTA5/Z0GqZt15F9ZuHdgU+LBP
	MByNxhXvGqqHwNCTW0XnFSONw+w+6H3NVGHaejL/DQA==
X-Gm-Gg: ASbGnctv7t3WoW7OvndvZwMGyzjXVBdwmdfngSJ/BEjHUGuQZk81DWg3oCssQ+9j4Su
	wVIPDFb74Of7u9P6thnno+kk2ex9Rd9NhjkGRyvePuw890iwjHOCCHlKlvsQEMNyD6Zs2U7uSHu
	+yi9C8BZOOmyVsn/5Kw6dsmsqQjjAzC1q8+sLLqY0aMMxhFTplRIyuctqh6rmBB5ejrVi2BjMkA
	xbvNYp1e5rF2B9JoUZz2ZxfEPv7HfeaPxDN+NZHXlsnUm1/nmkOsE87HZ9ZM7Tj8r3Jo4a+/tdH
	AgS5Tw==
X-Google-Smtp-Source: AGHT+IHDkZQ+ImU9RTRugkonJf2E+hg917WnNusnwXVOvnWYJ8u+14drqRk1eQk1lC04UEf9Ur7igG1PLO7dWtr7QLg=
X-Received: by 2002:ac8:5d47:0:b0:4ee:5fc:43da with SMTP id
 d75a77b69052e-4ee588189c5mr66608501cf.11.1763812730384; Sat, 22 Nov 2025
 03:58:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com> <20251122-controller-v8-2-e7562e0df658@google.com>
In-Reply-To: <20251122-controller-v8-2-e7562e0df658@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 22 Nov 2025 11:58:39 +0000
X-Gm-Features: AWmQ_bmxr74_zcagVpTKmx_rF_8JcJE4EnUUPe-ZPMt4veKA7v9CBx5wm0awg0g
Message-ID: <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Roy Luo <royluo@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Roy,

Thanks for your patch. It's great to see Laguna support being added upstream.

On Sat, 22 Nov 2025 at 09:32, Roy Luo <royluo@google.com> wrote:
>
> Add support for the DWC3 USB controller found on Google Tensor G5
> (codename: laguna). The controller features dual-role functionality
> and hibernation.
>
> The primary focus is implementing hibernation support in host mode,
> enabling the controller to enter a low-power state (D3). This is
> particularly relevant during system power state transition and
> runtime power management for power efficiency.
> Highlights:
> - Align suspend callback with dwc3_suspend_common() for deciding
>   between a full teardown and hibernation in host mode.
> - Integration with `psw` (power switchable) and `top` power domains,
>   managing their states and device links to support hibernation.
> - A notifier callback dwc3_google_usb_psw_pd_notifier() for
>   `psw` power domain events to manage controller state
>   transitions to/from D3.
> - Coordination of the `non_sticky` reset during power state
>   transitions, asserting it on D3 entry and deasserting on D0 entry
>   in hibernation scenario.
> - Handling of high-speed and super-speed PME interrupts
>   that are generated by remote wakeup during hibernation.
>
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/usb/dwc3/Kconfig       |  13 +
>  drivers/usb/dwc3/Makefile      |   1 +
>  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 642 insertions(+)
>
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 4925d15084f816d3ff92059b476ebcc799b56b51..f58c70dabf108878cbefe0abea88572d9ae81e26 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -200,4 +200,17 @@ config USB_DWC3_GENERIC_PLAT
>           the dwc3 child node in the device tree.
>           Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
>
> +config USB_DWC3_GOOGLE
> +       tristate "Google Platform"
> +       depends on COMPILE_TEST
> +       depends on OF && COMMON_CLK && RESET_CONTROLLER
> +       help
> +         Support the DesignWare Core USB3 IP found on Google Tensor
> +         SoCs, starting with the G5 generation. This driver includes

consider adding: (Laguna)

> +         support for hibernation in host mode.
> +         Say 'Y' or 'M' if you have one such device.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called dwc3-google.ko.
> +
>  endif
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index 96469e48ff9d189cc8d0b65e65424eae2158bcfe..cf1cd408d938b3ac26d58b9be7fcc5af3ee82660 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -58,3 +58,4 @@ obj-$(CONFIG_USB_DWC3_XILINX)         += dwc3-xilinx.o
>  obj-$(CONFIG_USB_DWC3_OCTEON)          += dwc3-octeon.o
>  obj-$(CONFIG_USB_DWC3_RTK)             += dwc3-rtk.o
>  obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)    += dwc3-generic-plat.o
> +obj-$(CONFIG_USB_DWC3_GOOGLE)          += dwc3-google.o
> diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..53e04a5409d8a11eb025b0f5cd351cb1b33281ab
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-google.c
> @@ -0,0 +1,628 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dwc3-google.c - Google DWC3 Specific Glue Layer
> + *
> + * Copyright (c) 2025, Google LLC
> + * Author: Roy Luo <royluo@google.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/bitfield.h>
> +#include <linux/irq.h>
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/pm_domain.h>
> +#include <linux/iopoll.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

Please sort the headers alphabetically. It helps avoid duplicates and
is easier when adding new headers.

Also can you add this file, and the bindings patch to the Tensor SoC
MAINTAINERS entry, so it's easier to review future patches?

With those nits  addressed:
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter.
