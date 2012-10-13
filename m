From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2 0/4] DMA: PL330: Fix mem leaks and balance probe/remove
Date: Sat, 13 Oct 2012 16:33:32 +0530
Message-ID: <CABb+yY2a_QEPvrT6yPBz1gM_avBTH2GRRD3bUKk+mCCMGgcfuQ@mail.gmail.com>
References: <1349432276-22919-1-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:57885 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751166Ab2JMLDd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Oct 2012 07:03:33 -0400
In-Reply-To: <1349432276-22919-1-git-send-email-inderpal.singh@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inderpal Singh <inderpal.singh@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, boojin.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, kgene.kim@samsung.com

On Fri, Oct 5, 2012 at 3:47 PM, Inderpal Singh
<inderpal.singh@linaro.org> wrote:
> The first 2 patches of this series fix memory leaks because the memory
> allocated for peripheral channels and DMA descriptors were not getting
> freed.
>
> The last 2 patches balance the module's remove function.
>
> This series depends on "61c6e7531d3b66b3 ........DMA: PL330: Check the
> pointer returned by kzalloc" which is on slave-dma's "fixes" branch.
> Hence slave-dma tree's "next" branch was merged with "fixes" and
> applied patch at [1] to fix the build error.
>
> [1] http://permalink.gmane.org/gmane.linux.kernel.next/24274
>
> Changes since v1:
>  - Protect only list_add_tail with spin_locks
>  - Return EBUSY from remove if channel is in use
>  - unregister dma_device in remove
>
> Inderpal Singh (4):
>   DMA: PL330: Free memory allocated for peripheral channels
>   DMA: PL330: Change allocation method to properly free  DMA
>     descriptors
>   DMA: PL330: Balance module remove function with probe
>   DMA: PL330: unregister dma_device in module's remove function
>
>  drivers/dma/pl330.c |   53 ++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 38 insertions(+), 15 deletions(-)
>
All seem fine.
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Thanks.
