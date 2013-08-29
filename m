From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [RFC V3 0/4] dw_mmc platform specific private data and SMU init
Date: Thu, 29 Aug 2013 12:05:17 +0900
Message-ID: <521EBA6D.2070900@samsung.com>
References: <1377691731-7226-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:25563 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752186Ab3H2DFG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 23:05:06 -0400
In-reply-to: <1377691731-7226-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cjb@laptop.org, jh80.chung@samsung.com, tgih.jun@samsung.com, ks.giri@samsung.com, t.figa@samsung.com, alim.akhtar@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Hi Yuvaraj,

I have tested on Exynos4 series.
I didn't test for SMU feature. If Seungwon could test or review and confirm this patch,
then looks good to me.

With exynos4 series,
Tested-by: Jaehoon Chung <jh80.chung@samsung.com> 

Best Regards.
Jaehoon Chung

On 08/28/2013 09:08 PM, Yuvaraj Kumar C D wrote:
> changes from V2:
> 	1.dropped the bypass-smu quirk 
> 		mmc: dw_mmc: exynos: configure SMU in exynos5420.
> 	2.Changed the subject line for this patch
> 	  add a quirk for SMU -> configure SMU in exynos5420
> 	
> 	mmc: dw_mmc: exynos: configure SMU in exynos5420 
> 	was earlier 
> 	mmc: dw_mmc: exynos: add a quirk for SMU.
> 
> changes from V1:
> 	1.Added a new RFC patch 
> 		mmc: dw_mmc: socfpga: move socfpga private init
> 	2.Avoid code duplication in
> 		mmc: dw_mmc: exynos: add a quirk for SMU.
> 
> Yuvaraj Kumar C D (4):
>   mmc: dw_mmc: exynos: move the exynos private init
>   mmc: dw_mmc: socfpga: move socfpga private init
>   mmc: dw_mmc: move the platform specific init call
>   mmc: dw_mmc: exynos: configure SMU in exynos5420.
> 
>  drivers/mmc/host/dw_mmc-exynos.c  |   56 +++++++++++++++++++++++++++----------
>  drivers/mmc/host/dw_mmc-pltfm.c   |    7 -----
>  drivers/mmc/host/dw_mmc-socfpga.c |   29 ++++++++++---------
>  drivers/mmc/host/dw_mmc.c         |    9 ++++++
>  4 files changed, 65 insertions(+), 36 deletions(-)
> 
