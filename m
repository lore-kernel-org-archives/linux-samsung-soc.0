From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] Removal of obsolete s3c2410_* GPIO API
Date: Mon, 27 Aug 2012 17:16:01 -0700
Message-ID: <CACRpkdbh=vkZBpdf1p9VTpMw833iAxmBcq50mM=c3a6hYk0b-g@mail.gmail.com>
References: <1345897243-15619-1-git-send-email-sylvester.nawrocki@gmail.com>
	<503C03D7.5050801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:35339 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755024Ab2H1AQC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Aug 2012 20:16:02 -0400
Received: by wgbdr13 with SMTP id dr13so4074131wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Aug 2012 17:16:01 -0700 (PDT)
In-Reply-To: <503C03D7.5050801@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org, linus.walleij@stericsson.com, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>

On Mon, Aug 27, 2012 at 4:33 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> Linus, this series should be sent to upstream via both trees, samsung and
> gpio to avoid useless merge conflicts. How do you think?

Take it all in the Samsung tree. You just need my ACK, which you have.

I don't have any big Samsung patches in my tree, just fixes that
will go into the -rc:s anyway.

Yours,
Linus Walleij
