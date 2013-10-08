From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v5 3/4] ARM: S3C24XX: add platform-devices for new dma
 driver for s3c2412 and s3c2443
Date: Tue, 8 Oct 2013 13:29:47 -0700
Message-ID: <CAOesGMjK5ZMkK8mj_+HSEjZCtfZUiLmVZThBAHacW8kp1=ThFw@mail.gmail.com>
References: <201309182118.28391.heiko@sntech.de>
	<201309182120.30950.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f46.google.com ([209.85.128.46]:47952 "EHLO
	mail-qe0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754857Ab3JHU3s convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Oct 2013 16:29:48 -0400
Received: by mail-qe0-f46.google.com with SMTP id x7so7137794qeu.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Oct 2013 13:29:47 -0700 (PDT)
In-Reply-To: <201309182120.30950.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, LinusW <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

On Wed, Sep 18, 2013 at 12:20 PM, Heiko St=FCbner <heiko@sntech.de> wro=
te:
> This includes defining the mapping for the request sources.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> changes since v1:
> - follow new pdata definition

This showed up in -next today, and introduced:

arch/arm/mach-s3c24xx/common.c:337:24: warning: 's3c2410_dma_resource'
defined but not used [-Wunused-variable]

> +#if defined(CONFIG_CPU_S3C2410) || defined(CONFIG_CPU_S3C2412) || \
> +    defined(CONFIG_CPU_S3C2440) || defined(CONFIG_CPU_S3C2442)
> +static struct resource s3c2410_dma_resource[] =3D {
> +       [0] =3D DEFINE_RES_MEM(S3C24XX_PA_DMA, S3C24XX_SZ_DMA),
> +       [1] =3D DEFINE_RES_IRQ(IRQ_DMA0),
> +       [2] =3D DEFINE_RES_IRQ(IRQ_DMA1),
> +       [3] =3D DEFINE_RES_IRQ(IRQ_DMA2),
> +       [4] =3D DEFINE_RES_IRQ(IRQ_DMA3),
> +};
> +#endif
> +

Log at:

http://arm-soc.lixom.net/buildlogs/next-thierry/v3.12-rc4-4340-g56a7390=
/buildall.arm.mini2440_defconfig.log.passed


-Olof
