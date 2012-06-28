From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] spi/s3c64xx: Expand S3C64XX_SPI_{DE,}ACT macros at
 call sites
Date: Thu, 28 Jun 2012 20:52:45 +0200
Message-ID: <CACRpkdaC3mXcgTib3JWOjuvaWU_NEcg1JCV-4QNS4EcAAZzCJQ@mail.gmail.com>
References: <1340889811-7524-1-git-send-email-broonie@opensource.wolfsonmicro.com>
	<1340889811-7524-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:62950 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754640Ab2F1Swq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jun 2012 14:52:46 -0400
Received: by qadb17 with SMTP id b17so213548qad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jun 2012 11:52:45 -0700 (PDT)
In-Reply-To: <1340889811-7524-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, spi-devel-general@lists.sourceforge.net

On Thu, Jun 28, 2012 at 3:23 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:

> They have very few users and they're both just doing a single register
> write so the advantage of having the macro is a bit limited. An inline
> function might make sense but it's as easy to just do the writes directly.
>
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Much clearer.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
