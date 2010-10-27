From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 1/6] rtc: rtc-s3c: Fix access unit from byte to word on RTCCON
Date: Wed, 27 Oct 2010 17:20:29 +0900
Message-ID: <AANLkTimXee842b+cmi7vy+Dj60SKzyg1Q=NorOmvJg3w@mail.gmail.com>
References: <1286494879-2932-1-git-send-email-kgene.kim@samsung.com>
	<1286494879-2932-2-git-send-email-kgene.kim@samsung.com>
	<AANLkTi=+BH7nJFt5Amz_q=6HAn9STfXjKbCS6jSQeW5y@mail.gmail.com>
	<000401cb75ac$b6eab190$24c014b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:61410 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753646Ab0J0IUa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Oct 2010 04:20:30 -0400
Received: by gyg4 with SMTP id 4so168153gyg.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Oct 2010 01:20:29 -0700 (PDT)
In-Reply-To: <000401cb75ac$b6eab190$24c014b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, a.zummo@towertech.it, ben-linux@fluff.org, akpm@linux-foundation.org, Changhwan Youn <chaos.youn@samsung.com>

On Wed, Oct 27, 2010 at 4:58 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> MyungJoo Ham wrote:
>>
>> On Fri, Oct 8, 2010 at 8:41 AM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
>> > From: Changhwan Youn <chaos.youn@samsung.com>
>> >
>> > S3C2410_RTCCON of TYPE_S3C64XX RTC should be read/written by
>> > readw and writew, because TYPE_S3C64XX RTC uses bit 8 and 9.
>> > And TYPE_S3C2410 RTC also can access it by readw and writew.
>> >
>> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
>> > [atul.dahiya@samsung.com: tested on smdk2416]
>> > Tested-by: Atul Dahiya <atul.dahiya@samsung.com>
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > Cc: Ben Dooks <ben-linux@fluff.org>
>> > ---
>> > =A0drivers/rtc/rtc-s3c.c | =A0 36 ++++++++++++++++++--------------=
----
>> > =A01 files changed, 18 insertions(+), 18 deletions(-)
>>
>> Hello,
>>
> Hi,
>>
>> Sorry for a late reply...
>>
> Yeah, too late :-(
>
>> Anyway, I have a small question in this rtc-s3c.c driver.
>>
>> Is there any reason to use read/write b/w to access registers of rtc=
-s3c?
>>
> See the git comment.
>
>> Why don't we use readl/writel when accessing registers in this drive=
rs
>
> I don't know why we should use readl/writel for all case...
> even though we can use just word or byte access.
>
>> and just forget which registers require at least 8 or 16 or 32 bits?
>>
>> In fact, it appears that readw/writew accesses 16bits, not 32bits in
>
> Yes...
>
>> ARM machines, which may incur problems with TICCNT(S3C2410_TICNT in =
the code)/CURTICCNT
>> registers.
>>
> I can't get your comment...

It is because TICCNT and CURTICCNT RTC registers of S5PC210 require
32bit access according to the manual while this patch still uses 16bit
accesses for them.

Besides, ALMYEAR/BCDYEAR(S3C2410_RTCYEAR) requires at least 16bit acces=
s.


This issue was found today while testing suspend-to-mem with s5pc210
and rtc-wakeup loop. My guess is that saving and restoring only 8 bits
of TICNT at suspend/resume function incurred the instable
suspend-to-mem (kernel hangs with about 1/100 probability) Using
readl/writel for TICNT solved the kernel hang issue.

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
