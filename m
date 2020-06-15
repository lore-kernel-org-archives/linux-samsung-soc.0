Return-Path: <SRS0=5Eo2=74=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A317C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Jun 2020 15:39:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53D38206D7
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Jun 2020 15:39:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgFOPjk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Jun 2020 11:39:40 -0400
Received: from foss.arm.com ([217.140.110.172]:50562 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728477AbgFOPjj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 11:39:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F55F1F1;
        Mon, 15 Jun 2020 08:39:38 -0700 (PDT)
Received: from [10.37.12.69] (unknown [10.37.12.69])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F26A3F6CF;
        Mon, 15 Jun 2020 08:39:36 -0700 (PDT)
Subject: Re: Question about Odroid XU4 cpuidle
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>, s.nawrocki@samsung.com
References: <570c73f2-d9d8-4ae1-3caf-829547232e48@arm.com>
 <CGME20200610140246eucas1p2167e2d5f71a762b54d9c4d2db565bece@eucas1p2.samsung.com>
 <20200610140238.GA31473@kozik-lap>
 <5b6a4345-4df6-51b4-298d-6a4fc6935d89@samsung.com>
 <8c0a8cc6-9cc0-88b5-6614-67edb903d149@arm.com>
 <26daae4c-684a-7319-ae6c-f3319ba0406d@samsung.com>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <b3bbf82b-e990-3892-faab-257c928c1b97@arm.com>
Date:   Mon, 15 Jun 2020 16:39:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <26daae4c-684a-7319-ae6c-f3319ba0406d@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On 6/15/20 1:45 PM, Marek Szyprowski wrote:
> Hi Lukasz
> 
> On 10.06.2020 16:30, Lukasz Luba wrote:
>> On 6/10/20 3:09 PM, Marek Szyprowski wrote:
>>> On 10.06.2020 16:02, Krzysztof Kozlowski wrote:
>>>> On Wed, Jun 10, 2020 at 02:18:12PM +0100, Lukasz Luba wrote:
>>>>> Hi Krzysztof, Bartek,
>>>>>
>>>>> I recall that you have been working on some cpuidle code for
>>>>> Exynos(4?).
>>>>>
>>>>> I have a question regarding CPUIdle driver for Odroid XU4.
>>>>> I use the board with LISA tests for EAS, but missing at
>>>>> least idle state 0 cause errors (please see the log below).
>>>>>
>>>>> Currently the system does not report any idle driver and the state 0
>>>>> is missing in: /sys/devices/system/cpu/cpu0/cpuidle/state0/
>>>> The state 0 long time ago was WFI. It was kind of meaningless so it it
>>>> was dropped.
>>>>
>>>>> I am using driver CONFIG_ARM_BIG_LITTLE_CPUIDLE but the
>>>>> boot stops silently while trying to init the cpu idle devices in
>>>>> there.
>>>>> I carry on with a workaround that just removes idle state[1] and set
>>>>> state_count=1 in the big and little structures.
>>>> Try earlyprintk.
>>>>
>>>> In general, the big-little cpuidle driver should work... or rather:
>>>> long
>>>> time ago it was working.  It requires proper support from early stages
>>>> (BL1, secure monitor) but this should be already in standard Odroid.
>>>>
>>>> I just saw there:
>>>>      /* Start at index 1, index 0 standard WFI */
>>>> so maybe it was not updated properly to removal of WFI?
>>>>
>>>> I think no one uses this driver so it might be not well tested and not
>>>> that useful.
>>>
>>> I think it never worked on Odroid XU3/XU4. Afair it was developed on
>>> PeachPi Chromebook, which use different bootloader (and doesn't use
>>> trustzone).
>>
>> That would explain the compatibility string in that driver. Good to
>> know. Thank you for your response.
>>
> I've just digged a bit in the old kernels and indeed, the big-little
> cpuidle driver worked only on Samsung Exynos 5420/5800 Chromebooks
> (Peach Pit/Pi). The last release which worked fine (although it was
> still not enabled in the exynos_defconfig) is v4.2. Then it got broken
> by the commit 833b5794e330 ("ARM: EXYNOS: reset Little cores when cpu is
> up"). It never worked on the Odroid XU3/XU4.

Thank you Marek for your time to investigate it. In this case I think
there is no way to fix idle state 1 for Odroid xu3/xu4. I don't have
Peach Pit/Pi so I have to pass, but I can help you in reviewing
if you or someone else have time (and board) to work on it.

> 
> Do you have any plans to fix it?

I'm baking some patch internally which might help Odroid XU3/4 though.
If that won't be killed, I'll post it soon.
If failed internally, I will also let you know.

Regards,
Lukasz

> 
> Best regards
> 
