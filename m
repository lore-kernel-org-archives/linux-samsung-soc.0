From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/3] drm/exynos: fimd: add HW trigger support
Date: Wed, 01 Jun 2016 14:56:36 +0900
Message-ID: <574E7914.3020201@samsung.com>
References: <1459844864-12065-1-git-send-email-inki.dae@samsung.com>
 <1459844864-12065-3-git-send-email-inki.dae@samsung.com>
 <CGME20160530225859epcas1p1cd4e0ee36c138ad9ea17f3f5885e8cdb@epcas1p1.samsung.com>
 <a8e410dd-ef60-f8cd-f4ea-cf60414db5bd@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33101 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757229AbcFAF4i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 01:56:38 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O82006R1WICWOC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Jun 2016 14:56:36 +0900 (KST)
In-reply-to: <a8e410dd-ef60-f8cd-f4ea-cf60414db5bd@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org

Hi Javier,

2016=EB=85=84 05=EC=9B=94 31=EC=9D=BC 07:58=EC=97=90 Javier Martinez Ca=
nillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hello Inki,
>=20
> On 04/05/2016 04:27 AM, Inki Dae wrote:
>> This patch adds HW trigger support on i80 mode.
>>
>> Until now, Exynos DRM only supported SW trigger which was set
>> SWTRGCMD bit of TRIGCON register by CPU to transfer scanout
>> buffer to Display bus device or panel.
>>
>> With this patch, the transmission to Display bus device or
>> panel will be initiated by FIMD controller.
>>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> ---
>=20
> There is a regression for the Exynos5800 Peach Pi Chromebook display =
due
> this patch. The display is blank and I noticed that it only happens w=
hen
> HW start trigger is enabled, but works with SW trigger (as it was bef=
ore).

Posted below pathch,
[PATCH] drm/exynos: fimd: fix trigger mode change regression

Can you test it again with the patch? I have no HW to test it. :(

Thanks,
Inki Dae

>=20
> So for example with the following diff on top of v4.7-rc1, display wo=
rks
> again. Do you have any hints about what could be the issue?
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 0444d7fc400d..8c62830e9514 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -171,7 +171,7 @@ static struct fimd_driver_data exynos5420_fimd_dr=
iver_data =3D {
>  	.lcdblk_vt_shift =3D 24,
>  	.lcdblk_bypass_shift =3D 15,
>  	.lcdblk_mic_bypass_shift =3D 11,
> -	.trg_type =3D I80_HW_TRG,
>  	.has_shadowcon =3D 1,
>  	.has_vidoutcon =3D 1,
>  	.has_vtsel =3D 1,
>=20
> Best regards,
>=20
