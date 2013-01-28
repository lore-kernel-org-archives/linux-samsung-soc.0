From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v4 4/7] ARM: Exynos: allow dt based discovery of mct controller
 using clocksource_of_init
Date: Mon, 28 Jan 2013 13:57:41 -0700
Message-ID: <5106E645.70807@wwwdotorg.org>
References: <1358762542-19008-1-git-send-email-thomas.abraham@linaro.org> <1358762542-19008-5-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:47388 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753229Ab3A1U5p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 15:57:45 -0500
In-Reply-To: <1358762542-19008-5-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, swarren@nvidia.com, sylvester.nawrocki@gmail.com, chaos.youn@samsung.com, linux-arm-kernel@lists.infradead.org

On 01/21/2013 03:02 AM, Thomas Abraham wrote:
> Add entries to __clksrc_of_table so that Exynos MCT controller is discoverable
> using call to clocksource_of_init. With this change, it would be appropriate to
> rename the function 'exynos4_timer_init' as 'mct_init' since it aptly describes
> this function. Additionally, the 'init_time' callback of all machine descriptors
> for exynos platforms that were previously set to 'exynos4_timer_init' are now
> set to either 'mct_init' or 'clocksource_of_init'.

> diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c

> +#ifdef CONFIG_CLKSRC_OF
> +CLOCKSOURCE_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init)
> +CLOCKSOURCE_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init)
> +#endif

I suggested in another review (IIRC for a different SoC) that
CLOCKSOURCE_OF_DECLARE() should always be declared so you don't need
that ifdef. Would you care to send a patch to add to arm-soc's
timer/cleanup branch to do that? If not, let me know and I can.
