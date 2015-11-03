From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 1/7] ARM: EXYNOS: removing redundant code from regs-pmu.h
Date: Tue, 03 Nov 2015 10:37:23 +0900
Message-ID: <56380FD3.1060204@samsung.com>
References: <1445864143-25695-1-git-send-email-pankaj.dubey@samsung.com>
 <1445864143-25695-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44637 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752441AbbKCBhd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 20:37:33 -0500
In-reply-to: <1445864143-25695-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, amitdanielk@gmail.com

On 26.10.2015 21:55, Pankaj Dubey wrote:
> commit 6ec4f8d0d91f ("ARM: EXYNOS: add generic function to calculate
> cpu number") introduced exynos_pmu_cpunr to be used by multi-cluster SoC's
> e.g Exynos5420, but it's no more used in the codebase and hence removing
> this part of code.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/pmu.c      | 1 +
>  arch/arm/mach-exynos/regs-pmu.h | 9 ---------
>  2 files changed, 1 insertion(+), 9 deletions(-)
>

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
