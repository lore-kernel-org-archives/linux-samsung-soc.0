From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/2] soc: samsung: pm_domains: Prepare for supporting
 ARMv8 Exynos
Date: Wed, 11 May 2016 10:13:09 -0400
Message-ID: <7a62ff75-187e-06ef-8331-c056a7eee4e7@osg.samsung.com>
References: <1462888341-21963-1-git-send-email-k.kozlowski@samsung.com>
 <1462888341-21963-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:46575 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751360AbcEKONS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 10:13:18 -0400
In-Reply-To: <1462888341-21963-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 05/10/2016 09:52 AM, Krzysztof Kozlowski wrote:
> The ARMv8 Exynos family (Exynos5433 and Exynos7420) uses different value
> (0xf instead of 0x7) for controlling the power domain on/off registers
> (both for control and for status).
> 
> Choose the value depending on the compatible. This prepares the driver
> for supporting ARMv8 SoCs.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
