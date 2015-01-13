From: Inha Song <ideal.song@samsung.com>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: samsung: Document Trats2 audio
 subsystem bindings
Date: Tue, 13 Jan 2015 10:27:34 +0900
Message-ID: <20150113102734.7a3aa77a@songinha-Samsung-DeskTop-System>
References: <1420457117-11030-1-git-send-email-ideal.song@samsung.com>
 <1420457117-11030-3-git-send-email-ideal.song@samsung.com>
 <20150105152918.GT11764@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:25747 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751789AbbAMB1i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jan 2015 20:27:38 -0500
In-reply-to: <20150105152918.GT11764@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sbkim73@samsung.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.de, robh+dt@kernel.org, kgene@kernel.org, s.nawrocki@samsung.com, galak@codeaurora.org, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org

Hi Mark,

Thank you for your feedback and sorry for late response.

I think, I should remove clock settings in machine driver.
If the clock settings are necessary, I will add "assigned-clocks" nodes
in trats2 sound DT like odroid board.

Best Regards,
Inha Song.

> On Mon, Jan 05, 2015 at 08:25:16PM +0900, Inha Song wrote:
> 
> > + - clocks : Reference to the codec master clock
> > + - clock-names : The clock should be named "mclk"
> 
> This should be done in the CODEC driver, not in the machine driver - the
> CODEC always needs the clock, it's not something specific to this
> machine.  Even if we decide that for Linux the best thing to do is to
> manage the clock in the machine driver it should be described in the DT
> as being attached to the CODEC.
