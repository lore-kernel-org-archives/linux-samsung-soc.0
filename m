From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Cleanup exynos4412-odroidx2.dts and
 enable sound on odroid-x.
Date: Wed, 28 Dec 2016 19:31:01 +0200
Message-ID: <20161228173101.hbiveyxnniyyvez3@kozik-lap>
References: <d56c0228-d39b-87e8-3a5f-e8577f3a91e4@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35021 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750976AbcL1Rbp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Dec 2016 12:31:45 -0500
Received: by mail-lf0-f68.google.com with SMTP id x140so16122355lfa.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Dec 2016 09:31:06 -0800 (PST)
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
Thanks, applied.

Best regards,
Krzysztof
