From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RESEND] ARM: dts: Move display-timings node from fimd to
 dp
Date: Tue, 29 Sep 2015 16:21:07 +0900
Message-ID: <560A3BE3.3090504@samsung.com>
References: <1442494120-463-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:34842 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755546AbbI2HVP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Sep 2015 03:21:15 -0400
In-Reply-To: <1442494120-463-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

W dniu 17.09.2015 o 21:48, Tomeu Vizoso pisze:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch moves the display-timings node from fimd to dp to reflect the
> device tree bindings change.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> [tomeu.vizoso@collabora.com: Rebased]
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> 
> ---
> 
> Hi,
> 
> looks like a long time ago the bindings were changed and the DTs for
> these boards weren't updated.
> 
> I have retaken Sean's forgotten patch and rebased it, but I have only
> tested on an Arndale that exynos-drm doesn't complain about missing
> timings.
> 
> Regards,
> 
> Tomeu
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts  |  8 ++++----
>  arch/arm/boot/dts/exynos5250-smdk5250.dts | 16 ++++++++--------
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |  7 ++++---
>  3 files changed, 16 insertions(+), 15 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
