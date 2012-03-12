From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add HDMIPHY quirk for S3C2440
Date: Mon, 12 Mar 2012 11:38:52 +0530
Message-ID: <CAJuYYwQ1QmnZ5L_FO3zW3TzfpS=XTDQFf-T14noehQyDzwqDTA@mail.gmail.com>
References: <1331312686-2077-1-git-send-email-k.lewandowsk@samsung.com>
	<1331312686-2077-3-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331312686-2077-3-git-send-email-k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 9 March 2012 22:34, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wro=
te:
> From: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> This patch adds support for s3c2440 I2C bus controller dedicated HDMI=
PHY device on
> Exynos4 platform. Some quirks are introduced due to differences betwe=
en HDMIPHY
> and other I2C controllers on Exynos4. =A0These differences are:
> - no GPIOs, HDMIPHY is inside the SoC and the controller is connected
> =A0internally
> - due to unknown reason (probably HW bug in HDMIPHY and/or the contro=
ller) a
> =A0transfer fails to finish. The controller hangs after sending the l=
ast byte,
> =A0the workaround for this bug is resetting the controller after each=
 transfer
>
> Signed-off-by: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Tested-by: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> =A0.../devicetree/bindings/i2c/samsung-i2c.txt =A0 =A0 =A0 =A0| =A0 1=
0 +++++-
> =A0drivers/i2c/busses/i2c-s3c2410.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 34 ++++++++++++++++++++
> =A02 files changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/samsung-i2c.txt b/=
Documentation/devicetree/bindings/i2c/samsung-i2c.txt
> index 38832c7..ac0917c 100644
> --- a/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
> @@ -10,14 +10,20 @@ Required properties:
> =A0 =A0 region.
> =A0 - interrupts: interrupt number to the cpu.
> =A0 - samsung,i2c-sda-delay: Delay (in ns) applied to data line (SDA)=
 edges.
> - =A0- gpios: The order of the gpios should be the following: <SDA, S=
CL>.
> - =A0 =A0The gpio specifier depends on the gpio controller.
>
> =A0Optional properties:
> + =A0- gpios: The order of the gpios should be the following: <SDA, S=
CL>.
> + =A0 =A0The gpio specifier depends on the gpio controller. Required =
in all cases
> + =A0 =A0except when "samsung,i2c-no-gpio" is also specified.
> + =A0- samsung,i2c-no-gpio: input/output lines of the controller are
> + =A0 =A0permanently wired to the respective client, there are no gpi=
o
> + =A0 =A0lines that need to be configured to enable this controller
> =A0 - samsung,i2c-slave-addr: Slave address in multi-master enviromen=
t. If not
> =A0 =A0 specified, default value is 0.
> =A0 - samsung,i2c-max-bus-freq: Desired frequency in Hz of the bus. I=
f not
> =A0 =A0 specified, the default value in Hz is 100000.
> + =A0- samsung,i2c-quirk-hdmiphy: Quirk for HDMI PHY block on S3C2440=
 -
