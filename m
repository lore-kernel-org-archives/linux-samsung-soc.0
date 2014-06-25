From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/1] i2c: Kconfig: Enable HSI2C for Exynos5 platform
Date: Wed, 25 Jun 2014 10:55:31 -0700
Message-ID: <CAD=FV=WzPxT4okEur8C2G=FZK=zq3EsyCv9aAJwZ1PDkfoOcpA@mail.gmail.com>
References: <1403690523-1863-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f171.google.com ([209.85.128.171]:52304 "EHLO
	mail-ve0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932349AbaFYRzc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 13:55:32 -0400
Received: by mail-ve0-f171.google.com with SMTP id jz11so2409659veb.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2014 10:55:31 -0700 (PDT)
In-Reply-To: <1403690523-1863-1-git-send-email-sachin.kamat@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Sachin Kamat <spk.linux@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>

Sachin,

On Wed, Jun 25, 2014 at 3:02 AM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
> All Exynos5 platforms have HSI2C controllers and are needed by
> various IPs connected to the boards based on these SoCs. Thus
> select this by default for Exynos5 platforms.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> Cc: Doug Anderson <dianders@chromium.org>
> ---
>  drivers/i2c/busses/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 9f7d5859cf65..c7918cffe790 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -465,9 +465,9 @@ config I2C_EG20T
>  config I2C_EXYNOS5
>         tristate "Exynos5 high-speed I2C driver"
>         depends on ARCH_EXYNOS5 && OF
> +       default y
>         help
> -         Say Y here to include support for high-speed I2C controller in the
> -         Exynos5 based Samsung SoCs.
> +         High-speed I2C controller on Exynos5 based Samsung SoCs.
>
>  config I2C_GPIO
>         tristate "GPIO-based bitbanging I2C"
> --
> 1.7.9.5

This seems reasonable to me and I will also take the blame for
suggesting this.  It's hard to imagine running a real exynos5 system
without I2C.  One could argue that on an exynos5250 the high speed I2C
controller is not mandatory (since all the ports can be muxed to use
the old controller) but on newer exynos5 products you're expected to
have the main PMIC on one of the i2c ports.  An exynos system without
access to its PMIC will just sorta limp by.

...but I've added Arnd to this thread as he expressed some
reservations about this type of thing, so we'll see what he says.

Reviewed-by: Doug Anderson <dianders@chromium.org>
