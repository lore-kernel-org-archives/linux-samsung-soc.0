From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3 1/3] drm/exynos: dp: add of_graph dt binding support
 for panel
Date: Fri, 4 Dec 2015 09:38:35 -0300
Message-ID: <5661894B.1090105@osg.samsung.com>
References: <1449135010-8111-1-git-send-email-inki.dae@samsung.com>
 <1449135010-8111-2-git-send-email-inki.dae@samsung.com>
 <566049D0.8070404@osg.samsung.com> <56615619.2040208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:32916 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751980AbbLDMio (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Dec 2015 07:38:44 -0500
In-Reply-To: <56615619.2040208@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, k.kozlowski@samsung.com

Hello Inki,

On 12/04/2015 06:00 AM, Inki Dae wrote:
> Hi Javier,
>=20
> 2015=EB=85=84 12=EC=9B=94 03=EC=9D=BC 22:55=EC=97=90 Javier Martinez =
Canillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> Hello Inki,
>>
>> I found that v2 of this patch is alredy in your exynos-drm for-next =
branch so
>> so I had to revert it in linux-next to apply this one to test. You s=
houldn't
>> push patches that were still not reviewed (specially the ones that w=
eren't
>> tested like this one) to your branch that gets pulled by -next. The =
idea of
>> -next is to have some test coverage but it should be as stable as po=
ssible.
>=20
> exynos-drm/for-next branch is not really for-next branch. This branch=
 is used

Well, it is a for-next branch because is pulled by -next. It is listed =
in:
http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Ne=
xt/Trees

drm-exynos	git	git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/dr=
m-exynos.git#exynos-drm/for-next

> only for integration test. As you know, there are many exynos maintai=
ners
> and they have their own repository. So we would need to test the inte=
gration.

Integration testing is of course very needed and linux-next is for that=
 but
what should be tested are the patches that are targeted to mainline.

> For this, exynos-drm/for-next is merged to linux-next not Dave's tree=
=2E
> Only exynos-drm-next branch will be merged to Dave's tree so only rev=
iewed and
> tested patches will be merged to exynos-drm-next.
>

In that case, exynos-drm-next is what should be pulled by linux-next, n=
o the
for-next branch. Linux-next is a simulation of what Torvalds would do n=
ext
so problems are found earlier, ideally before the patches land into mai=
nline.

Best regards,
--=20
Javier Martinez Canillas
Open Source Group
Samsung Research America
