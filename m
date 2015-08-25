From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/7] ARM: EXYNOS: remove unused static mapping of CMU
 for exynos5
Date: Tue, 25 Aug 2015 09:55:38 +0900
Message-ID: <55DBBD0A.1020805@samsung.com>
References: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
 <1440403348-8974-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8533 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751565AbbHYAzy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 20:55:54 -0400
In-reply-to: <1440403348-8974-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene@kernel.org, heiko@sntech.de, thomas.ab@samsung.com

On 24.08.2015 17:02, Pankaj Dubey wrote:
> Remove unused static mapping of exynos5 CMU and related code.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c           | 5 -----
>  arch/arm/mach-exynos/include/mach/map.h | 1 -
>  2 files changed, 6 deletions(-)

Looks good:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
