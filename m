From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 00/12] drm/exynos/ipp: image post processing improvements,
 part three
Date: Mon, 21 Jul 2014 11:23:01 +0200
Message-ID: <53CCDBF5.9080605@samsung.com>
References: <1404393037-17299-1-git-send-email-a.hajda@samsung.com>
 <53BD5615.8060900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34211 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753031AbaGUJX3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 05:23:29 -0400
In-reply-to: <53BD5615.8060900@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

Hi Inki,

On 07/09/2014 04:47 PM, Inki Dae wrote:
> On 2014=EB=85=84 07=EC=9B=94 03=EC=9D=BC 22:10, Andrzej Hajda wrote:
>> This set of independent patches contains various improvement and fix=
es
>> for exynos_drm ipp framework.
>> The patchset is based on exynos-drm-next branch.
>>
> Did you test ipp module using libdrm? If so, can you share the app? I
> would try to test this patch series before merging them. Mainline lib=
drm
> has no any ipp interfaces.

I have used ipptest program developed by you :), with minor changes.
More advanced tests are on my TODO list, but for this patchset ipptest
seems to be OK - the patches are mainly cleanup patches.

Regards
Andrzej

>
> Thanks,
> Inki Dae
>
>> Regards
>> Andrzej
>>
>>
>> Andrzej Hajda (12):
>>   drm/exynos/ipp: remove type casting
>>   drm/exynos/ipp: remove unused field from exynos_drm_ipp_private
>>   drm/exynos/ipp: remove struct exynos_drm_ipp_private
>>   drm/exynos/ipp: correct address type
>>   drm/exynos/ipp: remove temporary variable
>>   drm/exynos/ipp: remove incorrect checks of list_first_entry result
>>   drm/exynos/ipp: simplify memory check function
>>   drm/exynos/ipp: remove useless registration checks
>>   drm/exynos/ipp: simplify ipp_find_obj
>>   drm/exynos/ipp: remove redundant messages
>>   drm/exynos/ipp: simplify ipp_create_id
>>   drm/exynos/ipp: simplify ipp_find_driver
>>
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h |   7 +-
>>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 259 +++++++++------------=
-----------
>>  drivers/gpu/drm/exynos/exynos_drm_ipp.h |   4 +-
>>  3 files changed, 73 insertions(+), 197 deletions(-)
>>
>
