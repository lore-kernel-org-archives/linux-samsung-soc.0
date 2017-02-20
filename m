From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/5] Fix the parse_dt of exynos dsi and remove the OF graph
Date: Mon, 20 Feb 2017 10:55:09 +0200
Message-ID: <CAJKOXPdqfZ6HG9OKiV9xFw1ybSZXKfGPQJdwdVyH-jjeizpUaw@mail.gmail.com>
References: <CGME20170209012715epcas1p3dbe1788b864c50d339dcfd791c0900ec@epcas1p3.samsung.com>
 <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com>
 <58AA95C1.4020809@samsung.com> <CAJKOXPd7Roubdf_5B6pT1PkA9K9dZmjPydYOujXvrz8cVcKVmg@mail.gmail.com>
 <58AAA996.3080900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750774AbdBTIzO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 03:55:14 -0500
In-Reply-To: <58AAA996.3080900@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Mon, Feb 20, 2017 at 10:32 AM, Inki Dae <inki.dae@samsung.com> wrote:
>
>
> 2017년 02월 20일 16:27에 Krzysztof Kozlowski 이(가) 쓴 글:
>> On Mon, Feb 20, 2017 at 9:07 AM, Inki Dae <inki.dae@samsung.com> wrote:
>>> Hi Krzysztof,
>>>
>>> Can you merge patch 2 and 5 to your tree so that they can go to mainline? Otherwise, I can merge them to my tree if you give me acked-by.
>>
>> Hi,
>>
>> Hm? Why do you need them to be merged? Do you mean that the first
>> patch breaks not only ABI but also bisectability? Then this has to be
>> reworked because:
>>
>> 1. The DTS patches cannot go through non-DT tree so no, you cannot
>> take them into your branch. I will merge them according to point 4
>> below.
>> 2. Bisectability has to be preserved.
>> 3. DTS changes in general should not be a dependency for driver changes.
>
> Krzysztof,
>
> I know that. I didn't check you gave a comment to Hoegun do rework this patch series. I just checked reviewed-by from Andrzej H. and thought no problem.
>
> Ideally you are right. DT changes should be no any dependency of driver changes but now Exynos DT is broken.

I didn't receive any bug reports that Exynos DT is broken so I am
quite surprised hearing that. What do you mean by that?

> So if we have to keep the bisectability between driver and device tree patches - this means that all drivers should always keep the backward compatibility - then the drivers will be messed up.

No, you are mixing two things. Bisectability is different than
backward compatibility. For the backward DT ABI compatibility, we
agreed that in this case it can be dropped. However bisectability is
something totally different. The DTS changes always go through
separate branch, so the driver has to be *always* ready for such case
and should still be fully bisectable. This is a general rule existing
for long time and every deviation from the rule is pointed out by
arm-soc guys. Whenever I accepted breaking of this rule, I had hard
times with arm-soc so no - I am no longer giving up basic rule just
because developer might not care.

There are many ways to solve the bisectability problem. Recently for
example Marek found nice way to solve the PMU syscon handle dependency
[1]. One can also merge first DTS changes and in next release, merge
the driver.

> About this, we had a discussion and I think you agreed,
> https://patchwork.kernel.org/patch/9477957/

Again, this discussion was about DT ABI. Not bisectability.

> Do you want the backward compatibility to be kept always when new dt binding relevant patch - which fixes up the wrong usage of dt binding - is posted?
> It would be good for the backward compatibility to be kept as long as we can do but there would be several cases to make the driver to be messed up like this patch series.

Again, DT ABI not bisectability.

Best regards,
Krzysztof

[1] https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/commit/?h=for-v4.11/drivers-soc-exynos-pmu-the-joy-never-ends&id=76640b84bd7a9d68c70d8bc8ecd02cdc4bd8855e
