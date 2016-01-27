From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v3 07/10] rtc: max77686: Use dev_warn() instead of pr_warn()
Date: Tue, 26 Jan 2016 23:42:31 -0300
Message-ID: <CABxcv=mYo+rjwhpo_CxLbCxBJaewfTQi+=NmmtM4x5zcM-qaGA@mail.gmail.com>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
	<1453836020-29579-8-git-send-email-javier@osg.samsung.com>
	<20160127012230.GE14296@samsunx.samsung>
	<56A82331.5050403@osg.samsung.com>
	<56A825F0.9000108@samsung.com>
	<20160127023554.GI14296@samsunx.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f194.google.com ([209.85.160.194]:36091 "EHLO
	mail-yk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751359AbcA0Cmb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 21:42:31 -0500
Received: by mail-yk0-f194.google.com with SMTP id k129so16168959yke.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jan 2016 18:42:31 -0800 (PST)
In-Reply-To: <20160127023554.GI14296@samsunx.samsung>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello Andi,

On Tue, Jan 26, 2016 at 11:35 PM, Andi Shyti <andi.shyti@samsung.com> wrote:
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
>
> Nevertheless, the function fails, and those who call
> max77686_rtc_tm_to_data() fail as well, so, we are printing
> warning, but behaving as error.
>
> Either we print error and return error, or we print warning, we
> set:
>
> tm->tm_year = 100; /* don't know if I got the logic right */
>
> and return 0
>
> Right?
>

I was thinking in moving the check at the start of the function so a
on error, the RTC sec/min/hour/etc registers are untouched.

> Thanks,
> Andi
> --

Best regards,
Javier
