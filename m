From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v3 1/3] ARM: EXYNOS: Add missing static to file-scope
 declarations
Date: Thu, 05 Feb 2015 16:55:38 +0530
Message-ID: <54D35332.6000309@samsung.com>
References: <1423121002-25117-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1423121002-25117-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, cpgs@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Thursday 05 February 2015 12:53 PM, Krzysztof Kozlowski wrote:
> The 'pm_data', 'exynos_release_ret_regs', 'exynos3250_release_ret_regs'
> and 'exynos5420_release_ret_regs' are not exported nor used outside of
> suspend.c file. Make them static.
>
> This fixes following sparse warnings:
> arch/arm/mach-exynos/suspend.c:83:23: warning: symbol 'pm_data' was not declared. Should it be static?
> arch/arm/mach-exynos/suspend.c:106:14: warning: symbol 'exynos_release_ret_regs' was not declared. Should it be static?
> arch/arm/mach-exynos/suspend.c:117:14: warning: symbol 'exynos5420_release_ret_regs' was not declared. Should it be static?
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Thanks,
Pankaj Dubey
