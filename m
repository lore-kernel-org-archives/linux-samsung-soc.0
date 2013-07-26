From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V2 1/8] platform: Increase platform name size
Date: Fri, 26 Jul 2013 20:06:47 +0530
Message-ID: <CAK9yfHxX7j8o3rQNzDM2eL6M66CJVcdGSz3XYR2-4i=5SmCinA@mail.gmail.com>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
	<1374845812-7803-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:43549 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756175Ab3GZOgs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 10:36:48 -0400
Received: by mail-oa0-f53.google.com with SMTP id k14so7391121oag.26
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2013 07:36:47 -0700 (PDT)
In-Reply-To: <1374845812-7803-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, broonie@kernel.org, kgene.kim@samsung.com, abrestic@chromium.org, tomasz.figa@gmail.com

Hi Padma,

On 26 July 2013 19:06, Padmavathi Venna <padma.v@samsung.com> wrote:
> This patch increases the platform name size from 20 to 30.

Instead of describing what the patch does (which is quite obvious from
the code), it would be useful to describe why this change is required.


>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  include/linux/mod_devicetable.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index b62d4af..f67b5d5 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -478,7 +478,7 @@ struct dmi_system_id {
>  #define DMI_MATCH(a, b)        { .slot = a, .substr = b }
>  #define DMI_EXACT_MATCH(a, b)  { .slot = a, .substr = b, .exact_match = 1 }
>
> -#define PLATFORM_NAME_SIZE     20
> +#define PLATFORM_NAME_SIZE     30
>  #define PLATFORM_MODULE_PREFIX "platform:"
>
>  struct platform_device_id {
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With warm regards,
Sachin
