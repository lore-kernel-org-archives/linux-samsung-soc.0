From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Failure due to missing (Exynos related) pinctrl patch
Date: Mon, 28 Jan 2013 22:20:15 -0800
Message-ID: <05ed01cdfde8$b529fc00$1f7df400$@samsung.com>
References: <CAK9yfHybC6ZgGwxa_i=LrMpU_q9M4aaMraTqK63B+fw11NBqRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28378 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753530Ab3A2GUV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 01:20:21 -0500
In-reply-to: <CAK9yfHybC6ZgGwxa_i=LrMpU_q9M4aaMraTqK63B+fw11NBqRA@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'LKML' <linux-kernel@vger.kernel.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Sachin Kamat wrote:
> 
> Hi Linus, Kukjin,
> 
> Patch titled "pinctrl: exynos: change PINCTRL_EXYNOS option"
> (linux-next commit Id: 7452b64d) which is present in linux-next is
> missing in the mainline kernel. This patch is required along with the
> patch "gpio: samsung: fix pinctrl condition for exynos and exynos5440"
> (mainline commit Id: e4a5da51) which has already made it into
> mainline. Without the missing patch we get the following boot up
> warnings and subsequent failures with dt boot on 4412 based board:
> 
>  WARNING: at drivers/gpio/gpio-samsung.c:3102
> samsung_gpiolib_init+0x29c/0x2e8()
>  Unknown SoC in gpio-samsung, no GPIOs added
>  Modules linked in:
>  [<c00142dc>] (unwind_backtrace+0x0/0xf8) from [<c00202bc>]
> (warn_slowpath_common+0x4c/0x64)
>  [<c00202bc>] (warn_slowpath_common+0x4c/0x64) from [<c0020368>]
> (warn_slowpath_fmt+0x30/0x40)
>  [<c0020368>] (warn_slowpath_fmt+0x30/0x40) from [<c028b924>]
> (samsung_gpiolib_init+0x29c/0x2e8)
>  [<c028b924>] (samsung_gpiolib_init+0x29c/0x2e8) from [<c000862c>]
> (do_one_initcall+0x34/0x174)
>  [<c000862c>] (do_one_initcall+0x34/0x174) from [<c0275960>]
> (kernel_init_freeable+0xfc/0x1c8)
>  [<c0275960>] (kernel_init_freeable+0xfc/0x1c8) from [<c01c0a5c>]
> (kernel_init+0x8/0xe4)
>  [<c01c0a5c>] (kernel_init+0x8/0xe4) from [<c000e158>]
> (ret_from_fork+0x14/0x3c)
> 
Sachin, thanks for your information.

Linus, can you check following again?

https://lkml.org/lkml/2013/1/18/461

Thanks.

- Kukjin
