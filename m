From: Wan ZongShun <mcuos.com@gmail.com>
Subject: Re: [rtc-linux] RE: [PATCH 5/5] rtc: rtc-s3c: Fix debug message
 format on RTC
Date: Fri, 10 Sep 2010 17:05:39 +0800
Message-ID: <AANLkTi=Jb04ySn1WaGktY-hJQQoGvRpr6kz9DcSHrBZA@mail.gmail.com>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
	<1283837381-9575-6-git-send-email-kgene.kim@samsung.com>
	<4C86CAC1.2050205@fluff.org>
	<000601cb4fbb$f9fbab90$edf302b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:52950 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756098Ab0IJJFm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 05:05:42 -0400
Received: by wyf22 with SMTP id 22so2553886wyf.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Sep 2010 02:05:40 -0700 (PDT)
In-Reply-To: <000601cb4fbb$f9fbab90$edf302b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, p_gortmaker@yahoo.com, a.zummo@towertech.it

2010/9/9 Kukjin Kim <kgene.kim@samsung.com>:
> Ben Dooks wrote:
>>
>> On 07/09/10 06:29, Kukjin Kim wrote:
>> > This patch fixes debug message format on rtc-s3c.
>> >
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > Cc: Ben Dooks <ben-linux@fluff.org>
>> > ---
>> > =C2=A0drivers/rtc/rtc-s3c.c | =C2=A0 18 +++++++++---------
>> > =C2=A01 files changed, 9 insertions(+), 9 deletions(-)
>> >
>>
>> how long has this lot been broken for?
>>
> Haha...we don't know :-)
>
>> Acked-by: Ben Dooks <ben-linux@fluff.org>
>
> Thanks for your ack...so...
>
> Hi Alessandro Zummo,
> Is it possible to send this to upstream through your tree?
> Or which tree is better to care this.


Please get help from Andrew.

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> You received this message because you are subscribed to "rtc-linux".
> Membership options at http://groups.google.com/group/rtc-linux .
> Please read http://groups.google.com/group/rtc-linux/web/checklist
> before submitting a driver.



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
