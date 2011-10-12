From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v6 09/10] ARM: S5PC100: Modify platform data for pl330
 driver
Date: Wed, 12 Oct 2011 12:58:03 +0900
Message-ID: <000701cc8893$246a2d50$6d3e87f0$%kim@samsung.com>
References: <1318270538-30450-1-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-2-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-3-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-4-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-5-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-6-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-7-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-8-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-9-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-10-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63569 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751252Ab1JLD6P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 23:58:15 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSX00KYBPOA7VK0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 12:58:04 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.120.72])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSX005YWPOR3D40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 12:58:04 +0900 (KST)
In-reply-to: <1318270538-30450-10-git-send-email-thomas.abraham@linaro.org>
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
> Subject: [PATCH v6 09/10] ARM: S5PC100: Modify platform data for pl330
> driver
>
> With the 'struct dma_pl330_peri' removed, the platfrom data for dma
> driver can be simplified to a simple list of peripheral request ids.
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-s5pc100/dma.c |  247 ++++++++++++-----------------------
> --------
>  1 files changed, 69 insertions(+), 178 deletions(-)
>

Looks good to me.
Acked-by: Boojin Kim <boojin.kim@samsung.com>

> diff --git a/arch/arm/mach-s5pc100/dma.c b/arch/arm/mach-s5pc100/dma.c
> index 065a087..8dfdc76 100644
> --- a/arch/arm/mach-s5pc100/dma.c
> +++ b/arch/arm/mach-s5pc100/dma.c
> @@ -35,100 +35,42 @@
>
>  static u64 dma_dmamask = DMA_BIT_MASK(32);
>
