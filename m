From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: use logical AND in
 exynos_drm_plane_check_size()
Date: Mon, 13 Jun 2016 10:34:24 +0900
Message-ID: <575E0DA0.3000204@samsung.com>
References: <1464179407-9004-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CGME20160610102416epcas1p42e4f3f3de00104a37b7c1e4caf503af9@epcas1p4.samsung.com>
 <575A9291.6020906@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39539 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933059AbcFMBe1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Jun 2016 21:34:27 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O8O02EG8SDCOY30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2016 10:34:24 +0900 (KST)
In-reply-to: <575A9291.6020906@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

Picked it up.

Thanks,
Inki Dae

2016=EB=85=84 06=EC=9B=94 10=EC=9D=BC 19:12=EC=97=90 Tobias Jakobi =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Ping!
>=20
> - Tobias
>=20
> Tobias Jakobi wrote:
>> The current bitwise AND should result in the same assembler
>> but this is what the code is actually supposed to do.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu=
/drm/exynos/exynos_drm_plane.c
>> index b3f3c2c..e4a1a63 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> @@ -226,7 +226,7 @@ exynos_drm_plane_check_size(const struct exynos_=
drm_plane_config *config,
>>  	    state->v_ratio =3D=3D (1 << 15))
>>  		height_ok =3D true;
>> =20
>> -	if (width_ok & height_ok)
>> +	if (width_ok && height_ok)
>>  		return 0;
>> =20
>>  	DRM_DEBUG_KMS("scaling mode is not supported");
>>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
>=20
