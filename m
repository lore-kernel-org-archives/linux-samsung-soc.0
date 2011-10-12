From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v6 02/10] DMA: PL330: Infer transfer direction from
 transfer request instead of platform data
Date: Wed, 12 Oct 2011 13:01:48 +0900
Message-ID: <000901cc8893$aa37b790$fea726b0$%kim@samsung.com>
References: <1318270538-30450-1-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-2-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-3-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49668 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707Ab1JLECB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 00:02:01 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSX006VPPUVKMK0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 13:01:48 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.120.72])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSX0045HPV07E00@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 13:01:48 +0900 (KST)
In-reply-to: <1318270538-30450-3-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, vinod.koul@intel.com, 'Jassi Brar' <jassisinghbrar@gmail.com>

Thomas Abraham wrote:

> Sent: Tuesday, October 11, 2011 3:16 AM
> To: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org; kgene.kim@samsung.com;
> vinod.koul@intel.com; Jassi Brar; Boojin Kim
> Subject: [PATCH v6 02/10] DMA: PL330: Infer transfer direction from
> transfer request instead of platform data
>
> The transfer direction for a channel can be inferred from the transfer
> request and the need for specifying transfer direction in platfrom
> data
> can be eliminated. So the structure definition 'struct dma_pl330_peri'
> is no longer required.
>
> The channel's private data is set to point to a channel id specified
> in
> the platform data (instead of an instance of type 'struct
> dma_pl330_peri').
> The filter function is correspondingly modified to match the channel
> id.
>
> With the 'struct dma_pl330_peri' removed from platform data, the dma
> controller transfer capabilities cannot be inferred any more. Hence,
> the dma controller capabilities is specified using platform data.
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> ---
>  drivers/dma/pl330.c        |   65 +++++++++++---------------------------
> ------
>  include/linux/amba/pl330.h |   13 ++-------
>  2 files changed, 19 insertions(+), 59 deletions(-)
>

Looks good to me.
Acked-by: Boojin Kim <boojin.kim@samsung.com>
