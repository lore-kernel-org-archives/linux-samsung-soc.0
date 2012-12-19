From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3 0/5 RESEND] Avoid passing clks through platform data
Date: Wed, 19 Dec 2012 10:27:58 -0800
Message-ID: <008601cdde16$937d94a0$ba78bde0$@samsung.com>
References: <1355895353-10316-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49584 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751337Ab2LSS2E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Dec 2012 13:28:04 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFA003RKJAMSY30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Dec 2012 03:28:02 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFA007NEJANOH20@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Dec 2012 03:28:02 +0900 (KST)
In-reply-to: <1355895353-10316-1-git-send-email-padma.v@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, olof@lixom.net, jhbird.choi@samsung.com

Padmavathi Venna wrote:
> 
> These are the set of patches required to fix the following build error
> in dev-audio.c on all samsung platforms.
> 
> arch/arm/mach-exynos/dev-audio.c:58:4: error: unknown field 'src_clk'
> specified in initializer
> arch/arm/mach-exynos/dev-audio.c:58:4: warning: initialization makes
> integer
> from pointer without a cast [enabled by default]
> arch/arm/mach-exynos/dev-audio.c:58:4: warning: (near initialization for
> 'i2sv5_pdata.type.i2s.idma_addr') [enabled by default]
> arch/arm/mach-exynos/dev-audio.c:91:4: error: unknown field 'src_clk'
> specified in initializer
> arch/arm/mach-exynos/dev-audio.c:91:4: warning: initialization makes
> integer
> from pointer without a cast [enabled by default]
> arch/arm/mach-exynos/dev-audio.c:91:4: warning: (near initialization for
> 'i2sv3_pdata.type.i2s.idma_addr') [enabled by default]
> 
> Changes since v2:
>         - Rebased on 3.7-rc3
> 
> I2S controller has an internal mux for RCLK source clks. The list
> of source clk names were passed through platform data in non-dt case.
> The variable holding the list of RCLK source clk names is not
> required, as the list of clks need to be registered with clkdev
> using generic connection id. This is required as part of adding DT
> support for I2S controller driver.
> 
> In the below series of patches, registered the existed clks with
> clkdev using generic connection id and removed the variable which
> holds those clk names. This is done for s3c64xx,s5pc100,s5p64x0,
> s5pv210 and exynos4 series. But tested the sound card detection
> only on smdk6410 board. On remaining all platforms it was just
> build tested.
> 
> Padmavathi Venna (5):
>   ARM: S3C64XX: Add I2S clkdev support
>   ARM: S5PC100: Add I2S clkdev support
>   ARM: S5P64X0: Add I2S clkdev support
>   ARM: S5PV210: Avoid passing the clks through platform data
>   ARM: EXYNOS: Avoid passing the clks through platform data
> 
>  arch/arm/mach-exynos/dev-audio.c      |   12 ---
>  arch/arm/mach-s3c64xx/clock.c         |  126
++++++++++++++++++++----------
> ---
>  arch/arm/mach-s3c64xx/dev-audio.c     |   11 ---
>  arch/arm/mach-s5p64x0/clock-s5p6440.c |   49 +++++++++----
>  arch/arm/mach-s5p64x0/clock-s5p6450.c |   61 +++++++++++-----
>  arch/arm/mach-s5p64x0/dev-audio.c     |   12 ---
>  arch/arm/mach-s5pc100/clock.c         |   48 ++++++++-----
>  arch/arm/mach-s5pc100/dev-audio.c     |   16 ----
>  arch/arm/mach-s5pv210/dev-audio.c     |   16 ----
>  9 files changed, 182 insertions(+), 169 deletions(-)
> 
> --
> 1.7.4.4

Applied, thanks.

- Kukjin
