From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 0/2] Add RTC DT node to Exynos5420 SoC and Fix RTC DT
 node name for 5250 Soc
Date: Wed, 14 Aug 2013 13:30 +0200
Message-ID: <3054059.xbBShFpfCt@amdc1227>
References: <1376478181-27539-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:24025 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759704Ab3HNLaH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 07:30:07 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRI008XYQLOTZ00@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Aug 2013 12:30:05 +0100 (BST)
In-reply-to: <1376478181-27539-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Vikas,

On Wednesday 14 of August 2013 16:32:59 Vikas Sajjan wrote:
> changes since v2:
> 	- split the 5250 related modifications into a separate patch.

I'm not sure whether Kukjin's comment was about this, as it introduces a 
short bisect breakage between patch 1 and patch 2 from this series.

IMHO it would be more sensible to make first patch simply fix name of the 
node and then a separate patch adding the rtc node for exynos5420.

Best regards,
Tomasz

> 	- placed the RTC node as per the alphabetical order in the DTS file as
> 	suggested by Kukjin Kim <kgene@kernel.org>.
> 
> changes since v1:
> 	- made DT node status as "okay" in the dtsi file itself.
> -
> Vikas Sajjan (2):
>   ARM: dts: Add RTC DT node to Exynos5420 SoC
>   ARM: dts: Fix the RTC DT node name for Exynos5250 SoC
> 
>  arch/arm/boot/dts/exynos5.dtsi    |    2 +-
>  arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
>  arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
>  3 files changed, 9 insertions(+), 2 deletions(-)
