From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 1/3] arm: s5pv210: GONI: add support for framebuffer
Date: Wed, 14 Jul 2010 16:39:19 +0900
Message-ID: <AANLkTinFFwWBQ3ZgjBBDVHrfVUCg3kjVjkHYURn3Jr4m@mail.gmail.com>
References: <1278321416-32524-1-git-send-email-m.szyprowski@samsung.com>
	<1278321416-32524-2-git-send-email-m.szyprowski@samsung.com>
	<006301cb2320$822639e0$8672ada0$%kim@samsung.com>
	<00bf01cb2326$705e9fd0$511bdf70$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:34852 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751275Ab0GNHjU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jul 2010 03:39:20 -0400
Received: by pwi5 with SMTP id 5so2630590pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jul 2010 00:39:19 -0700 (PDT)
In-Reply-To: <00bf01cb2326$705e9fd0$511bdf70$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Andrew Morton <akpm@linux-foundation.org>, Maurus Cuelenaere <mcuelenaere@gmail.com>

On Wed, Jul 14, 2010 at 4:30 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> On Wednesday, July 14, 2010 8:48 AM Kukjin Kim wrote:
>
>> Marek Szyprowski wrote:
>> >
>> > This patch adds required platform definitions to enable s3c-fb
>> > driver on GONI board. One framebuffer window in 480x800x16bpp mode=
 is
>> > defined.
>> >
>> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> > ---
>> > =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 | =A0 =A02 +
>> > =A0arch/arm/mach-s5pv210/mach-goni.c | =A0 39
>> > +++++++++++++++++++++++++++++++++++++
>> > =A02 files changed, 41 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-
>> s5pv210/Kconfig
>> > index 5e88941..8ab4bb0 100644
>> > --- a/arch/arm/mach-s5pv210/Kconfig
>> > +++ b/arch/arm/mach-s5pv210/Kconfig
>> > @@ -59,6 +59,8 @@ config MACH_GONI
>> > =A0 =A0 bool "GONI"
>> > =A0 =A0 select CPU_S5PV210
>> > =A0 =A0 select ARCH_SPARSEMEM_ENABLE
>> > + =A0 select S5PV210_SETUP_FB_24BPP
>> > + =A0 select S3C_DEV_FB
>> > =A0 =A0 select S5PC110_DEV_ONENAND
>> > =A0 =A0 help
>> > =A0 =A0 =A0 Machine support for Samsung GONI board
>> > diff --git a/arch/arm/mach-s5pv210/mach-goni.c
>> b/arch/arm/mach-s5pv210/mach-
>> > goni.c
>> > index 88c38e3..05b4a1a 100644
>> > --- a/arch/arm/mach-s5pv210/mach-goni.c
>> > +++ b/arch/arm/mach-s5pv210/mach-goni.c
>> > @@ -12,6 +12,9 @@
>> > =A0#include <linux/types.h>
>> > =A0#include <linux/init.h>
>> > =A0#include <linux/serial_core.h>
>> > +#include <linux/fb.h>
>> > +#include <linux/delay.h>
>>
>> need linux/delay.h in here?
>>
>> > +#include <linux/clk.h>
>>
>> same...need linux/clk.h?
>>
>> >
>> > =A0#include <asm/mach/arch.h>
>> > =A0#include <asm/mach/map.h>
>> > @@ -20,11 +23,15 @@
>> >
>> > =A0#include <mach/map.h>
>> > =A0#include <mach/regs-clock.h>
>> > +#include <mach/regs-fb.h>
>> > +#include <mach/gpio.h>
>>
>> linux/gpio.h
>
> Ok.
>
>> >
>> > +#include <plat/gpio-cfg.h>
>> > =A0#include <plat/regs-serial.h>
>> > =A0#include <plat/s5pv210.h>
>> > =A0#include <plat/devs.h>
>> > =A0#include <plat/cpu.h>
>> > +#include <plat/fb.h>
>> >
>> > =A0/* Following are default values for UCON, ULCON and UFCON UART =
registers
>> */
>> > =A0#define S5PV210_UCON_DEFAULT =A0 =A0 =A0 (S3C2410_UCON_TXILEVEL=
 | =A0 =A0 =A0 =A0\
