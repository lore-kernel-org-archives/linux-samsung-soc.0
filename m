From: =?UTF-8?B?7LWc6rec7Zi4?= <chlrbgh0@gmail.com>
Subject: Re: [PATCH] ARM: S5PV210: Add Torbreck board support
Date: Mon, 27 Sep 2010 19:10:55 +0900
Message-ID: <AANLkTik1YAd8W75DzrDmfhFYG-JE8__Tu4uq83RKsioC@mail.gmail.com>
References: <1285463130-14227-1-git-send-email-chlrbgh0@gmail.com>
	<AANLkTik5SkqjEz5Ymtg6RvwfrU0i8XzhPQq3Un7gMbP=@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0622257736=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AANLkTik5SkqjEz5Ymtg6RvwfrU0i8XzhPQq3Un7gMbP=@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: kgene.kim@samsung.com, Hyunchul Ko <ghcstop@gmail.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============0622257736==
Content-Type: multipart/alternative; boundary=0016e65b5b38e5f5f604913af2ef

--0016e65b5b38e5f5f604913af2ef
Content-Type: text/plain; charset=UTF-8

Hi,
Thank you for your interesting.

On Mon, Sep 27, 2010 at 11:58 AM, Kyungmin Park <kmpark@infradead.org>wrote:

> Hi,
>
> Looks good to me except minor fixup.
>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>
> On Sun, Sep 26, 2010 at 10:05 AM, Kyuho Choi <chlrbgh0@gmail.com> wrote:
> > This patch adds to support Torbreck board of aESOP community using
> > Samsung S5PV210 SoC.
> >
> > Signed-off-by: Kyuho Choi <chlrbgh0@gmail.com>
> > Signed-off-by: Hyunchul Ko <ghcstop@gmail.com>
> > ---
> >  arch/arm/mach-s5pv210/Kconfig         |   18 +++++
> >  arch/arm/mach-s5pv210/Makefile        |    1 +
> >  arch/arm/mach-s5pv210/mach-torbreck.c |  133
> +++++++++++++++++++++++++++++++++
> >  3 files changed, 152 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm/mach-s5pv210/mach-torbreck.c
> >
> > diff --git a/arch/arm/mach-s5pv210/Kconfig
> b/arch/arm/mach-s5pv210/Kconfig
> > index d3a3895..c5ec466 100644
> > --- a/arch/arm/mach-s5pv210/Kconfig
> > +++ b/arch/arm/mach-s5pv210/Kconfig
> > @@ -139,6 +139,24 @@ config MACH_SMDKV210
> >        help
> >          Machine support for Samsung SMDKV210
> >
> > +config MACH_TORBRECK
> > +       bool "Torbreck"
> > +       select CPU_S5PV210
> > +       select ARCH_SPARSEMEM_ENABLE
> > +       select S3C_DEV_HSMMC
> > +       select S3C_DEV_HSMMC1
> > +       select S3C_DEV_HSMMC2
> > +       select S3C_DEV_HSMMC3
> > +       select S3C_DEV_I2C1
> > +       select S3C_DEV_I2C2
> > +       select S3C_DEV_RTC
> > +       select S3C_DEV_WDT
> > +       select S5PV210_SETUP_I2C1
> > +       select S5PV210_SETUP_I2C2
> > +       select S5PV210_SETUP_SDHCI
> > +       help
> > +         Machine support for aESOP Torbreck
> Just question. Does it TDROID board?
>

No, Torbreck is aESOP community's co-work board. It's not TDORID.


