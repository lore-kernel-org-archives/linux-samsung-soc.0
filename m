From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 0/9] ARM: dts: exynos: Use macros for GPIO to make it more
 readable
Date: Wed, 31 Aug 2016 14:40:52 +0200
Message-ID: <9c17ea4e-780e-2e1b-4c97-40399c8e3086@osg.samsung.com>
References: <1472645613-5362-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:49225
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932687AbcHaMk7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 08:40:59 -0400
In-Reply-To: <1472645613-5362-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 08/31/2016 02:13 PM, Krzysztof Kozlowski wrote:
> Hi,
> 
> Example:
> -		samsung,pin-function = <0x2>;
> -		samsung,pin-pud = <0>;
> -		samsung,pin-drv = <0>;
> +		samsung,pin-function = <PIN_FUNC_SPC_2>;
> +		samsung,pin-pud = <PIN_PULL_NONE>;
> +		samsung,pin-drv = <PIN_DRV_LV1>;
>  
> This should be just more readable. Especially for drive strenghts which
> are unobvious and different between some SoCs.
>

I agree that's better to have macros for these instead of using magic numbers.

For all the series:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

> Tested with dtx_diff:
> for i in dts-old/exynos*dtb; do scripts/dtc/dtx_diff $i dts-new/$(basename $i);  done
>

I've also tested the patches on an Exynos5800 Peach Pi board, and as expected
everything is working correctly since the compiled DTB is exactly the same.

So for patches 1/9 and 9/9:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
