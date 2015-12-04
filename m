From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3 1/3] drm/exynos: dp: add of_graph dt binding support
 for panel
Date: Fri, 4 Dec 2015 13:18:04 -0300
Message-ID: <5661BCBC.4090207@osg.samsung.com>
References: <1449135010-8111-1-git-send-email-inki.dae@samsung.com>
 <1449135010-8111-2-git-send-email-inki.dae@samsung.com>
 <566049D0.8070404@osg.samsung.com> <56615619.2040208@samsung.com>
 <5661894B.1090105@osg.samsung.com>
 <CAAQKjZMT0d=r7qMVtBLTC3EJaJ0PYZppPX9pCJu4dEeKcpApXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:33234 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753887AbbLDQSL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Dec 2015 11:18:11 -0500
In-Reply-To: <CAAQKjZMT0d=r7qMVtBLTC3EJaJ0PYZppPX9pCJu4dEeKcpApXQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <daeinki@gmail.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?Q?Krzysztof_Koz=c5=82owski?= <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>

Hello Inki,

On 12/04/2015 11:57 AM, Inki Dae wrote:
> Hi Javier,
>=20
> 2015-12-04 21:38 GMT+09:00 Javier Martinez Canillas <javier@osg.samsu=
ng.com>:
>> Hello Inki,
>>
>> On 12/04/2015 06:00 AM, Inki Dae wrote:
>>> Hi Javier,
>>>
>>> 2015=EB=85=84 12=EC=9B=94 03=EC=9D=BC 22:55=EC=97=90 Javier Martine=
z Canillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>>> Hello Inki,
>>>>
>>>> I found that v2 of this patch is alredy in your exynos-drm for-nex=
t branch so
>>>> so I had to revert it in linux-next to apply this one to test. You=
 shouldn't
>>>> push patches that were still not reviewed (specially the ones that=
 weren't
>>>> tested like this one) to your branch that gets pulled by -next. Th=
e idea of
>>>> -next is to have some test coverage but it should be as stable as =
possible.
>>>
>>> exynos-drm/for-next branch is not really for-next branch. This bran=
ch is used
>>
>> Well, it is a for-next branch because is pulled by -next. It is list=
ed in:
>> http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree=
/Next/Trees
>>
>> drm-exynos      git     git://git.kernel.org/pub/scm/linux/kernel/gi=
t/daeinki/drm-exynos.git#exynos-drm/for-next
>>
>>> only for integration test. As you know, there are many exynos maint=
ainers
>>> and they have their own repository. So we would need to test the in=
tegration.
>>
>> Integration testing is of course very needed and linux-next is for t=
hat but
>> what should be tested are the patches that are targeted to mainline.
>>
>>> For this, exynos-drm/for-next is merged to linux-next not Dave's tr=
ee.
>>> Only exynos-drm-next branch will be merged to Dave's tree so only r=
eviewed and
>>> tested patches will be merged to exynos-drm-next.
>>>
>>
>> In that case, exynos-drm-next is what should be pulled by linux-next=
, no the
>> for-next branch. Linux-next is a simulation of what Torvalds would d=
o next
>> so problems are found earlier, ideally before the patches land into =
mainline.
>=20
> Seems I didn't comment enough. exynos-drm/for-next branch includes al=
l
> patches of exynos-drm-next
> and actually, they keep same patches for most time but sometimes, I
> merge additional patches only to
> exynos-drm/for-next, which should be more tested with other trees
> before going to Dave's tree.
>=20

Ok, but unreviewed and more importantly untested patches should not
go to to exynos-drm/for-next because those will be made available in
linux-next and can cause issues.

Only patches that are known to be good and have been reviewed/acked
should go there.

> One more thing, there is other difference between exynos-drm-next and
> exynos-drm/for-next.
> That is all patches of exynos-drm-next are merged on top of based on
> Dave's drm-next branch.
> On the other hand, all of exynos-drm/for-next are merged on top of
> mainline. So if exynos-drm-next

It's OK if you keep a different branch because you need a different
base before sending your pull request but IMHO the patches in both
branches should always be the same.

> is merged to linux-next then all patches will be conflicted with
> Dave's tree because his branch
> is also merged to linux-next.
>
> I'm not sure that other maintainers always keep only the for-next
> branch in their repository but
> in my case, I use exynos-drm/for-next branch for the test before goin=
g
> to drm-next.
> Anyway, exynos-drm-next will go to Dave's tree and then Dave's tree
> will also be pulled by
> linux-next, which would allow exynos-drm-next to be tested altogether
> again before going to mainline.
>

This should be a common problem for subsystems with different levels
of maintainership. I'm not a subsystem maintainer so I don't know how
this should be solved but I thought that git merge would take care
of this when both trees are pulled by linux-next.

Maybe Krzysztof can comment on this since he has to do the same for
the Exynos SoC support? He maintains a for-next branch and has to
send pull request to Kukjin (and sometimes may need to rebase on top
of Kukjin's tree) but both trees are pulled by linux-next to test.

> Thanks,
> Inki Dae
>=20

Best regards,
--=20
Javier Martinez Canillas
Open Source Group
Samsung Research America
