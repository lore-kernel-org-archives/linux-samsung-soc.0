From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] spi/s3c64xx: Remove unused message queue
Date: Sat, 06 Jul 2013 01:54:42 +0200
Message-ID: <1866030.QlpeqFgIhJ@flatron>
References: <1373046993-1349-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:61880 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751942Ab3GEXyp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 19:54:45 -0400
Received: by mail-ea0-f174.google.com with SMTP id o10so1744298eaj.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2013 16:54:44 -0700 (PDT)
In-Reply-To: <1373046993-1349-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@linaro.org>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

On Friday 05 of July 2013 18:56:33 Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Since the driver has been converted to use the core message pump code
> the only use of the messsage queue in the driver is a check to see if
> it is empty which will always succeed since nothing ever adds to the
> queue. Just remove the queue.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  drivers/spi/spi-s3c64xx.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 

Looks good to me.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
