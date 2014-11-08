From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: exynos_defconfig: disable CONFIG_EXYNOS5420_MCPM; not
 stable
Date: Sat, 08 Nov 2014 18:50:04 +0900
Message-ID: <000e01cffb39$5ef0a2d0$1cd1e870$@kernel.org>
References: <1414796382-5447-1-git-send-email-khilman@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30471 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753576AbaKHJuG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Nov 2014 04:50:06 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEP009EASNGET00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Nov 2014 18:50:04 +0900 (KST)
In-reply-to: <1414796382-5447-1-git-send-email-khilman@kernel.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kevin Hilman' <khilman@kernel.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, 'Kevin Hilman' <khilman@linaro.org>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Sachin Kamat' <sachin.kamat@samsung.com>, 'Doug Anderson' <dianders@chromium.org>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Tushar Behera' <tushar.behera@linaro.org>

Kevin Hilman wrote:
> 
> From: Kevin Hilman <khilman@linaro.org>
> 
> The option CONFIG_EXYNOS5420_MCPM is causing imprecise external aborts
> during boot testing, causing various userspace startup failures.
> 
> Disable until it has gotten more testing.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>,
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
> Cc: Sachin Kamat <sachin.kamat@samsung.com>,
> Cc: Doug Anderson <dianders@chromium.org>,
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
> Cc: Tushar Behera <tushar.behera@linaro.org>,
> Cc: stable@vger.kernel.org # v3.17+
> Signed-off-by: Kevin Hilman <khilman@linaro.org>
> ---
> This has been reported by a few people[1], but not investigated or fixed, so it's
> time to disable this feature until it can be fixed.
> 
Hi Kevin,

Yeah I agree with your opinion.

But as you can see my tree, I've queued regarding mcpm patches for 3.19 will
be shown in -next in this weekend. Anyway let me apply this into -fixes and
then let's enable after test its functionality in -next in a couple of days.

Thanks,
Kukjin


> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-September/288344.html
> 
>  arch/arm/configs/exynos_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 72058b8a6f4d..a250dcbf34cd 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -10,7 +10,7 @@ CONFIG_MODULE_UNLOAD=y
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_ARCH_EXYNOS=y
>  CONFIG_ARCH_EXYNOS3=y
> -CONFIG_EXYNOS5420_MCPM=y
> +CONFIG_EXYNOS5420_MCPM=n
>  CONFIG_SMP=y
>  CONFIG_BIG_LITTLE=y
>  CONFIG_BL_SWITCHER=y
> --
> 2.1.0
