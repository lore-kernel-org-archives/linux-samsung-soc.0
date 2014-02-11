From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Consolidate Kconfig entries
Date: Tue, 11 Feb 2014 12:15:39 +0100
Message-ID: <52FA065B.1070100@samsung.com>
References: <1391687996-26011-1-git-send-email-sachin.kamat@linaro.org>
 <5101685.tPb8PWOH5Q@amdc1032>
 <CAOesGMi8SUXzxJSW4yoywLQn0C7HmPL81iCQqxg9uZp_jN7yPQ@mail.gmail.com>
 <7214831.iPsDTEq8CU@amdc1032>
 <CAOesGMhGTVQex7vu49QnHv2HsdE7S8jz7oKY04FsT4Hg1VR7sA@mail.gmail.com>
 <52F50ACC.3020105@samsung.com>
 <CAK9yfHxi7EPTdeMoLYHrnomC3w5OpEux6vOHPeOEKhZg9Jw8+g@mail.gmail.com>
 <CAL5jtJ=2adaiTvX6BUr1TWqA4w35ALadx32g53HMQ54sRihp+g@mail.gmail.com>
 <CAOesGMiFL71dR13CuFV7hbkT=AaWjGA2ejk42W5hyy7wn_mJHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:25432 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785AbaBKLPn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 06:15:43 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0T0017QWM51R20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Feb 2014 11:15:41 +0000 (GMT)
In-reply-to: <CAOesGMiFL71dR13CuFV7hbkT=AaWjGA2ejk42W5hyy7wn_mJHQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>



On 11.02.2014 07:30, Olof Johansson wrote:
> Hi,
>
> On Mon, Feb 10, 2014 at 10:10 PM, Kukjin Kim <kgene.kim@gmail.com> wrote:
>> 2014-02-10 10:20 GMT+05:30 Sachin Kamat <sachin.kamat@linaro.org>:
>>>
>>> On 7 February 2014 22:03, Tomasz Figa <t.figa@samsung.com> wrote:
>>>> On 06.02.2014 19:59, Olof Johansson wrote:
>>>>>
>>>>> On Thu, Feb 6, 2014 at 10:43 AM, Bartlomiej Zolnierkiewicz
>>>>> <b.zolnierkie@samsung.com> wrote:
>>>>>
>>>>>>>> Well, once again, seeing some numbers would be good. :)
>>>>>>>
>>>>>>>
>>>>>>> What numbers do you want? Size comparisons with all SoC options on vs
>>>>>>> only one?
>>>>>>
>>>>>>
>>>>>> Yes, size comparisions with all SoCs (for given family) turned on vs
>>>>>> only one turned on (done on kernel without this patch applied).
>>>>>>
>>>>>> Also size comparisons for ARCH_EXYNOS4 and ARCH_EXYNOS5 both turned
>>>>>> on vs only ARCH_EXYNOS4 or ARCH_EXYNOS5 turned on (with this patch
>>>>>> applied).
>>>>>
>>>>>
>>>>> exynos_defconfig-based build data below.
>>>>>
>>>>>      text    data     bss     dec     hex filename
>>>>> 5109986  319952  270196 5700134  56fa26 obj-tmp/vmlinux   # all 4+5 SoCs
>>>>> enabled
>>>>> 5088312  296912  270196 5655420  564b7c obj-tmp/vmlinux  # EXYNOS5
>>>>> off, all EXYNOS4 SoCs enabled
>>>>> 5088032  296896  270196 5655124  564a54 obj-tmp/vmlinux  # Only 4210
>>>>> enabled
>>>>> 5079205  299928  270068 5649201  563331 obj-tmp/vmlinux  # EXYNOS4
>>>>> off, all EXYNOS5 SoCs enabled
>>>>> 5063355  286792  270068 5620215  55c1f7 obj-tmp/vmlinux   # Only 5250
>>>>> enabled
>>>>> 5067815  298152  270068 5636035  55ffc3 obj-tmp/vmlinux    # Only
>>>>> 5250+5420 enabled
>>>>> 5053357  278480  269364 5601201  5577b1 obj-tmp/vmlinux  # Only 5440
>>>>> enabled
>>>>>
>>>>> The main difference of disabling 5440 is that it removed the PCI
>>>>> support, which explains that reduction in size.
>>>>>
>>>>> So, I would argue that theere might be some value in disabling whole
>>>>> families (since it saves about 20k of text and the same of data), but
>>>>> that there's less gain per SoC member. 5440 is an oddball in this
>>>>> setup so it might make sense to treat it differently due to the PCI
>>>>> aspect.
>>>>
>>>>
>>>> Well, the numbers basically represent what I expected. Thanks for checking
>>>> this.
>>>
>>> Thanks to Olof for coming out with these numbers.
>>>
>>>> So I second this patch even more now,
>>>
>>> Thanks Tomasz :)
>>>
>>>> but maybe let's change it a bit
>>>> and introduce third entry for Exynos5440, since it doesn't really belong to
>>>> either of ARCHs. Candidates that come to my mind are ARCH_EXYNOS5440 (seems
>>>> to specific) or ARCH_EXYNOS5_SERVER. Feel free to suggest anything better,
>>>> though.
>>>
>>> Though Exynos5440 belongs to the Exynos5 family, it is different in a
>>> few ways and hence
>>> I preferred to keep it as a separate entry for now. I agree with your
>>> suggestion to have a third
>>> ARCH category but I would prefer to wait for a while until we have one
>>> more candidate for this
>>> category so that we have a bit more data for naming and grouping.
>>>
>> Well, I also, having soc number would be good like 5440 you thought
>> because I can't say upcoming exynos ARMv7 based SoCs are familiar with
>> previous exynos SoCs or not at this moment. And it means sometimes we
>> need to add the numbering and sometime we don't need. It's not fair
>> enough I think. And I have strong objection on Thomasz' suggestion
>> about ARCH_EXYNOS5_SERVER? Please don't guess.
>
> Well, we know that we do not want to see new options for every single
> new SoC that are similar to existing ones. It's just not needed, as
> the size comparisons above shows.
>
> So, I think today, we should have three options:
>
> EXYNOS4
> EXYNOS5
> EXYNOS5440
>
> 5440 can depend on EXYNOS5 today if it makes sense. Only reason to let
> it have its own option is that it's substantially different from the
> others in that it pulls in PCI and causes kernel size to go up.

Well, hardware-wise it's completely different. Even the pin controller 
needs a separate driver (pinctrl-exynos5440.c vs 
pinctrl-exynos.c+pinctrl-samsung.c), so I believe a third option is 
completely justified.

> If
> other SoCs are added that are quire similar to 5440, then the right
> option is probably to group them under an option together with 5440.
> It doesn't matter if it's called server or something else as long as
> they're mostly kept together. And for now that's just theoretical
> anwyay: Let's keep calling it 5440 until there's reason to change it.

Fair enough. That was basically my first proposal, which sounded a bit 
too specific to me, but I guess it can't be helped.

Best regards,
Tomasz
