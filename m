From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v7 0/2] iommu/exynos: Add IOMMU/System MMU driver for
	Samsung Exynos
Date: Thu, 01 Dec 2011 16:29:17 +0900
Message-ID: <045b01ccaffa$ef48c430$cdda4c90$%kim@samsung.com>
References: <1321609650-1329-1-git-send-email-pullip.cho@samsung.com>
 <20111123114626.GH20535@8bytes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54003 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753218Ab1LAH3W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 02:29:22 -0500
In-reply-to: <20111123114626.GH20535@8bytes.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joerg Roedel' <joro@8bytes.org>, 'KyongHo Cho' <pullip.cho@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 'Younglak Kim' <younglak1004.kim@samsung.com>, 'Sanghyun Lee' <sanghyun75.lee@samsung.com>

Joerg Roedel wrote:
> 
> On Fri, Nov 18, 2011 at 06:47:28PM +0900, KyongHo Cho wrote:
> > Changes since v6:
> > - Totally rewrite exynos_iommu_map() and exynos_iommu_unmap() according
> >   to the change in iommu_map() and iommu_unmap().
> > - Change special slab for Lv2 page table to kmalloc().
> 
> Okay, the driver looks good to me now. If there are no further
> objections I am going to merge it for 3.3.
> 

Hi Joerg,

Sorry for late response, I came back just now from family travelling...

Anyway, that touches many Samsung stuff so it would be better if you could
create separate topic branch which can be merged into Samsung tree. And if
required, please add my ack on them.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
