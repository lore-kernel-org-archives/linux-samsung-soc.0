From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/10] ARM: S5PV210: Add audio clocks as sysclk
Date: Fri, 08 Oct 2010 19:18:04 +0900
Message-ID: <001c01cb66d2$1ae0b350$50a219f0$%kim@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286193468-18510-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62330 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757155Ab0JHKR7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 06:17:59 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y007WCV9NC880@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:17:47 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y005YNV9N99@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:17:47 +0900 (KST)
In-reply-to: <1286193468-18510-1-git-send-email-sw.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> This patch adds audio clocks(SCLK_AUDIO{0,1,2} and SCLK_AUDIO) to be
> initial as a sysclk on boot-time.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> ---
>  arch/arm/mach-s5pv210/clock.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
> index 195a088..3f3b7ba 100644
> --- a/arch/arm/mach-s5pv210/clock.c
> +++ b/arch/arm/mach-s5pv210/clock.c
> @@ -997,6 +997,10 @@ static struct clksrc_clk *sysclks[] = {
>  	&clk_sclk_dac,
>  	&clk_sclk_pixel,
>  	&clk_sclk_hdmi,
> +	&clk_sclk_audio0,
> +	&clk_sclk_audio1,
> +	&clk_sclk_audio2,
> +	&clk_sclk_spdif,
>  };
> 
>  void __init_or_cpufreq s5pv210_setup_clocks(void)
> --

Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
