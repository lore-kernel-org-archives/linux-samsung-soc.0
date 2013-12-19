From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 06/11] PM / devfreq: move definitions for exynos4_bus into drivers/devfreq
Date: Thu, 19 Dec 2013 16:29:03 +0900
Message-ID: <CAJ0PZbSQaDy13BO=nrorMt1O16X7VEqAfs_h6dAeF+Gekgrfdw@mail.gmail.com>
References: <116401cefb1e$75b83440$61289cc0$@kernel.org>
	<CAJ0PZbTH0kga7Gbb87umJpCF_ih3TQrxKS0xBbofDvJq+_wj5Q@mail.gmail.com>
	<52B1E156.6030904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f48.google.com ([209.85.212.48]:65037 "EHLO
	mail-vb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951Ab3LSH3E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 02:29:04 -0500
Received: by mail-vb0-f48.google.com with SMTP id f13so413701vbg.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 23:29:03 -0800 (PST)
In-Reply-To: <52B1E156.6030904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: kgene@kernel.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Thu, Dec 19, 2013 at 2:54 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 12/18/13 15:11, MyungJoo Ham wrote:
>>
>> On Tue, Dec 17, 2013 at 8:52 PM,<kgene@kernel.org>  wrote:
>>>
>>> From: Kukjin Kim<kgene.kim@samsung.com>
>>>
>>> We don't need to keep the definitions for exynos4_bus into
>>> mach-exynos/ so this moves them into drviers/devfreq with
>>> adding header file.
>>
>>
>> Acked-by: MyungJoo Ham<myungjoo.ham@samsung.com>
>>
>> However, how are you going to merge this patch?
>> Do you need me to get this handled or are you going to do it yourself
>> with Samsung-SoC tree?
>>
>
> Hi MyungJoo,
>
> Let me take this into Samsung tree with others if you're OK :-)

Yes, Ok. Please go ahead.

>
> Thanks,
> Kukjin
>
>
>> Cheers,
>> MyungJoo.
>>
>>>
>>> Cc: MyungJoo Ham<myungjoo.ham@samsung.com>
>>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>>> ---
>>>   arch/arm/mach-exynos/include/mach/regs-clock.h |   94
>>> --------------------
>>>   drivers/devfreq/exynos/exynos4_bus.c           |    4 +-
>>>   drivers/devfreq/exynos/exynos4_bus.h           |  110
>>> ++++++++++++++++++++++++
>>>   3 files changed, 112 insertions(+), 96 deletions(-)
>>>   create mode 100644 drivers/devfreq/exynos/exynos4_bus.h



-- 
MyungJoo Ham, Ph.D.
System S/W Lab, S/W Center, Samsung Electronics
