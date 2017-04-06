From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v5 3/5] drm/exynos: dsi: Fix the parse_dt function
Date: Thu, 06 Apr 2017 15:48:37 +0900
Message-ID: <58E5E4C5.5090107@samsung.com>
References: <1488948852-5380-1-git-send-email-hoegeun.kwon@samsung.com>
        <CGME20170308045502epcas1p2d2f7a0f768082b7a54b2ebe260e78436@epcas1p2.samsung.com>
        <1488948852-5380-4-git-send-email-hoegeun.kwon@samsung.com>
        <93e79e92-a102-e931-8d63-843031848888@samsung.com>
        <58DA1E38.50907@samsung.com>
        <CAJKOXPeD4HKemKTrnC2JaON3JkuNGO9g+Hg8M7F6f2WusiYkhg@mail.gmail.com>
        <CAJKOXPd-h4QqLXJ5AYr1KgpjvROaWpVZnd9KmeeGoVRQifssbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24636 "EHLO
        epoutp01.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932371AbdDFGsl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Apr 2017 02:48:41 -0400
In-reply-to: <CAJKOXPd-h4QqLXJ5AYr1KgpjvROaWpVZnd9KmeeGoVRQifssbw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>, jy0922.shim@samsung.com, Seung Woo Kim <sw0312.kim@samsung.com>, airlied@linux.ie, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, a.hajda@samsung.com, Andi Shyti <andi.shyti@samsung.com>, LW@karo-electronics.de, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>



2017년 04월 05일 00:38에 Krzysztof Kozlowski 이(가) 쓴 글:
> On Tue, Mar 28, 2017 at 11:38 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Tue, Mar 28, 2017 at 11:26 AM, Inki Dae <inki.dae@samsung.com> wrote:
>>> Merged.
>>
>> Hi,
>>
>> I do not see the tag (with DT patches) merged by you which I provided
>> to you before. These are essential for bisectability. Without them,
>> kernel bisectability is broken. Did you merged the tag somewhere?
>>
>> Best regards,
>> Krzysztof
>>
>>> Thanks,
>>> Inki Dae
> 
> Inki,
> 
> I still do not see the DTS tag [1] merged in your tree but you applied
> patches breaking the display. I looked at exynos-drm-next branch.
> 
> We talked already about bisectability and with Hoegeun we provided
> proper solution. Hoegeun split the patchset and I sent you a stable
> tag to merge. Be aware not to apply the DTS patch because you would
> effectively duplicate it. Instead, deal like with any pull request -
> merge the tag as dependency *before* applying DRM DSI patch.
> 
> I saw also a branch like this:
> https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/log/?h=exynos-drm-next-tm2
> but this is something obviously wrong. I do not know what are your
> plans to do with it, but please drop it as it brings only confusion.

Krzysztof,

Do not make you confusing with above branch which is used just for internal test so never go -next maybe you know.
Why are you suffering from this?


Thanks,
Inki Dae

> 
> Best regards,
> Krzysztof
> 
> [1] https://www.spinics.net/lists/arm-kernel/msg567053.html
> 
>>> 2017년 03월 22일 10:36에 Hoegeun Kwon 이(가) 쓴 글:
>>>> Hi inki,
>>>>
>>>> Could you check the this patch?
>>>> For reference, patch 1/5 and 2/5 have already been applied to Krzysztof tree.
>>>>
>>>> Best regards,
>>>> Hoegeun
>>>>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
