From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 0/3] drm/exynos: Kconfig dependency fixes
Date: Tue, 29 Mar 2016 10:59:15 -0400
Message-ID: <56FA9843.70806@osg.samsung.com>
References: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
 <56F9DE63.6050808@samsung.com> <56F9EB3E.5080000@osg.samsung.com>
 <56FA03A3.1090205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56FA03A3.1090205@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sw0312.kim@samsung.com
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hello Seung-Woo,

On 03/29/2016 12:25 AM, Seung-Woo Kim wrote:
> Hello Javier,
>=20
> On 2016=EB=85=84 03=EC=9B=94 29=EC=9D=BC 11:41, Javier Martinez Canil=
las wrote:
>> Hello Seung-Woo,
>>
>> Thanks a lot for your feedback.
>>
>> On 03/28/2016 09:46 PM, Seung-Woo Kim wrote:
>>> Hi Javier,
>>>
>>> On 2016=EB=85=84 03=EC=9B=94 29=EC=9D=BC 10:28, Javier Martinez Can=
illas wrote:
>>>> Hello Inki,
>>>>
>>>> This patch series contains some fixes for the Kconfig symbol depen=
dencies
>>>> of the Exynos DRM driver. They make sure that the Exynos DRM compo=
nents
>>>> and the media platform drivers that makes use of the same HW IP bl=
ock are
>>>> not enabled at the same time.
>>>>
>>>> Best regards,
>>>> Javier
>>>>
>>>>
>>>> Javier Martinez Canillas (3):
>>>>   drm/exynos: Use VIDEO_SAMSUNG_S5P_G2D=3Dn as G2D Kconfig depende=
ncy
>>>>   drm/exynos: Use VIDEO_SAMSUNG_EXYNOS_GSC=3Dn as GSC Kconfig depe=
ndency
>>>>   drm/exynos: Make DRM_EXYNOS_FIMC depend on VIDEO_S5P_FIMC=3Dn
>>>
>>> In G2D case, there is only one instance, but for the other cases, t=
here
>>> are several instances and in my environment, I enable both drivers =
on
>>> v4l2 and drm FIMC/GSC.
>>>
>>> So, IMHO, the not-enabled v4l2 dependency is not really required fo=
r drm
>>> fimc and drm gsc.
>>>
>>
>> I'm confused, it was you who added the depends on !VIDEO_SAMSUNG_EXY=
NOS_GSC
>> for DRM_EXYNOS_GSC in commit aeefb36832e5 ("drm/exynos: gsc: add dev=
ice tree
>> support and remove usage of static mappings").
>=20
> Yes, you are right. Originally, my goal on the GSC was bringing optio=
nal
> flag for setting isp mode or wb mode like FIMC in tizen.org git tree.
>=20
> https://review.tizen.org/git/?p=3Dplatform/kernel/linux-exynos.git;a=3D=
blobdiff;f=3DDocumentation/devicetree/bindings/media/exynos5-gsc.txt;h=3D=
d526777a3abd04d244c46fdd729e3df93bb86917;hp=3D0604d42f38d1941526d47ad11=
a958a2a83797f97;hb=3D751cd6d88d9620c83042641b52fdd244408a3947;hpb=3D7c7=
ab44f86d64ba6a6733da8f201a26a6c0e807f
>=20
> But only devicetree part of GSC was upstreamed and simultaneous enabl=
ing
> both v4l2 gsc and drm gsc driver is removed. The only reason I set bo=
th
> driver simultaneously was enabling video codec, exynos-mfc with gsc t=
o
> convert RGB plane.
>=20
> I know Marek already has plan to integrate yuv plane feature of GSC t=
o
> DRM KMS. Also, for GSC, simultaneous setup is alredy remove, so your
> patch seems better.
>

Ok, thanks for the confirmation. So at least patch 1/3 and 3/3 are need=
ed then.
=20
>>
>> >From the commit message "The driver cannot be used simultaneously w=
ith V4L2
>> Mem2Mem GScaller driver thought". Did that assumption changed and th=
e depend
>> should be removed then? or maybe I misunderstood what you meant.
>>
>> Now, I'm not really sure about FIMC either, it was feedback I got fr=
om this
>> patch [0]. Could you please take a look to that and let me know if e=
nabling
>> these drivers simultaneously makes sense then?
>=20
> About FIMC, there is still simultaneous setup for both v4l2 and drm
> driver with devicetree binding flags, samsung,isp-wb and samsung,lcd-=
wb.
>=20
> If on the FIMC instance of dt node, samsung,lcd-wb is set, then drm
> driver is probed, otherwise v4l2 driver is probed.
>=20

Interesting, I didn't know about these DT properties. I see that some F=
IMC nodes
are using both though like in arch/arm/boot/dts/exynos4x12.dtsi. Is tha=
t a bug?

So if both the DRM and V4L2 drivers can be enabled at the same time for=
 FIMC,
then patch 3/3 should be dropped and instead the exynos_defconfig patch=
 that
enables CONFIG_VIDEO_S5P_FIMC should be picked IMHO.

> Simultaneous FIMC driver is also only for RGB converting of video cod=
ec
> planes like GSC at least to me.
>=20
> Marek, do you have any idea about the simultaneous setup for fimc and=
 gsc?
>=20
> Best Regards,
> - Seung-Woo Kim
>=20
>>
>>> Best Regards,
>>> - Seung-Woo Kim
>>>
>>>>
>>>>  drivers/gpu/drm/exynos/Kconfig | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>
>>
>> [0]: https://lkml.org/lkml/2016/3/23/292
>>
>> Best regards,
>>
>=20

Best regards,
--=20
Javier Martinez Canillas
Open Source Group
Samsung Research America
