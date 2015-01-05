From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] ARM: samsung: add exynos-chipid binding information
Date: Mon, 05 Jan 2015 15:15:01 +0530
Message-ID: <54AA5D1D.9000409@samsung.com>
References: <1417592664-10672-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60062 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753270AbbAEJop (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jan 2015 04:44:45 -0500
In-reply-to: <1417592664-10672-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, pawel.moll@arm.com, thomas.ab@samsung.com

Gentle Ping.

On Wednesday 03 December 2014 01:14 PM, Pankaj Dubey wrote:
> Exynos SoC's DT files are using Chipid device nodes, but it's binding
> information is missing. This patch adds exynos-chipid binding information.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>   .../bindings/arm/samsung/exynos-chipid.txt         |   12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
> new file mode 100644
> index 0000000..85c5dfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
> @@ -0,0 +1,12 @@
> +SAMSUNG Exynos SoCs Chipid driver.
> +
> +Required properties:
> +- compatible : Should at least contain "samsung,exynos4210-chipid".
> +
> +- reg: offset and length of the register set
> +
> +Example:
> +	chipid@10000000 {
> +		compatible = "samsung,exynos4210-chipid";
> +		reg = <0x10000000 0x100>;
> +	};
>

Thanks,
Pankaj Dubey
