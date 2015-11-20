From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 5/5] ARM: exynos: select POWER_RESET_SYSCON and
 POWER_RESET_SYSCON_POWEROFF
Date: Fri, 20 Nov 2015 15:49:10 +0900
Message-ID: <564EC266.5020706@samsung.com>
References: <1447996629-18232-1-git-send-email-alim.akhtar@samsung.com>
 <1447996629-18232-6-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:32054 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934291AbbKTGtM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2015 01:49:12 -0500
In-reply-to: <1447996629-18232-6-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.reichl@fivetechno.de, tjakobi@math.uni-bielefeld.de, ulf.hansson@linaro.org

On 20.11.2015 14:17, Alim Akhtar wrote:
> Since we switch to use generic syscon regmap based reset/poweroff
> driver for exynos SoC, lets select it from ARCH_EXYNOS instead of
> enabling it from various defconfigs. This also select POWER_RESET
> as SYSCON-{reset, poweroff} drivers depends on it.
> 
> Also because of the above changes we don't need special handling
> for reboot/poweroff in exynos pmu driver. This patch also removes
> the same from exynos pmu driver to keep git bisect working.
> 
> Note: This will break reboot/poweroff on boards with older dtbs
> with a newer kernel.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  arch/arm/mach-exynos/Kconfig |    3 +++
>  arch/arm/mach-exynos/pmu.c   |   43 ------------------------------------------
>  2 files changed, 3 insertions(+), 43 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


Thanks, applied with different title:
"ARM: EXYNOS: Switch to syscon reboot and poweroff"
https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/log/?h=next/soc

I'll be pushing this to Kukjin for v4.5 (unless he picks it by himself).

Best regards,
Krzysztof
