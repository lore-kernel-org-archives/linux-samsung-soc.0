From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Fix mismatched value for SD4 pull
 up/down configuration on exynos4210
Date: Thu, 1 Sep 2016 12:19:47 +0200
Message-ID: <35fb6718-aa5a-bb72-be3f-a44fab0c5aef@osg.samsung.com>
References: <1472719022-27226-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:53609
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752984AbcIAKTx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 06:19:53 -0400
In-Reply-To: <1472719022-27226-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 09/01/2016 10:37 AM, Krzysztof Kozlowski wrote:
> The pinctrl pull up/down register on exynos4210 is 2-bit wide for each
> pin and it accepts only values of 0, 1 and 3.  The pins sd4-bus-width8
> were configured with value of 4.  The driver does not validate the value
> so this overflow effectively set a bit 1 in adjacent pins thus
> configuring them to pull down.
> 
> The author's intention was probably to set drive strength of 4x.  All
> other bus-widths pins are configured with pull up and drive strength of
> 4x.  Fix this one with same pattern.
> 
> Fixes: 87711d8c7c70 ("ARM: dts: Add pinctrl node entries for SAMSUNG EXYNOS4210 SoC")
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
