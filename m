From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/6] arm64: dts: exynos: Add MSCL power domain to
 Exynos 5433 SoC
Date: Fri, 1 Dec 2017 17:50:02 +0100
Message-ID: <20171201165002.63jcevtmw6ijnn7m@kozik-lap>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
 <CGME20171129112650eucas1p13a3cc167bc64d133cf24e4f621865203@eucas1p1.samsung.com>
 <20171129112638.15813-4-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:39975 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751414AbdLAQuF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Dec 2017 11:50:05 -0500
Received: by mail-wm0-f68.google.com with SMTP id v19so4435970wmh.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2017 08:50:05 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171129112638.15813-4-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

On Wed, Nov 29, 2017 at 12:26:35PM +0100, Marek Szyprowski wrote:
> This patch adds support for MSCL power domain to Exynos 5433 SoCs, which
> contains following devices: a clock controller, JPEG codec device and its
> SYSMMU.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
