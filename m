From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v3] rtc: s3c: Don't print an error on probe deferral
Date: Sat, 19 Mar 2016 00:08:19 +0100
Message-ID: <20160318230819.GF2828@piout.net>
References: <1458005918-7893-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:59373 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751134AbcCRXIV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Mar 2016 19:08:21 -0400
Content-Disposition: inline
In-Reply-To: <1458005918-7893-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com

On 14/03/2016 at 22:38:38 -0300, Javier Martinez Canillas wrote :
> The clock and source clock looked up by the driver may not be available
> just because the clock controller driver was not probed yet so printing
> an error in this case is not correct and only adds confusion to users.
> 
> However, knowing that a driver's probe was deferred may be useful so it
> can be printed as a debug information.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> Changes in v3:
> - Change debug messages again as suggested by Joe Perches.
> 
> Changes in v2:
> - Improve debug messages as suggested by Joe Perches.
> 
>  drivers/rtc/rtc-s3c.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
