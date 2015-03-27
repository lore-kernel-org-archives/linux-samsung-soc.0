From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm: Exynos: Respect framebuffer pitch for FIMD/Mixer
Date: Fri, 27 Mar 2015 10:47:55 +0900
Message-ID: <5514B6CB.7060301@samsung.com>
References: <1426598698-31095-1-git-send-email-daniels@collabora.com>
 <CABxcv==Z0ccmR-3Hasnkmg14m3hBJEwha=6c6288jQPUhyQt-g@mail.gmail.com>
 <5514187E.60405@samsung.com> <5514A118.2000609@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43828 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752513AbbC0Br5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Mar 2015 21:47:57 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NLU00ICCKZV3B10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Mar 2015 10:47:55 +0900 (KST)
In-reply-to: <5514A118.2000609@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Daniel Stone <daniels@collabora.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 2015=EB=85=84 03=EC=9B=94 27=EC=9D=BC 09:15, Tobias Jakobi wrote:
> Inki Dae wrote:
>> Hello Javier,
>>
>> Applied.
>>
>> Could you use right prefix of the subject like below when you post p=
atch?
>>
>> 'drm/exynos: ...', not 'drm: Exynos: ...'
>>
>> Your email will be filtered from my mailbox if you don't use the rig=
ht
>> prefix so I couldn't check and take care of your patch.
> I would suggest to change (or drop) the filter settings then. I don't

=46ilters of my mailbox are considered for two cases, one is DRI mailin=
g
list, other is drm/exynos.
So if you don't use the drm/exynos prefix, then I would try to find you=
r
patch in DRI mailing list - I sometimes check the mailing list. However=
,
the mailing list have so much emails so it'd be not easy to pick up onl=
y
exynos relevant patches among the email lists. As a result, you would
get the my review lately.

> think you can expect people to jump through these hoops to reach a
> maintainer of a kernel subsystem. Especially since this not 'document=
ed'
> anywhere.

Right, this is not documented but if you have ever checked exynos drm
driver tree, then I think you could know how we use the prefix. Of
course, I don't like to force the use of this prefix but if you and
other people use prefix in the manner of them, exynos drm tree would be
a little bit messy. i.e., DRM: EXYNOS, drm: exynos, drm: Exynos,
drm/exynos, drm/exynos: fimd, drm: exynos: fimd, DRM: EXYNOS: FIMD, ...
 so many cases....  Do you really want this?

So I will always say "please, use right prefix" Otherwise, I will chang=
e
it while merging as is.
And I see that other drm drivers have their own way which is not
documented but just implicitly.

Thanks,
Inki Dae

>=20
>=20
>=20
> With best wishes,
> Tobias
>=20
>=20
