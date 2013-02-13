From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3] ARM: EXYNOS: Add clocks for EXYNOS I2S and PCM I/F
Date: Tue, 12 Feb 2013 21:29:01 -0800
Message-ID: <1e0c01ce09ab$09600b70$1c202250$@samsung.com>
References: <011201ce05db$82ae97e0$880bc7a0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64287 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab3BMF3Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Feb 2013 00:29:24 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI5000VX8KKP7L0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 14:29:22 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI5007JV8KV94A0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 14:29:21 +0900 (KST)
In-reply-to: <011201ce05db$82ae97e0$880bc7a0$@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangsu Park' <sangsu4u.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, sbkim73@samsung.com, 'Tushar Behera' <tushar.behera@linaro.org>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Padma Venkat' <padma.kvr@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>

Sangsu Park wrote:
> 
> Audio Subsystem has own clocks for I2S0 and PCM0 in all EXYNOS series.
> This patch add clocks for I2S0 and PCM0 I/F.
> 
> Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Makefile      |    1 +
>  arch/arm/mach-exynos/clock-audss.c |   68
> ++++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/clock-audss.c
> 
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-
> exynos/Makefile
> index 7e53a3a..5b6c7c0 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -13,6 +13,7 @@ obj-				:=
>  # Core
> 
>  obj-$(CONFIG_ARCH_EXYNOS)	+= common.o
> +obj-$(CONFIG_ARCH_EXYNOS)	+= clock-audss.o

Sorry for late response.

Basically, this should be implemented with common clock stuff but its
posting was delayed due to some reason :-( I think, you can see the patches
from Thomas P Abraham soon, so please re-work this based on that. If any
updates, let you know.

Thanks.

- Kukjin