>  > +
> >  endmenu
> >
> >  endif
> > diff --git a/arch/arm/mach-s5pv210/Makefile
> b/arch/arm/mach-s5pv210/Makefile
> > index 05048c5..927c2b7 100644
> > --- a/arch/arm/mach-s5pv210/Makefile
> > +++ b/arch/arm/mach-s5pv210/Makefile
> > @@ -21,6 +21,7 @@ obj-$(CONFIG_MACH_AQUILA)     += mach-aquila.o
> >  obj-$(CONFIG_MACH_SMDKV210)    += mach-smdkv210.o
> >  obj-$(CONFIG_MACH_SMDKC110)    += mach-smdkc110.o
> >  obj-$(CONFIG_MACH_GONI)                += mach-goni.o
> > +obj-$(CONFIG_MACH_TORBRECK)    += mach-torbreck.o
> >
> >  # device support
> >
> > diff --git a/arch/arm/mach-s5pv210/mach-torbreck.c
> b/arch/arm/mach-s5pv210/mach-torbreck.c
> > new file mode 100644
> > index 0000000..3142250
> > --- /dev/null
> > +++ b/arch/arm/mach-s5pv210/mach-torbreck.c
> > @@ -0,0 +1,133 @@
> > +/* linux/arch/arm/mach-s5pv210/mach-torbreck.c
> > + *
> > + * Copyright (c) 2010 aESOP Community
> > + *             http://www.aesop.or.kr/
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > +*/
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/types.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/serial_core.h>
> > +
> > +#include <asm/mach/arch.h>
> > +#include <asm/mach/map.h>
> > +#include <asm/setup.h>
> > +#include <asm/mach-types.h>
> > +
> > +#include <mach/map.h>
> > +#include <mach/regs-clock.h>
> > +
> > +#include <plat/regs-serial.h>
> > +#include <plat/s5pv210.h>
> > +#include <plat/devs.h>
> > +#include <plat/cpu.h>
> > +#include <plat/iic.h>
> > +
> > +/* Following are default values for UCON, ULCON and UFCON UART registers
> */
> > +#define TORBRECK_UCON_DEFAULT  (S3C2410_UCON_TXILEVEL |        \
> > +                                S3C2410_UCON_RXILEVEL |        \
> > +                                S3C2410_UCON_TXIRQMODE |       \
> > +                                S3C2410_UCON_RXIRQMODE |       \
> > +                                S3C2410_UCON_RXFIFO_TOI |      \
> > +                                S3C2443_UCON_RXERR_IRQEN)
> > +
> > +#define TORBRECK_ULCON_DEFAULT S3C2410_LCON_CS8
> > +
> > +#define TORBRECK_UFCON_DEFAULT (S3C2410_UFCON_FIFOMODE |       \
> > +                                S5PV210_UFCON_TXTRIG4 |        \
> > +                                S5PV210_UFCON_RXTRIG4)
>
> Any reason to use TRIG4? just use the full trigger e.g., 256.
>

Okay, I'll fix it.


