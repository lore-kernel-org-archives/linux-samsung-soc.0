From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: remove Exynos4212 support (dead
 code)
Date: Mon, 9 Jan 2017 13:59:26 -0300
Message-ID: <b924cc2e-72fb-cc69-980b-099a3b13c739@osg.samsung.com>
References: <CGME20170109083453eucas1p295add9f8c3e5a10c7ae3081d6567fe08@eucas1p2.samsung.com>
 <1483950880-16016-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:57001
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1762598AbdAIQ7g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 11:59:36 -0500
In-Reply-To: <1483950880-16016-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>

Hello Marek,

On 01/09/2017 05:34 AM, Marek Szyprowski wrote:
> There are no Exynos4212 based boards in mainline, so there is no need to
> keep additional files for SoCs, which are never used. This patch removes
> support for Exynos4212 SoCs and moves previously shared Exynos4412
> definitions to a single file to simplify future maintenance.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

There are still a lot of references to Exynos4212 after this patch though.
I see Kconfig symbols, macros, SoC specific logic and compatibles strings
in Exynos platform code, drivers and DT bindings.

Are you planning to also remove these as a follow-up?

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
