From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v3 06/10] rtc: max77686: Add max77802 support
Date: Tue, 26 Jan 2016 23:24:20 -0300
Message-ID: <CABxcv==M4X7gS7ojtF4qWoakss43wLPLxFM5_CVzGTpPN2BAuQ@mail.gmail.com>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
	<1453836020-29579-7-git-send-email-javier@osg.samsung.com>
	<56A82475.1040602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56A82475.1040602@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On Tue, Jan 26, 2016 at 10:59 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 27.01.2016 04:20, Javier Martinez Canillas wrote:

[snip]

>>       data[RTC_MONTH] = tm->tm_mon + 1;
>> -     data[RTC_YEAR] = tm->tm_year > 100 ? (tm->tm_year - 100) : 0;
>>
>> -     if (tm->tm_year < 100) {
>> -             pr_warn("RTC cannot handle the year %d.  Assume it's 2000.\n",
>> -                     1900 + tm->tm_year);
>> -             return -EINVAL;
>> +     if (!info->drv_data->alarm_enable_reg) {
>
> I don't like all these inverted checks. They are error-prone. This is
> why I propose different name. However since you want to stick to this
> name of this property, then easier to read would be:
>
> if (info->drv_data->alarm_enable_reg) {
>         data[RTC_YEAR] = tm->tm_year;
> } else {
>         max77686-stuff...
> }
> Can you reverse it here and in other places?
>

Fair enough, I'll reverse the logic so is more natural and also do an
early return as Andi suggested.

> The patch beside that is okay and works fine:
>
> Tested on Trats2 (max77686):
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> BR,
> Krzysztof
>

Best regards,
Javier
