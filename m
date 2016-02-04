From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 02/10] drm/exynos: ipp: fix incorrect format specifiers in
 debug messages
Date: Thu, 04 Feb 2016 11:45:37 +0900
Message-ID: <56B2BB51.5030504@samsung.com>
References: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
 <1454503374-16382-3-git-send-email-m.szyprowski@samsung.com>
 <56B2B4BC.1040708@samsung.com> <56B2B8A8.3090409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31144 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755683AbcBDCpi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Feb 2016 21:45:38 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O20006HZ5004Z60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Feb 2016 02:45:36 +0000 (GMT)
In-reply-to: <56B2B8A8.3090409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 04.02.2016 11:34, Inki Dae wrote:
>=20
>=20
> 2016=EB=85=84 02=EC=9B=94 04=EC=9D=BC 11:17=EC=97=90 Krzysztof Kozlow=
ski =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> On 03.02.2016 21:42, Marek Szyprowski wrote:
>>> Drivers should use %p for printing pointers instead of hardcoding t=
hem
>>> as hexadecimal integers. This patch fixes compilation warnings on 6=
4bit
>>> architectures.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>  drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  2 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_gsc.c     |  2 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_ipp.c     | 32 ++++++++++++++---=
------------
>>>  drivers/gpu/drm/exynos/exynos_drm_rotator.c |  2 +-
>>>  4 files changed, 19 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu=
/drm/exynos/exynos_drm_fimc.c
>>> index c747824..8a4f4a0 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>>> @@ -1723,7 +1723,7 @@ static int fimc_probe(struct platform_device =
*pdev)
>>>  		goto err_put_clk;
>>>  	}
>>> =20
>>> -	DRM_DEBUG_KMS("id[%d]ippdrv[0x%x]\n", ctx->id, (int)ippdrv);
>>> +	DRM_DEBUG_KMS("id[%d]ippdrv[%p]\n", ctx->id, ippdrv);
>>
>> I don't oppose the patch itself but I have different concern. First =
-
>> probably you meant %pK because this is a writeable structure with
>> function pointers.
>> Second - why the ippdrv has to be printed? Is it useful for debuggin=
g?
>=20
> Marek fixed just compilation warnings on ARM64 so yes it wouldn't nee=
d to print out ippdrv address but as other cleanup patch.

Another patch?

There is no point in a flow like this:
1. Make a patch which changes %x to %p.
2. Make a second patch right after the first one which changes %p to %p=
K.
3. Optionally make a third patch removing %pK entirely.

There are two issues here (and in other places like in patch 3/10) -
64bit compilation warnings and security related issues. Properly fixing
security related issues would fix in the same time the compilation
warnings...

Best regards,
Krzysztof