> > +
> > +static struct s3c2410_uartcfg torbreck_uartcfgs[] __initdata = {
> > +       [0] = {
> > +               .hwport         = 0,
> > +               .flags          = 0,
> There's no code for flags, please remove it all.
>

Okay, I'll remove it.


> > +               .ucon           = TORBRECK_UCON_DEFAULT,
>  > +               .ulcon          = TORBRECK_ULCON_DEFAULT,
> > +               .ufcon          = TORBRECK_UFCON_DEFAULT,
> > +       },
> > +       [1] = {
> > +               .hwport         = 1,
> > +               .flags          = 0,
> > +               .ucon           = TORBRECK_UCON_DEFAULT,
> > +               .ulcon          = TORBRECK_ULCON_DEFAULT,
> > +               .ufcon          = TORBRECK_UFCON_DEFAULT,
> > +       },
> > +       [2] = {
> > +               .hwport         = 2,
> > +               .flags          = 0,
> > +               .ucon           = TORBRECK_UCON_DEFAULT,
> > +               .ulcon          = TORBRECK_ULCON_DEFAULT,
> > +               .ufcon          = TORBRECK_UFCON_DEFAULT,
> > +       },
> > +       [3] = {
> > +               .hwport         = 3,
> > +               .flags          = 0,
> > +               .ucon           = TORBRECK_UCON_DEFAULT,
> > +               .ulcon          = TORBRECK_ULCON_DEFAULT,
> > +               .ufcon          = TORBRECK_UFCON_DEFAULT,
> > +       },
> > +};
> > +
> > +static struct platform_device *torbreck_devices[] __initdata = {
> > +       &s5pv210_device_iis0,
> > +       &s3c_device_cfcon,
> > +       &s3c_device_hsmmc0,
> > +       &s3c_device_hsmmc1,
> > +       &s3c_device_hsmmc2,
> > +       &s3c_device_hsmmc3,
> > +       &s3c_device_i2c0,
> > +       &s3c_device_i2c1,
> > +       &s3c_device_i2c2,
> > +       &s3c_device_rtc,
> > +       &s3c_device_wdt,
> > +};
> > +
> > +static struct i2c_board_info torbreck_i2c_devs0[] __initdata = {
> > +       /* To Be Updated */
> > +};
> > +
> > +static struct i2c_board_info torbreck_i2c_devs1[] __initdata = {
> > +       /* To Be Updated */
> > +};
> > +
> > +static struct i2c_board_info torbreck_i2c_devs2[] __initdata = {
> > +       /* To Be Updated */
> > +};
> > +
> > +static void __init torbreck_map_io(void)
> > +{
> > +       s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> > +       s3c24xx_init_clocks(24000000);
> > +       s3c24xx_init_uarts(torbreck_uartcfgs,
> ARRAY_SIZE(torbreck_uartcfgs));
> > +}
> > +
> > +static void __init torbreck_machine_init(void)
> > +{
> > +       s3c_i2c0_set_platdata(NULL);
> > +       s3c_i2c1_set_platdata(NULL);
> > +       s3c_i2c2_set_platdata(NULL);
> > +       i2c_register_board_info(0, torbreck_i2c_devs0,
> > +                       ARRAY_SIZE(torbreck_i2c_devs0));
> > +       i2c_register_board_info(1, torbreck_i2c_devs1,
> > +                       ARRAY_SIZE(torbreck_i2c_devs1));
> > +       i2c_register_board_info(2, torbreck_i2c_devs2,
> > +                       ARRAY_SIZE(torbreck_i2c_devs2));
> > +
> > +       platform_add_devices(torbreck_devices,
> ARRAY_SIZE(torbreck_devices));
> > +}
> > +
> > +MACHINE_START(TORBRECK, "TORBRECK")
> > +       /* Maintainer: Hyunchul Ko <ghcstop@gmail.com> */
> > +       .phys_io        = S3C_PA_UART & 0xfff00000,
> > +       .io_pg_offst    = (((u32)S3C_VA_UART) >> 18) & 0xfffc,
> > +       .boot_params    = S5P_PA_SDRAM + 0x100,
> > +       .init_irq       = s5pv210_init_irq,
> > +       .map_io         = torbreck_map_io,
> > +       .init_machine   = torbreck_machine_init,
> > +       .timer          = &s3c24xx_timer,
> > +MACHINE_END
> > --
> > 1.5.6.3
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>

Thanks,
Kyuho Choi

--0016e65b5b38e5f5f604913af2ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>Thank you for your interesting.<br><br></div>
<div class=3D"gmail_quote">On Mon, Sep 27, 2010 at 11:58 AM, Kyungmin Park =
<span dir=3D"ltr">&lt;<a href=3D"mailto:kmpark@infradead.org">kmpark@infrad=
ead.org</a>&gt;</span> wrote:<br>
<blockquote style=3D"BORDER-LEFT: #ccc 1px solid; MARGIN: 0px 0px 0px 0.8ex=
; PADDING-LEFT: 1ex" class=3D"gmail_quote">Hi,<br><br>Looks good to me exce=
pt minor fixup.<br><br>Acked-by: Kyungmin Park &lt;<a href=3D"mailto:kyungm=
in.park@samsung.com">kyungmin.park@samsung.com</a>&gt;<br>


<div>
<div></div>
<div class=3D"h5"><br>On Sun, Sep 26, 2010 at 10:05 AM, Kyuho Choi &lt;<a h=
ref=3D"mailto:chlrbgh0@gmail.com">chlrbgh0@gmail.com</a>&gt; wrote:<br>&gt;=
 This patch adds to support Torbreck board of aESOP community using<br>&gt;=
 Samsung S5PV210 SoC.<br>

&gt;<br>&gt; Signed-off-by: Kyuho Choi &lt;<a href=3D"mailto:chlrbgh0@gmail=
.com">chlrbgh0@gmail.com</a>&gt;<br>&gt; Signed-off-by: Hyunchul Ko &lt;<a =
href=3D"mailto:ghcstop@gmail.com">ghcstop@gmail.com</a>&gt;<br>&gt; ---<br>

&gt; =C2=A0arch/arm/mach-s5pv210/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 18 +++++<br>&gt; =C2=A0arch/arm/mach-s5pv210/Makefile =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A01 +<br>&gt; =C2=A0arch/arm/mach-s5pv210/mach-torbr=
eck.c | =C2=A0133 +++++++++++++++++++++++++++++++++<br>&gt; =C2=A03 files c=
hanged, 152 insertions(+), 0 deletions(-)<br>

