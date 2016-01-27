From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v3 07/10] rtc: max77686: Use dev_warn() instead of pr_warn()
Date: Tue, 26 Jan 2016 23:50:38 -0300
Message-ID: <CABxcv=nO-c=2c181hYoLOfrxeqnggXVsxGCGFmSDzMpatT1mWQ@mail.gmail.com>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
	<1453836020-29579-8-git-send-email-javier@osg.samsung.com>
	<20160127012230.GE14296@samsunx.samsung>
	<56A82331.5050403@osg.samsung.com>
	<56A825F0.9000108@samsung.com>
	<20160127024628.GC25597@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f195.google.com ([209.85.160.195]:34078 "EHLO
	mail-yk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751670AbcA0Cuj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 21:50:39 -0500
Received: by mail-yk0-f195.google.com with SMTP id v14so16115245ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jan 2016 18:50:39 -0800 (PST)
In-Reply-To: <20160127024628.GC25597@piout.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello Alexandre,

On Tue, Jan 26, 2016 at 11:46 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> Hi,
>
> On 27/01/2016 at 11:05:36 +0900, Krzysztof Kozlowski wrote :
>> On 27.01.2016 10:53, Javier Martinez Canillas wrote:
>> > Hello Andi,
>> >
>> > Thanks a lot for your feedback and review.
>> >
>> > On 01/26/2016 10:22 PM, Andi Shyti wrote:
>> >> Hi Javier,
>> >>
>> >>>           if (tm->tm_year < 100) {
>> >>> -            pr_warn("RTC can't handle year %d. Assume it's 2000.\n",
>> >>> -                1900 + tm->tm_year);
>> >>> +            dev_warn(info->dev,
>> >>> +                 "RTC can't handle year %d. Assume it's 2000\n",
>> >>> +                 1900 + tm->tm_year);
>> >>>               return -EINVAL;
>> >>
>> >> Because we are returning an error value, why not use dev_err()?
>> >>
>> >
>> > You are absolutely right. Since the driver was using pr_warn(), I used
>> > dev_warn() but dev_err() would had been correct.
>>
>> Wait. The message says that "2000 will be assumed" which is not an
>> error. The message indicates that driver will proceed, thus the warning.
>>
>> However the driver won't proceed because the max77686_rtc_set_time()
>> will abort. This came from max8997 which has the same issue.
>>
>> This means that either message should be changed (dev_err() without the
>> "assume" verb) or the function should not abort and set the year to
>> 2000+something (then dev_warn()... look at rtc-ds3234.c and rtc-mcp795.c).
>>
>> The easiest would be to choose #1 - no changes in the logic.
>>
>
> My stance on that is to never set a date that differs from the requested
> date. Else, userspace has no way of knowing whether this is an erroneous
> date or the real date when reading back.
>
> I think I had a look and the driver is already doing the right thing but
> the message is wrong.
>

That's correct.

> --
> Alexandre Belloni, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Best regards,
Javier
