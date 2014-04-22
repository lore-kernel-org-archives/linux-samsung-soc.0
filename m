From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 8/9] drm/bridge: Add PS8622 bridge driver
Date: Tue, 22 Apr 2014 19:27:17 +0530
Message-ID: <CAEC9eQNeRBxbUh4X=8Vqz+T_=PUQrs2J-GwNU5hsxr=EGeU8-A@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-9-git-send-email-ajaykumar.rs@samsung.com>
 <004001cf5e06$fccf1c00$f66d5400$%han@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1912195309=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <004001cf5e06$fccf1c00$f66d5400$%han@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Andrew Bresticker <abrestic@chromium.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1912195309==
Content-Type: multipart/alternative; boundary=089e01183daa7306da04f7a1feff

--089e01183daa7306da04f7a1feff
Content-Type: text/plain; charset=UTF-8

Hi Jingoo,


On Tue, Apr 22, 2014 at 2:13 PM, Jingoo Han <jg1.han@samsung.com> wrote:

> On Tuesday, April 22, 2014 7:39 AM, Ajay Kumar wrote:
> >
> > This patch adds a drm_bridge driver for the PS8622 DisplayPort to LVDS
> > bridge chip.
> >
> > Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > ---
> > Changes since V1:
> >       Pushing V1 for this as V2 because this patch holds good in this
> series.
> >
> >  drivers/gpu/drm/bridge/Kconfig  |    7 +
> >  drivers/gpu/drm/bridge/Makefile |    1 +
> >  drivers/gpu/drm/bridge/ps8622.c |  566
> +++++++++++++++++++++++++++++++++++++++
> >  include/drm/bridge/ps8622.h     |   42 +++
> >  4 files changed, 616 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/ps8622.c
> >  create mode 100644 include/drm/bridge/ps8622.h
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig
> b/drivers/gpu/drm/bridge/Kconfig
> > index 3bc6845..aba21fc 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -4,3 +4,10 @@ config DRM_PTN3460
> >       select DRM_KMS_HELPER
> >       select DRM_PANEL
> >       ---help---
> > +
> > +config DRM_PS8622
> > +     tristate "Parade eDP/LVDS bridge"
> > +     depends on DRM
> > +     select DRM_KMS_HELPER
> > +     select DRM_PANEL
>
> Please add the following select.
>
> +       select BACKLIGHT_LCD_SUPPORT
> +       select BACKLIGHT_CLASS_DEVICE
>
> Without this, the following build issues happen.
>
> drivers/gpu/drm/bridge/ps8622.c:353: undefined reference to
> `backlight_device_unregister'
> drivers/built-in.o: In function `ps8622_init':
> drivers/gpu/drm/bridge/ps8622.c:559: undefined reference to
> `backlight_device_unregister'
> drivers/gpu/drm/bridge/ps8622.c:507: undefined reference to
> `backlight_device_register'
>
> Right. I will add it.


