From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: exynos4210: MDMA1 device belongs to LCD0
 power domain
Date: Mon, 30 Nov 2015 15:58:45 +0900
Message-ID: <565BF3A5.30103@samsung.com>
References: <1448542190-19498-1-git-send-email-m.szyprowski@samsung.com>
 <1448542190-19498-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24030 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788AbbK3G64 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 01:58:56 -0500
In-reply-to: <1448542190-19498-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 26.11.2015 21:49, Marek Szyprowski wrote:
> On Exynos 4210 MDMA1 device belongs to LCD0 power domain, so add proper
> power-domains property. On Exynos 4x12, it belongs to TOP power domain,
> which is always enabled, thus require no assignment in exynos4x12.dtsi.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)

Makes sense. I suppose the rest of the patchset does not depends on it
directly so it can go through samsung-soc tree (otherwise please let us
know).

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
