From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv2 0/2] ARM: dts: Fix the number of DMA channels for
 Exynos3250/4
Date: Wed, 12 Nov 2014 14:38:22 +0900
Message-ID: <5462F24E.7030100@samsung.com>
References: <1415760629-1531-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45511 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752202AbaKLFi0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 00:38:26 -0500
In-reply-to: <1415760629-1531-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: Chanwoo Choi <cw00.choi@samsung.com>, ben-linux@fluff.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Dear Kukjin,

Please ignore this patchset because this patchset are wrong.

Best Regards,
Chanwoo Choi

On 11/12/2014 11:50 AM, Chanwoo Choi wrote:
> This patch fix minor issuse to correct the number of DMA channels for
> Exynos3250 and Exynos4 series. The PL330 DMA of Exynos3250/Exynos4 support
> 16 channels simultaneously but, PL330 DMA driver don't use 'dma-channels'
> property directly. This patchset fix the correct information
> of Exynos3250/Exynos4's PL330 DMA simply.
> 
> Changes from v1:
> - Fix the nubmer for DMA channesl for Exynos4415
> 
> Chanwoo Choi (2):
>   ARM: dts: Fix the number of DMA channels for Exynos3250
>   ARM: dts: Fix the number of DMA channels for Exynos4
> 
>  arch/arm/boot/dts/exynos3250.dtsi | 4 ++--
>  arch/arm/boot/dts/exynos4.dtsi    | 4 ++--
>  arch/arm/boot/dts/exynos4415.dtsi | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
