From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/2] Exynos5 device tree fixes
Date: Wed, 28 Aug 2013 15:08:20 +0200
Message-ID: <1616805.Bvb6ibvgpm@amdc1227>
References: <1377693768-16777-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:11320 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752887Ab3H1NI0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 09:08:26 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MS8000BQSHG7YD0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Aug 2013 14:08:24 +0100 (BST)
In-reply-to: <1377693768-16777-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, thomas.ab@samsung.com

On Wednesday 28 of August 2013 18:12:46 Chander Kashyap wrote:
> This patch series fixes two problem with MCT node in Exynos5 platforms.
> 1. In Exynos5250 it fixes the number of interrupt-cells.
> 2. Removes invalid properties in MCT node for Exynos5420 and Exynos5250.
> 
> Chander Kashyap (2):
>   ARM: DT: Exynos5250: fix number of interrupt-cells in mct node
>   DTS: Exynos5: Remove invalid MCT properties
> 
>  arch/arm/boot/dts/exynos5250.dtsi |   19 ++++++++-----------
>  arch/arm/boot/dts/exynos5420.dtsi |    2 --
>  2 files changed, 8 insertions(+), 13 deletions(-)

For the whole series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

By the way, it should be noted that this patch is a follow up to my series, 
available at:

http://thread.gmane.org/gmane.linux.kernel.samsung-soc/22207

to let reviewing people know that things that this patch relies on, like 
relevant changes to the documentation, have been already posted.

Best regards,
Tomasz
