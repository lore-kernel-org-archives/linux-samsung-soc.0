From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Fix the parse_dt of exynos dsi and remove the OF
 graph
Date: Tue, 21 Feb 2017 08:24:52 +0900
Message-ID: <58AB7AC4.40606@samsung.com>
References: <CGME20170209012715epcas1p3dbe1788b864c50d339dcfd791c0900ec@epcas1p3.samsung.com>
 <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com>
 <58AA95C1.4020809@samsung.com>
 <CAJKOXPd7Roubdf_5B6pT1PkA9K9dZmjPydYOujXvrz8cVcKVmg@mail.gmail.com>
 <58AAA996.3080900@samsung.com>
 <CAJKOXPdqfZ6HG9OKiV9xFw1ybSZXKfGPQJdwdVyH-jjeizpUaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJKOXPdqfZ6HG9OKiV9xFw1ybSZXKfGPQJdwdVyH-jjeizpUaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org



2017년 02월 20일 17:55에 Krzysztof Kozlowski 이(가) 쓴 글:
> On Mon, Feb 20, 2017 at 10:32 AM, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>
>>
>> 2017년 02월 20일 16:27에 Krzysztof Kozlowski 이(가) 쓴 글:
>>> On Mon, Feb 20, 2017 at 9:07 AM, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>> Hi Krzysztof,
>>>>
>>>> Can you merge patch 2 and 5 to your tree so that they can go to mainline? Otherwise, I can merge them to my tree if you give me acked-by.
>>>
>>> Hi,
>>>
>>> Hm? Why do you need them to be merged? Do you mean that the first
>>> patch breaks not only ABI but also bisectability? Then this has to be
>>> reworked because:
>>>
>>> 1. The DTS patches cannot go through non-DT tree so no, you cannot
>>> take them into your branch. I will merge them according to point 4
>>> below.
>>> 2. Bisectability has to be preserved.
>>> 3. DTS changes in general should not be a dependency for driver changes.
>>
>> Krzysztof,
>>
>> I know that. I didn't check you gave a comment to Hoegun do rework this patch series. I just checked reviewed-by from Andrzej H. and thought no problem.
>>
>> Ideally you are right. DT changes should be no any dependency of driver changes but now Exynos DT is broken.
> 
> I didn't receive any bug reports that Exynos DT is broken so I am
> quite surprised hearing that. What do you mean by that?

Wrong usage of Display relevant DT ABI is being fixed without the backward compatibility of the DT ABI. This means device driver doesn't consider old DT binding.
So the use of old DTB binary will make kernel booting not to work correctly.

> 
>> So if we have to keep the bisectability between driver and device tree patches - this means that all drivers should always keep the backward compatibility - then the drivers will be messed up.
> 
> No, you are mixing two things. Bisectability is different than
> backward compatibility. For the backward DT ABI compatibility, we
> agreed that in this case it can be dropped. However bisectability is
> something totally different. The DTS changes always go through
> separate branch, so the driver has to be *always* ready for such case
> and should still be fully bisectable. This is a general rule existing

I meant that if this patch series considers old DT binding to keep the bisectability, then this driver would be messed up because the driver should try to bind same properties at different places and one of these two cases should be bound.
So this driver doesn't consider the old DT binding, which means that the old DTB binary isn't compatible with this driver - exynos_drm_dsi.c.

This means if only one side is merged then this driver wouldn't work correctly. 

> for long time and every deviation from the rule is pointed out by
> arm-soc guys. Whenever I accepted breaking of this rule, I had hard
> times with arm-soc so no - I am no longer giving up basic rule just
> because developer might not care.

Understood and reasonable. Seems I just hurried up. For the bisectability, this driver will have a little messed up code temporarily, and this messed up code will be removed after dt change is merged.
This thing was really what I want to avoid - if even the messed up code should be keeped forever for the backward compatibility then it would be really terribble. :(


Do you have a better idea?

> 
> There are many ways to solve the bisectability problem. Recently for
> example Marek found nice way to solve the PMU syscon handle dependency

Thanks for share but this would be a different case.

Thanks,
Inki Dae

> [1]. One can also merge first DTS changes and in next release, merge
> the driver.
> 
>> About this, we had a discussion and I think you agreed,
>> https://patchwork.kernel.org/patch/9477957/
> 
> Again, this discussion was about DT ABI. Not bisectability.
> 
>> Do you want the backward compatibility to be kept always when new dt binding relevant patch - which fixes up the wrong usage of dt binding - is posted?
>> It would be good for the backward compatibility to be kept as long as we can do but there would be several cases to make the driver to be messed up like this patch series.
> 
> Again, DT ABI not bisectability.
> 
> Best regards,
> Krzysztof
> 
> [1] https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/commit/?h=for-v4.11/drivers-soc-exynos-pmu-the-joy-never-ends&id=76640b84bd7a9d68c70d8bc8ecd02cdc4bd8855e
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
