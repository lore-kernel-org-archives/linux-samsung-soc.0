From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [rtc-linux] [PATCH 2/3] rtc: rtc-s3c: Disable alarm entries that
 are not chosen.
Date: Mon, 4 Jul 2011 13:56:21 +0900
Message-ID: <CAJ0PZbRf-Q3r9D9EbhSG+VuzLWWbWqXKJ4A1byLUGn5On=ArVg@mail.gmail.com>
References: <1309175006-9218-1-git-send-email-myungjoo.ham@samsung.com>
	<1309175006-9218-3-git-send-email-myungjoo.ham@samsung.com>
	<013101cc39f3$9b44b830$d1ce2890$%youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:43199 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750860Ab1GDE4W convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 00:56:22 -0400
Received: by bwd5 with SMTP id 5so3794335bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Jul 2011 21:56:21 -0700 (PDT)
In-Reply-To: <013101cc39f3$9b44b830$d1ce2890$%youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Changhwan Youn <chaos.youn@samsung.com>
Cc: rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, kyungmin.park@samsung.com, dg77.kim@samsung.com

On Mon, Jul 4, 2011 at 11:39 AM, Changhwan Youn <chaos.youn@samsung.com=
> wrote:
> MyungJoo Ham wrote:
>> When rtc_setalarm is called, the entries that are not chosen (entrie=
s
>> without valid time values) should be disabled. However, in the previ=
ous
>> rtc-s3c driver, they are not explicitly disabled (did not changed). =
This
>> patch allows to disable such entries even if they were previously us=
ed.
>
> This has already been implemented by current code.
> The original code you modified only leaves alarm enable bit.
> You may misunderstand the code.

Ah.. sorry. I misunderstood when I was writing the commit message.

It is not about the enable bits of each time entry. It is about the ena=
ble bit.

However, as rtc->ops->set_alarm is not called when alarm->enabled is
false, the patch becomes meaningless.

Please never mind this patch.

>
> Regards,
> Changhwan
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0drivers/rtc/rtc-s3c.c | =A0 =A03 ++-
>> =A01 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
>> index 3c8dfa7..be85ea5 100644
>> --- a/drivers/rtc/rtc-s3c.c
>> +++ b/drivers/rtc/rtc-s3c.c
>> @@ -273,7 +273,8 @@ static int s3c_rtc_setalarm(struct device *dev, =
struct
>> rtc_wkalrm *alrm)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01900 + tm->tm_year, tm->tm_mon + 1, t=
m->tm_mday,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tm->tm_hour, tm->tm_min, tm->tm_sec);
>>
>> - =A0 =A0 alrm_en =3D readb(base + S3C2410_RTCALM) & S3C2410_RTCALM_=
ALMEN;
>> + =A0 =A0 /* Disable entires that are not chosen by alrm */
>> + =A0 =A0 alrm_en =3D S3C2410_RTCALM_ALMEN;
>> =A0 =A0 =A0 writeb(0x00, base + S3C2410_RTCALM);
>>
>> =A0 =A0 =A0 if (tm->tm_sec < 60 && tm->tm_sec >=3D 0) {
>> --
>> 1.7.4.1
>>
>> --
>> You received this message because you are subscribed to "rtc-linux".
>> Membership options at http://groups.google.com/group/rtc-linux .
>> Please read http://groups.google.com/group/rtc-linux/web/checklist
>> before submitting a driver.
>
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
