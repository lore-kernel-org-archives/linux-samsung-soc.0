From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] rtc: Fix module autoload for rtc-{ab8500,max8997,s5m}
 drivers
Date: Mon, 31 Aug 2015 22:09:44 +0200
Message-ID: <20150831200944.GA3409@piout.net>
References: <1440671672-26590-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:45704 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751345AbbHaUJq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 16:09:46 -0400
Content-Disposition: inline
In-Reply-To: <1440671672-26590-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Luis de Bethencourt <luis.bg@samsung.com>, linux-samsung-soc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Sangbeom Kim <sbkim73@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org

On 27/08/2015 at 12:34:32 +0200, Javier Martinez Canillas wrote :
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
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
