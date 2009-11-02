From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: S3C64XX DSP support added
Date: Mon, 2 Nov 2009 11:23:58 +0000
Message-ID: <20091102112358.GC29351@sirena.org.uk>
References: <1257127774-5564-1-git-send-email-jassisinghbrar@gmail.com> <20091102104211.GA29351@sirena.org.uk> <1b68c6790911020310u18dbae52u89063b311e671d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:51379 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754404AbZKBLXy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 06:23:54 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6790911020310u18dbae52u89063b311e671d@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Mon, Nov 02, 2009 at 08:10:07PM +0900, jassi brar wrote:

> The codec drivers use the term DSP (DSP_A/DSP_B) for what our PCM
> controller does.

I know; this is a bit unfortunate but not too much of an issue since
it's only ever mentioned in the context of a DAIFMT constant so it's
clear what's being talked about.  In this case it's particularly
confusing because the hardware is always talked about as being PCM and
from the sounds of it some of the current S5P processors already have
some basic DSP stuff in them.

> I used 'DSP' for things related to ALSA and 'PCM' for h/w specific things.

I'm having a hard time following your logic here?  This is a hardware
driver after all.

> > You might want to rename the existing PCM driver to DMA.
> Could do that, but still 'PCM' is used at other places in the stack as well.
> Would that be fine?

Probably, yes.  The use of PCM for DMA drivers is there mostly because
in older systems the PCM interface offered no software control at all so
all you needed to drive them was the DMA driver.
