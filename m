From: Kyuho Choi <chlrbgh0@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Add support for ORIGEN4QUAD board
Date: Tue, 20 Nov 2012 13:29:56 +0900
Message-ID: <CAP2JTQLOGMy+S0vd1yzQR4B5B_Z7B26D=VSbEXn=85T+ekt+2A@mail.gmail.com>
References: <1353345846-31355-1-git-send-email-kh.choi@insignal.co.kr>
 <50AB0048.60302@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0176327776899322187=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50AB0048.60302@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyuho Choi <kh.choi@insignal.co.kr>, linux-samsung-soc@vger.kernel.org, "jhkim@insignal.co.kr" <jhkim@insignal.co.kr>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============0176327776899322187==
Content-Type: multipart/alternative; boundary=f46d04389415dce98504cee5b021

--f46d04389415dce98504cee5b021
Content-Type: text/plain; charset=UTF-8

Thanks for your interest. :)

2012/11/20 Tushar Behera <tushar.behera@linaro.org>

> On 11/19/2012 10:54 PM, chlrbgh0@gmail.com wrote:
> > From: Kyuho Choi <kh.choi@insignal.co.kr>
> >
> > This patch add support for Insignal ORIGEN4QUAD board.
> > ORIGEN4QUAD board based on Samsung Exynos4412 SoC.
> >
> > Signed-off-by: Kyuho Choi <kh.choi@insignal.co.kr>
> > ---
> >  arch/arm/mach-exynos/Kconfig       |    1 +
> >  arch/arm/mach-exynos/mach-origen.c |   74
> +++++++++++++++++++++++++++--------
> >  2 files changed, 58 insertions(+), 17 deletions(-)
> >
>
> Since Origen and Origen4Quad boards have different peripherals
> (different pmic chip, touch/audio on different I2C bus etc.), how do you
> plan to add them to mach-origen.c?
>
> As your mentioned, PMIC setup code will be added for Origen4Quad board.

IMHO, Origen and Origen4Quad board has differential form SoC type.
Thus I modified machine initial code from "mach-origen.c" source. It
separate Origenboard and Origen4Quad board from SoC type.

- Common initialize features(Origen and Origen4Quad shared features)
- Origenboard dependant features
- Origen4Quad board dependant features

So, code to initialize the peripherals will be added to each area.

