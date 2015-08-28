From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] rtc: Fix module autoload for rtc-{ab8500,max8997,s5m}
 drivers
Date: Fri, 28 Aug 2015 09:27:37 +0900
Message-ID: <55DFAAF9.3020202@samsung.com>
References: <1440671672-26590-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37878 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709AbbH1A1p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Aug 2015 20:27:45 -0400
In-reply-to: <1440671672-26590-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Luis de Bethencourt <luis.bg@samsung.com>, linux-samsung-soc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Sangbeom Kim <sbkim73@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org

On 27.08.2015 19:34, Javier Martinez Canillas wrote:
> These platform drivers have a platform device ID table but the module
> alias information is not created so module autoloading will not work.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  drivers/rtc/rtc-ab8500.c  | 1 +
>  drivers/rtc/rtc-max8997.c | 1 +
>  drivers/rtc/rtc-s5m.c     | 1 +
>  3 files changed, 3 insertions(+)

Makes sense:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
