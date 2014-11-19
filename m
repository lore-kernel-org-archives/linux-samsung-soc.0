From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: use drm generic mmap interface
Date: Wed, 19 Nov 2014 11:04:23 +0900
Message-ID: <546BFAA7.1030605@samsung.com>
References: <1410961726-2533-1-git-send-email-inki.dae@samsung.com>
 <1410961726-2533-3-git-send-email-inki.dae@samsung.com>
 <542BFEFE.20708@gmail.com> <542D275B.3080304@samsung.com>
 <546BC3A6.1090304@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19049 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753801AbaKSCE0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 21:04:26 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF90004WKFBVQC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Nov 2014 11:04:23 +0900 (KST)
In-reply-to: <546BC3A6.1090304@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

On 2014=EB=85=84 11=EC=9B=94 19=EC=9D=BC 07:09, Tobias Jakobi wrote:
> Inki Dae wrote:
>> Hi Tomasz,
>>
>> Yes, of course.
>>
>> We will fix it soon. For this, I mentioned earlier,
>> http://web.archiveorange.com/archive/v/hhSc574WhqJAKgdBq7KL
>>
>> Thanks,
>> Inki Dae
>=20
>=20
> Hello,
>=20
> it looks like libdrm git master is still using the EXYNOS_GEM_MMAP io=
ctl
> that was removed by this patch. Is there any news on the patches for =
libdrm?

The patch set already was posted. You can refer to below link,
	http://www.spinics.net/lists/dri-devel/msg70737.html

Thanks,
Inki Dae

>=20
> With best wishes,
> Tobias
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