>
> > diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> > index bb3b09a..0b8ccd3 100644
> > --- a/arch/arm/mach-exynos/Kconfig
> > +++ b/arch/arm/mach-exynos/Kconfig
> > @@ -324,6 +324,7 @@ config MACH_NURI
> >  config MACH_ORIGEN
> >       bool "ORIGEN"
> >       select CPU_EXYNOS4210
> > +     select SOC_EXYNOS4412
> >       select EXYNOS4_DEV_USB_OHCI
> >       select EXYNOS4_SETUP_FIMD0
> >       select EXYNOS4_SETUP_SDHCI
> > diff --git a/arch/arm/mach-exynos/mach-origen.c
> b/arch/arm/mach-exynos/mach-origen.c
> > index e6f4191..2839724 100644
> > --- a/arch/arm/mach-exynos/mach-origen.c
> > +++ b/arch/arm/mach-exynos/mach-origen.c
> > @@ -1,6 +1,6 @@
> >  /* linux/arch/arm/mach-exynos4/mach-origen.c
> >   *
> > - * Copyright (c) 2011 Insignal Co., Ltd.
> > + * Copyright (c) 2011-2012 Insignal Co., Ltd.
> >   *           http://www.insignal.co.kr/
> >   *
> >   * This program is free software; you can redistribute it and/or modify
> > @@ -771,19 +771,36 @@ static void __init origen_reserve(void)
> >       s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
> >  }
> >
> > -static void __init origen_machine_init(void)
> > +static int __init origen4quad_i2c_init(void)
> >  {
> > -     origen_power_init();
> > +     /*
> > +      * Origen4Quad has weaknees drive strength in i2c channel 3.
> > +      * thus here setup i2c3's drvstr for Origen4Quad.
> > +      */
> > +     s5p_gpio_set_drvstr(EXYNOS4_GPA1(2), 3);
> > +     s5p_gpio_set_drvstr(EXYNOS4_GPA1(3), 3);
> > +     return 0;
> > +}
> >
> > -     s3c_i2c0_set_platdata(NULL);
> > -     i2c_register_board_info(0, i2c0_devs, ARRAY_SIZE(i2c0_devs));
> > +static int __init origen4quad_usb_init(void)
> > +{
> > +     /* USB HUB controller's hub reset pin setup for Origen4Quad. */
> > +     gpio_request(EXYNOS4_GPX3(5), "GPX3");
> > +     gpio_direction_output(EXYNOS4_GPX3(5), 1);
> > +     gpio_set_value(EXYNOS4_GPX3(5), S3C_GPIO_PULL_UP);
> > +     gpio_free(EXYNOS4_GPX3(5));
> > +     return 0;
> > +}
> >
> > +static void __init origen_machine_init(void)
> > +{
> >       /*
> > -      * Since sdhci instance 2 can contain a bootable media,
> > -      * sdhci instance 0 is registered after instance 2.
> > +      * Common initialize code for ORIGEN and Origen4Quad.
> >        */
> > +     s3c_i2c0_set_platdata(NULL);
> > +     i2c_register_board_info(0, i2c0_devs, ARRAY_SIZE(i2c0_devs));
> > +
> >       s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
> > -     s3c_sdhci0_set_platdata(&origen_hsmmc0_pdata);
> >
> >       origen_ehci_init();
> >       origen_ohci_init();
> > @@ -793,22 +810,45 @@ static void __init origen_machine_init(void)
> >       s5p_i2c_hdmiphy_set_platdata(NULL);
> >       s5p_hdmi_set_platdata(&hdmiphy_info, NULL, 0);
> >
> > -#ifdef CONFIG_DRM_EXYNOS
> > -     s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
> > -     exynos4_fimd0_gpio_setup_24bpp();
> > -#else
> > -     s5p_fimd0_set_platdata(&origen_lcd_pdata);
> > -#endif
> > +     pwm_add_table(origen_pwm_lookup, ARRAY_SIZE(origen_pwm_lookup));
> >
> >       platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
> >
> > -     pwm_add_table(origen_pwm_lookup, ARRAY_SIZE(origen_pwm_lookup));
> > -     samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
> > +     if (!soc_is_exynos4210()) {
> > +             /*
> > +              * In case of soc_is_4210(),
> > +              * Machine initialize for Origen.
> > +              */
> >
> > -     origen_bt_setup();
> > +             origen_power_init();
> > +
> > +             /*
> > +              * Since sdhci instance 2 can contain a bootable media,
> > +              * sdhci instance 0 is registered after instance 2.
> > +              */
> > +             s3c_sdhci0_set_platdata(&origen_hsmmc0_pdata);
> > +
> > +#ifdef CONFIG_DRM_EXYNOS
> > +             s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
> > +             exynos4_fimd0_gpio_setup_24bpp();
> > +#else
> > +             s5p_fimd0_set_platdata(&origen_lcd_pdata);
> > +#endif
> > +             samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
> > +
> > +             origen_bt_setup();
> > +     } else{
> > +             /*
> > +              * In case of soc_is_4412(),
> > +              * Machine initialize for Origen4Quad.
> > +              */
> > +             origen4quad_i2c_init();
> > +             origen4quad_usb_init();
> > +     }
> >  }
> >
> >  MACHINE_START(ORIGEN, "ORIGEN")
> > +     /* Maintainer: Kyuho Choi <kh.choi@insignal.co.kr> */
> >       /* Maintainer: JeongHyeon Kim <jhkim@insignal.co.kr> */
> >       .atag_offset    = 0x100,
> >       .smp            = smp_ops(exynos_smp_ops),
> >
>
>
> --
> Tushar Behera
>

--f46d04389415dce98504cee5b021
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks for your interest. :)<div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">2012/11/20 Tushar Behera <span dir=3D"ltr">&lt;<a href=3D"mailto=
:tushar.behera@linaro.org" target=3D"_blank">tushar.behera@linaro.org</a>&g=
t;</span><br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On 11/19/2012 10:54 PM, <a href=3D"mailt=
o:chlrbgh0@gmail.com">chlrbgh0@gmail.com</a> wrote:<br>


&gt; From: Kyuho Choi &lt;<a href=3D"mailto:kh.choi@insignal.co.kr">kh.choi=
@insignal.co.kr</a>&gt;<br>
&gt;<br>
&gt; This patch add support for Insignal ORIGEN4QUAD board.<br>
&gt; ORIGEN4QUAD board based on Samsung Exynos4412 SoC.<br>
&gt;<br>
&gt; Signed-off-by: Kyuho Choi &lt;<a href=3D"mailto:kh.choi@insignal.co.kr=
">kh.choi@insignal.co.kr</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0arch/arm/mach-exynos/Kconfig =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A01 +<br>
&gt; =C2=A0arch/arm/mach-exynos/mach-origen.c | =C2=A0 74 +++++++++++++++++=
++++++++++--------<br>
&gt; =C2=A02 files changed, 58 insertions(+), 17 deletions(-)<br>
&gt;<br>
<br>
</div>Since Origen and Origen4Quad boards have different peripherals<br>
(different pmic chip, touch/audio on different I2C bus etc.), how do you<br=
>
plan to add them to mach-origen.c?<br>
<div class=3D""><div class=3D"h5"><br></div></div></blockquote><div>As your=
 mentioned, PMIC setup code will be added for Origen4Quad board.<br></div><=
