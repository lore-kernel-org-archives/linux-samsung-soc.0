From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: EXYNOS: PD: Fix duplicate variable
Date: Sun, 13 May 2012 19:51:14 +0100
Message-ID: <20120513185114.GB13947@n2100.arm.linux.org.uk>
References: <1336567828-9967-1-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:39721 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752556Ab2EMSvd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 May 2012 14:51:33 -0400
Content-Disposition: inline
In-Reply-To: <1336567828-9967-1-git-send-email-sangwook.lee@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangwook Lee <sangwook.lee@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

On Wed, May 09, 2012 at 01:50:28PM +0100, Sangwook Lee wrote:
> struct generic_pm_domain already has a field for name. Use that field
> instead of creating another field in struct exynos_pm_domain

Argh.  No.

> @@ -99,7 +98,7 @@ static __init int exynos_pm_dt_parse_domains(void)
>  
>  		if (of_get_property(np, "samsung,exynos4210-pd-off", NULL))
>  			pd->is_off = true;
> -		pd->name = np->name;
> +		pd->pd.name = (char *)np->name;

Why this cast?  Why can't pd->pd.name be correctly typed in the first place?

I assume this is because np->name is const.  Never EVER cast away const.
It's wrong to do so.
