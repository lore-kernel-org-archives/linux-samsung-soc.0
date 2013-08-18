From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 0/4] ARM: S3C24XX: add dmaengine based dma-driver
Date: Mon, 19 Aug 2013 03:13:19 +0900
Message-ID: <52110EBF.9010209@samsung.com>
References: <201308141359.13872.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:40165 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754362Ab3HRSNX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 14:13:23 -0400
In-Reply-To: <201308141359.13872.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On 08/14/13 20:59, Heiko St=C3=BCbner wrote:
> This series tries to provide a basic dmaengine driver for the s3c24xx
> SoCs to subsequently retire the old one with custom API.
>
> Since v1 three big changes happened (appart from fixing received comm=
ents):
>
> For one the limitation of sg-lists to 1 element is gone.Secondly the
> specifics of the virtual channels (target bus, handshake, etc) are no=
t
> encoded with channel ids but in the platformdata - making a later dt
> binding easier, as these informations can there be gathered by the xl=
ate
> function. And lastly I also added a preliminary mechanism to handle t=
he
> specific needs for the earlier variants of the driver.
>
> While s3c2443 and later can use any channel for any peripheral with j=
ust
> marking the target-peripheral-id in a register, earlier SoCs can only=
 use
> specific channels and the target-ids also vary depending on the chann=
el.
>
> Therefore on newer SoCs the chansel element only needs to contain the
> requested target-id, while on the older variants use it to encode bot=
h
> the valid channels and the channel-specific peripheral-id.
>
> On affected SoCs the target-id is always 3 bit wide, so we use these =
and
> an additional 4th bit to hold the valid state. As the older SoCs all =
have
> 4 dma channels this can live happily in an u16 element.
>
> The s3c24xx series will most likely not see any new offspring, but ev=
en
> if it happens any new model will probably use the newer more flexible
> variant of the dma controller, so this should not restrict anything
> in the future.
>
> Example:
> SDI is valid on channels 0, 2 and 3 - with varying hw request sources=
=2E
> For it the chansel field would look like
>
>   ((BIT(3) | 1)<<  3 * 4) | // channel 3, with request source 1
>   ((BIT(3) | 2)<<  2 * 4) | // channel 2, with request source 2
>   ((BIT(3) | 2)<<  0 * 4)   // channel 0, with request source 2
>
>
> Heiko Stuebner (4):
>    ARM: S3C24XX: number the dma clocks
>    dmaengine: add driver for Samsung s3c24xx SoCs
>    ARM: S3C24XX: add platform-devices for new dma driver for s3c2412 =
and
>      s3c2443
>    ARM: SAMSUNG: set s3c24xx_dma_filter for s3c64xx-spi0 device
>
>   arch/arm/mach-s3c24xx/clock-s3c2412.c     |    8 +-
>   arch/arm/mach-s3c24xx/common-s3c2443.c    |   12 +-
>   arch/arm/mach-s3c24xx/common.c            |  106 +++
>   arch/arm/mach-s3c24xx/common.h            |    3 +
>   arch/arm/mach-s3c24xx/mach-jive.c         |    1 +
>   arch/arm/mach-s3c24xx/mach-smdk2413.c     |    1 +
>   arch/arm/mach-s3c24xx/mach-smdk2416.c     |    1 +
>   arch/arm/mach-s3c24xx/mach-smdk2443.c     |    1 +
>   arch/arm/mach-s3c24xx/mach-vstms.c        |    1 +
>   arch/arm/plat-samsung/devs.c              |    5 +-
>   drivers/dma/Kconfig                       |   12 +
>   drivers/dma/Makefile                      |    1 +
>   drivers/dma/s3c24xx-dma.c                 | 1255 ++++++++++++++++++=
+++++++++++
>   include/linux/platform_data/dma-s3c24xx.h |   43 +
>   14 files changed, 1439 insertions(+), 11 deletions(-)
>   create mode 100644 drivers/dma/s3c24xx-dma.c
>   create mode 100644 include/linux/platform_data/dma-s3c24xx.h
>
Looks good to me, but I need ack from Vinod, dma maintainer.

Vinod, if you're OK on this, please let us know so that I could take=20
this whole series into samsung tree.

Thanks,
Kukjin
