From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/3] DMA: PL330: Infer transfer direction from transfer
 request instead of platform data
Date: Tue, 23 Aug 2011 14:55:18 +0530
Message-ID: <CABb+yY21jhuVxC_zeYSSFb540tanrXdEHwSsXkaPgeKE+xGh3g@mail.gmail.com>
References: <1314049830-9453-1-git-send-email-thomas.abraham@linaro.org>
	<1314049830-9453-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:39852 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754463Ab1HWJZT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 05:25:19 -0400
In-Reply-To: <1314049830-9453-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, vinod.koul@intel.com, Boojin Kim <boojin.kim@samsung.com>

On Tue, Aug 23, 2011 at 3:20 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> The transfer direction for a channel can be inferred from the transfer
> request and the need for specifying transfer direction in platfrom data
> can be eliminated. So the structure definition 'struct dma_pl330_peri'
> is no longer required.
>
> With the 'struct dma_pl330_peri' removed, the dma controller transfer
> capabilities cannot be inferred any longer. Hence, the dma controller
> capabilities is specified using platforme data.
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Looks ok.

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
