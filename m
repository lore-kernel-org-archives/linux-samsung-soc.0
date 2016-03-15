From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 7/7] ARM: dts: Add initial gpio setting of MMC2 device
 for exynos3250-monk
Date: Tue, 15 Mar 2016 11:38:42 +0900
Message-ID: <56E775B2.9010100@samsung.com>
References: <1458007695-3627-1-git-send-email-cw00.choi@samsung.com>
 <1458007695-3627-8-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:10250 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932942AbcCOCiu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 22:38:50 -0400
In-reply-to: <1458007695-3627-8-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 15.03.2016 11:08, Chanwoo Choi wrote:
> This patch adds initial pin configuration of MMC2 device on exynos3250-monk
> board because the MMC2 gpio pin (gpk2[0-6]) are NC (not connected) state.
> 
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-monk.dts | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>

The patch should go in before setting these pins to MMC2 (so before
patch 4/7) so there won't be any change in behaviour.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>



Best regards,

Krzysztof
