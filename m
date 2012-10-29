From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 4/4] DMA: PL330: add device tree property for DMA_MEMCPY capability
Date: Mon, 29 Oct 2012 22:45:48 +0100
Message-ID: <CABb+yY1Ztu2n38ObXJq+shOoXw6yk0YK39QUHhDN_pJKziAFQg@mail.gmail.com>
References: <1351504796-24788-1-git-send-email-b.zolnierkie@samsung.com>
	<1351504796-24788-5-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:55739 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933095Ab2J2Vpt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Oct 2012 17:45:49 -0400
In-Reply-To: <1351504796-24788-5-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, vinod.koul@intel.com, kgene.kim@samsung.com, rob.herring@calxeda.com, dinguyen@altera.com, pawel.moll@arm.com, t.figa@samsung.com, kyungmin.park@samsung.com

On Mon, Oct 29, 2012 at 10:59 AM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> * Add device tree (DT) property ("pl330,dma-memcpy") for DMA_MEMCPY
>   capability and instead of setting this capability unconditionally
>   in pl330_probe() do it only when property is present.
>
Perhaps we should pass the array of peripheral interfaces via DT, the
lack of which could imply MEMCPY capability ? (while it works, I doubt
if pl330 is supposed to have SLAVE and MEMCPY capabilities in any
instance)
That would also be a step towards discarding "struct dma_pl330_platdata".
