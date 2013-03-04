From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: S5PV210: Fix compilation error in mach-goni.c
Date: Mon, 04 Mar 2013 15:18:17 +0100
Message-ID: <5134AD29.5050901@samsung.com>
References: <1361779938-30023-1-git-send-email-sachin.kamat@linaro.org>
 <512B3723.8070801@samsung.com>
 <CAK9yfHwNnadfVEco5ORn4fCK=myazmVnUCMec_xJa2_tzLzvbQ@mail.gmail.com>
 <008101ce18d9$b879e850$296db8f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43809 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757156Ab3CDOSV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Mar 2013 09:18:21 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MJ500LGL3JFDZ90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 14:18:18 +0000 (GMT)
Received: from [106.116.147.32] by eusync3.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MJ500D9H3QIAH70@eusync3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 14:18:18 +0000 (GMT)
In-reply-to: <008101ce18d9$b879e850$296db8f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 03/04/2013 02:11 PM, Kukjin Kim wrote:
> Sachin Kamat wrote:
>> On 25 February 2013 15:34, Sylwester Nawrocki <s.nawrocki@samsung.com>
>> wrote:
>>> On 02/25/2013 09:12 AM, Sachin Kamat wrote:
>>>> Commit 56bc91 ("[media] s5p-fimc: Redefine platform data structure for
>> fimc-is")
>>>> split bus_type into fimc_bus_type and sensor_bus_type and converted all
>>>> instances of it. This file however escaped the change.
>>>>
>>>> Without this patch we get the following build error:
>>>> arch/arm/mach-s5pv210/mach-goni.c:848:3: error:
>>>> unknown field 'bus_type' specified in initializer
>>>>
>>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>>> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>>
>>> Thanks for the patch. My apologies for this omission, there is already
>>> similar patch from Arnd [1], [2].
>>
>> Yes, they fix the same issue. I had not noticed them earlier.
>>
> So, when can be fixed?

Could you apply patch from Arnd: "[PATCH 8/9] s5p-fimc: fix s5pv210 build"
or teh $subject patch from Sachin ? It may take long time to push the fix
through the media tree, as Mauro sends bug fixes to Linus usually only
twice per whole -rc cycle. And now the issue is only at arch/arm, hence
the arm-soc tree may be more appropriate.

My apologies for overlooking this, I'll be more careful next time.

> arch/arm/mach-s5pv210/mach-goni.c:848:3: error: unknown field 'bus_type'
> specified in initializer
>   CC      arch/arm/mm/idmap.o
> make[2]: *** [arch/arm/mach-s5pv210/mach-goni.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> 
> - Kukjin

Regards,
Sylwester
