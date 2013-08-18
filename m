From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v4 2/3] ARM: dts: Update the status of RTC DT node of
 Exynos5250 SoC to "okay"
Date: Mon, 19 Aug 2013 03:40:05 +0900
Message-ID: <52111505.9010207@samsung.com>
References: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org> <1376488710-12124-3-git-send-email-vikas.sajjan@linaro.org> <CAHbNUh3LG4coLDfGZ5b=agaJ0PhhAR0A3Nhq-tPyL78KekhFOw@mail.gmail.com> <2856422.z0LmRpN0Wg@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:58431 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753076Ab3HRSkJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 14:40:09 -0400
In-Reply-To: <2856422.z0LmRpN0Wg@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org, Doug Anderson <dianders@chromium.org>, devicetree@vger.kernel.org

On 08/15/13 17:59, Tomasz Figa wrote:
> Hi Tushar,
>
[...]

>>> +               status = "okay";
>>>
>>>          };
>>
>> Sometime back we had a discussion on this, the decision was to enable
>> it in respective boards.
>
> This is not entirely true.
>
> According to ePAPR, chapter 2.3.4, the status property has a well defined
> meaning and it should be set to "disabled" when "the device is not
> presently operational, but it might become operational in the future (for
> example, something is not plugged in, or switched off)".
>
So in my understanding, you mean using "okay" is wrong and only 
"disabled" is used? and in board dt file? Already there are too many 
"okay"...

> This means that unless setup of the device is missing something (e.g.
> board-specific properties, like regulators or pin config) or there is a
> valid technical reason for disabling the device by default (e.g. it needs
> certain SoC pins to be properly connected to something), then such device
> should be "okay", because it is operational.
>
>> Also if we are going ahead with this, we would need to remove the
>> corresponding status statements from board files.
>
> Yes, this is true.
>
According to above, probably we should add "disabled" in board dt file?

If I'm wrong, correct me.

(+ dt ml)

Anyway, I'm not sure how to use 'okay' and 'disabled' for status...

I think, every hardware information should be defined in SoC dt file and 
maybe some of them could be set disabled or okay in each board dt file...

Any suggestions?

Thanks,
Kukjin
