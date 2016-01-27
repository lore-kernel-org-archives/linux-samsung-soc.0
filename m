From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 08/10] rtc: Remove Maxim 77802 driver
Date: Wed, 27 Jan 2016 11:09:30 +0900
Message-ID: <56A826DA.1080707@samsung.com>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
 <1453836020-29579-9-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:14454 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750851AbcA0CJh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 21:09:37 -0500
In-reply-to: <1453836020-29579-9-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

On 27.01.2016 04:20, Javier Martinez Canillas wrote:
> The max77686 RTC driver now supports the max77802 RTC as
> well so there's no need to have a separate driver anymore.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> ---
> 
> Changes in v3:
> - Add Laxman Dewangan's Acked-by tag to patch #8.
> 
> Changes in v2:
> - Add Krzysztof Kozlowski's Reviewed-by tag to patch #8.
> 
>  drivers/rtc/Kconfig        |  10 -
>  drivers/rtc/Makefile       |   1 -
>  drivers/rtc/rtc-max77802.c | 502 ---------------------------------------------
>  3 files changed, 513 deletions(-)
>  delete mode 100644 drivers/rtc/rtc-max77802.c
> 

FWIW, this also (surprise!) works on max77686:
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
