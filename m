From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/4] ARM: dts: exynos4: add PMU syscon node
Date: Thu, 24 Apr 2014 18:07:03 +0200
Message-ID: <535936A7.9050003@samsung.com>
References: <1397479700-15864-1-git-send-email-chanho61.park@samsung.com>
 <1397479700-15864-2-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:56240 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932321AbaDXQHN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 12:07:13 -0400
In-reply-to: <1397479700-15864-2-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: k.debski@samsung.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

Hi Chanho,

On 14.04.2014 14:48, Chanho Park wrote:
> This patch adds a PMU(Power Management Unit) syscon node. This
> should be required for USB Phy syscon regmap I/F.
>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 2f8bcd0..e565b86 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -110,6 +110,11 @@
>   		reg = <0x10010000 0x400>;
>   	};
>
> +	pmu_reg: syscon@10020000 {
> +		compatible = "samsung,exynos4-pmureg", "syscon";

This compatible string doesn't seem to be defined in [1], please add it 
there,

[1] Documentation/devicetree/bindings/arm/samsung/pmu.txt

Otherwise looks good, so after fixing that you may add my

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
