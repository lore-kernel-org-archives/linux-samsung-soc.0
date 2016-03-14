From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 04/10] ARM: dts: Add MSHC2 dt node for Exynos3250 SoC
Date: Mon, 14 Mar 2016 15:22:38 +0900
Message-ID: <56E658AE.5070806@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:22120 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806AbcCNGWs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 02:22:48 -0400
In-reply-to: <1457921056-21257-5-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 14.03.2016 11:04, Chanwoo Choi wrote:
> This patch adds the MSHC2 (Mobile Storage Host Controller) Device Tree node for
> Exynos3250 SoC.
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 35 +++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos3250.dtsi         | 13 ++++++++++++
>  2 files changed, 48 insertions(+)


After looking at your other patch ("ARM: dts: Add initial pin
configuration for exynos3250-rinato") I have doubts. The Monk will be
affected.

Here you are configuring all the gpk2 GPIOS for EMMC2 mode. Then on
Rinato you are setting it back to default non-used state. However the
Monk board will remain with this new configuration... so you would have
to add initial-state also for Monk.

But how about doing opposite? Configure here the pins to unused state
and enable them only for Artik board?

What do you think?

Best regards,
Krzysztof
