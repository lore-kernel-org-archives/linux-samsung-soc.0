From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 11/18] iommu: exynos: remove useless device_add/remove
 callbacks
Date: Wed, 22 Oct 2014 11:54:34 +0200
Message-ID: <54477EDA.3060104@samsung.com>
References: <1410868485-4143-1-git-send-email-m.szyprowski@samsung.com>
 <1410868485-4143-12-git-send-email-m.szyprowski@samsung.com>
 <1413969300.31696.10.camel@gmail.com> <2779319.yKiT9EDCse@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:30265 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754720AbaJVJyp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Oct 2014 05:54:45 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NDU00I46BNY6480@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Oct 2014 10:57:34 +0100 (BST)
In-reply-to: <2779319.yKiT9EDCse@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Alban Browaeys <alban.browaeys@gmail.com>, linux-samsung-soc@vger.kernel.org

Hello,

On 2014-10-22 11:26, Arnd Bergmann wrote:
> On Wednesday 22 October 2014 11:15:00 Alban Browaeys wrote:
>> Le mardi 16 septembre 2014 =C3=A0 13:54 +0200, Marek Szyprowski a =C3=
=A9crit :
>>> The driver doesn't need to do anything important in device add/remo=
ve
>>> callbacks, because initialization will be done from device-tree spe=
cific
>>> callbacks added later. IOMMU groups created by current code were ne=
ver
>>> used.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> The exyons iommu init fails if those are removed, that is it never r=
each
>> init_done:
>> 1. exynos_iommu_setup
>> 2. - exynos_iommu_init
>> 3. ---bus_set_iommu
>> 4. ------ add_iommu_group
>>
>> that is (4) add_iommu_group returns ENODEV to bus_set_iommu, the lat=
ter
>> doing so to exynos_iommu_init. Which thus error out before the init_=
done
>> is set to true.
> On a related note, I found that the exynos iommu driver does not chec=
k
> for the presence of an exynos iommu before calling bus_set_iommu,
> and this breaks multiplatform kernels.
>
> Please fix.

=46or the time being please apply this patch:=20
https://lkml.org/lkml/2014/8/5/163

The proper solution will be applied when driver will be adapted to comm=
on of
iommu support, which is still under discussion.

Best regards
--=20
Marek Szyprowski, PhD
Samsung R&D Institute Poland
