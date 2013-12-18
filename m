From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 6/6] ARM: dts: exynos4: Add missing unit-address of
 sysreg node
Date: Thu, 19 Dec 2013 03:23:52 +0900
Message-ID: <52B1E838.4030304@samsung.com>
References: <1386864738-19829-1-git-send-email-t.figa@samsung.com> <1386864738-19829-7-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:51042 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203Ab3LRSX7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 13:23:59 -0500
In-Reply-To: <1386864738-19829-7-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>

On 12/13/13 01:12, Tomasz Figa wrote:
> The node contains reg property, so unit-address suffix should be present
> in its name.
>
> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> Acked-by: Kyungmin Park<kyungmin.park@samsung.com>
> Reviewed-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 4fed2ad..ee173fe 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -99,7 +99,7 @@
>   		reg =<0x10440000 0x1000>;
>   	};
>
> -	sys_reg: sysreg {
> +	sys_reg: sysreg@10010000 {
>   		compatible = "samsung,exynos4-sysreg", "syscon";
>   		reg =<0x10010000 0x400>;
>   	};

Tomasz, I already Sachin's patch for similar changing of sys_reg 
property with your reviewed tag.

ARM: dts: Fix sysreg node name in exynos4.dtsi

I've applied whole this series except this one.
If any problems, please kindly let me know.

Thanks,
Kukjin
