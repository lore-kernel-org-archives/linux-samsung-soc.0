From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: exynos_defconfig: Enable UAS support for
 Odroid HC1 board
Date: Mon, 2 Oct 2017 18:56:21 +0200
Message-ID: <20171002165621.t37rpf7jxzbr6z66@kozik-lap>
References: <1506926375-5782-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20171002063945eucas1p1a4f32bcd2e31435cd613086b95c5a5d0@eucas1p1.samsung.com>
 <1506926375-5782-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36221 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751380AbdJBQ4Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 12:56:25 -0400
Received: by mail-wm0-f68.google.com with SMTP id 63so2654036wmn.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Oct 2017 09:56:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1506926375-5782-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Mon, Oct 02, 2017 at 08:39:35AM +0200, Marek Szyprowski wrote:
> Odroid HC1 board has built-in JMicron USB to SATA bridge, which supports
> UAS protocol. Compile-in support for it (instead of enabling it as module)
> to make sure that all built-in storage devices are available for rootfs.
> The bridge itself also supports fallback to standard USB Mass Storage
> protocol, but USB Mass Storage class doesn't bind to it when UAS is
> compiled as module and modules are not (yet) available.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks, applied.

Best regards,
Krzysztof
