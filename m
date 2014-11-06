From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/9] drm/exynos: remove uneeded declaration of struct
 dma_iommu_mapping
Date: Thu, 06 Nov 2014 21:44:14 +0900
Message-ID: <545B6D1E.4070104@samsung.com>
References: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
 <20141106123847.GB30193@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58368 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751051AbaKFMoQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Nov 2014 07:44:16 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEM00BN8BDQ2640@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Nov 2014 21:44:14 +0900 (KST)
In-reply-to: <20141106123847.GB30193@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org


Hi Gustavo,

On 2014=EB=85=84 11=EC=9B=94 06=EC=9D=BC 21:38, Gustavo Padovan wrote:
>=20
> Hi Inki,
>=20
> Could you please give a review to this series?

It looks good to me. This patch series is just cleanup but not test so =
I
will merge them next week after testing if there is no any comment.

Thanks,
Inki Dae

>=20
> Thanks.
>=20
> 	Gustavo
>=20
> 2014-10-31 Gustavo Padovan <gustavo@padovan.org>:
>=20
>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>
>> It is not even used in this header anymore.
>>
>> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_iommu.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.h b/drivers/gpu=
/drm/exynos/exynos_drm_iommu.h
>> index 72376d4..35d2588 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_iommu.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
>> @@ -40,7 +40,6 @@ static inline bool is_drm_iommu_supported(struct d=
rm_device *drm_dev)
>> =20
>>  #else
>> =20
>> -struct dma_iommu_mapping;
>>  static inline int drm_create_iommu_mapping(struct drm_device *drm_d=
ev)
>>  {
>>  	return 0;
>> --=20
>> 1.9.3
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
