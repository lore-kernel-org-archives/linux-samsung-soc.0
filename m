From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/3] clk: exynos5250: fix sysmmu_mfc{l,r} gate clocks
Date: Wed, 18 Dec 2013 19:28:57 +0100
Message-ID: <CA+Ln22GD5fr4S6aR-+85bdutkeeHmgutLvRWETEQEt1vJX-Y6Q@mail.gmail.com>
References: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org>
	<1383905648-23733-2-git-send-email-sachin.kamat@linaro.org>
	<2996623.YXg5JqReYS@flatron>
	<CAK9yfHzs+T0g0qy-EALFkrKFybdJDAQ3ZGAoYovZO8PDaWM4QA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:59701 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754571Ab3LRS27 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 13:28:59 -0500
Received: by mail-we0-f172.google.com with SMTP id p61so24915wes.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 10:28:58 -0800 (PST)
In-Reply-To: <CAK9yfHzs+T0g0qy-EALFkrKFybdJDAQ3ZGAoYovZO8PDaWM4QA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Andrew Bresticker <abrestic@chromium.org>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>

Hi Sachin,

2013/12/18 Sachin Kamat <sachin.kamat@linaro.org>:
> Hi Tomasz,
>
> On 10 November 2013 22:38, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Hi Sachin, Andrew,
>>
>> On Friday 08 of November 2013 15:44:07 Sachin Kamat wrote:
>>> From: Andrew Bresticker <abrestic@chromium.org>
>>>
>>> The gate clocks for the MFC sysmmus appear to be flipped, i.e.
>>> GATE_IP_MFC[2] gates sysmmu_mfcl and GATE_IP_MFC[1] gates sysmmu_mfcr.
>>> Fix this so that the MFC will start up.
>>
>> Wow, this means that there is a mistake in the documentation. Not that
>> I'm surprised, though.
>>
>> I guess you are sure about this, so:
>>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>
> I believe you are going to take this through your tree along with a
> few others which you have already reviewed?

Thanks for reminding me about this patch. It's been quite a while
since it was posted
to the list.

Yes, I will apply it to samsung-clk tree.

Best regards,
Tomasz
