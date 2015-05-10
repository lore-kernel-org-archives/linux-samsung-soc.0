From: Cho KyongHo <pullip.cho@samsung.com>
Subject: Re: [PATCH v6 11/25] iommu: exynos: add support for binding more than
 one sysmmu to master device
Date: Sun, 10 May 2015 22:34:37 +0900
Message-ID: <20150510223437.b651f6d2f3f0ead49eb72488@samsung.com>
References: <1430727380-10912-1-git-send-email-m.szyprowski@samsung.com>
 <1430727380-10912-12-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24145 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038AbbEJNek (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 May 2015 09:34:40 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NO400B4GZ1QCH30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 10 May 2015 22:34:38 +0900 (KST)
In-reply-to: <1430727380-10912-12-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, Shaik Ameer Basha <shaik.ameer@samsung.com>, Joerg Roedel <joro@8bytes.org>, Thierry Reding <treding@nvidia.com>, Olof Johansson <olof@lixom.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, Will Deacon <will.deacon@arm.com>, David Wodhouse <dwmw2@infradead.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>

On Mon, 04 May 2015 10:16:06 +0200 Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> This patch adds support for assigning more than one SYSMMU controller to
> the master device. This has been achieved simply by chaning the struct
> device pointer in struct exynos_iommu_owner into the list of struct
> sysmmu_drvdata of all controllers assigned to the given master device.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/iommu/exynos-iommu.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index f2eceb6605c5..598660c87410 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -186,7 +186,7 @@ static char *sysmmu_fault_name[SYSMMU_FAULTS_NUM] = {
>  
>  /* attached to dev.archdata.iommu of the master device */
>  struct exynos_iommu_owner {
> -	struct device *sysmmu;
> +	struct list_head clients;

'clients' is the list of System MMUs that are assigned to the same iommu
domain. I don't think clients is not a good list name for exynos_iommu_owner
even though the elements are the same because they are used in different
contexts.

-- 
samsung.com <pullip.cho@samsung.com>
