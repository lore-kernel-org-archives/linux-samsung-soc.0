From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: plat-samsung: remove unused register definitions
Date: Wed, 24 Feb 2016 09:53:32 +0900
Message-ID: <56CCFF0C.3000004@samsung.com>
References: <1456218373-23658-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:44252 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751949AbcBXAxk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Feb 2016 19:53:40 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O310084M15DAZ00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Feb 2016 00:53:37 +0000 (GMT)
In-reply-to: <1456218373-23658-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, linux@arm.linux.org.uk

On 23.02.2016 18:06, Pankaj Dubey wrote:
> This patch removes S5P_VA_TWD and S3C_UART_OFFSET as it is no more used
> by any platform which including this header file.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/plat-samsung/include/plat/map-s5p.h | 5 -----
>  1 file changed, 5 deletions(-)

Just squash it with previous patch and remove S3C_UART_OFFSET
atomically. Everywhere or nowhere. Not a little bit here, a little bit
there.

Best regards,
Krzysztof
