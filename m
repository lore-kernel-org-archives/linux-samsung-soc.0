From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Remove redundant interrupt properties
 in gpio-keys
Date: Tue, 19 Sep 2017 19:24:56 +0200
Message-ID: <20170919172456.6zmysnoudggxdqqu@kozik-lap>
References: <CGME20170915064253eucas1p24582912a3103187d751dde26a0aa0300@eucas1p2.samsung.com>
 <1505457767-24104-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37613 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbdISRZB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 13:25:01 -0400
Received: by mail-wm0-f68.google.com with SMTP id f4so255735wmh.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Sep 2017 10:25:01 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1505457767-24104-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Sep 15, 2017 at 08:42:47AM +0200, Marek Szyprowski wrote:
> GPIO keys don't need interrupt property. Interrupt number can be derived
> directly from the GPIO pin definition, so remove redundant 'interrupts'
> and 'interrupt-parent' properties from gpio-keys nodes.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 2 --
>  arch/arm/boot/dts/exynos4412-odroidx.dts        | 2 --
>  2 files changed, 4 deletions(-)
> 

Thanks, applied with slight adjustments in title/subject about boards.

Best regards,
Krzysztof