> > +     ---help---
> > diff --git a/drivers/gpu/drm/bridge/Makefile
> b/drivers/gpu/drm/bridge/Makefile
> > index b4733e1..d1b5daa 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -1,3 +1,4 @@
> >  ccflags-y := -Iinclude/drm
> >
> >  obj-$(CONFIG_DRM_PTN3460) += ptn3460.o
> > +obj-$(CONFIG_DRM_PS8622) += ps8622.o
> > diff --git a/drivers/gpu/drm/bridge/ps8622.c
> b/drivers/gpu/drm/bridge/ps8622.c
> > new file mode 100644
> > index 0000000..1e6b3ca
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/ps8622.c
>
> [.....]
>
> > +static int ps8622_send_config(struct ps8622_bridge *ps_bridge)
> > +{
> > +     struct i2c_client *cl = ps_bridge->client;
> > +     int err = 0;
> > +
> > +     /* wait 20ms after power ON */
> > +     usleep_range(20000, 30000);
> > +
> > +     err |= ps8622_set(cl, 0x02, 0xa1, 0x01); /* HPD low */
> > +     /* SW setting */
> > +     err |= ps8622_set(cl, 0x04, 0x14, 0x01); /* [1:0] SW output 1.2V
> voltage
> > +                                               * is lower to 96% */
>
> The comment style looks awkward.
> Please choose one of two options. And change all comments in this file.
>
> 1.
>
> +       /* SW setting */
> +       err |= ps8622_set(cl, 0x04, 0x14, 0x01); /* [1:0] SW output 1.2V
> voltage is lower to 96% */
>
> 2.
>
> +       /* SW setting */
> +       /* [1:0] SW output 1.2V voltage is lower to 96% */
> +       err |= ps8622_set(cl, 0x04, 0x14, 0x01);
>
> Will use this.


> > +     /* RCO SS setting */
> > +     err |= ps8622_set(cl, 0x04, 0xe3, 0x20); /* [5:4] = b01 0.5%, b10
> 1%,
> > +                                               * b11 1.5% */
> > +     err |= ps8622_set(cl, 0x04, 0xe2, 0x80); /* [7] RCO SS enable */
> > +     /* RPHY Setting */
> > +     err |= ps8622_set(cl, 0x04, 0x8a, 0x0c); /* [3:2] CDR tune wait
> cycle
> > +                                               * before measure for
> fine tune
> > +                                               * b00: 1us b01: 0.5us
> b10:2us
> > +                                               * b11: 4us */
> > +     err |= ps8622_set(cl, 0x04, 0x89, 0x08); /* [3] RFD always on */
> > +     err |= ps8622_set(cl, 0x04, 0x71, 0x2d); /* CTN lock in/out:
> > +                                               * 20000ppm/80000ppm.
> > +                                               * Lock out 2 times. */
> > +     /* 2.7G CDR settings */
> > +     err |= ps8622_set(cl, 0x04, 0x7d, 0x07); /* NOF=40LSB for HBR CDR
> > +                                               * setting */
> > +     err |= ps8622_set(cl, 0x04, 0x7b, 0x00); /* [1:0] Fmin=+4bands */
> > +     err |= ps8622_set(cl, 0x04, 0x7a, 0xfd); /* [7:5] DCO_FTRNG=+-40%
> */
> > +     /* 1.62G CDR settings */
> > +     err |= ps8622_set(cl, 0x04, 0xc0, 0x12); /* [5:2]NOF=64LSB [1:0]DCO
> > +                                               * scale is 2/5 */
> > +     err |= ps8622_set(cl, 0x04, 0xc1, 0x92); /* Gitune=-37% */
> > +     err |= ps8622_set(cl, 0x04, 0xc2, 0x1c); /* Fbstep=100% */
> > +     err |= ps8622_set(cl, 0x04, 0x32, 0x80); /* [7] LOS signal disable
> */
> > +     /* RPIO Setting */
> > +     err |= ps8622_set(cl, 0x04, 0x00, 0xb0); /* [7:4] LVDS driver bias
> > +                                               * current : 75% (250mV
> swing)
> > +                                               * */
> > +     err |= ps8622_set(cl, 0x04, 0x15, 0x40); /* [7:6] Right-bar GPIO
> output
> > +                                               * strength is 8mA */
> > +     /* EQ Training State Machine Setting */
> > +     err |= ps8622_set(cl, 0x04, 0x54, 0x10); /* RCO calibration start
> */
> > +     /* Logic, needs more than 10 I2C command */
> > +     err |= ps8622_set(cl, 0x01, 0x02, 0x80 |
> ps_bridge->max_lane_count);
> > +                                              /* [4:0] MAX_LANE_COUNT
> set to
> > +                                               * max supported lanes */
> > +     err |= ps8622_set(cl, 0x01, 0x21, 0x80 | ps_bridge->lane_count);
> > +                                              /* [4:0] LANE_COUNT_SET
> set to
> > +                                               * chosen lane count */
> > +     err |= ps8622_set(cl, 0x00, 0x52, 0x20);
> > +     err |= ps8622_set(cl, 0x00, 0xf1, 0x03); /* HPD CP toggle enable */
> > +     err |= ps8622_set(cl, 0x00, 0x62, 0x41);
> > +     err |= ps8622_set(cl, 0x00, 0xf6, 0x01); /* Counter number, add 1ms
> > +                                               * counter delay */
> > +     err |= ps8622_set(cl, 0x00, 0x77, 0x06); /* [6]PWM function
> control by
> > +                                               * DPCD0040f[7], default
> is PWM
> > +                                               * block always works. */
> > +     err |= ps8622_set(cl, 0x00, 0x4c, 0x04); /* 04h Adjust VTotal
> tolerance
> > +                                               * to fix the 30Hz no
> display
> > +                                               * issue */
> > +     err |= ps8622_set(cl, 0x01, 0xc0, 0x00); /* DPCD00400='h00, Parade
> OUI =
> > +                                               * 'h001cf8 */
> > +     err |= ps8622_set(cl, 0x01, 0xc1, 0x1c); /* DPCD00401='h1c */
> > +     err |= ps8622_set(cl, 0x01, 0xc2, 0xf8); /* DPCD00402='hf8 */
> > +     err |= ps8622_set(cl, 0x01, 0xc3, 0x44); /* DPCD403~408 = ASCII
> code
> > +                                               * D2SLV5='h4432534c5635
> */
> > +     err |= ps8622_set(cl, 0x01, 0xc4, 0x32); /* DPCD404 */
> > +     err |= ps8622_set(cl, 0x01, 0xc5, 0x53); /* DPCD405 */
> > +     err |= ps8622_set(cl, 0x01, 0xc6, 0x4c); /* DPCD406 */
> > +     err |= ps8622_set(cl, 0x01, 0xc7, 0x56); /* DPCD407 */
> > +     err |= ps8622_set(cl, 0x01, 0xc8, 0x35); /* DPCD408 */
> > +     err |= ps8622_set(cl, 0x01, 0xca, 0x01); /* DPCD40A, Initial Code
> major
> > +                                               * revision '01' */
> > +     err |= ps8622_set(cl, 0x01, 0xcb, 0x05); /* DPCD40B, Initial Code
> minor
> > +                                               * revision '05' */
> > +     if (ps_bridge->bl) {
> > +             err |= ps8622_set(cl, 0x01, 0xa5, 0xa0);
> > +                                             /* DPCD720, internal PWM */
> > +             err |= ps8622_set(cl, 0x01, 0xa7,
> > +                             ps_bridge->bl->props.brightness);
> > +                                              /* FFh for 100%
> brightness,
> > +                                               *  0h for 0% brightness
> */
> > +     } else {
> > +             err |= ps8622_set(cl, 0x01, 0xa5, 0x80);
> > +                                             /* DPCD720, external PWM */
> > +     }
> > +     err |= ps8622_set(cl, 0x01, 0xcc, 0x13); /* Set LVDS output as
> 6bit-VESA
> > +                                               * mapping, single LVDS
> channel
> > +                                               * */
> > +     err |= ps8622_set(cl, 0x02, 0xb1, 0x20); /* Enable SSC set by
> register
> > +                                               * */
> > +     err |= ps8622_set(cl, 0x04, 0x10, 0x16); /* Set SSC enabled and
> +/-1%
> > +                                               * central spreading */
> > +     /* Logic end */
> > +     err |= ps8622_set(cl, 0x04, 0x59, 0x60); /* MPU Clock source: LC
> => RCO
> > +                                               * */
> > +     err |= ps8622_set(cl, 0x04, 0x54, 0x14); /* LC -> RCO */
> > +     err |= ps8622_set(cl, 0x02, 0xa1, 0x91); /* HPD high */
> > +
> > +     return err ? -EIO : 0;
> > +}
> > +
>
> [.....]
>
> > +
> > +static void ps8622_pre_enable(struct drm_bridge *bridge)
> > +{
> > +     struct ps8622_bridge *ps_bridge = bridge->driver_private;
> > +     int ret;
> > +
> > +     mutex_lock(&ps_bridge->enable_mutex);
> > +     if (ps_bridge->enabled)
> > +             goto out;
> > +
> > +     if (gpio_is_valid(ps_bridge->gpio_rst_n))
> > +             gpio_set_value(ps_bridge->gpio_rst_n, 0);
> > +
> > +     if (ps_bridge->v12) {
> > +             ret = regulator_enable(ps_bridge->v12);
> > +             if (ret)
> > +                     DRM_ERROR("fails to enable ps_bridge->v12");
> > +     }
> > +
> > +     drm_panel_pre_enable(ps_bridge->panel);
> > +
> > +     if (gpio_is_valid(ps_bridge->gpio_slp_n))
> > +             gpio_set_value(ps_bridge->gpio_slp_n, 1);
> > +
> > +     /*
> > +      * T1 is the range of time that it takes for the power to rise
> after we
> > +      * enable the lcd fet. T2 is the range of time in which the data
> sheet
> > +      * specifies we should deassert the reset pin.
> > +      *
> > +      * If it takes T1.max for the power to rise, we need to wait
> atleast
> > +      * T2.min before deasserting the reset pin. If it takes T1.min for
> the
> > +      * power to rise, we need to wait at most T2.max before
> deasserting the
> > +      * reset pin.
> > +      */
> > +     usleep_range(PS8622_RST_HIGH_T2_MIN_US +
> PS8622_POWER_RISE_T1_MAX_US,
> > +                  PS8622_RST_HIGH_T2_MAX_US +
> PS8622_POWER_RISE_T1_MIN_US);
> > +
> > +     if (gpio_is_valid(ps_bridge->gpio_rst_n))
> > +             gpio_set_value(ps_bridge->gpio_rst_n, 1);
> > +
> > +     ret = ps8622_send_config(ps_bridge);
> > +     if (ret)
> > +             DRM_ERROR("Failed to send config to bridge (%d)\n", ret);
> > +
> > +     ps_bridge->enabled = true;
> > +
> > +     mutex_unlock(&ps_bridge->enable_mutex);
> > +     return;
> > +
> > +out:
> > +
> > +     mutex_unlock(&ps_bridge->enable_mutex);
> > +}
>
> mutex_unlock() is duplicated. Also, 'return' is unnecessary.
> Please fix it as below.
>
> +       ps_bridge->enabled = true;
> +
> +out:
> +       mutex_unlock(&ps_bridge->enable_mutex);
> +}
>
Right. Will change it.


