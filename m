From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 10/10] arm64: dts: exynos: remove i80-if-timings nodes
Date: Fri, 8 Sep 2017 18:47:52 +0200
Message-ID: <20170908164752.mrxqrhkszmfqbk6x@kozik-lap>
References: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
 <CGME20170824133412eucas1p23233d7bed8b83d86b26de01bc1ecf2a1@eucas1p2.samsung.com>
 <1503581639-580-11-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35299 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756340AbdIHQsD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Sep 2017 12:48:03 -0400
Content-Disposition: inline
In-Reply-To: <1503581639-580-11-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org

On Thu, Aug 24, 2017 at 03:33:59PM +0200, Andrzej Hajda wrote:
> Since i80/command mode is determined in runtime by propagating info
> from panel this property can be removed.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
>

I understand this should go in after merging the driver changes to
preserve bisectability?

Best regards,
Krzysztof
