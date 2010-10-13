From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 4/6] ARM: S5P: Add EPLL rate change warning
Date: Wed, 13 Oct 2010 16:55:55 +0900
Message-ID: <002301cb6aac$12a05e10$37e11a30$%kim@samsung.com>
References: <1286882399-27595-1-git-send-email-sw.youn@samsung.com>
 <1286883983-27790-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32572 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752858Ab0JMIAd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Oct 2010 04:00:33 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA7009SKY0O6W60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Oct 2010 16:55:36 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA700FOLY0O05@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Oct 2010 16:55:37 +0900 (KST)
In-reply-to: <1286883983-27790-1-git-send-email-sw.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> This patch adds warning about changing EPLL rate to notice that other
> driver that controls H/W, which is using EPLL, will has unknown effects
> by this EPLL rate change.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> ---
>  arch/arm/mach-s5p64x0/clock-s5p6440.c |    3 +++
>  arch/arm/mach-s5p64x0/clock-s5p6450.c |    3 +++
>  arch/arm/mach-s5pc100/clock.c         |    3 +++
>  arch/arm/mach-s5pv210/clock.c         |    3 +++
>  4 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-
> s5p64x0/clock-s5p6440.c
> index 1e3f517..0b539d5 100644
> --- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
> +++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
> @@ -79,6 +79,9 @@ static int s5p6440_epll_set_rate(struct clk *clk,
unsigned long
> rate)
>  	__raw_writel(epll_con, S5P_EPLL_CON);
>  	__raw_writel(epll_con_k, S5P_EPLL_CON_K);
> 
> +	printk(KERN_WARNING "EPLL Rate changes from %lu to %lu\n",
> +			clk->rate, rate);

Do we really need KERN_WARNING here?
How about just KERN_INFO?...In my opinion, to change EPLL value seems to be
nearer 'information' message more than 'warning'.

(others, same)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