&gt; =C2=A0create mode 100644 arch/arm/mach-s5pv210/mach-torbreck.c<br>&gt;=
<br>&gt; diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210=
/Kconfig<br>&gt; index d3a3895..c5ec466 100644<br>&gt; --- a/arch/arm/mach-=
s5pv210/Kconfig<br>

&gt; +++ b/arch/arm/mach-s5pv210/Kconfig<br>&gt; @@ -139,6 +139,24 @@ confi=
g MACH_SMDKV210<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Machine support for Samsung SMDKV210<br>&gt;<br>&gt=
; +config MACH_TORBRECK<br>&gt; + =C2=A0 =C2=A0 =C2=A0 bool &quot;Torbreck&=
quot;<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 select CPU_S5PV210<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 select ARCH_SPARSEMEM_ENABLE<br>&gt; + =C2=A0 =C2=A0 =C2=A0 select S3C_=
DEV_HSMMC<br>&gt; + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_HSMMC1<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 select S3C_DEV_HSMMC2<br>&gt; + =C2=A0 =C2=A0 =C2=A0 s=
elect S3C_DEV_HSMMC3<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_I2C1<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 select S3C_DEV_I2C2<br>&gt; + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_RTC<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_WDT<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 select S5PV210_SETUP_I2C1<br>&gt; + =C2=A0 =C2=A0 =C2=A0 select S5PV=
210_SETUP_I2C2<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 select S5PV210_SETUP_SDHCI<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 help<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Machine support for a=
ESOP Torbreck<br></div></div>Just question. Does it TDROID board?<br></bloc=
kquote>
<div>=C2=A0</div>
<div>No, Torbreck is aESOP community&#39;s co-work board. It&#39;s not=C2=
=A0TDORID.</div>
<div>=C2=A0</div>
<blockquote style=3D"BORDER-LEFT: #ccc 1px solid; MARGIN: 0px 0px 0px 0.8ex=
; PADDING-LEFT: 1ex" class=3D"gmail_quote">
<div>
<div></div>
<div class=3D"h5">&gt; +<br>&gt; =C2=A0endmenu<br>&gt;<br>&gt; =C2=A0endif<=
br>&gt; diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210=
/Makefile<br>&gt; index 05048c5..927c2b7 100644<br>&gt; --- a/arch/arm/mach=
-s5pv210/Makefile<br>

&gt; +++ b/arch/arm/mach-s5pv210/Makefile<br>&gt; @@ -21,6 +21,7 @@ obj-$(C=
ONFIG_MACH_AQUILA) =C2=A0 =C2=A0 +=3D mach-aquila.o<br>&gt; =C2=A0obj-$(CON=
FIG_MACH_SMDKV210) =C2=A0 =C2=A0+=3D mach-smdkv210.o<br>&gt; =C2=A0obj-$(CO=
NFIG_MACH_SMDKC110) =C2=A0 =C2=A0+=3D mach-smdkc110.o<br>

&gt; =C2=A0obj-$(CONFIG_MACH_GONI) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0+=3D mach-goni.o<br>&gt; +obj-$(CONFIG_MACH_TORBRECK) =C2=
=A0 =C2=A0+=3D mach-torbreck.o<br>&gt;<br>&gt; =C2=A0# device support<br>&g=
t;<br>&gt; diff --git a/arch/arm/mach-s5pv210/mach-torbreck.c b/arch/arm/ma=
ch-s5pv210/mach-torbreck.c<br>

&gt; new file mode 100644<br>&gt; index 0000000..3142250<br>&gt; --- /dev/n=
ull<br>&gt; +++ b/arch/arm/mach-s5pv210/mach-torbreck.c<br>&gt; @@ -0,0 +1,=
133 @@<br>&gt; +/* linux/arch/arm/mach-s5pv210/mach-torbreck.c<br>&gt; + *<=
br>

&gt; + * Copyright (c) 2010 aESOP Community<br>&gt; + * =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.aesop.or.kr/" target=3D"_bla=
nk">http://www.aesop.or.kr/</a><br>&gt; + *<br>&gt; + * This program is fre=
e software; you can redistribute it and/or modify<br>

&gt; + * it under the terms of the GNU General Public License version 2 as<=
br>&gt; + * published by the Free Software Foundation.<br>&gt; +*/<br>&gt; =
+<br>&gt; +#include &lt;linux/kernel.h&gt;<br>&gt; +#include &lt;linux/type=
s.h&gt;<br>

