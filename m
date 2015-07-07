From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] arm:irqchip: IRQCHIP_DECLARE macro is now accessible
Date: Wed, 08 Jul 2015 08:46:58 +0900
Message-ID: <559C64F2.9070803@samsung.com>
References: <1436299411-12329-1-git-send-email-joel@porquet.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24203 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757138AbbGGXrE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jul 2015 19:47:04 -0400
In-reply-to: <1436299411-12329-1-git-send-email-joel@porquet.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joel Porquet <joel@porquet.org>, linux-kernel@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org

On 08.07.2015 05:02, Joel Porquet wrote:
> The IRQCHIP_DECLARE macro migrated to 'include/linux/irqchip.h', making it
> globally accessible.
> 
> See commit 91e20b5040c67c51aad88cf87db4305c5bd7f79d
> ("irqchip: Move IRQCHIP_DECLARE macro to include/linux/irqchip.h").
> 
> This patch adds inclusions of 'include/linux/irqchip.h' and replaces uses of
> macro OF_DECLARE_2 with IRQCHIP_DECLARE.
> 
> Signed-off-by: Joel Porquet <joel@porquet.org>
> ---
>  arch/arm/mach-exynos/suspend.c       | 3 ++-
>  arch/arm/mach-imx/gpc.c              | 7 ++-----
>  arch/arm/mach-omap2/omap-wakeupgen.c | 7 ++-----
>  3 files changed, 6 insertions(+), 11 deletions(-)
> 

For Exynos:
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
