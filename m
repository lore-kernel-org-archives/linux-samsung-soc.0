From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: Disable pull down for audio pins in
 Exynos5433 SoCs
Date: Fri, 20 Jan 2017 07:35:12 -0300
Message-ID: <0028c25b-8c9b-99f5-f170-92453d295391@osg.samsung.com>
References: <CGME20170120065702eucas1p1dd0b370aa6cba11d26ce2ed1651f16b9@eucas1p1.samsung.com>
 <1484895413-9080-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:50401
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751598AbdATKfT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 05:35:19 -0500
In-Reply-To: <1484895413-9080-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hello Marek,

On 01/20/2017 03:56 AM, Marek Szyprowski wrote:
> Common definition for I2S, PMC, SPDIF buses should not define any pull
> control for the individual pins. Correct this by changing samsung,pin-pud
> property to EXYNOS_PIN_PULL_NONE like it is defined for other Exynos SoCs.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
