From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM: S5P: Dynamicly numbered GPIO interrupt support
Date: Fri, 14 May 2010 18:16:06 +0900
Message-ID: <AANLkTineeTkf3HXjo2f0Xxn7_v7S11G5HWAGDBagspt2@mail.gmail.com>
References: <1273826403-28976-1-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:55409 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758684Ab0ENJQI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 05:16:08 -0400
Received: by vws16 with SMTP id 16so716607vws.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 May 2010 02:16:06 -0700 (PDT)
In-Reply-To: <1273826403-28976-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Fri, May 14, 2010 at 5:40 PM, Ben Dooks <ben-linux@fluff.org> wrote:
> Add support for GPIO interrupts where the interrupt number
> is dynamically allocated at first request from gpiolib.
>
> This method is employed as the newer SoCs have a large number
> of possible interrupt numbers which are very rarely heavily
> used. However, the classic code has always registered all
> possible interrupts, using a large amount of memory for the
> irq_desc[] table.
>
> For example, S5PV210 has 178 possible GPIO interrupt sources
> of which few boards actually use any of these. The current
> size of a single irq_desc entry is 80 bytes, meaing to fully
> support GPIO interrupts on the V210 we use 14240 bytes when
> a board may only need a few of these.
>
> NOTE: This code is not tested, and not even booted. it is
> offered here as an example and if people think it is a good
> idea, I will do the necessary run testing and checking.
>
> not-quite-signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
> =C2=A0arch/arm/mach-s5pv210/gpiolib.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 10 +++++++++-
> =C2=A0arch/arm/mach-s5pv210/include/mach/irqs.h =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A05 ++++-
> =C2=A0arch/arm/plat-s5p/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05 +++++
> =C2=A0arch/arm/plat-s5p/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0arch/arm/plat-samsung/include/plat/gpio-core.h | =C2=A0 =C2=A05=
 +++++
> =C2=A05 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/gpiolib.c b/arch/arm/mach-s5pv210/=
gpiolib.c
> index 99dad92..68972ea 100644
> --- a/arch/arm/mach-s5pv210/gpiolib.c
> +++ b/arch/arm/mach-s5pv210/gpiolib.c
> @@ -237,6 +237,12 @@ static struct s3c_gpio_chip s5pv210_gpio_4bit[] =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> +static int to_gpio_irq_bank(int nr)
> +{
> + =C2=A0 =C2=A0 =C2=A0 if (nr >=3D 17)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nr - 4;
> +}
> +
> =C2=A0static __init int s5pv210_gpiolib_init(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct s3c_gpio_chip *chip =3D s5pv210_gpi=
o_4bit;
> @@ -244,8 +250,10 @@ static __init int s5pv210_gpiolib_init(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int i =3D 0;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i < nr_chips; i++, chip++) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chip->config =3D=
=3D NULL)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chip->config =3D=
=3D NULL) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0chip->config =3D &gpio_cfg;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 s5p_gpio_irq_register(chip, to_gpio_irq_bank(i));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (chip->base=
 =3D=3D NULL)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0chip->base =3D S5PV210_BANK_BASE(i);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mac=
h-s5pv210/include/mach/irqs.h
> index 1714be2..dca0067 100644
> --- a/arch/arm/mach-s5pv210/include/mach/irqs.h
> +++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
> @@ -144,8 +144,11 @@
> =C2=A0#define S5P_EINT_SET2(x) =C2=A0 =C2=A0 =C2=A0 S5PV210_GPH2(x)
> =C2=A0#define S5P_EINT_SET3(x) =C2=A0 =C2=A0 =C2=A0 S5PV210_GPH3(x)
>
> +#define IRQ_GPIO_BASE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IRQ_EINT(31)=
 + 1
> +#define NR_GPIO_IRQS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (24)
Don't we want to give option to configure this value during build?
Rest sounds good.
