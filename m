From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 05/37] ARM: dts: s5pv210-aquila: Fix typo in regulator
 enable GPIO property
Date: Tue, 13 Oct 2015 09:20:18 +0900
Message-ID: <561C4E42.7060905@samsung.com>
References: <1444684386-17094-1-git-send-email-laurent.pinchart@ideasonboard.com>
 <1444684386-17094-6-git-send-email-laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35847 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752009AbbJMAU1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 20:20:27 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NW4004KQUA1WV10@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2015 01:20:25 +0100 (BST)
In-reply-to: <1444684386-17094-6-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

On 13.10.2015 06:12, Laurent Pinchart wrote:
> The property name should be "gpio", not "gpios". Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/s5pv210-aquila.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
