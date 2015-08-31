From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] arm64: dts: Add BUS1 instance pinctrl support
Date: Mon, 31 Aug 2015 14:42:53 +0900
Message-ID: <55E3E95D.50003@samsung.com>
References: <1440761134-27639-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20991 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751256AbbHaFnC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 01:43:02 -0400
In-reply-to: <1440761134-27639-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, gautam.vivek@samsung.com

On 28.08.2015 20:25, Alim Akhtar wrote:
> This adds BUS1 instance pinctrl for exynos7 soc.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi |  111 +++++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7.dtsi         |    7 ++
>  2 files changed, 118 insertions(+)

The "etc1" GPIO in my datasheet is not fully documented but the rest
looks good:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
