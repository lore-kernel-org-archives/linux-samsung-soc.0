From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PULL] drm-exynos-next 2014-12-22
Date: Thu, 08 Jan 2015 13:25:53 +0900
Message-ID: <54AE06D1.9010105@samsung.com>
References: <20141222130418.GJ16419@joana> <549CB768.3000903@samsung.com>
 <20150107180608.GA2001@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14270 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753247AbbAHEZ4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jan 2015 23:25:56 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NHU002SMCB5KEC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Jan 2015 13:25:53 +0900 (KST)
In-reply-to: <20150107180608.GA2001@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: Dave Airlie <airlied@gmail.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

On 2015=EB=85=84 01=EC=9B=94 08=EC=9D=BC 03:06, Gustavo Padovan wrote:
> 2014-12-26 Inki Dae <inki.dae@samsung.com>:
>=20
>> On 2014=EB=85=84 12=EC=9B=94 22=EC=9D=BC 22:04, Gustavo Padovan wrot=
e:
>>> Hi Dave,
>>>
>>> Here goes a bunch of clean up for the exynos driver. I've posted th=
is work in
>>> the mailing list twice but never got a review on it, first time was=
 about a
>>
>> Never no. I already had a review and they - your first time patch se=
t -
>> had been merged to exynos-drm-next-todo. I was moving them to
>> exynos-drm-next locally but one of your patch set was not reasonable=
 to
>> me so I gave you one comment. After that, you posted next patch set
>> which include new changes and patches just 9 days ago. So they shoul=
d
>> also be reviewed enough at least for two weeks.
>=20
> So please notify on the mailing list what you are doing. To me it loo=
ked that
> all patches but one didn't get any review. I have a lot of pending wo=
rk to do
> on top of this pull request and review on them is quite important for=
 me to
> keep working on new changes.
>=20
>>
>> Please, do not hurry. Such big changes should really be reviewed eno=
ugh.
>> I will wait for other reviews and them merge them if reviewed enough=
=2E If
>> nobody have reviews then I will merge them. So please, don't worry a=
bout
>> that.
>=20
> It is been a way more than two weeks now, can you please merge all my
> patches but the 3 ones you had commented on? I'll send updated patche=
s for
> those.

Actually, I am waiting for your reply because your second patch series
includes the changes and updates related to atomic page flip and mode
setting, which doesn't have consistency with your first patch series.
Anyway, I'll merge the only cleanup parts to exynos-drm-next. Please,
post atomic parts after updating later. In addition, I'll not merge
'[PATCH 01/29] drm/exynos/fimd: only finish pageflip if START =3D=3D
START_S' because not clear to me as I already mentioned before.

And lastly, thanks for your contribution. :)
Inki Dae

>=20
> Also can you add you tree to the linux-next build?
>=20
> 	Gustavo
>=20
