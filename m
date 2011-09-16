From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Add keypad support for Origen
Date: Fri, 16 Sep 2011 20:42:45 +0530
Message-ID: <CAK9yfHwM0c-jSe7XvfwT-9BqikxczSqBrDt0gxWg5YXCoMzCvw@mail.gmail.com>
References: <1316057572-13719-1-git-send-email-sachin.kamat@linaro.org>
	<00d201cc7469$dc599bf0$950cd3d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8210998036745257328=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <00d201cc7469$dc599bf0$950cd3d0$%kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============8210998036745257328==
Content-Type: multipart/alternative; boundary=0016e6d77cf8eeecba04ad106cad

--0016e6d77cf8eeecba04ad106cad
Content-Type: text/plain; charset=ISO-8859-1

On 16 September 2011 17:42, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

> Sachin Kamat wrote:
> >
> > This patch adds keypad support for Origen board as GPIO keys.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/mach-exynos4/mach-origen.c |   58
> > +++++++++++++++++++++++++++++++++++
> >  1 files changed, 58 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos4/mach-origen.c
> b/arch/arm/mach-exynos4/mach-
> > origen.c
> > index ed59f86..61da36b 100644
> > --- a/arch/arm/mach-exynos4/mach-origen.c
> > +++ b/arch/arm/mach-exynos4/mach-origen.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/io.h>
> >  #include <linux/input.h>
> > +#include <linux/gpio_keys.h>
> >
> >  #include <asm/mach/arch.h>
> >  #include <asm/mach-types.h>
> > @@ -79,10 +80,67 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata
> > __initdata = {
> >       .clk_type               = S3C_SDHCI_CLK_DIV_EXTERNAL,
> >  };
> >
> > +static struct gpio_keys_button origen_gpio_keys_table[] = {
> > +     {
> > +             .code = KEY_MENU,
>
> If you're ok, will change tab between '.code' and '=', I think it would be
> better to read code.
> OK. Sure.
>
> > +             .gpio = EXYNOS4_GPX1(5),
> > +             .desc = "gpio-keys: KEY_MENU",
> > +             .type = EV_KEY,
> > +             .active_low = 1,
> > +             .wakeup = 1,
> > +             .debounce_interval = 1,
> > +     }, {
> > +             .code = KEY_HOME,
> > +             .gpio = EXYNOS4_GPX1(6),
> > +             .desc = "gpio-keys: KEY_HOME",
> > +             .type = EV_KEY,
> > +             .active_low = 1,
> > +             .wakeup = 1,
> > +             .debounce_interval = 1,
> > +     }, {
> > +             .code = KEY_BACK,
> > +             .gpio = EXYNOS4_GPX1(7),
> > +             .desc = "gpio-keys: KEY_BACK",
> > +             .type = EV_KEY,
> > +             .active_low = 1,
> > +             .wakeup = 1,
> > +             .debounce_interval = 1,
> > +     }, {
> > +             .code = KEY_UP,
> > +             .gpio = EXYNOS4_GPX2(0),
> > +             .desc = "gpio-keys: KEY_UP",
> > +             .type = EV_KEY,
> > +             .active_low = 1,
> > +             .wakeup = 1,
> > +             .debounce_interval = 1,
> > +     }, {
> > +             .code = KEY_DOWN,
> > +             .gpio = EXYNOS4_GPX2(1),
> > +             .desc = "gpio-keys: KEY_DOWN",
> > +             .type = EV_KEY,
> > +             .active_low = 1,
> > +             .wakeup = 1,
> > +             .debounce_interval = 1,
> > +     },
> > +};
> > +
> > +static struct gpio_keys_platform_data origen_gpio_keys_data = {
> > +     .buttons = origen_gpio_keys_table,
> > +     .nbuttons = ARRAY_SIZE(origen_gpio_keys_table),
> > +};
> > +
> > +static struct platform_device origen_device_gpiokeys = {
> > +     .name = "gpio-keys",
> > +     .dev = {
> > +             .platform_data = &origen_gpio_keys_data,
> > +     },
> > +};
> > +
> >  static struct platform_device *origen_devices[] __initdata = {
> >       &s3c_device_hsmmc2,
> >       &s3c_device_rtc,
> >       &s3c_device_wdt,
> > +     &origen_device_gpiokeys,
> >  };
> >
> >  static void __init origen_map_io(void)
> > --
> > 1.7.4.1
>
> Looks ok to me, will apply.
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

