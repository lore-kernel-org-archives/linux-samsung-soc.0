From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos: Correct clocks for Exynos4 I2S
 module
Date: Fri, 9 Dec 2016 16:29:19 +0200
Message-ID: <20161209142919.GB10080@kozik-lap>
References: <1481268131-1264-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:36305 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933082AbcLIO3Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 09:29:25 -0500
Received: by mail-wj0-f193.google.com with SMTP id j10so2725818wjb.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2016 06:29:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1481268131-1264-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Fri, Dec 09, 2016 at 08:22:10AM +0100, Marek Szyprowski wrote:
> "iis", "i2s_opclk0" and "i2s_opclk1" are standard clocks for Exynos4 I2S
> hardware module, so they should be defined in .dtsi file not in the random
> board .dts file.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
> v2:
> - added changes for exynos4412-itop-elite board
> ---
>  arch/arm/boot/dts/exynos4.dtsi                  | 6 ++++--
>  arch/arm/boot/dts/exynos4412-itop-elite.dts     | 4 ----
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 4 ----
>  3 files changed, 4 insertions(+), 10 deletions(-)

For the reference:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
