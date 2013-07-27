From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V2 2/8] ASoC: Samsung: I2S: Add quirks as driver data in I2S
Date: Sat, 27 Jul 2013 13:56:43 +0200
Message-ID: <2425397.IIfnern1kk@flatron>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com> <1417636.4d7IlsSAyI@amdc1227> <20130726152551.GM9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f48.google.com ([209.85.214.48]:32932 "EHLO
	mail-bk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751538Ab3G0L4u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Jul 2013 07:56:50 -0400
Received: by mail-bk0-f48.google.com with SMTP id jf3so1435981bkc.7
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jul 2013 04:56:49 -0700 (PDT)
In-Reply-To: <20130726152551.GM9858@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, kgene.kim@samsung.com, abrestic@chromium.org

On Friday 26 of July 2013 16:25:51 Mark Brown wrote:
> On Fri, Jul 26, 2013 at 05:02:46PM +0200, Tomasz Figa wrote:
> > IMHO this SoC-based identification looks much better, especially
> > considering the fact that IP version isn't something easily
> > determinable, as even the documentation can sometimes be not really
> > clear about that.
> 
> Yeah, it's not terribly clever either way.  We've been using the version
> numbers in audio for a long time partly because it is documented
> sometimes and partly because most of the SoCs tend to have one fully
> featured controller and a bunch of secondary controllers on older IP
> revisions.
> 
> > However the s3c6410-i2sv4 string looks a bit unfortunate. AFAIK there
> > were two types of I2S IPs on S3C6410 - normal I2S and I2S
> > multichannel. What about having a compatible like s3c6410-i2s-multi?
> 
> It was explicitly identified as I2Sv4 in the S3C6410 datasheet so no
> real issue there.

Well, the datasheet I have calls it either "I2S V40" or "IIS MULTI AUDIO 
INTERFACE". I like the latter much more, because it actually says what's 
the difference compared to previous I2S IPs.

I'm not strongly against using the v4 suffix, but since we decided to use 
more meaningful compatible values elsewhere, I think this way would be 
better for sound drivers as well.

Best regards,
Tomasz
