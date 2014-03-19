From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: Disable MDMA1 node for Arndale-octa board
Date: Wed, 19 Mar 2014 14:08:43 +0530
Message-ID: <CAHbNUh0sWquBXk9bXAr6LKqYz_1JHDXwzoRy4==R0ze2FNoaQw@mail.gmail.com>
References: <1394006947-26126-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:39467 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932595AbaCSIin (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 04:38:43 -0400
Received: by mail-ob0-f179.google.com with SMTP id va2so7939686obc.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2014 01:38:43 -0700 (PDT)
In-Reply-To: <1394006947-26126-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kgene Kim <kgene.kim@samsung.com>

On 5 March 2014 13:39, Tushar Behera <tushar.behera@linaro.org> wrote:
> MDMA1 can support both secure and non-secure AXI transactions. When this
> is enabled in the kernel for boards that run in secure mode, we get
> imprecise external aborts causing the kernel to oops.
>
> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
>
> Suggested-by: Javi Merino <javi.merino@arm.com>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> index f509e8f..810ec73 100644
> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> @@ -361,4 +361,16 @@
>                         gpio-key,wakeup;
>                 };
>         };
> +
> +       amba {
> +               mdma1: mdma@11C10000 {
> +                       /*
> +                        * MDMA1 can support both secure and non-secure
> +                        * AXI transactions. When this is enabled in the kernel
> +                        * for boards that run in secure mode, we are getting
> +                        * imprecise external aborts causing the kernel to oops.
> +                        */
> +                       status = "disabled";
> +               };
> +       };
>  };
> --
> 1.7.9.5
>
Kukjin,

Can you please apply this with Javi's "Tested-by"?


-- 
Tushar Behera
