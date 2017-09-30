From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Use dwc3 quirk for USB3 and LAN on
 Odroid XU4
Date: Sat, 30 Sep 2017 18:28:38 +0200
Message-ID: <20170930162838.neqrrwmkdpjjlgzr@kozik-lap>
References: <20170930145454.sm2zpwonemlfsemo@vis>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:38242 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751028AbdI3Q2m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Sep 2017 12:28:42 -0400
Received: by mail-wm0-f68.google.com with SMTP id q124so1249669wmb.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Sep 2017 09:28:41 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170930145454.sm2zpwonemlfsemo@vis>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jochen Sprickerhof <git@jochen.sprickerhof.de>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Vagrant Cascadian <vagrant@debian.org>

On Sat, Sep 30, 2017 at 04:54:54PM +0200, Jochen Sprickerhof wrote:
> Without this, the USB3 and LAN ports don't show up.
> 
> See also https://bugs.debian.org/843448
> 
> This was first proposed in https://lkml.org/lkml/2015/3/18/400 but for
> exynos5420.dtsi. I only tested it on Odroid XU4, so I propose it only
> for that board. Also I found the dis_u2_susphy_quirk to make no
> difference, so it's not included.
> 
> A second proposal is in https://lkml.org/lkml/2017/1/24/402, but only
> for USB3, not for the LAN port.

No external references in commit msg (if really needed it could go to
BugLink but this should be just described here) and no links to lkml.org
please (it just does not work, instead for example
http://lkml.kernel.org/r/).

It looks like already merged:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/dt&id=3bf689f9275ff73de1ffad3e571837c8bff41d27

What is the difference?

Best regards,
Krzysztof

> Signed-off-by: Jochen Sprickerhof <git@jochen.sprickerhof.de>
> ---
> arch/arm/boot/dts/exynos5422-odroidxu4.dts | 7 +++++++
> 1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
> index 2faf88627a48..30fc4d35422e 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
> @@ -43,6 +43,13 @@
> 	status = "okay";
> };
> 
> +&usbdrd_dwc3_0 {
> +	/* quirk is needed to make USB3 ports work */
> +	snps,dis_u3_susphy_quirk;
> +};
> +
> &usbdrd_dwc3_1 {
> 	dr_mode = "host";
> +	/* quirk is needed to make LAN port work */
> +	snps,dis_u3_susphy_quirk;
> };
> -- 
> 2.14.2
> 
