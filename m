From: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu: Initialize domain->handler in
	iommu_domain_alloc()
Date: Thu, 15 Dec 2011 09:10:56 +0100
Message-ID: <20111215081056.GC4475@8bytes.org>
References: <1323760466-30333-1-git-send-email-pullip.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from 8bytes.org ([88.198.83.132]:34658 "EHLO 8bytes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752340Ab1LOIK5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Dec 2011 03:10:57 -0500
Content-Disposition: inline
In-Reply-To: <1323760466-30333-1-git-send-email-pullip.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: KyongHo Cho <pullip.cho@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Sanghyun Lee <sanghyun75.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Younglak Kim <younglak1004.kim@samsung.com>

On Tue, Dec 13, 2011 at 04:14:26PM +0900, KyongHo Cho wrote:
> Since it is not guaranteed that an iommu driver initializes in its
> domain_init() function, it must be initialized with NULL to prevent
> calling a function in an arbitrary location when iommu fault occurred.
> 
> Signed-off-by: KyongHo Cho <pullip.cho@samsung.com>
> ---
>  drivers/iommu/iommu.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 7cc3c65..1afb896 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -148,6 +148,7 @@ struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
>  		return NULL;
>  
>  	domain->ops = bus->iommu_ops;
> +	domain->handler = NULL;

Good catch. But it is better to change the kmalloc in the function to
kzalloc. This will implicitly initialize all future members correctly.

Thanks,

	Joerg
