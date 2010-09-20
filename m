From: Ben Dooks <ben@fluff.org>
Subject: Re: [PATCH] ARM: s3c2442: Setup gpio {set,get}_pull callbacks
Date: Tue, 21 Sep 2010 00:41:15 +0100
Message-ID: <4C97F11B.50806@fluff.org>
References: <1285020052-20020-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:36213 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752404Ab0ITXl0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Sep 2010 19:41:26 -0400
In-Reply-To: <1285020052-20020-1-git-send-email-lars@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 20/09/10 23:00, Lars-Peter Clausen wrote:
> Currently the {set,get}_pull callbacks of the s3c24xx_gpiocfg_default structure
> are not initalized for the s3c2442 cpu type. This results in a NULL-pointer
> deref upon calling s3c_gpio_setpull.
> 
> The s3c2442 has pulldowns instead of pullups compared to the s3c2440.
> The method of controlling them is the same though.
> So this patch modifies the existing s3c_gpio_{get,set}pull_1up helper functions
> to take an additional parameter deciding whether the pin has a pullup or
> pulldown.
> The s3c_gpio_{get,set}pull_1{down,up} functions then wrap that functions passing
> either S3C_GPIO_PULL_UP or S3C_GPIO_PULL_DOWN.
> 
> Furthermore this patch sets up the s3c24xx_gpiocfg_default.{get,set}_pull fields
> in the s3c2442 cpu init function to the new pulldown helper functions.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Initial reading looks ok, will see about adding it to my -next tree.
