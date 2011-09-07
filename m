From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: EXYNOS4: ADD USB EHCI device to SMDKV310
Date: Wed, 7 Sep 2011 14:07:31 +0530
Message-ID: <CAK9yfHwxjj7oZqxFF4YfjeeOtvo6T=p07W5itHfxLsbSOxcUVw@mail.gmail.com>
References: <1313564357-32331-1-git-send-email-sachin.kamat@linaro.org>
	<000801cc6d2b$5b49db50$11dd91f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4322649693738406397=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <000801cc6d2b$5b49db50$11dd91f0$%kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============4322649693738406397==
Content-Type: multipart/alternative; boundary=20cf303dd27eec976a04ac55da9d

--20cf303dd27eec976a04ac55da9d
Content-Type: text/plain; charset=ISO-8859-1

Hi Kukjin,

As far as the patch is concerned, there is no difference between mine and
Jingoo's.
So you can go ahead with either of them. No problems from my side.

Regards
Sachin

On 7 September 2011 12:27, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

> Kukjin Kim wrote:
> >
> > Sachin Kamat wrote:
> > >
> > > Signed-off-by: Bhuvana Kakunoori <bhuvana.kakunoori-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  arch/arm/mach-exynos4/Kconfig         |    2 ++
> > >  arch/arm/mach-exynos4/mach-smdkv310.c |   16 ++++++++++++++++
> > >  2 files changed, 18 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/arch/arm/mach-exynos4/Kconfig
> b/arch/arm/mach-exynos4/Kconfig
> > > index bb29d51..cc97d23 100644
> > > --- a/arch/arm/mach-exynos4/Kconfig
> > > +++ b/arch/arm/mach-exynos4/Kconfig
> > > @@ -136,6 +136,7 @@ config MACH_SMDKV310
> > >     bool "SMDKV310"
> > >     select CPU_EXYNOS4210
> > >     select S5P_DEV_FIMD0
> > > +   select S5P_DEV_USB_EHCI
> > >     select S3C_DEV_RTC
> > >     select S3C_DEV_WDT
> > >     select S3C_DEV_I2C1
> > > @@ -151,6 +152,7 @@ config MACH_SMDKV310
> > >     select SAMSUNG_DEV_PWM
> > >     select EXYNOS4_DEV_SYSMMU
> > >     select EXYNOS4_SETUP_FIMD0
> > > +   select EXYNOS4_SETUP_USB_PHY
> > >     select EXYNOS4_SETUP_I2C1
> > >     select EXYNOS4_SETUP_KEYPAD
> > >     select EXYNOS4_SETUP_SDHCI
> > > diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> > > exynos4/mach-smdkv310.c
> > > index 5f62b2b..b6c28ea 100644
> > > --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> > > +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> > > @@ -33,6 +33,8 @@
> > >  #include <plat/gpio-cfg.h>
> > >  #include <plat/backlight.h>
> > >  #include <plat/mfc.h>
> > > +#include <plat/ehci.h>
> > > +#include <plat/clock.h>
> > >
> > >  #include <mach/map.h>
> > >
> > > @@ -167,6 +169,16 @@ static struct i2c_board_info i2c_devs1[]
> __initdata
> = {
> > >     {I2C_BOARD_INFO("wm8994", 0x1a),},
> > >  };
> > >
> > > +/* USB EHCI */
> > > +static struct s5p_ehci_platdata smdkv310_ehci_pdata;
> > > +
> > > +static void __init smdkv310_ehci_init(void)
> > > +{
> > > +   struct s5p_ehci_platdata *pdata = &smdkv310_ehci_pdata;
> > > +
> > > +   s5p_ehci_set_platdata(pdata);
> > > +}
> > > +
> > >  static struct platform_device *smdkv310_devices[] __initdata = {
> > >     &s3c_device_hsmmc0,
> > >     &s3c_device_hsmmc1,
> > > @@ -175,6 +187,7 @@ static struct platform_device *smdkv310_devices[]
> > > __initdata = {
> > >     &s3c_device_i2c1,
> > >     &s3c_device_rtc,
> > >     &s3c_device_wdt,
> > > +   &s5p_device_ehci,
> > >     &exynos4_device_ac97,
> > >     &exynos4_device_i2s0,
> > >     &samsung_device_keypad,
> > > @@ -258,6 +271,9 @@ static void __init smdkv310_machine_init(void)
> > >
> > >     samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
> > >
> > > +   smdkv310_ehci_init();
> > > +   clk_xusbxti.rate = 24000000;
> > > +
> > >     platform_add_devices(smdkv310_devices,
> > > ARRAY_SIZE(smdkv310_devices));
> > >     s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
> > >  }
> > > --
> > > 1.7.4.1
> >
> > (Cc'ed Jingoo Han)
> >
> > Well, this is same with Jingoo's patch on smdkc210 which has been
> submitted at
> > 12th Aug.
> >
> > I requested to him to re-work this on smdkv310 on his patch just now...
> > Hmm...I don't know :(
> >
> > Let me think again...
> >
> As I've heard, Jingoo talked you about this patch and you agreed to use
> Jingoo's patch on SMDKV310. So I dropped this and will pick up his patch.
>
> If any problems, please let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>


-- 
With warm regards,
Sachin

--20cf303dd27eec976a04ac55da9d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Kukjin,<br><br>As far as the patch is concerned, there is no difference =
between mine and Jingoo&#39;s.<br>So you can go ahead with either of them. =
No problems from my side.<br><br>Regards<br>Sachin <br><br><div class=3D"gm=
ail_quote">
On 7 September 2011 12:27, Kukjin Kim <span dir=3D"ltr">&lt;<a href=3D"mail=
to:kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org">kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, 20=
4, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Kukjin Kim wrote:<br>
<div><div></div><div class=3D"h5">&gt;<br>
&gt; Sachin Kamat wrote:<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Bhuvana Kakunoori &lt;<a href=3D"mailto:bhuvana.ka=
kunoori-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">bhuvana.kakunoori-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; &gt; Signed-off-by: Pankaj Dubey &lt;<a href=3D"mailto:pankaj.dubey@sa=
msung.com">pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
&gt; &gt; Signed-off-by: Sachin Kamat &lt;<a href=3D"mailto:sachin.kamat@li=
naro.org">sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 | =A0 =A02 ++<br=
>
&gt; &gt; =A0arch/arm/mach-exynos4/mach-smdkv310.c | =A0 16 +++++++++++++++=
+<br>
&gt; &gt; =A02 files changed, 18 insertions(+), 0 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/arch/arm/mach-exynos4/Kconfig<br>
b/arch/arm/mach-exynos4/Kconfig<br>
&gt; &gt; index bb29d51..cc97d23 100644<br>
&gt; &gt; --- a/arch/arm/mach-exynos4/Kconfig<br>
&gt; &gt; +++ b/arch/arm/mach-exynos4/Kconfig<br>
&gt; &gt; @@ -136,6 +136,7 @@ config MACH_SMDKV310<br>
&gt; &gt; =A0 =A0 bool &quot;SMDKV310&quot;<br>
&gt; &gt; =A0 =A0 select CPU_EXYNOS4210<br>
&gt; &gt; =A0 =A0 select S5P_DEV_FIMD0<br>
&gt; &gt; + =A0 select S5P_DEV_USB_EHCI<br>
&gt; &gt; =A0 =A0 select S3C_DEV_RTC<br>
&gt; &gt; =A0 =A0 select S3C_DEV_WDT<br>
&gt; &gt; =A0 =A0 select S3C_DEV_I2C1<br>
&gt; &gt; @@ -151,6 +152,7 @@ config MACH_SMDKV310<br>
&gt; &gt; =A0 =A0 select SAMSUNG_DEV_PWM<br>
&gt; &gt; =A0 =A0 select EXYNOS4_DEV_SYSMMU<br>
&gt; &gt; =A0 =A0 select EXYNOS4_SETUP_FIMD0<br>
&gt; &gt; + =A0 select EXYNOS4_SETUP_USB_PHY<br>
&gt; &gt; =A0 =A0 select EXYNOS4_SETUP_I2C1<br>
&gt; &gt; =A0 =A0 select EXYNOS4_SETUP_KEYPAD<br>
&gt; &gt; =A0 =A0 select EXYNOS4_SETUP_SDHCI<br>
&gt; &gt; diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mac=
h-<br>
&gt; &gt; exynos4/mach-smdkv310.c<br>
&gt; &gt; index 5f62b2b..b6c28ea 100644<br>
&gt; &gt; --- a/arch/arm/mach-exynos4/mach-smdkv310.c<br>
&gt; &gt; +++ b/arch/arm/mach-exynos4/mach-smdkv310.c<br>
&gt; &gt; @@ -33,6 +33,8 @@<br>
&gt; &gt; =A0#include &lt;plat/gpio-cfg.h&gt;<br>
&gt; &gt; =A0#include &lt;plat/backlight.h&gt;<br>
&gt; &gt; =A0#include &lt;plat/mfc.h&gt;<br>
&gt; &gt; +#include &lt;plat/ehci.h&gt;<br>
&gt; &gt; +#include &lt;plat/clock.h&gt;<br>
&gt; &gt;<br>
&gt; &gt; =A0#include &lt;mach/map.h&gt;<br>
&gt; &gt;<br>
&gt; &gt; @@ -167,6 +169,16 @@ static struct i2c_board_info i2c_devs1[] __i=
nitdata<br>
=3D {<br>
&gt; &gt; =A0 =A0 {I2C_BOARD_INFO(&quot;wm8994&quot;, 0x1a),},<br>
&gt; &gt; =A0};<br>
&gt; &gt;<br>
&gt; &gt; +/* USB EHCI */<br>
&gt; &gt; +static struct s5p_ehci_platdata smdkv310_ehci_pdata;<br>
&gt; &gt; +<br>
&gt; &gt; +static void __init smdkv310_ehci_init(void)<br>
&gt; &gt; +{<br>
&gt; &gt; + =A0 struct s5p_ehci_platdata *pdata =3D &amp;smdkv310_ehci_pdat=
a;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 s5p_ehci_set_platdata(pdata);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; =A0static struct platform_device *smdkv310_devices[] __initdata =
=3D {<br>
&gt; &gt; =A0 =A0 &amp;s3c_device_hsmmc0,<br>
&gt; &gt; =A0 =A0 &amp;s3c_device_hsmmc1,<br>
&gt; &gt; @@ -175,6 +187,7 @@ static struct platform_device *smdkv310_devic=
es[]<br>
&gt; &gt; __initdata =3D {<br>
&gt; &gt; =A0 =A0 &amp;s3c_device_i2c1,<br>
&gt; &gt; =A0 =A0 &amp;s3c_device_rtc,<br>
&gt; &gt; =A0 =A0 &amp;s3c_device_wdt,<br>
&gt; &gt; + =A0 &amp;s5p_device_ehci,<br>
&gt; &gt; =A0 =A0 &amp;exynos4_device_ac97,<br>
&gt; &gt; =A0 =A0 &amp;exynos4_device_i2s0,<br>
&gt; &gt; =A0 =A0 &amp;samsung_device_keypad,<br>
&gt; &gt; @@ -258,6 +271,9 @@ static void __init smdkv310_machine_init(void=
)<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 samsung_bl_set(&amp;smdkv310_bl_gpio_info, &amp;smdkv310_=
bl_data);<br>
&gt; &gt;<br>
&gt; &gt; + =A0 smdkv310_ehci_init();<br>
&gt; &gt; + =A0 clk_xusbxti.rate =3D 24000000;<br>
&gt; &gt; +<br>
&gt; &gt; =A0 =A0 platform_add_devices(smdkv310_devices,<br>
&gt; &gt; ARRAY_SIZE(smdkv310_devices));<br>
&gt; &gt; =A0 =A0 s5p_device_mfc.dev.parent =3D &amp;exynos4_device_pd[PD_M=
FC].dev;<br>
&gt; &gt; =A0}<br>
&gt; &gt; --<br>
&gt; &gt; 1.7.4.1<br>
&gt;<br>
</div></div><div class=3D"im">&gt; (Cc&#39;ed Jingoo Han)<br>
&gt;<br>
&gt; Well, this is same with Jingoo&#39;s patch on smdkc210 which has been<=
br>
submitted at<br>
&gt; 12th Aug.<br>
&gt;<br>
&gt; I requested to him to re-work this on smdkv310 on his patch just now..=
.<br>
&gt; Hmm...I don&#39;t know :(<br>
&gt;<br>
&gt; Let me think again...<br>
&gt;<br>
</div>As I&#39;ve heard, Jingoo talked you about this patch and you agreed =
to use<br>
Jingoo&#39;s patch on SMDKV310. So I dropped this and will pick up his patc=
h.<br>
<br>
If any problems, please let me know.<br>
<div><div></div><div class=3D"h5"><br>
Thanks.<br>
<br>
Best regards,<br>
Kgene.<br>
--<br>
Kukjin Kim &lt;<a href=3D"mailto:kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org">kgene.kim@samsung.c=
om</a>&gt;, Senior Engineer,<br>
SW Solution Development Team, Samsung Electronics Co., Ltd.<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div>With w=
arm regards,</div>
<div>Sachin</div><br>

--20cf303dd27eec976a04ac55da9d--


--===============4322649693738406397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============4322649693738406397==--
