From: 'Joerg Roedel' <joro@8bytes.org>
Subject: Re: [PATCH v7 0/2] iommu/exynos: Add IOMMU/System MMU driver for
	Samsung Exynos
Date: Sun, 18 Dec 2011 19:02:59 +0100
Message-ID: <20111218180258.GD28302@8bytes.org>
References: <1321609650-1329-1-git-send-email-pullip.cho@samsung.com> <20111123114626.GH20535@8bytes.org> <045b01ccaffa$ef48c430$cdda4c90$%kim@samsung.com> <20111201185821.GL20535@8bytes.org> <04f601ccb0ce$72590550$570b0ff0$%kim@samsung.com> <20111202084922.GM20535@8bytes.org> <4EEE0F02.8070800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from 8bytes.org ([88.198.83.132]:42246 "EHLO 8bytes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751841Ab1LRSDA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Dec 2011 13:03:00 -0500
Content-Disposition: inline
In-Reply-To: <4EEE0F02.8070800@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'KyongHo Cho' <pullip.cho@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 'Younglak Kim' <younglak1004.kim@samsung.com>, 'Sanghyun Lee' <sanghyun75.lee@samsung.com>

On Mon, Dec 19, 2011 at 01:04:18AM +0900, Kukjin Kim wrote:
> Hmm, I cannot find the iommu/exynos branch what you said in your iommu  
> tree yet. Maybe you missed or any problem?

Problems. I tried to apply the patches and there were conflicts. After
solving them I wasn't able to find a kernel-config for Exynos that
conpiled for upstream Linux.
Additionally new objections were raised about the patches. Enough to not
merge these patches at this point. When I have a config to at least
compile-test the code you send me and repost the patches rebased to a
recent upstream commit with the objections fixed I can retry to merge
it.


Thanks,

	Joerg