>
> > +
> > +static void ps8622_enable(struct drm_bridge *bridge)
> > +{
> > +     struct ps8622_bridge *ps_bridge = bridge->driver_private;
> > +
> > +     mutex_lock(&ps_bridge->enable_mutex);
> > +     if (ps_bridge->enabled)
> > +             drm_panel_enable(ps_bridge->panel);
> > +     mutex_unlock(&ps_bridge->enable_mutex);
> > +}
> > +
> > +static void ps8622_disable(struct drm_bridge *bridge)
> > +{
> > +     struct ps8622_bridge *ps_bridge = bridge->driver_private;
> > +
> > +     mutex_lock(&ps_bridge->enable_mutex);
> > +
> > +     if (!ps_bridge->enabled)
> > +             goto out;
> > +
> > +     ps_bridge->enabled = false;
> > +
> > +     drm_panel_disable(ps_bridge->panel);
> > +     msleep(PS8622_PWMO_END_T12_MS);
> > +
> > +     /*
> > +      * This doesn't matter if the regulators are turned off, but
> something
> > +      * else might keep them on. In that case, we want to assert the
> slp gpio
> > +      * to lower power.
> > +      */
> > +     if (gpio_is_valid(ps_bridge->gpio_slp_n))
> > +             gpio_set_value(ps_bridge->gpio_slp_n, 0);
> > +
> > +     drm_panel_post_disable(ps_bridge->panel);
> > +     if (ps_bridge->v12)
> > +             regulator_disable(ps_bridge->v12);
> > +
> > +     /*
> > +      * Sleep for at least the amount of time that it takes the power
> rail to
> > +      * fall to prevent asserting the rst gpio from doing anything.
> > +      */
> > +     usleep_range(PS8622_POWER_FALL_T16_MAX_US,
> > +                  2 * PS8622_POWER_FALL_T16_MAX_US);
> > +     if (gpio_is_valid(ps_bridge->gpio_rst_n))
> > +             gpio_set_value(ps_bridge->gpio_rst_n, 0);
> > +
> > +     msleep(PS8622_POWER_OFF_T17_MS);
> > +
> > +out:
> > +     mutex_unlock(&ps_bridge->enable_mutex);
> > +}
> > +
> > +static void ps8622_post_disable(struct drm_bridge *bridge)
> > +{
> > +}
>
> How about just removing this empty function?

