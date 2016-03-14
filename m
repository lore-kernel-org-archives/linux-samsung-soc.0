From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 13:30:53 -0700
Message-ID: <1457987453.11972.133.camel@perches.com>
References: <1457987157-1177-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay0032.hostedemail.com ([216.40.44.32]:56642 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753263AbcCNUa5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 16:30:57 -0400
In-Reply-To: <1457987157-1177-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com

On Mon, 2016-03-14 at 17:25 -0300, Javier Martinez Canillas wrote:
> The clock and source clock looked up by the driver may not be available
> just because the clock controller driver was not probed yet so printing
> an error in this case is not correct and only adds confusion to users.
> 
> However, knowing that a driver's probe was deferred may be useful so it
> can be printed as debug information.

Hello again Javier:
> +			dev_dbg(&pdev->dev, "probe deferred due missing rtc clk\n");

Again, intelligible English would not use "due"
but would use "due to" or "because of".

> +				dev_dbg(&pdev->dev,
> +					"probe deferred due missing rtc src clk\n");

here too.
