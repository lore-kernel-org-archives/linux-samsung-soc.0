From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: g2d: drop the _REG postfix from the stride
 defines
Date: Mon, 13 Jun 2016 10:34:38 +0900
Message-ID: <575E0DAE.8010603@samsung.com>
References: <1464180176-10463-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CGME20160610102412epcas1p32081b590cf576a9e5e2ecb9375597d22@epcas1p3.samsung.com>
 <575A92A9.4010109@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47881 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933059AbcFMBem (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Jun 2016 21:34:42 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O8O000AESDRZY20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2016 10:34:39 +0900 (KST)
In-reply-to: <575A92A9.4010109@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

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
>> This makes the defines consistent with the rest.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/d=
rm/exynos/exynos_drm_g2d.c
>> index 01b72b9..0934d38 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
>> @@ -48,13 +48,13 @@
>> =20
>>  /* registers for base address */
>>  #define G2D_SRC_BASE_ADDR		0x0304
>> -#define G2D_SRC_STRIDE_REG		0x0308
>> +#define G2D_SRC_STRIDE			0x0308
>>  #define G2D_SRC_COLOR_MODE		0x030C
>>  #define G2D_SRC_LEFT_TOP		0x0310
>>  #define G2D_SRC_RIGHT_BOTTOM		0x0314
>>  #define G2D_SRC_PLANE2_BASE_ADDR	0x0318
>>  #define G2D_DST_BASE_ADDR		0x0404
>> -#define G2D_DST_STRIDE_REG		0x0408
>> +#define G2D_DST_STRIDE			0x0408
>>  #define G2D_DST_COLOR_MODE		0x040C
>>  #define G2D_DST_LEFT_TOP		0x0410
>>  #define G2D_DST_RIGHT_BOTTOM		0x0414
>> @@ -560,7 +560,7 @@ static enum g2d_reg_type g2d_get_reg_type(int re=
g_offset)
>> =20
>>  	switch (reg_offset) {
>>  	case G2D_SRC_BASE_ADDR:
>> -	case G2D_SRC_STRIDE_REG:
>> +	case G2D_SRC_STRIDE:
>>  	case G2D_SRC_COLOR_MODE:
>>  	case G2D_SRC_LEFT_TOP:
>>  	case G2D_SRC_RIGHT_BOTTOM:
>> @@ -570,7 +570,7 @@ static enum g2d_reg_type g2d_get_reg_type(int re=
g_offset)
>>  		reg_type =3D REG_TYPE_SRC_PLANE2;
>>  		break;
>>  	case G2D_DST_BASE_ADDR:
>> -	case G2D_DST_STRIDE_REG:
>> +	case G2D_DST_STRIDE:
>>  	case G2D_DST_COLOR_MODE:
>>  	case G2D_DST_LEFT_TOP:
>>  	case G2D_DST_RIGHT_BOTTOM:
>> @@ -961,8 +961,8 @@ static int g2d_check_reg_offset(struct device *d=
ev,
>>  			} else
>>  				buf_info->types[reg_type] =3D BUF_TYPE_GEM;
>>  			break;
>> -		case G2D_SRC_STRIDE_REG:
>> -		case G2D_DST_STRIDE_REG:
>> +		case G2D_SRC_STRIDE:
>> +		case G2D_DST_STRIDE:
>>  			if (for_addr)
>>  				goto err;
>> =20
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
