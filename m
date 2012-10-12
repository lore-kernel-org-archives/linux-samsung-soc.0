From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v1 2/6] dts: exynos: add device tree support for exynos5 mixer
Date: Sat, 13 Oct 2012 00:09:24 +0200
Message-ID: <9404527.Fd5M2RcnDp@flatron>
References: <1349981868-2116-1-git-send-email-rahul.sharma@samsung.com> <1349981868-2116-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:38960 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172Ab2JLWJY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Oct 2012 18:09:24 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so2774439wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Oct 2012 15:09:22 -0700 (PDT)
In-Reply-To: <1349981868-2116-3-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com

On Friday 12 of October 2012 00:27:43 Rahul Sharma wrote:
> This patch adds support for device tree based discovery for exynos5
> mixer. Mixer node is also renamed with "exynos5-mixer".
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi       |    8 ++++++++
>  arch/arm/mach-exynos/include/mach/map.h |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
>  3 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi index 4e019b5..e4483bc 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -499,4 +499,12 @@
>  		interrupts = <0 95 0>;
>  		version = "1.4";
>          };
> +
> +        mixer {
> +		compatible = "samsung,exynos5-mixer";
> +		reg = <0x14450000 0x10000>;
> +		interrupts = <0 94 0>;
> +		version = "16.0.33.0";
> +		vp-support = <0>;
> +        };

mixer@14450000

Also, what is this version property? How is it used in the driver?

Best regards,
Tomasz Figa
