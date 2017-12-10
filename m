From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: Fix power domain node names for
 Exynos5250
Date: Sun, 10 Dec 2017 15:36:13 +0100
Message-ID: <20171210143613.5vo2efvduyzryzls@kozik-lap>
References: <20171208145356.24152-1-m.szyprowski@samsung.com>
 <CGME20171208145403eucas1p1c20d4373468b3a506ea0e2925526acdd@eucas1p1.samsung.com>
 <20171208145356.24152-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35341 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751633AbdLJOgQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Dec 2017 09:36:16 -0500
Received: by mail-wm0-f67.google.com with SMTP id f9so9980403wmh.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2017 06:36:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171208145356.24152-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Dec 08, 2017 at 03:53:54PM +0100, Marek Szyprowski wrote:
> Device nodes in device tree should use generic names, so rename
> all existing domains to "power-domain".
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
