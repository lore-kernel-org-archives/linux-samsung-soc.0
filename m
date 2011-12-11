From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 3/4] rtc-s3c: add variants for S3C2443 and S3C2416
Date: Sun, 11 Dec 2011 11:24:57 +0530
Message-ID: <CAJuYYwS=0LaucoP2m1C0CJXUscStpax897D7otCGSv7c_hEOuQ@mail.gmail.com>
References: <201112091046.26563.heiko@sntech.de>
	<201112091050.55775.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:52828 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740Ab1LKFzB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Dec 2011 00:55:01 -0500
Received: by wgbdr13 with SMTP id dr13so8751566wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2011 21:55:00 -0800 (PST)
In-Reply-To: <201112091050.55775.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 9 December 2011 15:20, Heiko St=FCbner <heiko@sntech.de> wrote:
> Especially the TICNT registers are different from the two rtc types
> that currently exists.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> =A0arch/arm/plat-samsung/include/plat/regs-rtc.h | =A0 24 +++++++++++=
++
> =A0drivers/rtc/rtc-s3c.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 44 ++++++++++++++++++++++--
> =A02 files changed, 64 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/include/plat/regs-rtc.h b/arch/arm=
/plat-samsung/include/plat/regs-rtc.h
> index d9d9bdc..fa6066a 100644
> --- a/arch/arm/plat-samsung/include/plat/regs-rtc.h
> +++ b/arch/arm/plat-samsung/include/plat/regs-rtc.h
> @@ -23,14 +23,33 @@
> =A0#define S3C2410_RTCCON_CLKSEL =A0(1 << 1)
> =A0#define S3C2410_RTCCON_CNTSEL =A0(1 << 2)
> =A0#define S3C2410_RTCCON_CLKRST =A0(1 << 3)
> +#define S3C2443_RTCCON_TICSEL =A0(1 << 4)
> =A0#define S3C64XX_RTCCON_TICEN =A0 (1 << 8)
>
> =A0#define S3C64XX_RTCCON_TICMSK =A0(0xF << 7)
> =A0#define S3C64XX_RTCCON_TICSHT =A0(7)
>
> +#define S3C2416_RTCCON_TICMSK =A0(0x1F << 7)
> +
> =A0#define S3C2410_TICNT =A0 =A0 =A0 =A0 =A0S3C2410_RTCREG(0x44)
> =A0#define S3C2410_TICNT_ENABLE =A0 (1 << 7)
>
> +/* S3C2443: tick count is 15 bit wide
> + * TICNT[6:0] contains upper 7 bits
> + * TICNT1[7:0] contains lower 8 bits
> + */
> +#define S3C2443_TICNT_PART(x) =A0((x & 0x7f00) >> 8)
> +#define S3C2443_TICNT1 =A0 =A0 =A0 =A0 S3C2410_RTCREG(0x4C)
> +#define S3C2443_TICNT1_PART(x) (x & 0xff)
> +
> +/* S3C2416: tick count is 32 bit wide
> + * TICNT[6:0] contains bits [14:8]
> + * TICNT1[7:0] contains lower 8 bits
> + * TICNT2[16:0] contains upper 17 bits
> + */
> +#define S3C2416_TICNT2 =A0 =A0 =A0 =A0 S3C2410_RTCREG(0x48)
> +#define S3C2416_TICNT2_PART(x) ((x & 0xffff8000) >> 15)
> +
> =A0#define S3C2410_RTCALM =A0 =A0 =A0 =A0 S3C2410_RTCREG(0x50)
> =A0#define S3C2410_RTCALM_ALMEN =A0 (1 << 6)
> =A0#define S3C2410_RTCALM_YEAREN =A0(1 << 5)
> @@ -63,4 +82,9 @@
> =A0#define S3C2410_RTCMON =A0 =A0 =A0 =A0 S3C2410_RTCREG(0x84)
> =A0#define S3C2410_RTCYEAR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_RTC=
REG(0x88)
>
> +#define S3C2443_TICKCNT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_RTCRE=
G(0x90)
> +
> +#define S3C2443_RTCLBAT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_RTCRE=
G(0x94)
> +#define S3C2443_RTCLBAT_CLEAR =A0(1 << 0)
> +
> =A0#endif /* __ASM_ARCH_REGS_RTC_H */
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 71807a6..2a0692e 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -35,6 +35,8 @@
>
> =A0enum s3c_cpu_type {
> =A0 =A0 =A0 =A0TYPE_S3C2410,
> + =A0 =A0 =A0 TYPE_S3C2443,
> + =A0 =A0 =A0 TYPE_S3C2416,
> =A0 =A0 =A0 =A0TYPE_S3C64XX,
> =A0};
>
> @@ -132,6 +134,7 @@ static int s3c_rtc_setfreq(struct device *dev, in=
t freq)
> =A0 =A0 =A0 =A0struct platform_device *pdev =3D to_platform_device(de=
v);
> =A0 =A0 =A0 =A0struct rtc_device *rtc_dev =3D platform_get_drvdata(pd=
ev);
> =A0 =A0 =A0 =A0unsigned int tmp =3D 0;
> + =A0 =A0 =A0 int val;
>
> =A0 =A0 =A0 =A0if (!is_power_of_2(freq))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> @@ -139,12 +142,23 @@ static int s3c_rtc_setfreq(struct device *dev, =
int freq)
> =A0 =A0 =A0 =A0clk_enable(rtc_clk);
> =A0 =A0 =A0 =A0spin_lock_irq(&s3c_rtc_pie_lock);
>
> - =A0 =A0 =A0 if (s3c_rtc_cpu_type =3D=3D TYPE_S3C2410) {
> + =A0 =A0 =A0 if (s3c_rtc_cpu_type !=3D TYPE_S3C64XX) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp =3D readb(s3c_rtc_base + S3C2410_T=
ICNT);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp &=3D S3C2410_TICNT_ENABLE;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 tmp |=3D (rtc_dev->max_user_freq / freq)-1;
> + =A0 =A0 =A0 val =3D (rtc_dev->max_user_freq / freq) - 1;
> +
> + =A0 =A0 =A0 if (s3c_rtc_cpu_type =3D=3D TYPE_S3C2443) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp |=3D S3C2443_TICNT_PART(val);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(S3C2443_TICNT1_PART(val), s3c_rt=
c_base + S3C2443_TICNT1);
> + =A0 =A0 =A0 } else if (s3c_rtc_cpu_type =3D=3D TYPE_S3C2416) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp |=3D S3C2443_TICNT_PART(val);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(S3C2443_TICNT1_PART(val), s3c_rt=
c_base + S3C2443_TICNT1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(S3C2416_TICNT2_PART(val), s3c_rt=
c_base + S3C2416_TICNT2);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp |=3D val;
> + =A0 =A0 =A0 }

