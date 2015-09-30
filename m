From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos4412-trats2: remove
 regulator-compatible usage
Date: Wed, 30 Sep 2015 09:16:21 +0900
Message-ID: <560B29D5.8050105@samsung.com>
References: <1443436714-4488-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8266 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751891AbbI3AQb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Sep 2015 20:16:31 -0400
In-reply-to: <1443436714-4488-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: linux.amoon@gmail.com, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org

On 28.09.2015 19:38, Javier Martinez Canillas wrote:
> The regulator-compatible property from the regulator DT binding was
> deprecated and the correct approach is to use the node's name.
> 
> This patch has no functional changes but by not using a deprecated
> property, new DTS based on this one will not carry the same issue.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> Changes in v2:
> - Fixed typo on LDO10. Pointed out by Anand Moon.
> 
>  arch/arm/boot/dts/exynos4412-trats2.dts | 105 +++++++++++---------------------
>  1 file changed, 35 insertions(+), 70 deletions(-)
> 

Tested on Trats2 board:
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