>> > @@ -73,7 +80,35 @@ static struct s3c2410_uartcfg goni_uartcfgs[]
>> __initdata =3D {
>> > =A0 =A0 },
>> > =A0};
>> >
>> > +/* Frame Buffer */
>>
>> No need this comment because we know _fb_ means frame buffer...
>
> Comments in the source code are imho always welcome. As you know mach=
-*.c files
> grows to very large sizes and it is much easier to read them if all d=
efinitions
> and items are grouped and commented with a header on top of them (wit=
h such
> comments you easily can notice where one group starts and ends withou=
t reading
> the code).
>
>> > +static struct s3c_fb_pd_win goni_fb_win0 =3D {
>>
>> How about to use goni_fb_win[] array so that can be extended easily.=
=2E.
>
> I've just followed the style used in the other mach-*.c files. No pro=
blem to
> change it.
>
>>
>> > + =A0 .win_mode =3D {
>> > + =A0 =A0 =A0 =A0 =A0 .pixclock =3D 1000000000000ULL /
>> > ((16+16+2+480)*(28+3+2+800)*55),

Marugu(?) send the patch remove pixclock at fb mailing list. So If
>> > + =A0 =A0 =A0 =A0 =A0 .left_margin =3D 16,
>> > + =A0 =A0 =A0 =A0 =A0 .right_margin =3D 16,
>> > + =A0 =A0 =A0 =A0 =A0 .upper_margin =3D 3,
>> > + =A0 =A0 =A0 =A0 =A0 .lower_margin =3D 28,
>> > + =A0 =A0 =A0 =A0 =A0 .hsync_len =3D 2,
>> > + =A0 =A0 =A0 =A0 =A0 .vsync_len =3D 2,
>> > + =A0 =A0 =A0 =A0 =A0 .xres =3D 480,
>> > + =A0 =A0 =A0 =A0 =A0 .yres =3D 800,
>> > + =A0 =A0 =A0 =A0 =A0 .refresh =3D 55,
>> > + =A0 },
>> > + =A0 .max_bpp =3D 32,
>> > + =A0 .default_bpp =3D 16,
>>
>> If possible, please keep the align like below...for easily reading..=
=2E
>> But...it depends on your taste...:-)
>
> Ok, no problem with this.
>
>>
>> + =A0 =A0 .win_mode =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .pixclock =A0 =A0 =A0 =3D 1000000000000ULL=
 /
>> ((16+16+2+480)*(28+3+2+800)*55),

Maurus send the patch remove pixclock calculation so I hope his patch
merge and we just remove it at here.

Thank you,
Kyungmin Park
>> + =A0 =A0 =A0 =A0 =A0 =A0 .left_margin =A0 =A0=3D 16,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .right_margin =A0 =3D 16,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .upper_margin =A0 =3D 3,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .lower_margin =A0 =3D 28,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .hsync_len =A0 =A0 =A0=3D 2,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .vsync_len =A0 =A0 =A0=3D 2,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .xres =A0 =A0 =A0 =A0 =A0 =3D 480,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .yres =A0 =A0 =A0 =A0 =A0 =3D 800,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .refresh =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D=
 55,
>> + =A0 =A0 },
>> + =A0 =A0 .max_bpp =A0 =A0 =A0 =A0=3D 32,
>> + =A0 =A0 .default_bpp =A0 =A0=3D 16,
>>
>>
>> > +};
>> > +
>> > +static struct s3c_fb_platdata goni_lcd_pdata __initdata =3D {
>> > + =A0 .win[0] =3D &goni_fb_win0,
>> > + =A0 .vidcon0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D VIDCON0_VIDOUT_R=
GB |
>> > VIDCON0_PNRMODE_RGB |
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 VIDCON0_CLKSEL_LCD,
>> > + =A0 .vidcon1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D VIDCON1_INV_VCLK=
 | VIDCON1_INV_VDEN
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | VIDCON1_IN=
V_HSYNC |
>> > VIDCON1_INV_VSYNC,
>> > + =A0 .setup_gpio =A0 =A0 =A0 =A0 =A0 =A0 =3D s5pv210_fb_gpio_setu=
p_24bpp,
>> > +};
>>
>> Same...as previous comment.
>>
>> > +
>> > =A0static struct platform_device *goni_devices[] __initdata =3D {
>> > + =A0 &s3c_device_fb,
>> > =A0 =A0 &s5pc110_device_onenand,
>> > =A0};
>> >
>> > @@ -86,6 +121,10 @@ static void __init goni_map_io(void)
>> >
>> > =A0static void __init goni_machine_init(void)
>> > =A0{
>> > +
>>
>> no need above empty line.
>>
>> > + =A0 /* FB */
>> > + =A0 s3c_fb_set_platdata(&goni_lcd_pdata);
>> > +
>> > =A0 =A0 platform_add_devices(goni_devices, ARRAY_SIZE(goni_devices=
));
>> > =A0}
>> >
>> > --
>>
>> Thanks.
>>
>> Best regards,
>> Kgene.
>> --
>> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
>> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
