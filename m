From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: S3C64XX DSP support added
Date: Tue, 3 Nov 2009 12:02:09 +0000
Message-ID: <20091103120208.GA3492@rakim.wolfsonmicro.main>
References: <1257127774-5564-1-git-send-email-jassisinghbrar@gmail.com>
 <20091102104211.GA29351@sirena.org.uk>
 <1b68c6790911020310u18dbae52u89063b311e671d@mail.gmail.com>
 <20091102112358.GC29351@sirena.org.uk>
 <1b68c6790911020359u49e9f369hcefaab9b28aeaa27@mail.gmail.com>
 <20091102120732.GA7485@rakim.wolfsonmicro.main>
 <1b68c6790911021738p2b32b27rf688de5b7b2fa1e4@mail.gmail.com>
 <20091103094751.GA1520@rakim.wolfsonmicro.main>
 <1b68c6790911030358s7effe979nadfd489c888671e4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58985 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752788AbZKCMCH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2009 07:02:07 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6790911030358s7effe979nadfd489c888671e4@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Tue, Nov 03, 2009 at 08:58:22PM +0900, jassi brar wrote:

> btw, I plan to rename s3c24xx-pcm.c/h to s3c-audio.c/h rather than s3c-dma.c/h
> because that code isn't about just dma and s3c-dma doesn't sound anything audio

The fact that it's in sound/soc ought to be a pretty big hint that it's
audio...
