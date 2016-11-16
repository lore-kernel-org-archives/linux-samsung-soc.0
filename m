From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 0/8] DMA: s3c64xx: Conversion to the new channel request
 API
Date: Wed, 16 Nov 2016 08:56:20 +0530
Message-ID: <20161116032620.GV3000@localhost>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:32359 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752445AbcKPDQ5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 22:16:57 -0500
Content-Disposition: inline
In-Reply-To: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, arnd@arndb.de
Cc: krzk@kernel.org, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On Thu, Nov 10, 2016 at 04:17:48PM +0100, Sylwester Nawrocki wrote:
> This patch series aims to convert the s3c64xx platform to use
> the new DMA channel request API, i.e. this is only meaningful 
> for non-dt systems using s3c64xx SoCs.
> 
> Presumably the first 2 or 4 patches in this series could be queued 
> for v4.10-rc1 and the remaining patches could be left for subsequent
> release, to avoid non-trivial conflict with patches already applied 
> in the ASoC tree.

I am fine with dma patch (expect the subsystem tag) and others except arm
ones have acks, so I think we can merge this for v4.10-rc1. I cna create a
immutable tag and people can merge into their tree in case they have
dependencies.

Btw need acks on ARM patches before I can apply

Thanks

-- 
~Vinod
