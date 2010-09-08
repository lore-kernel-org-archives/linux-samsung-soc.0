From: Wan ZongShun <mcuos.com@gmail.com>
Subject: Re: [PATCH 4/5] rtc: rtc-s3c: Fix on RTC initialization method
Date: Wed, 8 Sep 2010 09:55:13 +0800
Message-ID: <AANLkTikkaG7-N500Kpytzuf1q4tK+=Dxs7Ss3Y+iRUbc@mail.gmail.com>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
	<1283837381-9575-5-git-send-email-kgene.kim@samsung.com>
	<4C86C9C2.20603@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:54904 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097Ab0IHBzP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 21:55:15 -0400
Received: by wyf22 with SMTP id 22so4980214wyf.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2010 18:55:14 -0700 (PDT)
In-Reply-To: <4C86C9C2.20603@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, a.zummo@towertech.it, Changhwan Youn <chaos.youn@samsung.com>

2010/9/8 Ben Dooks <ben-linux@fluff.org>:
> On 07/09/10 06:29, Kukjin Kim wrote:
>> From: Changhwan Youn <chaos.youn@samsung.com>
>>
>> This patch changes RTC initialization method on probe() as
>> per Wan ZongShun's suggestion. The 'rtc_valid_tm(tm)' can
>> check whether RTC BCD is valid or not.
>>

Hi Kukjin,

I think you misunderstood my meaning.
You only need add the ''rtc_valid_tm' checking in s3c_rtc_gettime()
function as following patch.

---
 drivers/rtc/rtc-s3c.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index a0d3ec8..270842c 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -185,7 +185,7 @@ static int s3c_rtc_gettime(struct device *dev,
struct rtc_time *rtc_tm)
 	rtc_tm->tm_year +=3D 100;
 	rtc_tm->tm_mon -=3D 1;

-	return 0;
+	return rtc_valid_tm(rtc_tm);
 }

 static int s3c_rtc_settime(struct device *dev, struct rtc_time *tm)
--=20
1.6.3.3

>> And should be changed the method of check because previous
>> method cannot validate RTC BCD registers properly.
>>
>> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> Cc: Ben Dooks <ben-linux@fluff.org>
>> Cc: Wan ZongShun <mcuos.com@gmail.com>
>> ---
>> =C2=A0drivers/rtc/rtc-s3c.c | =C2=A0 16 +++++++++++-----
>> =C2=A01 files changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
>> index c078548..7f15073 100644
>> --- a/drivers/rtc/rtc-s3c.c
>> +++ b/drivers/rtc/rtc-s3c.c
>> @@ -458,8 +458,8 @@ static int __devexit s3c_rtc_remove(struct platf=
orm_device *dev)
>> =C2=A0static int __devinit s3c_rtc_probe(struct platform_device *pde=
v)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 struct rtc_device *rtc;
>> + =C2=A0 =C2=A0 struct rtc_time rtc_tm;
>> =C2=A0 =C2=A0 =C2=A0 struct resource *res;
>> - =C2=A0 =C2=A0 unsigned int tmp, i;
>> =C2=A0 =C2=A0 =C2=A0 int ret;
>>
>> =C2=A0 =C2=A0 =C2=A0 pr_debug("%s: probe=3D%p\n", __func__, pdev);
>> @@ -540,11 +540,17 @@ static int __devinit s3c_rtc_probe(struct plat=
form_device *pdev)
>>
>> =C2=A0 =C2=A0 =C2=A0 /* Check RTC Time */
>>
>> - =C2=A0 =C2=A0 for (i =3D S3C2410_RTCSEC; i <=3D S3C2410_RTCYEAR; i=
 +=3D 0x4) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D readb(s3c_rtc_ba=
se + i);
>> + =C2=A0 =C2=A0 s3c_rtc_gettime(NULL, &rtc_tm);
>>
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((tmp & 0xf) > 0x9 ||=
 ((tmp >> 4) & 0xf) > 0x9)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 writeb(0, s3c_rtc_base + i);
>> + =C2=A0 =C2=A0 if (rtc_valid_tm(&rtc_tm)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtc_tm.tm_year =C2=A0=3D=
 100;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtc_tm.tm_mon =C2=A0 =3D=
 0;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtc_tm.tm_mday =C2=A0=3D=
 1;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtc_tm.tm_hour =C2=A0=3D=
 0;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtc_tm.tm_min =C2=A0 =3D=
 0;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtc_tm.tm_sec =C2=A0 =3D=
 0;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_rtc_settime(NULL, &r=
tc_tm);
>
> I think a dev_warn() in this path is good to alert the user
> to bad things happening, esp if the system should have a valid
> time, it marks he posibility the rtc battery has gone.
>
>



--=20
*linux-arm-kernel mailing list
mail addr:linux-arm-kernel@lists.infradead.org
you can subscribe by:
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

* linux-arm-NUC900 mailing list
mail addr:NUC900@googlegroups.com
main web: https://groups.google.com/group/NUC900
you can subscribe it by sending me mail:
mcuos.com@gmail.com
