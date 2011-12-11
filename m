From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: MM: Configure the number of banks
Date: Sun, 11 Dec 2011 10:24:43 +0000
Message-ID: <20111211102443.GT14542@n2100.arm.linux.org.uk>
References: <1323048539-9573-1-git-send-email-boojin.kim@samsung.com> <20111211100325.GR14542@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:55945 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751674Ab1LKKYy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Dec 2011 05:24:54 -0500
Content-Disposition: inline
In-Reply-To: <20111211100325.GR14542@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sun, Dec 11, 2011 at 10:03:25AM +0000, Russell King - ARM Linux wrote:
> On Mon, Dec 05, 2011 at 10:28:59AM +0900, Boojin Kim wrote:
> > This patch configures NR_BANKS by machine specific configuration.
> > NR_BANKS should be increased to support bigger than 2GB memory.
> > 
> > Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> 
> I'd much prefer to solve this a different way:
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 4676c19..d451945 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1126,6 +1126,11 @@ config ARM_TIMER_SP804
>  
>  source arch/arm/mm/Kconfig
>  
> +config ARM_NR_BANKS
> +	int
> +	default 16 if ARCH_EP93XX

I've now committed this patch - if you want to add exynos to this,
please send a patch to do just that.  Thanks.
