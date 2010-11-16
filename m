From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/3] rtc: rtc-s3c: Fix return type and argument of s3c_rtc_setaie
Date: Tue, 16 Nov 2010 10:30:30 +0900
Message-ID: <AANLkTikhEahF7o6XbW7TFESrGPaEVwFX3B8f5LHmaU7r@mail.gmail.com>
References: <1289865774-31073-1-git-send-email-kgene.kim@samsung.com>
	<1289865774-31073-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:59141 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759076Ab0KPBac convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Nov 2010 20:30:32 -0500
Received: by wyb28 with SMTP id 28so141500wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2010 17:30:31 -0800 (PST)
In-Reply-To: <1289865774-31073-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Wan ZongShun <mcuos.com@gmail.com>

Hi,

It's same patch early.
I used the email address by ./script/get_maintainer.sh

http://groups.google.com/group/linux.kernel/browse_thread/thread/953c41=
7a31756ab9?pli=3D1

Thank you,
Kyungmin Park

On Tue, Nov 16, 2010 at 9:02 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> According to struct rtc_class_ops, this patch fixes return type
> and argument of s3c_rtc_setaie().
>
> =A0int (*alarm_irq_enable)(struct device *, unsigned int enabled);
>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Wan ZongShun <mcuos.com@gmail.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0drivers/rtc/rtc-s3c.c | =A0 13 +++++++------
> =A01 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index cf953ec..e2636ff 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -76,19 +76,20 @@ static irqreturn_t s3c_rtc_tickirq(int irq, void =
*id)
> =A0 =A0 =A0 =A0return IRQ_HANDLED;
> =A0}
>
> -/* Update control registers */
> -static void s3c_rtc_setaie(int to)
> +static int s3c_rtc_setaie(struct device *dev, unsigned int enabled)
> =A0{
> =A0 =A0 =A0 =A0unsigned int tmp;
>
> - =A0 =A0 =A0 pr_debug("%s: aie=3D%d\n", __func__, to);
> + =A0 =A0 =A0 pr_debug("%s: aie=3D%d\n", __func__, enabled);
>
> =A0 =A0 =A0 =A0tmp =3D readb(s3c_rtc_base + S3C2410_RTCALM) & ~S3C241=
0_RTCALM_ALMEN;
>
> - =A0 =A0 =A0 if (to)
> + =A0 =A0 =A0 if (enabled)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp |=3D S3C2410_RTCALM_ALMEN;
>
> =A0 =A0 =A0 =A0writeb(tmp, s3c_rtc_base + S3C2410_RTCALM);
> +
> + =A0 =A0 =A0 return 0;
> =A0}
>
> =A0static int s3c_rtc_setpie(struct device *dev, int enabled)
> @@ -308,7 +309,7 @@ static int s3c_rtc_setalarm(struct device *dev, s=
truct rtc_wkalrm *alrm)
>
> =A0 =A0 =A0 =A0writeb(alrm_en, base + S3C2410_RTCALM);
>
> - =A0 =A0 =A0 s3c_rtc_setaie(alrm->enabled);
> + =A0 =A0 =A0 s3c_rtc_setaie(dev, alrm->enabled);
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> @@ -440,7 +441,7 @@ static int __devexit s3c_rtc_remove(struct platfo=
rm_device *dev)
> =A0 =A0 =A0 =A0rtc_device_unregister(rtc);
>
> =A0 =A0 =A0 =A0s3c_rtc_setpie(&dev->dev, 0);
> - =A0 =A0 =A0 s3c_rtc_setaie(0);
> + =A0 =A0 =A0 s3c_rtc_setaie(&dev->dev, 0);
>
> =A0 =A0 =A0 =A0clk_disable(rtc_clk);
> =A0 =A0 =A0 =A0clk_put(rtc_clk);
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