Can this be changed to:

if (s3c_rtc_cpu_type =3D=3D TYPE_S3C2443 || (s3c_rtc_cpu_type =3D=3D TY=
PE_S3C2416) {
       tmp |=3D S3C2443_TICNT_PART(val);
       writel(S3C2443_TICNT1_PART(val), s3c_rtc_base + S3C2443_TICNT1);
       if (s3c_rtc_cpu_type =3D=3D TYPE_S3C2416)
                writel(S3C2416_TICNT2_PART(val), s3c_rtc_base + S3C2416=
_TICNT2);
} else {
      tmp |=3D val;
}

>
> =A0 =A0 =A0 =A0writel(tmp, s3c_rtc_base + S3C2410_TICNT);
> =A0 =A0 =A0 =A0spin_unlock_irq(&s3c_rtc_pie_lock);
> @@ -371,7 +385,9 @@ static void s3c_rtc_enable(struct platform_device=
 *pdev, int en)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp &=3D ~S3C2410_RTCCON_RTCEN;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0writew(tmp, base + S3C2410_RTCCON);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (s3c_rtc_cpu_type =3D=3D TYPE_S3C241=
0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (s3c_rtc_cpu_type =3D=3D TYPE_S3C241=
0 ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_cpu_type =3D=3D TYPE_S3=
C2443 ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_cpu_type =3D=3D TYPE_S3=
C2416) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp =3D readb(base + S=
3C2410_TICNT);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp &=3D ~S3C2410_TICN=
T_ENABLE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0writeb(tmp, base + S3C=
2410_TICNT);
> @@ -441,6 +457,7 @@ static int __devinit s3c_rtc_probe(struct platfor=
m_device *pdev)
> =A0 =A0 =A0 =A0const struct of_device_id *match;
> =A0#endif
> =A0 =A0 =A0 =A0int ret;
> + =A0 =A0 =A0 int tmp;
>
> =A0 =A0 =A0 =A0pr_debug("%s: probe=3D%p\n", __func__, pdev);
>
> @@ -543,11 +560,18 @@ static int __devinit s3c_rtc_probe(struct platf=
orm_device *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_warn(&pdev->dev, "warning: invalid=
 RTC value so initializing it\n");
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 if (s3c_rtc_cpu_type =3D=3D TYPE_S3C64XX)
> + =A0 =A0 =A0 if (s3c_rtc_cpu_type !=3D TYPE_S3C2410)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rtc->max_user_freq =3D 32768;
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rtc->max_user_freq =3D 128;
>
> + =A0 =A0 =A0 if (s3c_rtc_cpu_type =3D=3D TYPE_S3C2443 ||
> + =A0 =A0 =A0 =A0 =A0 =A0s3c_rtc_cpu_type =3D=3D TYPE_S3C2416) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readw(s3c_rtc_base + S3C2410_RT=
CCON);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp |=3D S3C2443_RTCCON_TICSEL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writew(tmp, s3c_rtc_base + S3C2410_RTCC=
ON);
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0platform_set_drvdata(pdev, rtc);
>
> =A0 =A0 =A0 =A0s3c_rtc_setfreq(&pdev->dev, 1);
> @@ -652,6 +676,12 @@ static const struct of_device_id s3c_rtc_dt_matc=
h[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.compatible =3D "samsung,s3c2410-rtc"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.data =3D TYPE_S3C2410,
> =A0 =A0 =A0 =A0}, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c2443-rtc"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .data =3D TYPE_S3C2443,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c2416-rtc"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .data =3D TYPE_S3C2416,
> + =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.compatible =3D "samsung,s3c6410-rtc"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.data =3D TYPE_S3C64XX,
> =A0 =A0 =A0 =A0},
> @@ -667,6 +697,12 @@ static struct platform_device_id s3c_rtc_driver_=
ids[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "s3c2410=
-rtc",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.driver_data =A0 =A0=3D TYPE_S3C2410,
> =A0 =A0 =A0 =A0}, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s3c2443-=
rtc",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =A0 =A0=3D TYPE_S3C2443,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s3c2416-=
rtc",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =A0 =A0=3D TYPE_S3C2416,
> + =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "s3c64xx=
-rtc",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.driver_data =A0 =A0=3D TYPE_S3C64XX,
> =A0 =A0 =A0 =A0},
> --
> 1.7.5.4

Reviewed device tree related changes in this patch.

Regards,
Thomas.

>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