That is not possible. Because the bridge callbacks are called in this
fashion:
       bridge->funcs->post_disable(bridge);
So, if that particular callback turns NULL, it will crash!


>
[.....]
>
> Best regards,
> Jingoo Han
>
>
Regards,
Ajay Kumar

--089e01183daa7306da04f7a1feff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jingoo,<br><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">On Tue, Apr 22, 2014 at 2:13 PM, Jingoo Han <span dir=3D"=
ltr">&lt;<a href=3D"mailto:jg1.han@samsung.com" target=3D"_blank">jg1.han@s=
amsung.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On T=
uesday, April 22, 2014 7:39 AM, Ajay Kumar wrote:<br>
&gt;<br>
&gt; This patch adds a drm_bridge driver for the PS8622 DisplayPort to LVDS=
<br>
&gt; bridge chip.<br>
&gt;<br>
&gt; Signed-off-by: Andrew Bresticker &lt;<a href=3D"mailto:abrestic@chromi=
um.org">abrestic@chromium.org</a>&gt;<br>
&gt; Signed-off-by: Sean Paul &lt;<a href=3D"mailto:seanpaul@chromium.org">=
seanpaul@chromium.org</a>&gt;<br>
&gt; Signed-off-by: Rahul Sharma &lt;<a href=3D"mailto:rahul.sharma@samsung=
.com">rahul.sharma@samsung.com</a>&gt;<br>
&gt; Signed-off-by: Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.c=
om">ajaykumar.rs@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes since V1:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 Pushing V1 for this as V2 because this patch hold=
s good in this series.<br>
&gt;<br>
&gt; =C2=A0drivers/gpu/drm/bridge/Kconfig =C2=A0| =C2=A0 =C2=A07 +<br>
&gt; =C2=A0drivers/gpu/drm/bridge/Makefile | =C2=A0 =C2=A01 +<br>
&gt; =C2=A0drivers/gpu/drm/bridge/ps8622.c | =C2=A0566 ++++++++++++++++++++=
+++++++++++++++++++<br>
&gt; =C2=A0include/drm/bridge/ps8622.h =C2=A0 =C2=A0 | =C2=A0 42 +++<br>
&gt; =C2=A04 files changed, 616 insertions(+)<br>
&gt; =C2=A0create mode 100644 drivers/gpu/drm/bridge/ps8622.c<br>
&gt; =C2=A0create mode 100644 include/drm/bridge/ps8622.h<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/K=
config<br>
&gt; index 3bc6845..aba21fc 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/bridge/Kconfig<br>
&gt; @@ -4,3 +4,10 @@ config DRM_PTN3460<br>
&gt; =C2=A0 =C2=A0 =C2=A0 select DRM_KMS_HELPER<br>
&gt; =C2=A0 =C2=A0 =C2=A0 select DRM_PANEL<br>
&gt; =C2=A0 =C2=A0 =C2=A0 ---help---<br>
&gt; +<br>
&gt; +config DRM_PS8622<br>
&gt; + =C2=A0 =C2=A0 tristate &quot;Parade eDP/LVDS bridge&quot;<br>
&gt; + =C2=A0 =C2=A0 depends on DRM<br>
&gt; + =C2=A0 =C2=A0 select DRM_KMS_HELPER<br>
&gt; + =C2=A0 =C2=A0 select DRM_PANEL<br>
<br>
</div></div>Please add the following select.<br>
<br>
+ =C2=A0 =C2=A0 =C2=A0 select BACKLIGHT_LCD_SUPPORT<br>
+ =C2=A0 =C2=A0 =C2=A0 select BACKLIGHT_CLASS_DEVICE<br>
<br>
Without this, the following build issues happen.<br>
<br>
drivers/gpu/drm/bridge/ps8622.c:353: undefined reference to `backlight_devi=
ce_unregister&#39;<br>
drivers/built-in.o: In function `ps8622_init&#39;:<br>
drivers/gpu/drm/bridge/ps8622.c:559: undefined reference to `backlight_devi=
ce_unregister&#39;<br>
drivers/gpu/drm/bridge/ps8622.c:507: undefined reference to `backlight_devi=
ce_register&#39;<br>
<div class=3D""><br></div></blockquote><div>Right. I will add it.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div class=3D"">
&gt; + =C2=A0 =C2=A0 ---help---<br>
&gt; diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/=
Makefile<br>
&gt; index b4733e1..d1b5daa 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/Makefile<br>
&gt; +++ b/drivers/gpu/drm/bridge/Makefile<br>
&gt; @@ -1,3 +1,4 @@<br>
&gt; =C2=A0ccflags-y :=3D -Iinclude/drm<br>
&gt;<br>
&gt; =C2=A0obj-$(CONFIG_DRM_PTN3460) +=3D ptn3460.o<br>
&gt; +obj-$(CONFIG_DRM_PS8622) +=3D ps8622.o<br>
&gt; diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/drm/bridge/=
ps8622.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..1e6b3ca<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/bridge/ps8622.c<br>
<br>
</div>[.....]<br>
<div class=3D""><br>
&gt; +static int ps8622_send_config(struct ps8622_bridge *ps_bridge)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 struct i2c_client *cl =3D ps_bridge-&gt;client;<br>
&gt; + =C2=A0 =C2=A0 int err =3D 0;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 /* wait 20ms after power ON */<br>
&gt; + =C2=A0 =C2=A0 usleep_range(20000, 30000);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x02, 0xa1, 0x01); /* HPD low =
*/<br>
&gt; + =C2=A0 =C2=A0 /* SW setting */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x14, 0x01); /* [1:0] SW=
 output 1.2V voltage<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * is lower to 96% */<br>
