From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] ARM: EXYNOS: Don't use LDREX and STREX after disabling
 cache coherency
Date: Tue, 17 Feb 2015 14:24:51 -0800
Message-ID: <54E3BFB3.5030801@codeaurora.org>
References: <1424093802-5488-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1424093802-5488-1-git-send-email-k.kozlowski@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 02/16/15 05:36, Krzysztof Kozlowski wrote:
> During CPU shutdown the exynos_cpu_power_down() is called after
> disabling cache coherency and it uses LDREX and STREX instructions (by
> calling of_machine_is_compatible() -> kobject_get() -> kref_get()).
>
> The LDREX and STREX should not be used after disabling the cache
> coherency so just use soc_is_exynos().
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Fixes: adc548d77c22 ("ARM: EXYNOS: Use MCPM call-backs to support S2R on exynos5420")
> Cc: <stable@vger.kernel.org>
> Reported-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Looks good to me.

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
