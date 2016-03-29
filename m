From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 0/3] drm/exynos: Kconfig dependency fixes
Date: Mon, 28 Mar 2016 22:41:02 -0400
Message-ID: <56F9EB3E.5080000@osg.samsung.com>
References: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
 <56F9DE63.6050808@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:58859 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751202AbcC2ClR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2016 22:41:17 -0400
In-Reply-To: <56F9DE63.6050808@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sw0312.kim@samsung.com
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org

Hello Seung-Woo,

Thanks a lot for your feedback.

On 03/28/2016 09:46 PM, Seung-Woo Kim wrote:
> Hi Javier,
>=20
> On 2016=EB=85=84 03=EC=9B=94 29=EC=9D=BC 10:28, Javier Martinez Canil=
las wrote:
>> Hello Inki,
>>
>> This patch series contains some fixes for the Kconfig symbol depende=
ncies
>> of the Exynos DRM driver. They make sure that the Exynos DRM compone=
nts
>> and the media platform drivers that makes use of the same HW IP bloc=
k are
>> not enabled at the same time.
>>
>> Best regards,
>> Javier
>>
>>
>> Javier Martinez Canillas (3):
>>   drm/exynos: Use VIDEO_SAMSUNG_S5P_G2D=3Dn as G2D Kconfig dependenc=
y
>>   drm/exynos: Use VIDEO_SAMSUNG_EXYNOS_GSC=3Dn as GSC Kconfig depend=
ency
>>   drm/exynos: Make DRM_EXYNOS_FIMC depend on VIDEO_S5P_FIMC=3Dn
>=20
> In G2D case, there is only one instance, but for the other cases, the=
re
> are several instances and in my environment, I enable both drivers on
> v4l2 and drm FIMC/GSC.
>=20
> So, IMHO, the not-enabled v4l2 dependency is not really required for =
drm
> fimc and drm gsc.
>

I'm confused, it was you who added the depends on !VIDEO_SAMSUNG_EXYNOS=
_GSC
for DRM_EXYNOS_GSC in commit aeefb36832e5 ("drm/exynos: gsc: add device=
 tree
support and remove usage of static mappings").

=46rom the commit message "The driver cannot be used simultaneously wit=
h V4L2
Mem2Mem GScaller driver thought". Did that assumption changed and the d=
epend
should be removed then? or maybe I misunderstood what you meant.

Now, I'm not really sure about FIMC either, it was feedback I got from =
this
patch [0]. Could you please take a look to that and let me know if enab=
ling
these drivers simultaneously makes sense then?

> Best Regards,
> - Seung-Woo Kim
>=20
>>
>>  drivers/gpu/drm/exynos/Kconfig | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>=20

[0]: https://lkml.org/lkml/2016/3/23/292

Best regards,
--=20
Javier Martinez Canillas
Open Source Group
Samsung Research America
