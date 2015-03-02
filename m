From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 00/10] ARM: s3c64xx multiplatform, help needed
Date: Mon, 2 Mar 2015 09:37:37 -0800
Message-ID: <20150302173737.GB17094@dtor-ws>
References: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:33008 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751918AbbCBRhm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Mar 2015 12:37:42 -0500
Received: by iecar1 with SMTP id ar1so49917739iec.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Mar 2015 09:37:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Maurus Cuelenaere <mcuelenaere@gmail.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, ch.naveen@samsung.com, a.kesavan@samsung.com, cw00.choi@samsung.com, jic23@kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, padma.v@samsung.com, Vasily Khoruzhick <anarsoul@gmail.com>

On Mon, Mar 02, 2015 at 01:35:53PM +0100, Arnd Bergmann wrote:
> Hi everyone,
> 
> I've had these patches in a private git tree for a while, and have
> finally gotten around to clean them up some more for submission.
> Hopefully we can get all of it merged into 4.1.
> 
> I've done this to the best of my knowledge, but some parts are
> a bit tricky, so I expect that there are bugs. The trickiest
> part is the touchscreen driver. I've sent it out for review
> last year already, but I have not found anybody who could test
> it, and it's basically a blind rewrite of an existing driver,
> so it's unlikely that I got it all right.

I think Vasily had access to hardware with s3c2410_ts at some point...

> 
> The other parts may actually work, but it is possible that
> I made a mistake with the ASoC driver, the sparseirq support
> or something else.
> 
> Does anyone still have access to the hardware? I'm particularly
> interested in seeing this patch set get tested on smartq
> and on smdk6410, which have the majority of the hardware.

Thanks.

-- 
Dmitry
