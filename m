From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] spi/s3c64xx: Convert to using core message queue
Date: Wed, 22 Feb 2012 10:07:06 +0100
Message-ID: <CACRpkdawRwsT9SBS7BjyEnZzV3Z+Fe=NKVde2ghxjxCuqWJaNg@mail.gmail.com>
References: <1329346112-1647-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:52650 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752058Ab2BVJHH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 04:07:07 -0500
Received: by iacb35 with SMTP id b35so10062767iac.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2012 01:07:06 -0800 (PST)
In-Reply-To: <1329346112-1647-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org

On Wed, Feb 15, 2012 at 11:48 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:

> Convert the s3c64xx driver to using the new message queue factored out of
> the pl022 driver by Linus Walleij, saving us a nice block of code and
> getting the benefits of improvements implemented in the core.
>
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Hi Mark,

I tried to include this patch for my patch series but it seems it might be
dependent on other stuff already applied in the SPI tree so I couldn't
get it to apply.

However I guess if Grant picks up the latest (v3) version of the
core patch it should apply just as fine on top of that one.

Yours,
Linus Walleij
