From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: clear channels only when iommu is enabled
Date: Mon, 03 Aug 2015 17:46:28 +0900
Message-ID: <55BF2A64.9000108@samsung.com>
References: <1438073462-32560-1-git-send-email-jy0922.shim@samsung.com>
 <55BAC22B.4090605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48040 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751629AbbHCIqb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Aug 2015 04:46:31 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NSI0237I0DH7J00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Aug 2015 17:46:29 +0900 (KST)
In-reply-to: <55BAC22B.4090605@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org
Cc: sw0312.kim@samsung.com, m.szyprowski@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 2015=EB=85=84 07=EC=9B=94 31=EC=9D=BC 09:32, Krzysztof Kozlowski wro=
te:
> On 28.07.2015 17:51, Joonyoung Shim wrote:
>> This is simplest solution about reported problem[1]. It's no problem=
 to
>> clear channel only when iommu is enabled, if we consider that we can=
not
>> recognize iommu errors when iommu is disabled and it have been valid
>> until now. But this cannot be nice solution.
>>
>> [1] https://lkml.org/lkml/2015/7/21/404
>>
>> Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>=20
> I tested this patch on my Odroid XU3-Lite with hardkernel u-boot and =
it
> fixes the booting hang. Thanks!

Thanks for the test.

This patch fixes the booting hang issue but I'm not sure of this patch
being able to resolve the issue clearly.

In relation to this, I tried to resolve the issue using sub driver
stuff, which makes a probe callback for fimd sub driver to be called
after crtc and connector binding is completed.

I guessed that with this, ACLK_200_DISP1 would be enabled by connector
driver - mipi dsi or panel driver. However, the moment that the clock i=
s
enabled is at mode setting operation so the patch doesn't resolve the
issue because the callback I added will be called before mode setting
operation.

So the solution we could try would be to make FIMD driver to enable
relevant clock in case of Exynos5422 SoC. However, this way is also not
clear to me because it is required for additional device tree binding.

Anyway, I merged below patch so let's resolve this issue with more
generic way later.

P.s., I removed the patch which incurred the kernel hang issue from
exynos-drm-fixes, and moved it to exynos-drm-next with below patch so
now there must be no any problem with exynos-drm-fixes.

Thanks,
Inki Dae

>=20
> The test was not thorough - only booting and without any display outp=
ut
> (HDMI).
>=20
> Best regards,
> Krzysztof
>=20
>=20
>> ---
>> v2: add Reported-by.
>>
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/=
drm/exynos/exynos_drm_fimd.c
>> index 8d362b9..337af02 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -956,7 +956,8 @@ static int fimd_bind(struct device *dev, struct =
device *master, void *data)
>>  	if (ctx->display)
>>  		exynos_drm_create_enc_conn(drm_dev, ctx->display);
>> =20
>> -	fimd_clear_channels(ctx->crtc);
>> +	if (is_drm_iommu_supported(drm_dev))
>> +		fimd_clear_channels(ctx->crtc);
>> =20
>>  	ret =3D drm_iommu_attach_device(drm_dev, dev);
>>  	if (ret)
>>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