div><br></div><div>IMHO, Origen and Origen4Quad board has differential form=
 SoC type.<br>

</div><div>Thus I modified machine initial code from &quot;mach-origen.c&qu=
ot; source. It separate Origenboard and Origen4Quad board from SoC type.</d=
iv><div><br></div><div>- Common initialize features(Origen and Origen4Quad =
shared features)</div>

<div>- Origenboard dependant features</div><div>- Origen4Quad board dependa=
nt features</div><div><br></div><div>So, code to initialize the peripherals=
 will be added to each area.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex">

<div class=3D""><div class=3D"h5"><br>
&gt; diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconf=
ig<br>
&gt; index bb3b09a..0b8ccd3 100644<br>
&gt; --- a/arch/arm/mach-exynos/Kconfig<br>
&gt; +++ b/arch/arm/mach-exynos/Kconfig<br>
&gt; @@ -324,6 +324,7 @@ config MACH_NURI<br>
&gt; =C2=A0config MACH_ORIGEN<br>
&gt; =C2=A0 =C2=A0 =C2=A0 bool &quot;ORIGEN&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 select CPU_EXYNOS4210<br>
&gt; + =C2=A0 =C2=A0 select SOC_EXYNOS4412<br>
&gt; =C2=A0 =C2=A0 =C2=A0 select EXYNOS4_DEV_USB_OHCI<br>
&gt; =C2=A0 =C2=A0 =C2=A0 select EXYNOS4_SETUP_FIMD0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 select EXYNOS4_SETUP_SDHCI<br>
&gt; diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos=
/mach-origen.c<br>
&gt; index e6f4191..2839724 100644<br>
&gt; --- a/arch/arm/mach-exynos/mach-origen.c<br>
&gt; +++ b/arch/arm/mach-exynos/mach-origen.c<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt; =C2=A0/* linux/arch/arm/mach-exynos4/mach-origen.c<br>
&gt; =C2=A0 *<br>
&gt; - * Copyright (c) 2011 Insignal Co., Ltd.<br>
&gt; + * Copyright (c) 2011-2012 Insignal Co., Ltd.<br>
&gt; =C2=A0 * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.insi=
gnal.co.kr/" target=3D"_blank">http://www.insignal.co.kr/</a><br>
&gt; =C2=A0 *<br>
&gt; =C2=A0 * This program is free software; you can redistribute it and/or=
 modify<br>
&gt; @@ -771,19 +771,36 @@ static void __init origen_reserve(void)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 s5p_mfc_reserve_mem(0x43000000, 8 &lt;&lt; 20, 0x=
51000000, 8 &lt;&lt; 20);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -static void __init origen_machine_init(void)<br>
&gt; +static int __init origen4quad_i2c_init(void)<br>
&gt; =C2=A0{<br>
&gt; - =C2=A0 =C2=A0 origen_power_init();<br>
&gt; + =C2=A0 =C2=A0 /*<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* Origen4Quad has weaknees drive strength in i2c=
 channel 3.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* thus here setup i2c3&#39;s drvstr for Origen4Q=
uad.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; + =C2=A0 =C2=A0 s5p_gpio_set_drvstr(EXYNOS4_GPA1(2), 3);<br>
&gt; + =C2=A0 =C2=A0 s5p_gpio_set_drvstr(EXYNOS4_GPA1(3), 3);<br>
&gt; + =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 s3c_i2c0_set_platdata(NULL);<br>
&gt; - =C2=A0 =C2=A0 i2c_register_board_info(0, i2c0_devs, ARRAY_SIZE(i2c0_=
devs));<br>
&gt; +static int __init origen4quad_usb_init(void)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 /* USB HUB controller&#39;s hub reset pin setup for Or=
igen4Quad. */<br>
&gt; + =C2=A0 =C2=A0 gpio_request(EXYNOS4_GPX3(5), &quot;GPX3&quot;);<br>
&gt; + =C2=A0 =C2=A0 gpio_direction_output(EXYNOS4_GPX3(5), 1);<br>
&gt; + =C2=A0 =C2=A0 gpio_set_value(EXYNOS4_GPX3(5), S3C_GPIO_PULL_UP);<br>
&gt; + =C2=A0 =C2=A0 gpio_free(EXYNOS4_GPX3(5));<br>
&gt; + =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt;<br>
&gt; +static void __init origen_machine_init(void)<br>
&gt; +{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; - =C2=A0 =C2=A0 =C2=A0* Since sdhci instance 2 can contain a bootable =
media,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0* sdhci instance 0 is registered after instance =
2.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* Common initialize code for ORIGEN and Origen4Q=
uad.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; + =C2=A0 =C2=A0 s3c_i2c0_set_platdata(NULL);<br>
&gt; + =C2=A0 =C2=A0 i2c_register_board_info(0, i2c0_devs, ARRAY_SIZE(i2c0_=
devs));<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 s3c_sdhci2_set_platdata(&amp;origen_hsmmc2_pdata)=
;<br>
&gt; - =C2=A0 =C2=A0 s3c_sdhci0_set_platdata(&amp;origen_hsmmc0_pdata);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 origen_ehci_init();<br>
&gt; =C2=A0 =C2=A0 =C2=A0 origen_ohci_init();<br>
&gt; @@ -793,22 +810,45 @@ static void __init origen_machine_init(void)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 s5p_i2c_hdmiphy_set_platdata(NULL);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 s5p_hdmi_set_platdata(&amp;hdmiphy_info, NULL, 0)=
;<br>
&gt;<br>
&gt; -#ifdef CONFIG_DRM_EXYNOS<br>
&gt; - =C2=A0 =C2=A0 s5p_device_fimd0.dev.platform_data =3D &amp;drm_fimd_p=
data;<br>
&gt; - =C2=A0 =C2=A0 exynos4_fimd0_gpio_setup_24bpp();<br>
&gt; -#else<br>
&gt; - =C2=A0 =C2=A0 s5p_fimd0_set_platdata(&amp;origen_lcd_pdata);<br>
&gt; -#endif<br>
&gt; + =C2=A0 =C2=A0 pwm_add_table(origen_pwm_lookup, ARRAY_SIZE(origen_pwm=
_lookup));<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 platform_add_devices(origen_devices, ARRAY_SIZE(o=
rigen_devices));<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 pwm_add_table(origen_pwm_lookup, ARRAY_SIZE(origen_pwm=
_lookup));<br>
&gt; - =C2=A0 =C2=A0 samsung_bl_set(&amp;origen_bl_gpio_info, &amp;origen_b=
l_data);<br>
&gt; + =C2=A0 =C2=A0 if (!soc_is_exynos4210()) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* In case of soc_is_=
4210(),<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Machine initialize=
 for Origen.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 origen_bt_setup();<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 origen_power_init();<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Since sdhci instan=
ce 2 can contain a bootable media,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sdhci instance 0 i=
s registered after instance 2.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_sdhci0_set_platdata(&a=
mp;origen_hsmmc0_pdata);<br>
&gt; +<br>
&gt; +#ifdef CONFIG_DRM_EXYNOS<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s5p_device_fimd0.dev.platf=
orm_data =3D &amp;drm_fimd_pdata;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exynos4_fimd0_gpio_setup_2=
4bpp();<br>
&gt; +#else<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s5p_fimd0_set_platdata(&am=
p;origen_lcd_pdata);<br>
&gt; +#endif<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 samsung_bl_set(&amp;origen=
_bl_gpio_info, &amp;origen_bl_data);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 origen_bt_setup();<br>
&gt; + =C2=A0 =C2=A0 } else{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* In case of soc_is_=
4412(),<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Machine initialize=
 for Origen4Quad.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 origen4quad_i2c_init();<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 origen4quad_usb_init();<br=
>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0MACHINE_START(ORIGEN, &quot;ORIGEN&quot;)<br>
&gt; + =C2=A0 =C2=A0 /* Maintainer: Kyuho Choi &lt;<a href=3D"mailto:kh.cho=
i@insignal.co.kr">kh.choi@insignal.co.kr</a>&gt; */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 /* Maintainer: JeongHyeon Kim &lt;<a href=3D"mail=
to:jhkim@insignal.co.kr">jhkim@insignal.co.kr</a>&gt; */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 .atag_offset =C2=A0 =C2=A0=3D 0x100,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 .smp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 smp_ops(exynos_smp_ops),<br>
&gt;<br>
<br>
<br>
--<br>
</div></div><span class=3D""><font color=3D"#888888">Tushar Behera<br>
</font></span></blockquote></div><br></div>

--f46d04389415dce98504cee5b021--


--===============0176327776899322187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0176327776899322187==--
