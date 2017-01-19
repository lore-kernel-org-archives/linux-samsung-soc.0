From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: Fix i2s0 pins pull control for
 Exynos5433 SoCs
Date: Thu, 19 Jan 2017 12:18:49 -0300
Message-ID: <08051469-0fe4-734b-7e31-f8cfa243c824@osg.samsung.com>
References: <CGME20170119135856eucas1p149239f274848d61b9aa785e8497d957a@eucas1p1.samsung.com>
 <1484834310-21173-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:46563
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753123AbdASP1p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 10:27:45 -0500
In-Reply-To: <1484834310-21173-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hello Marek,

On 01/19/2017 10:58 AM, Marek Szyprowski wrote:
> Common definition for I2S0 bus should not define any pull control for
> the individual I2S pins. Correct this by changing samsung,pin-pud property
> to EXYNOS_PIN_PULL_NONE like it is used for other Exynos SoCs.
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
