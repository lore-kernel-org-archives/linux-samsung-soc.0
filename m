From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos: Add support for Hardkernel's
 Odroid HC1 board
Date: Mon, 2 Oct 2017 18:55:17 +0200
Message-ID: <20171002165517.olmv444bfwgmmfq6@kozik-lap>
References: <1506926375-5782-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20171002063945eucas1p203986b488120315e0e1a82c8c5d916cf@eucas1p2.samsung.com>
 <1506926375-5782-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32831 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751380AbdJBQzV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 12:55:21 -0400
Received: by mail-wm0-f65.google.com with SMTP id u138so3213677wmu.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Oct 2017 09:55:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1506926375-5782-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Mon, Oct 02, 2017 at 08:39:34AM +0200, Marek Szyprowski wrote:
> Odroid HC1 board is based on Odroid XU4 board, but it has no HDMI,
> no eMMC, no build-in USB3.0 hub, no extension port pins, and no GPIO
> button. USB3.0 ports are used for build-in JMicron USB to SATA bridge
> and Gigabit R8152 ethernet chips. HC1 uses only passive cooling.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 443 +++++++++++++++++++++
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 213 ++++++++++
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 428 +-------------------
>  4 files changed, 658 insertions(+), 427 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos5422-odroid-core.dtsi
>  create mode 100644 arch/arm/boot/dts/exynos5422-odroidhc1.dts
> 

Thanks, applied.

Best regards,
Krzysztof
