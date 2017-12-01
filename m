From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM64: dts: exynos: Add support for S3FWRN5 NFC chip to
 TM2(e) boards
Date: Fri, 1 Dec 2017 17:48:09 +0100
Message-ID: <20171201164809.rhhv4qvns5ugvcxf@kozik-lap>
References: <CGME20171129111327eucas1p2ddc03a0352a7bf2b3e1b9d4f9db99511@eucas1p2.samsung.com>
 <20171129111320.14592-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:39674 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750964AbdLAQsM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Dec 2017 11:48:12 -0500
Received: by mail-wm0-f66.google.com with SMTP id i11so4415650wmf.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2017 08:48:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171129111320.14592-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Nov 29, 2017 at 12:13:20PM +0100, Marek Szyprowski wrote:
> Add device tree node with S3FWRN5 NFC chip to TM2(e) boards. The chip is
> connected through HS-I2C bus #4.
> 
> Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
> [mszyprow: rebased onto v4.15-rc1, moved node to exynos5433-tm2-common.dtsi,
>  rephrased commit message]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
