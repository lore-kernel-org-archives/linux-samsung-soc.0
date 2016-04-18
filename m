From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Remove unsupported s2mps11 regulator
 bindings from Exynos5420 boards
Date: Mon, 18 Apr 2016 12:52:37 -0400
Message-ID: <571510D5.3090406@osg.samsung.com>
References: <1460965453-5337-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:60897 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751979AbcDRQw6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2016 12:52:58 -0400
In-Reply-To: <1460965453-5337-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 04/18/2016 03:44 AM, Krzysztof Kozlowski wrote:
> The bindings like s2mps11,buck6-ramp-enable or s2mps11,buck2-ramp-delay
> where ignored. They were never parse by s2mps11 regulator driver. Also
> the values used in these bindings were equal to default reset values of
> S2MPS11 device. It is safe to remove them.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

On a related note, the s5m8767 regulator driver parses similar DT properties
("s5m8767,pmic-buck-ramp-delay", "s5m8767,pmic-buck2-ramp-enable", etc) that
are not in Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt.

So those should either be added to the binding doc or removed from the driver
if are not correct (I don't have documentation for the s5m8767 PMIC but the
DT properties are not use by any DTS in mainline using the s5m8767 PMIC).

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
