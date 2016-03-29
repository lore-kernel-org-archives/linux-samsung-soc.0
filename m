From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH 0/3] drm/exynos: Kconfig dependency fixes
Date: Tue, 29 Mar 2016 13:25:07 +0900
Message-ID: <56FA03A3.1090205@samsung.com>
References: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
 <56F9DE63.6050808@samsung.com> <56F9EB3E.5080000@osg.samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56285 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819AbcC2EZL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Mar 2016 00:25:11 -0400
In-reply-to: <56F9EB3E.5080000@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>, m.szyprowski@samsung.com

Hello Javier,

On 2016=EB=85=84 03=EC=9B=94 29=EC=9D=BC 11:41, Javier Martinez Canilla=
s wrote:
> Hello Seung-Woo,
>=20
> Thanks a lot for your feedback.
>=20
> On 03/28/2016 09:46 PM, Seung-Woo Kim wrote:
>> Hi Javier,
>>
>> On 2016=EB=85=84 03=EC=9B=94 29=EC=9D=BC 10:28, Javier Martinez Cani=
llas wrote:
>>> Hello Inki,
>>>
>>> This patch series contains some fixes for the Kconfig symbol depend=
encies
>>> of the Exynos DRM driver. They make sure that the Exynos DRM compon=
ents
>>> and the media platform drivers that makes use of the same HW IP blo=
ck are
>>> not enabled at the same time.
>>>
>>> Best regards,
>>> Javier
>>>
>>>
>>> Javier Martinez Canillas (3):
>>>   drm/exynos: Use VIDEO_SAMSUNG_S5P_G2D=3Dn as G2D Kconfig dependen=
cy
>>>   drm/exynos: Use VIDEO_SAMSUNG_EXYNOS_GSC=3Dn as GSC Kconfig depen=
dency
>>>   drm/exynos: Make DRM_EXYNOS_FIMC depend on VIDEO_S5P_FIMC=3Dn
>>
>> In G2D case, there is only one instance, but for the other cases, th=
ere
>> are several instances and in my environment, I enable both drivers o=
n
>> v4l2 and drm FIMC/GSC.
>>
>> So, IMHO, the not-enabled v4l2 dependency is not really required for=
 drm
>> fimc and drm gsc.
>>
>=20
> I'm confused, it was you who added the depends on !VIDEO_SAMSUNG_EXYN=
OS_GSC
> for DRM_EXYNOS_GSC in commit aeefb36832e5 ("drm/exynos: gsc: add devi=
ce tree
> support and remove usage of static mappings").

Yes, you are right. Originally, my goal on the GSC was bringing optiona=
l
flag for setting isp mode or wb mode like FIMC in tizen.org git tree.

https://review.tizen.org/git/?p=3Dplatform/kernel/linux-exynos.git;a=3D=
blobdiff;f=3DDocumentation/devicetree/bindings/media/exynos5-gsc.txt;h=3D=
d526777a3abd04d244c46fdd729e3df93bb86917;hp=3D0604d42f38d1941526d47ad11=
a958a2a83797f97;hb=3D751cd6d88d9620c83042641b52fdd244408a3947;hpb=3D7c7=
ab44f86d64ba6a6733da8f201a26a6c0e807f

But only devicetree part of GSC was upstreamed and simultaneous enablin=
g
both v4l2 gsc and drm gsc driver is removed. The only reason I set both
driver simultaneously was enabling video codec, exynos-mfc with gsc to
convert RGB plane.

I know Marek already has plan to integrate yuv plane feature of GSC to
DRM KMS. Also, for GSC, simultaneous setup is alredy remove, so your
patch seems better.

>=20
>>From the commit message "The driver cannot be used simultaneously wit=
h V4L2
> Mem2Mem GScaller driver thought". Did that assumption changed and the=
 depend
> should be removed then? or maybe I misunderstood what you meant.
>=20
> Now, I'm not really sure about FIMC either, it was feedback I got fro=
m this
> patch [0]. Could you please take a look to that and let me know if en=
abling
> these drivers simultaneously makes sense then?

About FIMC, there is still simultaneous setup for both v4l2 and drm
driver with devicetree binding flags, samsung,isp-wb and samsung,lcd-wb=
=2E

If on the FIMC instance of dt node, samsung,lcd-wb is set, then drm
driver is probed, otherwise v4l2 driver is probed.

Simultaneous FIMC driver is also only for RGB converting of video codec
planes like GSC at least to me.

Marek, do you have any idea about the simultaneous setup for fimc and g=
sc?

Best Regards,
- Seung-Woo Kim

>=20
>> Best Regards,
>> - Seung-Woo Kim
>>
>>>
>>>  drivers/gpu/drm/exynos/Kconfig | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>
>=20
> [0]: https://lkml.org/lkml/2016/3/23/292
>=20
> Best regards,
>=20

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
