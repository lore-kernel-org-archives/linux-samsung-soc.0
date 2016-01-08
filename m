From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable NEON, accelerated
 crypto and cpufreq stats
Date: Fri, 8 Jan 2016 12:32:53 -0300
Message-ID: <568FD6A5.9020409@osg.samsung.com>
References: <1452132905-8587-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:49551 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751167AbcAHPdB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jan 2016 10:33:01 -0500
In-Reply-To: <1452132905-8587-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Anand Moon <linux.amoon@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: tjakobi@math.uni-bielefeld.de

Hello Krzysztof,

On 01/06/2016 11:15 PM, Krzysztof Kozlowski wrote:
> Enable the kernel NEON mode and asm/NEON accelerated crypto algorithms
> which should bring performance benefits on Exynos SoCs. Enable these as
> modules because they are optional, not essential anyhow for platform
> booting nor related directly to Exynos Soc. All accelerated algorithms
> pass booting self-tests on Odroid XU4 (Exynos5422) and Trats2 (Exynos4412).
> 
> Additionally enable cpufreq statistics as they are useful for debugging.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