> + =A0 =A0reduce timeout and reset controller when doing transefers
>
> =A0Example:
>
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2=
c-s3c2410.c
> index 5b400c6..9f3be51 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -48,6 +48,8 @@
> =A0#define TYPE_BITS =A0 =A0 =A0 =A0 =A0 =A0 =A00x000000ff
> =A0#define TYPE_S3C2410 =A0 =A0 =A0 =A0 =A0 0x00000001
> =A0#define TYPE_S3C2440 =A0 =A0 =A0 =A0 =A0 0x00000002
> +#define FLAG_HDMIPHY =A0 =A0 =A0 =A0 =A0 0x00000100
> +#define FLAG_NO_GPIO =A0 =A0 =A0 =A0 =A0 0x00000200
>
> =A0/* i2c controller state */
> =A0enum s3c24xx_i2c_state {
> @@ -449,6 +451,13 @@ static int s3c24xx_i2c_set_master(struct s3c24xx=
_i2c *i2c)
> =A0 =A0 =A0 =A0unsigned long iicstat;
> =A0 =A0 =A0 =A0int timeout =3D 400;
>
> + =A0 =A0 =A0 /* the timeout for HDMIPHY is reduced to 10 ms because
> + =A0 =A0 =A0 =A0* the hangup is expected to happen, so waiting 400 m=
s
> + =A0 =A0 =A0 =A0* causes only unnecessary system hangup
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (i2c->type & FLAG_HDMIPHY)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 timeout =3D 10;
> +
> =A0 =A0 =A0 =A0while (timeout-- > 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0iicstat =3D readl(i2c->regs + S3C2410_=
IICSTAT);
>
> @@ -458,6 +467,15 @@ static int s3c24xx_i2c_set_master(struct s3c24xx=
_i2c *i2c)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0msleep(1);
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 /* hang-up of bus dedicated for HDMIPHY occurred, reset=
ting */
> + =A0 =A0 =A0 if (i2c->type & FLAG_HDMIPHY) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(0, i2c->regs + S3C2410_IICCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(0, i2c->regs + S3C2410_IICSTAT);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(0, i2c->regs + S3C2410_IICDS);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0return -ETIMEDOUT;
> =A0}
>
> @@ -739,6 +757,9 @@ static int s3c24xx_i2c_parse_dt_gpio(struct s3c24=
xx_i2c *i2c)
> =A0{
> =A0 =A0 =A0 =A0int idx, gpio, ret;
>
> + =A0 =A0 =A0 if (i2c->type & FLAG_NO_GPIO)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> =A0 =A0 =A0 =A0for (idx =3D 0; idx < 2; idx++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpio =3D of_get_gpio(i2c->dev->of_node=
, idx);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!gpio_is_valid(gpio)) {
> @@ -763,6 +784,10 @@ free_gpio:
> =A0static void s3c24xx_i2c_dt_gpio_free(struct s3c24xx_i2c *i2c)
> =A0{
> =A0 =A0 =A0 =A0unsigned int idx;
> +
> + =A0 =A0 =A0 if (i2c->type & FLAG_NO_GPIO)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> =A0 =A0 =A0 =A0for (idx =3D 0; idx < 2; idx++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpio_free(i2c->gpios[idx]);
> =A0}
> @@ -846,6 +871,12 @@ s3c24xx_i2c_parse_dt(struct device_node *np, str=
uct s3c24xx_i2c *i2c)
> =A0 =A0 =A0 =A0match =3D of_match_node(&s3c24xx_i2c_match[0], np);
> =A0 =A0 =A0 =A0i2c->type =3D (unsigned int)match->data;
>
> + =A0 =A0 =A0 if (i2c->type =3D=3D TYPE_S3C2440 && of_get_property(np=
, "samsung,i2c-quirk-hdmiphy", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->type |=3D FLAG_HDMIPHY;
> +
> + =A0 =A0 =A0 if (of_get_property(np, "samsung,i2c-no-gpio", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->type |=3D FLAG_NO_GPIO;
> +
> =A0 =A0 =A0 =A0of_property_read_u32(np, "samsung,i2c-sda-delay", &pda=
ta->sda_delay);
> =A0 =A0 =A0 =A0of_property_read_u32(np, "samsung,i2c-slave-addr", &pd=
ata->slave_addr);
> =A0 =A0 =A0 =A0of_property_read_u32(np, "samsung,i2c-max-bus-freq",
> @@ -1103,6 +1134,9 @@ static struct platform_device_id s3c24xx_driver=
_ids[] =3D {
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "s3c2440=
-i2c",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.driver_data =A0 =A0=3D TYPE_S3C2440,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s3c2440-=
hdmiphy-i2c",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =A0 =A0=3D TYPE_S3C2440 | =
=46LAG_HDMIPHY | FLAG_NO_GPIO,
> =A0 =A0 =A0 =A0}, { },
> =A0};
> =A0MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
> --
> 1.7.9
>

Reviewed-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
