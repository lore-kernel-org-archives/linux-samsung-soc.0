From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: exynos: Use macros for pinctrl
 configuration on Exynos7
Date: Wed, 18 Jan 2017 17:01:31 +0200
Message-ID: <20170118150131.ttalzfxxtpbrw5gb@kozik-lap>
References: <1484718141-28785-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170118054013epcas5p3b20dca776ee350f4ba863db24d3dea67@epcas5p3.samsung.com>
 <1484718141-28785-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34100 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751799AbdARPBi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Jan 2017 10:01:38 -0500
Content-Disposition: inline
In-Reply-To: <1484718141-28785-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, krzk@kernel.org, kgene@kernel.org, robh+dt@kernel.org, sanath@samsung.com, javier@osg.samsung.com, s.nawrocki@samsung.com, alim.akhtar@samsung.com

On Wed, Jan 18, 2017 at 11:12:21AM +0530, Pankaj Dubey wrote:
> Usage of DTS macros instead of hard-coded numbers makes code easier to
> read.  One does not have to remember which value means pull-up/down or
> specific driver strength.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts |   4 +-
>  arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi | 302 ++++++++++++------------
>  2 files changed, 154 insertions(+), 152 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> index c528dd5..1b2db9f0 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> @@ -328,8 +328,8 @@
>  &pinctrl_alive {
>  	pmic_irq: pmic-irq {
>  		samsung,pins = "gpa0-2";
> -		samsung,pin-pud = <3>;
> -		samsung,pin-drv = <3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV3>;
>  	};
>  };

This is not equal (value 3 => 1). If the change was intended, please do
in separate patch.

Rest looks fine.

Best regards,
Krzysztof
