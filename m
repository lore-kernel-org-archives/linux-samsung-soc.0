From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v6 07/12] ARM: EXYNOS: remove system mmu initialization
 from exynos tree
Date: Sun, 29 Sep 2013 19:03:06 -0700
Message-ID: <CALiw-2HwQvpHCoJw0JyGn87ZV1vuvqMtPv8i+AcVGQHnAKtEJw@mail.gmail.com>
References: <003a01cde30b$e13c1910$a3b44b30$%cho@samsung.com>
	<CAOw6vbJfi7UhwxgFKmMzO91fnywWZNTRVDLLSWQOkbbU=C5ndA@mail.gmail.com>
	<20130930093500.ffa527f8f5f004e02a9cb187@samsung.com>
	<CAOw6vbKSQ2xTj7__D5F40vRLxU5Yt1NH4zEp4WcRtB1rVK5gQQ@mail.gmail.com>
	<20130930105234.73b5380ec08bf4cc6b2c9677@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:45036 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753213Ab3I3CDI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Sep 2013 22:03:08 -0400
Received: by mail-wg0-f53.google.com with SMTP id x12so4481036wgg.32
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Sep 2013 19:03:06 -0700 (PDT)
In-Reply-To: <20130930105234.73b5380ec08bf4cc6b2c9677@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Cho KyongHo <pullip.cho@samsung.com>
Cc: Sean Paul <seanpaul@chromium.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, Hyunwoong Kim <khw0178.kim@samsung.com>, Joerg Roedel <joro@8bytes.org>, Kukjin Kim <kgene.kim@samsung.com>, Prathyush <prathyush.k@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Subash Patel <supash.ramaswamy@linaro.org>

Hi,

2013/9/29 Cho KyongHo <pullip.cho@samsung.com>:

> Ah, I remember that this is merged.
> I agreed to merge this patch because iommu driver need to be completely changed.
> Whenever I change exynos-iommu driver, synchronizing samsung-next and iommu-next
> branches is a big challenge.
> Thus I decided to remove dependencies to samsung-next branch.
> But I didn't know that the rest of the new driver is not merged soon. :(
> I am sorry about that.
>
> new patch (v10) will be posted soon.

Will the v10 patch set be incremental based on v6?

How have you tested v10 on mainline?

Thanks,

-Olof
