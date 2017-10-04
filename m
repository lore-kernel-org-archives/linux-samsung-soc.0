From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable UAS support for Odroid
 HC1 board
Date: Wed, 4 Oct 2017 19:20:48 +0200
Message-ID: <20171004172048.4ovmarql34wj6uca@kozik-lap>
References: <CGME20171003101344eucas1p25f8a9b77aea2931e022eb213c14afd27@eucas1p2.samsung.com>
 <20171003101332.32732-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36009 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751275AbdJDRUw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 13:20:52 -0400
Received: by mail-wm0-f65.google.com with SMTP id 131so1960272wmk.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Oct 2017 10:20:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20171003101332.32732-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Tue, Oct 03, 2017 at 12:13:32PM +0200, Marek Szyprowski wrote:
> Odroid HC1 board has built-in JMicron USB to SATA bridge, which supports
> UAS protocol. Enable support for it to make sure that all built-in storage
> devices are available. Enable it as module to keep in line with multi_v7
> policy to enable drivers as build-in only if they are critical for boot
> process. On Odroid HC1 the kernel itself has to be still read from the
> SD-card, so assume that modules/initrd is also accessible there.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Thanks, applied.

Best regards,
Krzysztof
