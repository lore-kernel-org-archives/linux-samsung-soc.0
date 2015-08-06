From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos/fimc: fix runtime pm support
Date: Thu, 06 Aug 2015 20:57:20 +0900
Message-ID: <55C34BA0.4080100@samsung.com>
References: <1428569160-20628-1-git-send-email-m.szyprowski@samsung.com>
 <55C3334B.9060907@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40185 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751401AbbHFL5W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Aug 2015 07:57:22 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NSN02O05T7KAZ00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Aug 2015 20:57:21 +0900 (KST)
In-reply-to: <55C3334B.9060907@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, jy0922.shim@samsung.com

On 2015=EB=85=84 08=EC=9B=94 06=EC=9D=BC 19:13, Marek Szyprowski wrote:
> Hello,
>=20
> On 2015-04-09 10:46, Marek Szyprowski wrote:
>> Once pm_runtime_set_active() gets called, the kernel assumes that gi=
ven
>> device has already enabled runtime pm and will call pm_runtime_suspe=
nd()
>> without matching pm_runtime_resume(). In case of DRM FIMC IPP driver=
,
>> this will result in calling clk_disable() without respective call to
>> clk_enable(). This patch removes call to pm_runtime_set_active() to
>> ensure that pm_runtime_suspend/resume calls will match.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>=20
> Gentle ping...

Sorry, I missed it. Merged.

Thanks,
Inki Dae

>=20
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_fimc.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>> b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>> index 842d6b8dc3c4..2a652359af64 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>> @@ -1745,7 +1745,6 @@ static int fimc_probe(struct platform_device *=
pdev)
>>       spin_lock_init(&ctx->lock);
>>       platform_set_drvdata(pdev, ctx);
>>   -    pm_runtime_set_active(dev);
>>       pm_runtime_enable(dev);
>>         ret =3D exynos_drm_ippdrv_register(ippdrv);
>=20
> Best regards
