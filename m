From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Add the missed s3c_gpio_getpull() API
Date: Thu, 21 Oct 2010 21:47:46 +0400
Message-ID: <4CC07CC2.50206@mvista.com>
References: <1287648286-7202-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:41321 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753429Ab0JUTuK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Oct 2010 15:50:10 -0400
Received: by gwj21 with SMTP id 21so419025gwj.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2010 12:50:09 -0700 (PDT)
In-Reply-To: <1287648286-7202-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Daein Moon <moon9124@samsung.com>, ben-linux@fluff.org

Hello.

On 21-10-2010 12:04, Kukjin Kim wrote:

> From: Daein Moon<moon9124@samsung.com>

> This patch adds the s3c_gpio_getpull() API that has been missed in the
> plat-samsung/gpio-config.c and actullay there is its extern declaration
> in plat/gpio-cfg.h.

> Signed-off-by: Daein Moon<moon9124@samsung.com>
> Cc: Ben Dooks<ben-linux@fluff.org>
> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> ---
> NOTE:
> - already issued about this

>   arch/arm/plat-samsung/gpio-config.c                |   19 +++++++++++++++++++
>   .../plat-samsung/include/plat/gpio-cfg-helpers.h   |    6 ++++++
>   2 files changed, 25 insertions(+), 0 deletions(-)

> diff --git a/arch/arm/plat-samsung/gpio-config.c b/arch/arm/plat-samsung/gpio-config.c
> index 8a37211..b732b77 100644
> --- a/arch/arm/plat-samsung/gpio-config.c
> +++ b/arch/arm/plat-samsung/gpio-config.c
[...]
> diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
> index 3e21c75..c417f85 100644
> --- a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
> +++ b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
> @@ -42,6 +42,12 @@ static inline int s3c_gpio_do_setpull(struct s3c_gpio_chip *chip,
>   	return (chip->config->set_pull)(chip, off, pull);
>   }
>
> +static inline unsigned s3c_gpio_do_getpull(struct s3c_gpio_chip *chip,
> +					   unsigned int off)
> +{
> +	return (chip->config->get_pull)(chip, off);

    Parens are not necessary here.

> +}
> +

WBR, Sergei
