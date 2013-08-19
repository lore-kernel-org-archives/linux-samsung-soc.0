From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v4 2/3] ARM: dts: Update the status of RTC DT node of
 Exynos5250 SoC to "okay"
Date: Mon, 19 Aug 2013 14:03:48 +0530
Message-ID: <CAHbNUh2W6rRV_bN3M8+oi2mKfr_Y9RPvrarFczJkQG9-98GRAg@mail.gmail.com>
References: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org>
	<1376488710-12124-3-git-send-email-vikas.sajjan@linaro.org>
	<CAHbNUh3LG4coLDfGZ5b=agaJ0PhhAR0A3Nhq-tPyL78KekhFOw@mail.gmail.com>
	<2856422.z0LmRpN0Wg@flatron>
	<52111505.9010207@samsung.com>
	<CAD025ySAYRVWxJZubwDShOtwdRXKhg2JRUoPGmhaMmH31JVdTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:33049 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750894Ab3HSIdt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Aug 2013 04:33:49 -0400
Received: by mail-oa0-f47.google.com with SMTP id g12so5482125oah.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2013 01:33:48 -0700 (PDT)
In-Reply-To: <CAD025ySAYRVWxJZubwDShOtwdRXKhg2JRUoPGmhaMmH31JVdTQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org, Doug Anderson <dianders@chromium.org>, devicetree <devicetree@vger.kernel.org>, sunil joshi <joshi@samsung.com>

On 19 August 2013 13:48, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Hi Kukjin,
>
> On 19 August 2013 00:10, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> On 08/15/13 17:59, Tomasz Figa wrote:
>>>
>>> Hi Tushar,
>>>
>> [...]
>>
>>
>>>>> +               status = "okay";
>>>>>
>>>>>          };
>>>>
>>>>
>>>> Sometime back we had a discussion on this, the decision was to enable
>>>> it in respective boards.
>>>
>>>
>>> This is not entirely true.
>>>
>>> According to ePAPR, chapter 2.3.4, the status property has a well defined
>>> meaning and it should be set to "disabled" when "the device is not
>>> presently operational, but it might become operational in the future (for
>>> example, something is not plugged in, or switched off)".
>>>

Ok.

>> So in my understanding, you mean using "okay" is wrong and only "disabled"
>> is used? and in board dt file? Already there are too many "okay"...
>>
>>
>>> This means that unless setup of the device is missing something (e.g.
>>> board-specific properties, like regulators or pin config) or there is a
>>> valid technical reason for disabling the device by default (e.g. it needs
>>> certain SoC pins to be properly connected to something), then such device
>>> should be "okay", because it is operational.
>>>
>>>> Also if we are going ahead with this, we would need to remove the
>>>> corresponding status statements from board files.
>>>
>>>
>>> Yes, this is true.
>>>
>> According to above, probably we should add "disabled" in board dt file?
>>
>
> what Tushar meant was, since we made the status as "okay" in
> exynos5250.dtsi itself, its better to remove the "okay" from the board
> DTS files of exynos5250 ( exynos5250-snow.dts and
> exynos5250-arndale.dts). Am I right Tushar?
>

Yeah. Since we are going ahead with enabling the RTC node in
exynos5250.dtsi, I thought it would be good to remove the RTC nodes
from subsequent board files.

>
>> If I'm wrong, correct me.
>>
>> (+ dt ml)
>>
>> Anyway, I'm not sure how to use 'okay' and 'disabled' for status...
>>
>> I think, every hardware information should be defined in SoC dt file and
>> maybe some of them could be set disabled or okay in each board dt file...
>>
>> Any suggestions?
>>
>> Thanks,
>> Kukjin
>
>
>
> --
> Thanks and Regards
>  Vikas Sajjan



-- 
Tushar Behera
