From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: init vblank with real number of crtcs
Date: Wed, 08 Oct 2014 00:28:28 +0900
Message-ID: <5434069C.3030004@samsung.com>
References: <1411131440-15395-1-git-send-email-a.hajda@samsung.com>
 <5433DC15.5000000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38417 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753122AbaJGP2a convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 11:28:30 -0400
In-reply-to: <5433DC15.5000000@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene.kim@samsung.com>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, drake@endlessm.com, daniel@ffwll.ch, m.szyprowski@samsung.com


Sorry for late.

On 2014=EB=85=84 10=EC=9B=94 07=EC=9D=BC 21:27, Andrzej Hajda wrote:
> Hi Inki,
>=20
> Gently ping.
>=20
> Andrzej
>=20
>=20
> On 09/19/2014 02:57 PM, Andrzej Hajda wrote:
>> Initialization of vblank with MAX_CRTC caused attempts
>> to disabling vblanks for non-existing crtcs in case
>> drm used fewer crtcs. The patch fixes it.

Nice catch~ This patch also resolves unbind issue. When exynos driver i=
s
unbound, disable_vblank callback is called as dev->num_crtcs so if the
number of probed crtc drivers is different from the one of enabled crtc
drivers then it could attempt to disabling vblank for non-existing crtc=
,
which in turn, null pointer access occurs.

Thanks,
Inki Dae

>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/d=
rm/exynos/exynos_drm_drv.c
>> index 9b00e4e..dc4affd 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -94,10 +94,6 @@ static int exynos_drm_load(struct drm_device *dev=
, unsigned long flags)
>>  	/* init kms poll for handling hpd */
>>  	drm_kms_helper_poll_init(dev);
>> =20
>> -	ret =3D drm_vblank_init(dev, MAX_CRTC);
>> -	if (ret)
>> -		goto err_mode_config_cleanup;
>> -
>>  	/* setup possible_clones. */
>>  	exynos_drm_encoder_setup(dev);
>> =20
>> @@ -106,22 +102,26 @@ static int exynos_drm_load(struct drm_device *=
dev, unsigned long flags)
>>  	/* Try to bind all sub drivers. */
>>  	ret =3D component_bind_all(dev->dev, dev);
>>  	if (ret)
>> -		goto err_cleanup_vblank;
>> +		goto err_mode_config_cleanup;
>> +
>> +	ret =3D drm_vblank_init(dev, dev->mode_config.num_crtc);
>> +	if (ret)
>> +		goto err_unbind_all;
>> =20
>>  	/* Probe non kms sub drivers and virtual display driver. */
>>  	ret =3D exynos_drm_device_subdrv_probe(dev);
>>  	if (ret)
>> -		goto err_unbind_all;
>> +		goto err_cleanup_vblank;
>> =20
>>  	/* force connectors detection */
>>  	drm_helper_hpd_irq_event(dev);
>> =20
>>  	return 0;
>> =20
>> -err_unbind_all:
>> -	component_unbind_all(dev->dev, dev);
>>  err_cleanup_vblank:
>>  	drm_vblank_cleanup(dev);
>> +err_unbind_all:
>> +	component_unbind_all(dev->dev, dev);
>>  err_mode_config_cleanup:
>>  	drm_mode_config_cleanup(dev);
>>  	drm_release_iommu_mapping(dev);
>> @@ -138,8 +138,8 @@ static int exynos_drm_unload(struct drm_device *=
dev)
>>  	exynos_drm_fbdev_fini(dev);
>>  	drm_kms_helper_poll_fini(dev);
>> =20
>> -	component_unbind_all(dev->dev, dev);
>>  	drm_vblank_cleanup(dev);
>> +	component_unbind_all(dev->dev, dev);
>>  	drm_mode_config_cleanup(dev);
>>  	drm_release_iommu_mapping(dev);
>> =20
>>
>=20
>=20
