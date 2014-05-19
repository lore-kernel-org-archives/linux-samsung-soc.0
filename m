From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v9 1/4] ARM: dts: Add sysreg sytem controller node to
 exynos5250 and exynos5420
Date: Mon, 19 May 2014 18:28:55 +0900
Message-ID: <02fe01cf7344$c19d36f0$44d7a4d0$@samsung.com>
References: <1399641784-10833-1-git-send-email-gautam.vivek@samsung.com>
 <1399641784-10833-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10491 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753398AbaESJ26 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 05:28:58 -0400
In-reply-to: <1399641784-10833-2-git-send-email-gautam.vivek@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, stern@rowland.harvard.edu, kishon@ti.com, k.debski@samsung.com, jg1.han@samsung.com

Vivek Gautam wrote:
> 
> This patch adds sysreg-syscon node to exynos5250 and exynos5420 device
> tree, to access System Register's registers using syscon driver.
> 
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> [gautam.vivek@samsung.com: Split this syreg-syscon dts entry from
> dts: Add usb2phy to Exynos 5250 patch]
> [gautam.vivek@samsung.com: added similar syscon entry for exynos5420]
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
> 
Vivek,

See my comment below.

And please don't version each patch in series...it's really not a good way.
It cause very big confusing...

> Changes since v7:
> None
> 
>  arch/arm/boot/dts/exynos5250.dtsi |    5 +++++
>  arch/arm/boot/dts/exynos5420.dtsi |    5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index 3742331..70f0cd5 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -175,6 +175,11 @@
>  		reg = <0x10040000 0x5000>;
>  	};
> 
> +	sysreg_system_controller: syscon@10050000 {
> +		compatible = "samsung,exynos5250-sys", "syscon";

Maybe exynos5250-sysreg?

And need to add/modify binding doc?

- Kukjin

> +		reg = <0x10050000 0x5000>;
> +	};
> +
>  	watchdog@101D0000 {
>  		compatible = "samsung,exynos5250-wdt";
>  		reg = <0x101D0000 0x100>;
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi
> index a802f74..5d5d6e3 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -682,6 +682,11 @@
>  		reg = <0x10040000 0x5000>;
>  	};
> 
> +	sysreg_system_controller: syscon@10050000 {
> +		compatible = "samsung,exynos5420-sys", "syscon";
> +		reg = <0x10050000 0x5000>;
> +	};
> +
>  	tmu_cpu0: tmu@10060000 {
>  		compatible = "samsung,exynos5420-tmu";
>  		reg = <0x10060000 0x100>;
> --
> 1.7.10.4
