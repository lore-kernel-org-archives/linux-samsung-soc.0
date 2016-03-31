From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 1/9] ARM: dts: Add initial pin configuration for
 exynos3250-rinato
Date: Thu, 31 Mar 2016 13:46:04 +0900
Message-ID: <56FCAB8C.4070505@samsung.com>
References: <1459392485-11327-1-git-send-email-cw00.choi@samsung.com>
 <1459392485-11327-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56200 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbcCaEqN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Mar 2016 00:46:13 -0400
In-reply-to: <1459392485-11327-2-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On 31.03.2016 11:47, Chanwoo Choi wrote:
> This patch adds initial pin configuration using pinctrl subsystem
> to reduce leakage power-consumption of gpio pins in normal state.
> All pins included in this patch are NC (not connected) pin.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 38 +++++++++++++++++
>  arch/arm/boot/dts/exynos3250-rinato.dts   | 71 ++++++++++++++++++++++++++++++-
>  2 files changed, 107 insertions(+), 2 deletions(-)

Thanks, applied this one for v4.7 with adjusted title.

Best regards,
Krzysztof
