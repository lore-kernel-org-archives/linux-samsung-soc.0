From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: dpi: Fix NULL pointer dereference with legacy
 bindings
Date: Wed, 18 Jun 2014 14:06:12 +0900
Message-ID: <53A11E44.2090502@samsung.com>
References: <1402433877-10867-1-git-send-email-tomasz.figa@gmail.com>
 <53A0D8BC.7050607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10786 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933925AbaFRFGO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 01:06:14 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7C004GJM6D5R80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jun 2014 14:06:13 +0900 (KST)
In-reply-to: <53A0D8BC.7050607@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Andrzej Hajda <a.hajda@samsung.com>

On 2014=EB=85=84 06=EC=9B=94 18=EC=9D=BC 09:09, Tomasz Figa wrote:
> On 10.06.2014 22:57, Tomasz Figa wrote:
>> If there is no panel node in DT and instead display timings are prov=
ided
>> directly in FIMD node, there is no panel object created and ctx->pan=
el
>> becomes NULL. However during Exynos DRM initialization
>> drm_helper_hpd_irq_event() is called, which in turns calls
>> exynos_dpi_detect(), which dereferences ctx->panel without a check,
>> causing a NULL pointer derefrence.
>>
>> This patch fixes the issue by adding necessary NULL pointer check.
>>
>> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/d=
rm/exynos/exynos_drm_dpi.c
>> index f1b8587..f44bd90 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
>> @@ -40,7 +40,7 @@ exynos_dpi_detect(struct drm_connector *connector,=
 bool force)
>>  {
>>  	struct exynos_dpi *ctx =3D connector_to_dpi(connector);
>> =20
>> -	if (!ctx->panel->connector)
>> +	if (ctx->panel && !ctx->panel->connector)
>>  		drm_panel_attach(ctx->panel, &ctx->connector);
>> =20
>>  	return connector_status_connected;
>>
>=20
> Ping.

Applied.

Thanks,
Inki Dae

>=20
> Best regards,
> Tomasz
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
