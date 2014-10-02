From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: use drm generic mmap interface
Date: Thu, 02 Oct 2014 19:22:19 +0900
Message-ID: <542D275B.3080304@samsung.com>
References: <1410961726-2533-1-git-send-email-inki.dae@samsung.com>
 <1410961726-2533-3-git-send-email-inki.dae@samsung.com>
 <542BFEFE.20708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27409 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbaJBKW2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Oct 2014 06:22:28 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCT00GZBBHDFIA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Oct 2014 19:22:25 +0900 (KST)
In-reply-to: <542BFEFE.20708@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

On 2014=EB=85=84 10=EC=9B=94 01=EC=9D=BC 22:17, Tomasz Figa wrote:
> Hi Inki,
>=20
> On 17.09.2014 15:48, Inki Dae wrote:
>> This patch removes DRM_EXYNOS_GEM_MMAP ictrl feature specific
>> to Exynos drm and instead uses drm generic mmap.
>=20
> It looks like libdrm_exynos is still using DRM_EXYNOS_GEM_MMAP, but t=
his
> patch just removes it. This basically means that any application usin=
g
> it is now broken. Do you have any plans to fix this?
>=20

Hi Tomasz,

Yes, of course.

We will fix it soon. For this, I mentioned earlier,
http://web.archiveorange.com/archive/v/hhSc574WhqJAKgdBq7KL

Thanks,
Inki Dae

> Best regards,
> Tomasz
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
