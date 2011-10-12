From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v6 10/10] ARM: S5PV210: Modify platform data for pl330
 driver
Date: Wed, 12 Oct 2011 12:59:46 +0900
Message-ID: <000801cc8893$61a36510$24ea2f30$%kim@samsung.com>
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
 <1318270538-30450-11-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48683 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221Ab1JLD7s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 23:59:48 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSX006SJPRMKMK0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 12:59:46 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.120.72])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSX003WHPRMUU20@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 12:59:46 +0900 (KST)
In-reply-to: <1318270538-30450-11-git-send-email-thomas.abraham@linaro.org>
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
> Subject: [PATCH v6 10/10] ARM: S5PV210: Modify platform data for pl330
> driver
>
> With the 'struct dma_pl330_peri' removed, the platfrom data for dma
> driver can be simplified to a simple list of peripheral request ids.
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-s5pv210/dma.c |  241 ++++++++++++-----------------------
> -------
>  1 files changed, 69 insertions(+), 172 deletions(-)
>
Looks good to me.
Acked-by: Boojin Kim <boojin.kim@samsung.com>