&gt; +#include &lt;linux/i2c.h&gt;<br>&gt; +#include &lt;linux/init.h&gt;<b=
r>&gt; +#include &lt;linux/serial_core.h&gt;<br>&gt; +<br>&gt; +#include &l=
t;asm/mach/arch.h&gt;<br>&gt; +#include &lt;asm/mach/map.h&gt;<br>&gt; +#in=
clude &lt;asm/setup.h&gt;<br>

&gt; +#include &lt;asm/mach-types.h&gt;<br>&gt; +<br>&gt; +#include &lt;mac=
h/map.h&gt;<br>&gt; +#include &lt;mach/regs-clock.h&gt;<br>&gt; +<br>&gt; +=
#include &lt;plat/regs-serial.h&gt;<br>&gt; +#include &lt;plat/s5pv210.h&gt=
;<br>

&gt; +#include &lt;plat/devs.h&gt;<br>&gt; +#include &lt;plat/cpu.h&gt;<br>=
&gt; +#include &lt;plat/iic.h&gt;<br>&gt; +<br>&gt; +/* Following are defau=
lt values for UCON, ULCON and UFCON UART registers */<br>&gt; +#define TORB=
RECK_UCON_DEFAULT =C2=A0(S3C2410_UCON_TXILEVEL | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C2410_UCON_RXILEVEL | =C2=A0=
 =C2=A0 =C2=A0 =C2=A0\<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C241=
0_UCON_TXIRQMODE | =C2=A0 =C2=A0 =C2=A0 \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0S3C2410_UCON_RXIRQMODE | =C2=A0 =C2=A0 =C2=A0 \<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C2410_UCON_RXFIFO_TOI | =C2=
=A0 =C2=A0 =C2=A0\<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C2443_U=
CON_RXERR_IRQEN)<br>&gt; +<br>&gt; +#define TORBRECK_ULCON_DEFAULT S3C2410_=
LCON_CS8<br>&gt; +<br>&gt; +#define TORBRECK_UFCON_DEFAULT (S3C2410_UFCON_F=
IFOMODE | =C2=A0 =C2=A0 =C2=A0 \<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5PV210_UFCON_TXTRIG4 | =C2=A0=
 =C2=A0 =C2=A0 =C2=A0\<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5PV21=
0_UFCON_RXTRIG4)<br><br></div></div>Any reason to use TRIG4? just use the f=
ull trigger e.g., 256.<br></blockquote>


<div>=C2=A0</div>
<div>Okay, I&#39;ll fix it.</div>
<div>=C2=A0</div>
<blockquote style=3D"BORDER-LEFT: #ccc 1px solid; MARGIN: 0px 0px 0px 0.8ex=
; PADDING-LEFT: 1ex" class=3D"gmail_quote">
<div class=3D"im">&gt; +<br>&gt; +static struct s3c2410_uartcfg torbreck_ua=
rtcfgs[] __initdata =3D {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 [0] =3D {<br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D 0,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 .flags =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,<br></div>

There&#39;s no code for flags, please remove it all.<br></blockquote>
<div>=C2=A0</div>
<div>Okay, I&#39;ll remove it.</div>
<div>=C2=A0</div>
<blockquote style=3D"BORDER-LEFT: #ccc 1px solid; MARGIN: 0px 0px 0px 0.8ex=
; PADDING-LEFT: 1ex" class=3D"gmail_quote">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBR=
ECK_UCON_DEFAULT,<br>
<div>
<div></div>
<div class=3D"h5">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .=
ulcon =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 },<br>&gt; + =C2=A0 =C2=A0 =C2=A0 [1] =3D {<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 1,<=
br>

&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBRECK_UCON_D=
EFAULT,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ulcon =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 },<br>&gt; + =C2=A0 =C2=A0 =C2=A0 [2] =3D {<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 2,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .flags =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,<br>&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D TORBRECK_UCON_DEFAULT,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 .ulcon =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK=
_ULCON_DEFAULT,<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 },<br>&gt; + =C2=A0 =C2=A0 =C2=A0 [3] =3D {<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 3,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBRECK=
_UCON_DEFAULT,<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ulcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D TORBRECK_UFCON_DEFAULT,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 },<br>&gt; +}=
;<br>&gt; +<br>&gt; +static struct platform_device *torbreck_devices[] __in=
itdata =3D {<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 &amp;s5pv210_device_iis0,<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 &amp;s3c_device_cfcon,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 &amp;s3c_d=
evice_hsmmc0,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 &amp;s3c_device_hsmmc1,<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 &amp;s3c_device_hsmmc2,<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 &amp;s3c_device_hsmmc3,<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 &amp;s3c_device_i2c0,<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 &amp;s3c_device_i2c1,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 &amp;s3c_device=
_i2c2,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 &amp;s3c_device_rtc,<br>&gt; + =C2=A0=
 =C2=A0 =C2=A0 &amp;s3c_device_wdt,<br>&gt; +};<br>&gt; +<br>&gt; +static s=
