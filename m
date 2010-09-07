From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 4/5] rtc: rtc-s3c: Fix on RTC initialization method
Date: Tue, 7 Sep 2010 17:56:50 +0900
Message-ID: <AANLkTiketkJttU6zdqU9oD5a14DBB3cYY59RkeTZQuTw@mail.gmail.com>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
	<1283837381-9575-5-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:60552 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755736Ab0IGI7Z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 04:59:25 -0400
Received: by wyf22 with SMTP id 22so3983115wyf.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2010 01:59:24 -0700 (PDT)
In-Reply-To: <1283837381-9575-5-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Changhwan Youn <chaos.youn@samsung.com>, Wan ZongShun <mcuos.com@gmail.com>

On Tue, Sep 7, 2010 at 2:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> From: Changhwan Youn <chaos.youn@samsung.com>
>
> This patch changes RTC initialization method on probe() as
> per Wan ZongShun's suggestion. The 'rtc_valid_tm(tm)' can
> check whether RTC BCD is valid or not.
>
> And should be changed the method of check because previous
> method cannot validate RTC BCD registers properly.
>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Wan ZongShun <mcuos.com@gmail.com>
> ---
> =A0drivers/rtc/rtc-s3c.c | =A0 16 +++++++++++-----
> =A01 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index c078548..7f15073 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -458,8 +458,8 @@ static int __devexit s3c_rtc_remove(struct platfo=
rm_device *dev)
> =A0static int __devinit s3c_rtc_probe(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct rtc_device *rtc;
> + =A0 =A0 =A0 struct rtc_time rtc_tm;
> =A0 =A0 =A0 =A0struct resource *res;
> - =A0 =A0 =A0 unsigned int tmp, i;
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0pr_debug("%s: probe=3D%p\n", __func__, pdev);
> @@ -540,11 +540,17 @@ static int __devinit s3c_rtc_probe(struct platf=
orm_device *pdev)
>
> =A0 =A0 =A0 =A0/* Check RTC Time */
>
> - =A0 =A0 =A0 for (i =3D S3C2410_RTCSEC; i <=3D S3C2410_RTCYEAR; i +=3D=
 0x4) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D readb(s3c_rtc_base + i);
> + =A0 =A0 =A0 s3c_rtc_gettime(NULL, &rtc_tm);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((tmp & 0xf) > 0x9 || ((tmp >> 4) & =
0xf) > 0x9)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(0, s3c_rtc_base =
+ i);
> + =A0 =A0 =A0 if (rtc_valid_tm(&rtc_tm)) {
instead of !rtc_valid_tm(&rtc_tm) ???
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rtc_tm.tm_year =A0=3D 100;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rtc_tm.tm_mon =A0 =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rtc_tm.tm_mday =A0=3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rtc_tm.tm_hour =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rtc_tm.tm_min =A0 =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rtc_tm.tm_sec =A0 =3D 0;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_settime(NULL, &rtc_tm);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (s3c_rtc_cpu_type =3D=3D TYPE_S3C64XX)
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
