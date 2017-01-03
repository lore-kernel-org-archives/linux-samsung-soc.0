From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dmaengine: pl330: Fix runtime PM support for terminated
 transfers
Date: Tue, 3 Jan 2017 09:19:23 +0530
Message-ID: <20170103034923.GD3573@localhost>
References: <1481884751-21411-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:21132 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756292AbdACDtb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Jan 2017 22:49:31 -0500
Content-Disposition: inline
In-Reply-To: <1481884751-21411-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Dec 16, 2016 at 11:39:11AM +0100, Marek Szyprowski wrote:
> PL330 DMA engine driver is leaking a runtime reference after any terminated
> DMA transactions. This patch fixes this issue by tracking runtime PM state
> of the device and making additional call to pm_runtime_put() in terminate_all
> callback if needed.

Applied now

-- 
~Vinod