truct i2c_board_info torbreck_i2c_devs0[] __initdata =3D {<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 /* To Be Updated */<br>&gt; +};<br>&gt; +<br>&g=
t; +static struct i2c_board_info torbreck_i2c_devs1[] __initdata =3D {<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 /* To Be Updated */<br>&gt; +};<br>&gt; +<br>&gt=
; +static struct i2c_board_info torbreck_i2c_devs2[] __initdata =3D {<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 /* To Be Updated */<br>&gt; +};<br>&gt; +<br>&g=
t; +static void __init torbreck_map_io(void)<br>&gt; +{<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 s3c24xx_init_clocks(24000000);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 s3c24x=
x_init_uarts(torbreck_uartcfgs, ARRAY_SIZE(torbreck_uartcfgs));<br>

&gt; +}<br>&gt; +<br>&gt; +static void __init torbreck_machine_init(void)<b=
r>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 s3c_i2c0_set_platdata(NULL);<br>&g=
t; + =C2=A0 =C2=A0 =C2=A0 s3c_i2c1_set_platdata(NULL);<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 s3c_i2c2_set_platdata(NULL);<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 i2c_register_board_info(0, torbreck_i2c_devs0,<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ARRAY_SIZE(torbreck_i2c_devs0));<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 i2c_register_board_info(1, torbreck_i2c_devs1,<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARRAY_SIZE(t=
orbreck_i2c_devs1));<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 i2c_register_board_info(2, torbreck_i2c_devs2,<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ARRAY_SIZE(torbreck_i2c_devs2));<br>&gt; +<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 platform_add_devices(torbreck_devices, ARRAY_SIZE(torbreck_de=
vices));<br>

&gt; +}<br>&gt; +<br>&gt; +MACHINE_START(TORBRECK, &quot;TORBRECK&quot;)<br=
>&gt; + =C2=A0 =C2=A0 =C2=A0 /* Maintainer: Hyunchul Ko &lt;<a href=3D"mail=
to:ghcstop@gmail.com">ghcstop@gmail.com</a>&gt; */<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 .phys_io =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D S3C_PA_UART &amp; 0xfff00000=
,<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 .io_pg_offst =C2=A0 =C2=A0=3D (((u32)S3C_VA_UAR=
T) &gt;&gt; 18) &amp; 0xfffc,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 .boot_params =
=C2=A0 =C2=A0=3D S5P_PA_SDRAM + 0x100,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 .init=
_irq =C2=A0 =C2=A0 =C2=A0 =3D s5pv210_init_irq,<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 .map_io =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D torbreck_map_io,<br>

&gt; + =C2=A0 =C2=A0 =C2=A0 .init_machine =C2=A0 =3D torbreck_machine_init,=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 .timer =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &amp;s3c24xx_timer,<br>&gt; +MACHINE_END<br>&gt; --<br>&gt; 1.5.6.3<br>=
&gt;<br></div></div>&gt; --<br>&gt; To unsubscribe from this list: send the=
 line &quot;unsubscribe linux-samsung-soc&quot; in<br>

&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">=
majordomo@vger.kernel.org</a><br>&gt; More majordomo info at =C2=A0<a href=
=3D"http://vger.kernel.org/majordomo-info.html" target=3D"_blank">http://vg=
er.kernel.org/majordomo-info.html</a><br>

&gt;<br></blockquote></div>
<div><br>Thanks,</div>
<div>Kyuho Choi</div>

--0016e65b5b38e5f5f604913af2ef--


--===============0622257736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0622257736==--
