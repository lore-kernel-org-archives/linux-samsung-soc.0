From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/2] ARM: EXYNOS: pd: fix potentian kfree() of ro memory
Date: Fri, 31 Jul 2015 09:38:16 +0900
Message-ID: <55BAC378.80701@samsung.com>
References: <1438301390-7397-1-git-send-email-vz@mleia.com>
 <1438301390-7397-2-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37089 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751160AbbGaAiR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jul 2015 20:38:17 -0400
In-reply-to: <1438301390-7397-2-git-send-email-vz@mleia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>, Kukjin Kim <kgene@kernel.org>
Cc: Russell King <linux@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org

On 31.07.2015 09:09, Vladimir Zapolskiy wrote:
> The change fixes a bug introduced by 2be2a3ff42a5, memory allocated
> by kstrdup_const() must be always deallocated with kfree_const(),
> otherwise there is a risk of kfree'ing ro memory.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> Cc: <stable@vger.kernel.org>
> Fixes: 2be2a3ff42a5 ("ARM: EXYNOS: register power domain driver from core_initcall")
> ---
> Changes from v1 to v2:
> * split a single change v1 into two
> * added Fixes tag and Cc: <stable@vger.kernel.org>
> 
>  arch/arm/mach-exynos/pm_domains.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
