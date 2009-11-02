From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: S3C64XX DSP support added
Date: Mon, 2 Nov 2009 12:07:33 +0000
Message-ID: <20091102120732.GA7485@rakim.wolfsonmicro.main>
References: <1257127774-5564-1-git-send-email-jassisinghbrar@gmail.com>
 <20091102104211.GA29351@sirena.org.uk>
 <1b68c6790911020310u18dbae52u89063b311e671d@mail.gmail.com>
 <20091102112358.GC29351@sirena.org.uk>
 <1b68c6790911020359u49e9f369hcefaab9b28aeaa27@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59448 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754578AbZKBMHc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 07:07:32 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6790911020359u49e9f369hcefaab9b28aeaa27@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Mon, Nov 02, 2009 at 08:59:44PM +0900, jassi brar wrote:

> Okay, will rename s3c24xx-pcm.c to s3c24xx-dma.c and call this driver
> as s3c64xx-pcm.c

Is there a PCM controller on the s3c24xx chips?  I know you're not
particularly intersted in them but if there is I'd be surprised if the
same driver wouldn't work for both and someone else might want to add
the s3c24xx specific stuff (probably mostly under arch/arm).  If that is
the case then s3c-pcm might be better.

It'd be nice to do that for the DMA driver too if it is getting renamed
anyway.