--0016e6d77cf8eeecba04ad106cad
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On 16 September 2011 17:42, Kukjin Kim <=
span dir=3D"ltr">&lt;<a href=3D"mailto:kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org">kgene.kim@sam=
sung.com</a>&gt;</span> wrote:<br><blockquote style=3D"margin: 0px 0px 0px =
0.8ex; padding-left: 1ex; border-left-color: rgb(204, 204, 204); border-lef=
t-width: 1px; border-left-style: solid;" class=3D"gmail_quote">
<div class=3D"im">Sachin Kamat wrote:<br>
&gt;<br>
&gt; This patch adds keypad support for Origen board as GPIO keys.<br>
&gt;<br>
&gt; Signed-off-by: Sachin Kamat &lt;<a href=3D"mailto:sachin.kamat@linaro.=
org">sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; =A0arch/arm/mach-exynos4/mach-origen.c | =A0 58<br>
&gt; +++++++++++++++++++++++++++++++++++<br>
&gt; =A01 files changed, 58 insertions(+), 0 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/mach-exynos4/mach-origen.c<br>
b/arch/arm/mach-exynos4/mach-<br>
&gt; origen.c<br>
&gt; index ed59f86..61da36b 100644<br>
&gt; --- a/arch/arm/mach-exynos4/mach-origen.c<br>
&gt; +++ b/arch/arm/mach-exynos4/mach-origen.c<br>
&gt; @@ -14,6 +14,7 @@<br>
&gt; =A0#include &lt;linux/platform_device.h&gt;<br>
&gt; =A0#include &lt;linux/io.h&gt;<br>
&gt; =A0#include &lt;linux/input.h&gt;<br>
&gt; +#include &lt;linux/gpio_keys.h&gt;<br>
&gt;<br>
&gt; =A0#include &lt;asm/mach/arch.h&gt;<br>
&gt; =A0#include &lt;asm/mach-types.h&gt;<br>
&gt; @@ -79,10 +80,67 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pda=
ta<br>
&gt; __initdata =3D {<br>
&gt; =A0 =A0 =A0 .clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK_DI=
V_EXTERNAL,<br>
&gt; =A0};<br>
&gt;<br>
&gt; +static struct gpio_keys_button origen_gpio_keys_table[] =3D {<br>
&gt; + =A0 =A0 {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .code =3D KEY_MENU,<br>
<br>
</div>If you&#39;re ok, will change tab between &#39;.code&#39; and &#39;=
=3D&#39;, I think it would be<br>
better to read code.<br>
<div><div>OK. Sure.</div><div class=3D"h5"><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .gpio =3D EXYNOS4_GPX1(5),<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .desc =3D &quot;gpio-keys: KEY_MENU&quot;,<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .type =3D EV_KEY,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .active_low =3D 1,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .wakeup =3D 1,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .debounce_interval =3D 1,<br>
&gt; + =A0 =A0 }, {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .code =3D KEY_HOME,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .gpio =3D EXYNOS4_GPX1(6),<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .desc =3D &quot;gpio-keys: KEY_HOME&quot;,<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .type =3D EV_KEY,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .active_low =3D 1,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .wakeup =3D 1,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .debounce_interval =3D 1,<br>
&gt; + =A0 =A0 }, {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .code =3D KEY_BACK,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .gpio =3D EXYNOS4_GPX1(7),<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .desc =3D &quot;gpio-keys: KEY_BACK&quot;,<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .type =3D EV_KEY,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .active_low =3D 1,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .wakeup =3D 1,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .debounce_interval =3D 1,<br>
&gt; + =A0 =A0 }, {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .code =3D KEY_UP,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .gpio =3D EXYNOS4_GPX2(0),<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .desc =3D &quot;gpio-keys: KEY_UP&quot;,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .type =3D EV_KEY,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .active_low =3D 1,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .wakeup =3D 1,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .debounce_interval =3D 1,<br>
&gt; + =A0 =A0 }, {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .code =3D KEY_DOWN,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .gpio =3D EXYNOS4_GPX2(1),<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .desc =3D &quot;gpio-keys: KEY_DOWN&quot;,<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .type =3D EV_KEY,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .active_low =3D 1,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .wakeup =3D 1,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .debounce_interval =3D 1,<br>
&gt; + =A0 =A0 },<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct gpio_keys_platform_data origen_gpio_keys_data =3D {<br>
&gt; + =A0 =A0 .buttons =3D origen_gpio_keys_table,<br>
&gt; + =A0 =A0 .nbuttons =3D ARRAY_SIZE(origen_gpio_keys_table),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct platform_device origen_device_gpiokeys =3D {<br>
&gt; + =A0 =A0 .name =3D &quot;gpio-keys&quot;,<br>
&gt; + =A0 =A0 .dev =3D {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D &amp;origen_gpio_keys_dat=
a,<br>
&gt; + =A0 =A0 },<br>
&gt; +};<br>
&gt; +<br>
&gt; =A0static struct platform_device *origen_devices[] __initdata =3D {<br=
>
&gt; =A0 =A0 =A0 &amp;s3c_device_hsmmc2,<br>
&gt; =A0 =A0 =A0 &amp;s3c_device_rtc,<br>
&gt; =A0 =A0 =A0 &amp;s3c_device_wdt,<br>
&gt; + =A0 =A0 &amp;origen_device_gpiokeys,<br>
&gt; =A0};<br>
&gt;<br>
&gt; =A0static void __init origen_map_io(void)<br>
&gt; --<br>
&gt; 1.7.4.1<br>
<br>
</div></div>Looks ok to me, will apply.<br>
Thanks.<br>
<br>
Best regards,<br>
Kgene.<br>
<font color=3D"#888888">--<br>
Kukjin Kim &lt;<a href=3D"mailto:kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org">kgene.kim@samsung.c=
om</a>&gt;, Senior Engineer,<br>
SW Solution Development Team, Samsung Electronics Co., Ltd.<br>
<br>
</font></blockquote></div><br><br clear=3D"all"><br>-- <br><div>With warm r=
egards,</div>
<div>Sachin</div><br>

--0016e6d77cf8eeecba04ad106cad--


--===============8210998036745257328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============8210998036745257328==--