<br>
</div>The comment style looks awkward.<br>
Please choose one of two options. And change all comments in this file.<br>
<br>
1.<br>
<div class=3D""><br>
+ =C2=A0 =C2=A0 =C2=A0 /* SW setting */<br>
</div>+ =C2=A0 =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x14, 0x01); /* =
[1:0] SW output 1.2V voltage is lower to 96% */<br>
<br>
2.<br>
<div class=3D""><br>
+ =C2=A0 =C2=A0 =C2=A0 /* SW setting */<br>
</div>+ =C2=A0 =C2=A0 =C2=A0 /* [1:0] SW output 1.2V voltage is lower to 96=
% */<br>
<div class=3D"">+ =C2=A0 =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x14, =
0x01);<br>
<br></div></blockquote><div>Will use this.=C2=A0</div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div class=3D"">
<br>
</div><div><div class=3D"h5">&gt; + =C2=A0 =C2=A0 /* RCO SS setting */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0xe3, 0x20); /* [5:4] =
=3D b01 0.5%, b10 1%,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * b11 1.5% */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0xe2, 0x80); /* [7] RCO =
SS enable */<br>
&gt; + =C2=A0 =C2=A0 /* RPHY Setting */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x8a, 0x0c); /* [3:2] CD=
R tune wait cycle<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * before measure for fine tune<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * b00: 1us b01: 0.5us b10:2us<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * b11: 4us */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x89, 0x08); /* [3] RFD =
always on */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x71, 0x2d); /* CTN lock=
 in/out:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * 20000ppm/80000ppm.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * Lock out 2 times. */<br>
