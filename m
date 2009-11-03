From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 4/4] S3C64XX DSP: Added the CPU driver for PCM
 controllers
Date: Tue, 3 Nov 2009 09:52:48 +0000
Message-ID: <20091103095247.GB1520@rakim.wolfsonmicro.main>
References: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com>
 <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com>
 <1257127791-5595-3-git-send-email-jassisinghbrar@gmail.com>
 <1257127791-5595-4-git-send-email-jassisinghbrar@gmail.com>
 <20091102111753.GB29351@sirena.org.uk>
 <1b68c6790911021842s47de7fbdtfec7831b837a98dd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42910 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756001AbZKCJwo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2009 04:52:44 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6790911021842s47de7fbdtfec7831b837a98dd@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Tue, Nov 03, 2009 at 11:42:21AM +0900, jassi brar wrote:
> On Mon, Nov 2, 2009 at 8:17 PM, Mark Brown

> >> + =A0 =A0 =A0 =A0 =A0 =A0 local_irq_save(irqs);

> > Why local_irq_save()? =A0On existing uniprocessor systems they shou=
ld be

> Don't we need to protect critical mode change in PCM control register=
?
> Since the s3c64xx_dsp_snd_tx/rxctrl is small and non-blocking, I thin=
k
> protection by simply enabling/disabling IRQs should be fine.

Yes, but you're only disabling IRQs on the local CPU.  This means that =
a
future multi-core CPU variant won't get the benefit of the lock.  Since
the locking primitives are implemented so that the SMP-specifics compil=
e
out there should be no performance overhead from being prepared for
that.
