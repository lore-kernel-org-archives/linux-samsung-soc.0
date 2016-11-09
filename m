From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] exynos-gsc: Enable driver on ARCH_EXYNOS
Date: Wed, 9 Nov 2016 22:06:14 +0200
Message-ID: <20161109200614.GC23534@kozik-lap>
References: <1478701778-29452-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161109142950eucas1p28aeab32587655ee249c1eefefcbb408d@eucas1p2.samsung.com>
 <1478701778-29452-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33018 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751670AbcKIUGU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Nov 2016 15:06:20 -0500
Content-Disposition: inline
In-Reply-To: <1478701778-29452-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

On Wed, Nov 09, 2016 at 03:29:37PM +0100, Marek Szyprowski wrote:
> This driver can be also used on Exynos5433, which is ARM64-based
> platform, which selects only ARCH_EXYNOS symbol.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/media/platform/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