&gt; + =C2=A0 =C2=A0 /* 2.7G CDR settings */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x7d, 0x07); /* NOF=3D40=
LSB for HBR CDR<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * setting */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x7b, 0x00); /* [1:0] Fm=
in=3D+4bands */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x7a, 0xfd); /* [7:5] DC=
O_FTRNG=3D+-40% */<br>
&gt; + =C2=A0 =C2=A0 /* 1.62G CDR settings */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0xc0, 0x12); /* [5:2]NOF=
=3D64LSB [1:0]DCO<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * scale is 2/5 */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0xc1, 0x92); /* Gitune=
=3D-37% */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0xc2, 0x1c); /* Fbstep=
=3D100% */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x32, 0x80); /* [7] LOS =
signal disable */<br>
&gt; + =C2=A0 =C2=A0 /* RPIO Setting */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x00, 0xb0); /* [7:4] LV=
DS driver bias<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * current : 75% (250mV swing)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x15, 0x40); /* [7:6] Ri=
ght-bar GPIO output<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * strength is 8mA */<br>
&gt; + =C2=A0 =C2=A0 /* EQ Training State Machine Setting */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x54, 0x10); /* RCO cali=
bration start */<br>
&gt; + =C2=A0 =C2=A0 /* Logic, needs more than 10 I2C command */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0x02, 0x80 | ps_bridge-&=
gt;max_lane_count);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* [4:0] MAX_LANE_COUNT set to<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * max supported lanes */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0x21, 0x80 | ps_bridge-&=
gt;lane_count);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* [4:0] LANE_COUNT_SET set to<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * chosen lane count */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x00, 0x52, 0x20);<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x00, 0xf1, 0x03); /* HPD CP t=
oggle enable */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x00, 0x62, 0x41);<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x00, 0xf6, 0x01); /* Counter =
number, add 1ms<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * counter delay */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x00, 0x77, 0x06); /* [6]PWM f=
unction control by<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * DPCD0040f[7], default is PWM<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * block always works. */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x00, 0x4c, 0x04); /* 04h Adju=
st VTotal tolerance<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * to fix the 30Hz no display<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * issue */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xc0, 0x00); /* DPCD0040=
0=3D&#39;h00, Parade OUI =3D<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * &#39;h001cf8 */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xc1, 0x1c); /* DPCD0040=
1=3D&#39;h1c */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xc2, 0xf8); /* DPCD0040=
2=3D&#39;hf8 */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xc3, 0x44); /* DPCD403~=
408 =3D ASCII code<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * D2SLV5=3D&#39;h4432534c5635 */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xc4, 0x32); /* DPCD404 =
*/<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xc5, 0x53); /* DPCD405 =
*/<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xc6, 0x4c); /* DPCD406 =
*/<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xc7, 0x56); /* DPCD407 =
*/<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xc8, 0x35); /* DPCD408 =
*/<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xca, 0x01); /* DPCD40A,=
 Initial Code major<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * revision &#39;01&#39; */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xcb, 0x05); /* DPCD40B,=
 Initial Code minor<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * revision &#39;05&#39; */<br>
