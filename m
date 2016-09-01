From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 01/10] pinctrl: dt-bindings: samsung: Add header with
 values used for configuration
Date: Thu, 01 Sep 2016 13:02:57 +0200
Message-ID: <3419428.Xfa2aHQ3xc@amdc1976>
References: <1472714638-15676-1-git-send-email-k.kozlowski@samsung.com>
 <1472714638-15676-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1472714638-15676-2-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Thursday, September 01, 2016 09:23:49 AM Krzysztof Kozlowski wrote:
> Hard-coded pinctrl configuration values are scattered through DTS files.
> The numbers are difficult to decode by human, especially without the
> datasheet.  Additionally the drive strength differs between Exynos SoC
> families increasing the confusion.
> 
> The header will help making this more readable and maintainable.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  MAINTAINERS                           |  1 +
>  include/dt-bindings/pinctrl/samsung.h | 57 +++++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/samsung.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d8e81b1dde30..836bcd327ee4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9318,6 +9318,7 @@ L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>  L:	linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	drivers/pinctrl/samsung/
> +F:	include/dt-bindings/pinctrl/samsung.h
>  
>  PIN CONTROLLER - SINGLE
>  M:	Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
> diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
> new file mode 100644
> index 000000000000..0f410ba5ec7e
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/samsung.h
> @@ -0,0 +1,57 @@
> +/*
> + * Samsung's Exynos pinctrl bindings
> + *
> + * Copyright (c) 2016 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + * Author: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __DT_BINDINGS_PINCTRL_EXYNOS_H__
> +#define __DT_BINDINGS_PINCTRL_EXYNOS_H__

Minor nit:

shouldn't this be __DT_BINDINGS_PINCTRL_SAMSUNG_H__ (the header file
is named samsung.h and is going to be used also by s3c* SoCs)?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
