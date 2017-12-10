From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] ARM: dts: exynos: Add audio power domain to
 Exynos5250
Date: Sun, 10 Dec 2017 15:36:22 +0100
Message-ID: <20171210143622.fzylopk264zu55do@kozik-lap>
References: <20171208145356.24152-1-m.szyprowski@samsung.com>
 <CGME20171208145403eucas1p15c5b3075062c6ca28a877976d8d647bc@eucas1p1.samsung.com>
 <20171208145356.24152-3-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:39378 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751633AbdLJOg0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Dec 2017 09:36:26 -0500
Received: by mail-wm0-f50.google.com with SMTP id i11so9890691wmf.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2017 06:36:25 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171208145356.24152-3-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Dec 08, 2017 at 03:53:55PM +0100, Marek Szyprowski wrote:
> Audio power domain includes following hardware modules: Pin controller
> for GPZ bank, AudioSS clock controller and three Exynos I2S controller.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