&gt; + =C2=A0 =C2=A0 if (ps_bridge-&gt;bl) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x=
01, 0xa5, 0xa0);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* DPCD720, internal PWM */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x=
01, 0xa7,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ps_bridge-&gt;bl-&gt;props.brightness);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* FFh for 100% brightness,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * =C2=A00h for 0% brightness */<br>
&gt; + =C2=A0 =C2=A0 } else {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x=
01, 0xa5, 0x80);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* DPCD720, external PWM */<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x01, 0xcc, 0x13); /* Set LVDS=
 output as 6bit-VESA<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * mapping, single LVDS channel<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x02, 0xb1, 0x20); /* Enable S=
SC set by register<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x10, 0x16); /* Set SSC =
enabled and +/-1%<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * central spreading */<br>
&gt; + =C2=A0 =C2=A0 /* Logic end */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x59, 0x60); /* MPU Cloc=
k source: LC =3D&gt; RCO<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x04, 0x54, 0x14); /* LC -&gt;=
 RCO */<br>
&gt; + =C2=A0 =C2=A0 err |=3D ps8622_set(cl, 0x02, 0xa1, 0x91); /* HPD high=
 */<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 return err ? -EIO : 0;<br>
&gt; +}<br>
&gt; +<br>
<br>
</div></div>[.....]<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +static void ps8622_pre_enable(struct drm_bridge *bridge)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 struct ps8622_bridge *ps_bridge =3D bridge-&gt;driver_=
private;<br>
&gt; + =C2=A0 =C2=A0 int ret;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 mutex_lock(&amp;ps_bridge-&gt;enable_mutex);<br>
&gt; + =C2=A0 =C2=A0 if (ps_bridge-&gt;enabled)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(ps_bridge-&gt;gpio_rst_n))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(ps_bridge-&=
gt;gpio_rst_n, 0);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (ps_bridge-&gt;v12) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D regulator_enable(p=
s_bridge-&gt;v12);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_ERROR(&quot;fails to enable ps_bridge-&gt;v12&quot;);<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 drm_panel_pre_enable(ps_bridge-&gt;panel);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(ps_bridge-&gt;gpio_slp_n))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(ps_bridge-&=
gt;gpio_slp_n, 1);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 /*<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* T1 is the range of time that it takes for the =
power to rise after we<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* enable the lcd fet. T2 is the range of time in=
 which the data sheet<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* specifies we should deassert the reset pin.<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0*<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* If it takes T1.max for the power to rise, we n=
eed to wait atleast<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* T2.min before deasserting the reset pin. If it=
 takes T1.min for the<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* power to rise, we need to wait at most T2.max =
before deasserting the<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* reset pin.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; + =C2=A0 =C2=A0 usleep_range(PS8622_RST_HIGH_T2_MIN_US + PS8622_POWER_=
RISE_T1_MAX_US,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PS8622=
_RST_HIGH_T2_MAX_US + PS8622_POWER_RISE_T1_MIN_US);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(ps_bridge-&gt;gpio_rst_n))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(ps_bridge-&=
gt;gpio_rst_n, 1);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 ret =3D ps8622_send_config(ps_bridge);<br>
&gt; + =C2=A0 =C2=A0 if (ret)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_ERROR(&quot;Failed to =
send config to bridge (%d)\n&quot;, ret);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 ps_bridge-&gt;enabled =3D true;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 mutex_unlock(&amp;ps_bridge-&gt;enable_mutex);<br>
&gt; + =C2=A0 =C2=A0 return;<br>
&gt; +<br>
&gt; +out:<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 mutex_unlock(&amp;ps_bridge-&gt;enable_mutex);<br>
&gt; +}<br>
<br>
</div></div>mutex_unlock() is duplicated. Also, &#39;return&#39; is unneces=
sary.<br>
Please fix it as below.<br>
<div class=3D""><br>
+ =C2=A0 =C2=A0 =C2=A0 ps_bridge-&gt;enabled =3D true;<br>
+<br>
</div><div><div class=3D"h5">+out:<br>
+ =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;ps_bridge-&gt;enable_mutex);<br>
+}<br></div></div></blockquote><div>Right. Will change it.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
<br>
&gt; +<br>
&gt; +static void ps8622_enable(struct drm_bridge *bridge)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 struct ps8622_bridge *ps_bridge =3D bridge-&gt;driver_=
private;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 mutex_lock(&amp;ps_bridge-&gt;enable_mutex);<br>
&gt; + =C2=A0 =C2=A0 if (ps_bridge-&gt;enabled)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_panel_enable(ps_bridge=
-&gt;panel);<br>
&gt; + =C2=A0 =C2=A0 mutex_unlock(&amp;ps_bridge-&gt;enable_mutex);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void ps8622_disable(struct drm_bridge *bridge)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 struct ps8622_bridge *ps_bridge =3D bridge-&gt;driver_=
private;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 mutex_lock(&amp;ps_bridge-&gt;enable_mutex);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (!ps_bridge-&gt;enabled)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 ps_bridge-&gt;enabled =3D false;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 drm_panel_disable(ps_bridge-&gt;panel);<br>
&gt; + =C2=A0 =C2=A0 msleep(PS8622_PWMO_END_T12_MS);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 /*<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* This doesn&#39;t matter if the regulators are =
turned off, but something<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* else might keep them on. In that case, we want=
 to assert the slp gpio<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* to lower power.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(ps_bridge-&gt;gpio_slp_n))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(ps_bridge-&=
gt;gpio_slp_n, 0);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 drm_panel_post_disable(ps_bridge-&gt;panel);<br>
&gt; + =C2=A0 =C2=A0 if (ps_bridge-&gt;v12)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator_disable(ps_bridg=
e-&gt;v12);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 /*<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* Sleep for at least the amount of time that it =
takes the power rail to<br>
&gt; + =C2=A0 =C2=A0 =C2=A0* fall to prevent asserting the rst gpio from do=
ing anything.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; + =C2=A0 =C2=A0 usleep_range(PS8622_POWER_FALL_T16_MAX_US,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02 * PS=
8622_POWER_FALL_T16_MAX_US);<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(ps_bridge-&gt;gpio_rst_n))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(ps_bridge-&=
gt;gpio_rst_n, 0);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 msleep(PS8622_POWER_OFF_T17_MS);<br>
&gt; +<br>
&gt; +out:<br>
&gt; + =C2=A0 =C2=A0 mutex_unlock(&amp;ps_bridge-&gt;enable_mutex);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void ps8622_post_disable(struct drm_bridge *bridge)<br>
&gt; +{<br>
&gt; +}<br>
<br>
</div></div>How about just removing this empty function?</blockquote><div>T=
hat is not possible. Because the bridge callbacks are called in this fashio=
n:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge-&gt;funcs-&gt;post_disable(b=
ridge);</div><div>
So, if that particular callback turns NULL, it will crash!</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">=C2=A0<br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

[.....]<br>
<br>
Best regards,<br>
Jingoo Han<br>
<br>
</blockquote></div><br></div><div class=3D"gmail_extra">Regards,</div><div =
class=3D"gmail_extra">Ajay Kumar</div></div>

--089e01183daa7306da04f7a1feff--

--===============1912195309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1912195309==--
