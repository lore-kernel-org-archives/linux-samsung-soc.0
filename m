From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 0/6] pinctrl: s3c/samsung: Add header with values used for
 configuration
Date: Thu, 1 Sep 2016 12:53:25 +0200
Message-ID: <f235a3a0-36cb-7816-6f57-4a09d63d109f@osg.samsung.com>
References: <1472721715-2833-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:53715
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932298AbcIAKxd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 06:53:33 -0400
In-Reply-To: <1472721715-2833-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 09/01/2016 11:21 AM, Krzysztof Kozlowski wrote:
> Hi,
> 
> Extend previous patchset (v2) [1] to older, legacy platforms.
> This depends on v2 of prevoius patchset.
> 
> 
> Changes in DTS/DTSI generated with:
> sed -i -e 's/samsung,pin-drv = <0>;$/samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;/' arch/arm/boot/dts/s5p*
> sed -i -e 's/samsung,pin-drv = <2>;$/samsung,pin-drv = <EXYNOS4_PIN_DRV_LV2>;/' arch/arm/boot/dts/s5p*
> sed -i -e 's/samsung,pin-drv = <1>;$/samsung,pin-drv = <EXYNOS4_PIN_DRV_LV3>;/' arch/arm/boot/dts/s5p*
> sed -i -e 's/samsung,pin-drv = <3>;$/samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;/' arch/arm/boot/dts/s5p*
> 

Besides the comment for patch 1/6, the series looks good to me.
So when posting v2 feel free to add:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
