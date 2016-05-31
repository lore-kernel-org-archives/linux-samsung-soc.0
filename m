From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/3] drm/exynos: fimd: add HW trigger support
Date: Wed, 01 Jun 2016 08:50:29 +0900
Message-ID: <574E2345.60007@samsung.com>
References: <1459844864-12065-1-git-send-email-inki.dae@samsung.com>
 <1459844864-12065-3-git-send-email-inki.dae@samsung.com>
 <CGME20160530225902epcas1p3e7c8a92c4ace6560e788f084ef44eef8@epcas1p3.samsung.com>
 <a8e410dd-ef60-f8cd-f4ea-cf60414db5bd@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52664 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756662AbcEaXuc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 May 2016 19:50:32 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O820339IFK58G00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Jun 2016 08:50:29 +0900 (KST)
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
>=20
> So for example with the following diff on top of v4.7-rc1, display wo=
rks
> again. Do you have any hints about what could be the issue?

Right, there is a regression on boards with i80 Panel and in case that =
bootloader set trigger mode to SW trigger. The current trigger mode sho=
uld be changed to other one after entering into PSR mode of Panel devic=
e according to HW guy's saying. If the panel doesn't support the PSR mo=
de, then the mode should be changed after Panel power off and on again.=
 I don't understand exactly what is the PSR mode so I need more details=
 about PSR mode.

I will fix it soon.

Thanks,
Inki Dae =20


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
