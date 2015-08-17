From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 4/4] ARM: dts: Add MSHC2 dt node for Exynos3250 SoC
Date: Mon, 17 Aug 2015 11:13:35 +0900
Message-ID: <55D1434F.1040502@samsung.com>
References: <1439264784-30322-1-git-send-email-cw00.choi@samsung.com>
 <1439264784-30322-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25211 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752385AbbHQCNp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Aug 2015 22:13:45 -0400
In-reply-to: <1439264784-30322-5-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 11.08.2015 12:46, Chanwoo Choi wrote:
> This patch add the MSHC2 (Mobile Storage Host Controller) devicetree node for
> Exynos3250 SoC.

s/add/adds/
s/devicetree/Device Tree/

> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 35 +++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos3250.dtsi         | 13 ++++++++++++
>  2 files changed, 48 insertions(+)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
