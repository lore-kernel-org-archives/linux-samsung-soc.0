From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/3] ARM: s3c24xx: H1940: Move gpiochip_add call into
 core_init() callback
Date: Mon, 4 May 2015 12:23:39 +0900
Message-ID: <CAJKOXPd8XgpcoS2knB8JYNeRVRjO=jetwM64tVYW9hPCYN8UoA@mail.gmail.com>
References: <1430676910-30657-1-git-send-email-anarsoul@gmail.com>
	<1430676910-30657-3-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f43.google.com ([209.85.216.43]:33177 "EHLO
	mail-vn0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751915AbbEDDXk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 May 2015 23:23:40 -0400
Received: by vnbf1 with SMTP id f1so13853388vnb.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 May 2015 20:23:39 -0700 (PDT)
In-Reply-To: <1430676910-30657-3-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

2015-05-04 3:15 GMT+09:00 Vasily Khoruzhick <anarsoul@gmail.com>:
> gpiochip_add() allocates memory, however it's not possible anymore

"...to call it..."? Something is missing in the sentence.

> from
> machine map_io() callback thus it failed and prevented machine from booting
> properly.
>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm/mach-s3c24xx/mach-h1940.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
> index 86d9ec7..744aa4f 100644
> --- a/arch/arm/mach-s3c24xx/mach-h1940.c
> +++ b/arch/arm/mach-s3c24xx/mach-h1940.c
> @@ -777,9 +777,14 @@ static void __init h1940_map_io(void)
>
>         /* Add latch gpio chip, set latch initial value */
>         h1940_latch_control(0, 0);
> -       WARN_ON(gpiochip_add(&h1940_latch_gpiochip));
>  }
>
> +static __init int h1940_gpiolib_init(void)
> +{
> +       return gpiochip_add(&h1940_latch_gpiochip);
> +}
> +core_initcall(h1940_gpiolib_init);
> +

arch_initcall() or init_machine() callback seems more appropriate.
What do you think?

Best regards,
Krzysztof
