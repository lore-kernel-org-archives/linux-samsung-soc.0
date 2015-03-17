From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v4 1/3] ARM: EXYNOS: Add missing static to file-scope
 declarations
Date: Wed, 18 Mar 2015 02:33:53 +0900
Message-ID: <55086581.3010106@kernel.org>
References: <1426072121-6822-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:41959 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754373AbbCQReB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 13:34:01 -0400
In-Reply-To: <1426072121-6822-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

On 03/11/15 20:08, Krzysztof Kozlowski wrote:
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
> Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---

Applied this whole series.

Thanks,
Kukjin
