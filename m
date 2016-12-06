From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Cleanup exynos4412-odroidx2.dts and
 enable sound on odroid-x.
Date: Tue, 6 Dec 2016 18:55:19 +0200
Message-ID: <20161206165519.GA8008@kozik-lap>
References: <d56c0228-d39b-87e8-3a5f-e8577f3a91e4@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33224 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753647AbcLFQz3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Dec 2016 11:55:29 -0500
Received: by mail-wm0-f68.google.com with SMTP id u144so22577245wmu.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Dec 2016 08:55:28 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <d56c0228-d39b-87e8-3a5f-e8577f3a91e4@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Javier Martinez Canillas <javier@osg.samsung.com>

On Mon, Nov 28, 2016 at 01:48:06PM +0100, Markus Reichl wrote:
> Odroid-X2 differs from Odroid-X only in RAM and prime CPU.
> Remove doubled nodes from exynos4412-odroidx2.dts and move
> sound node to exynos4412-odroidx.dts to enable sound on both boards.
> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
>  arch/arm/boot/dts/exynos4412-odroidx.dts  | 13 +++++++++++++
>  arch/arm/boot/dts/exynos4412-odroidx2.dts | 24 ------------------------
>  2 files changed, 13 insertions(+), 24 deletions(-)
>

Looks correct. I won't be pushing anything more for v4.10 so I will
apply this for v4.11 after merge window. For the reference:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
