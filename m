From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 8/8] ARM: multi_v7_defconfig: Remove MAX77802 RTC Kconfig
 symbol
Date: Thu, 21 Jan 2016 10:58:32 +0900
Message-ID: <56A03B48.7080507@samsung.com>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
 <1453310088-29985-9-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:18479 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753396AbcAUB6f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 20:58:35 -0500
In-reply-to: <1453310088-29985-9-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 21.01.2016 02:14, Javier Martinez Canillas wrote:
> The driver has been removed so the Kconfig symbol is not valid anymore.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> 
> ---
> 
>  arch/arm/configs/multi_v7_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
