From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/3] Add DP related DT and Display-timing Node to
 exynos5250 based Arndale Board
Date: Fri, 31 May 2013 09:40:45 +0900
Message-ID: <019801ce5d97$7cdac500$76904f00$%kim@samsung.com>
References: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51771 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751616Ab3EaAkr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 May 2013 20:40:47 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNN005YK0JYDZB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 31 May 2013 09:40:46 +0900 (KST)
In-reply-to: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: jg1.han@samsung.com, s.trumtrar@pengutronix.de, tomasz.figa@gmail.com, olof@lixom.net, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Vikas Sajjan wrote:
> 
> This patch series adds support for DP on Exynos5250 based Arndale Board
> 
> changes since v1:
> 	- moved display-timimg node inside fimd DT node as suggested by
> 	Steffen Trumtrar s.trumtrar@pengutronix.de
> 
> Is based on branch "for-next"
> http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 
> 
> Vikas Sajjan (3):
>   ARM: dts: Add DT node for DP controller for Arndale Board
>   ARM: dts: Add clock provider information for DP controller in
>     Exynos5250 SoC
>   ARM: dts: Add display timing node to exynos5250-arndale.dts
> 
>  arch/arm/boot/dts/exynos5250-arndale.dts |   28
> ++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi        |    2 ++
>  2 files changed, 30 insertions(+)
> 
Looks good to me, applied.

Thanks.

- Kukjin
