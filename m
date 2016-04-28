From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Disable big.LITTLE switcher
Date: Thu, 28 Apr 2016 12:04:26 -0400
Message-ID: <e9259b1f-1cd7-b70f-86c3-cbe02c94be22@osg.samsung.com>
References: <1493315.8NlXQFsEtt@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:48780 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752403AbcD1QEh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 12:04:37 -0400
In-Reply-To: <1493315.8NlXQFsEtt@amdc1976>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello Bartlomiej,

On 04/28/2016 10:44 AM, Bartlomiej Zolnierkiewicz wrote:
> Disable big.LITTLE switcher in order to allow automatic usage of
> cpufreq-dt driver on Exynos542x/Exynos5800 SoCs based boards.
> 
> This change should not cause any problems as arm_big_little[_dt]
> driver (which is using big.LITTLE switcher support to do the "real"
> big.LITTLE switching work) is not used on any Exynos SoC based
> board currently.
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

On an Exynos5422 Odroid XU4 and Exynos5800 Peach Pi Chromebook:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
--
Javier Martinez Canillas
Open Source Group
Samsung Research America
