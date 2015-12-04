From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH v3 1/3] drm/exynos: dp: add of_graph dt binding support
 for panel
Date: Fri, 4 Dec 2015 23:57:14 +0900
Message-ID: <CAAQKjZMT0d=r7qMVtBLTC3EJaJ0PYZppPX9pCJu4dEeKcpApXQ@mail.gmail.com>
References: <1449135010-8111-1-git-send-email-inki.dae@samsung.com>
 <1449135010-8111-2-git-send-email-inki.dae@samsung.com> <566049D0.8070404@osg.samsung.com>
 <56615619.2040208@samsung.com> <5661894B.1090105@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f179.google.com ([209.85.160.179]:35685 "EHLO
	mail-yk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998AbbLDO5y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Dec 2015 09:57:54 -0500
In-Reply-To: <5661894B.1090105@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Javier,

2015-12-04 21:38 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung=
=2Ecom>:
> Hello Inki,
>
> On 12/04/2015 06:00 AM, Inki Dae wrote:
>> Hi Javier,
>>
>> 2015=EB=85=84 12=EC=9B=94 03=EC=9D=BC 22:55=EC=97=90 Javier Martinez=
 Canillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> Hello Inki,
>>>
>>> I found that v2 of this patch is alredy in your exynos-drm for-next=
 branch so
>>> so I had to revert it in linux-next to apply this one to test. You =
shouldn't
>>> push patches that were still not reviewed (specially the ones that =
weren't
>>> tested like this one) to your branch that gets pulled by -next. The=
 idea of
>>> -next is to have some test coverage but it should be as stable as p=
ossible.
>>
>> exynos-drm/for-next branch is not really for-next branch. This branc=
h is used
>
> Well, it is a for-next branch because is pulled by -next. It is liste=
d in:
> http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/=
Next/Trees
>
> drm-exynos      git     git://git.kernel.org/pub/scm/linux/kernel/git=
/daeinki/drm-exynos.git#exynos-drm/for-next
>
>> only for integration test. As you know, there are many exynos mainta=
iners
>> and they have their own repository. So we would need to test the int=
egration.
>
> Integration testing is of course very needed and linux-next is for th=
at but
> what should be tested are the patches that are targeted to mainline.
>
>> For this, exynos-drm/for-next is merged to linux-next not Dave's tre=
e.
>> Only exynos-drm-next branch will be merged to Dave's tree so only re=
viewed and
>> tested patches will be merged to exynos-drm-next.
>>
>
> In that case, exynos-drm-next is what should be pulled by linux-next,=
 no the
> for-next branch. Linux-next is a simulation of what Torvalds would do=
 next
> so problems are found earlier, ideally before the patches land into m=
ainline.

Seems I didn't comment enough. exynos-drm/for-next branch includes all
patches of exynos-drm-next
and actually, they keep same patches for most time but sometimes, I
merge additional patches only to
exynos-drm/for-next, which should be more tested with other trees
before going to Dave's tree.

One more thing, there is other difference between exynos-drm-next and
exynos-drm/for-next.
That is all patches of exynos-drm-next are merged on top of based on
Dave's drm-next branch.
On the other hand, all of exynos-drm/for-next are merged on top of
mainline. So if exynos-drm-next
is merged to linux-next then all patches will be conflicted with
Dave's tree because his branch
is also merged to linux-next.

I'm not sure that other maintainers always keep only the for-next
branch in their repository but
in my case, I use exynos-drm/for-next branch for the test before going
to drm-next.
Anyway, exynos-drm-next will go to Dave's tree and then Dave's tree
will also be pulled by
linux-next, which would allow exynos-drm-next to be tested altogether
again before going to mainline.

Thanks,
Inki Dae

>
> Best regards,
> --
> Javier Martinez Canillas
> Open Source Group
> Samsung Research America
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
