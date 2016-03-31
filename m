From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 6/9] ARM: dts: Add initial gpio setting of MMC2 device
 for exynos3250-monk
Date: Thu, 31 Mar 2016 13:46:26 +0900
Message-ID: <56FCABA2.6030708@samsung.com>
References: <1459392485-11327-1-git-send-email-cw00.choi@samsung.com>
 <1459392485-11327-7-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52297 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751364AbcCaEqf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Mar 2016 00:46:35 -0400
In-reply-to: <1459392485-11327-7-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 31.03.2016 11:48, Chanwoo Choi wrote:
> This patch adds initial pin configuration of MMC2 device on exynos3250-monk
> board because the MMC2 gpio pin (gpk2[0-6]) are NC (not connected) state.
> 
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-monk.dts | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Thanks, applied this one for v4.7 with adjusted title.

I'll wait with other patches for Sylwester's branch/tag.

Best regards,
Krzysztof
