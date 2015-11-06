From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v6 3/4] drivers: exynos-srom: Add support for bank
 configuration
Date: Fri, 06 Nov 2015 09:11:17 +0900
Message-ID: <563BF025.3070308@samsung.com>
References: <cover.1446724046.git.p.fedin@samsung.com>
 <ea4f9f2d5bac035c56156dfaf3119033478f5f3d.1446724046.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17074 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932944AbbKFALT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2015 19:11:19 -0500
In-reply-to: <ea4f9f2d5bac035c56156dfaf3119033478f5f3d.1446724046.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>

On 05.11.2015 21:03, Pavel Fedin wrote:
> Implement handling properties in subnodes and adding child devices to the
> system. Child devices will not be added if configuration fails.
> 
> Since the driver now does more than suspend-resume support, dependency on
> CONFIG_PM is removed.
> 
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig      |  2 +-
>  drivers/soc/samsung/Kconfig       |  2 +-
>  drivers/soc/samsung/exynos-srom.c | 61 +++++++++++++++++++++++++++++++++++++--
>  3 files changed, 61 insertions(+), 4 deletions(-)


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
