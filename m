From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: Add G3D power domain to Exynos5250
Date: Sun, 10 Dec 2017 15:36:31 +0100
Message-ID: <20171210143631.lox6jggw6k73st5g@kozik-lap>
References: <20171208145356.24152-1-m.szyprowski@samsung.com>
 <CGME20171208145403eucas1p1b6551d47d2a498afd25847821e1d685a@eucas1p1.samsung.com>
 <20171208145356.24152-4-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:38907 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751633AbdLJOge (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Dec 2017 09:36:34 -0500
Received: by mail-wm0-f44.google.com with SMTP id 64so9904781wme.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2017 06:36:34 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171208145356.24152-4-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Dec 08, 2017 at 03:53:56PM +0100, Marek Szyprowski wrote:
> Add support for G3D power domain, which contains ARM Mali-600MP
> graphics accelerator device (not yet instantiated).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
