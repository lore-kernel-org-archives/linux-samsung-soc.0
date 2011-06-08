From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Wed, 8 Jun 2011 08:44:11 +0100
Message-ID: <20110608074411.GA5176@n2100.arm.linux.org.uk>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com> <BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com> <BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com> <20110607081527.GB20929@n2100.arm.linux.org.uk> <BANLkTin66PhYGmVSOJcuZr8wDH_iNgjhZQ@mail.gmail.com> <20110607182923.GA28451@n2100.arm.linux.org.uk> <20110607184329.GA20849@sirena.org.uk> <BANLkTikXGpxpyF8kQORqswD5tqNEjtj3dA@mail.gmail.com> <20110607222810.GB28451@n2100.arm.linux.org.uk> <BANLkTimy+on-kKAAiWbwoRCVb0A-JgTXBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:37180 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754070Ab1FHHoZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2011 03:44:25 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTimy+on-kKAAiWbwoRCVb0A-JgTXBw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kmpark@infradead.org>, kgene.kim@samsung.com, root <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org

On Wed, Jun 08, 2011 at 09:35:34AM +0530, Jassi Brar wrote:
> In real life, I saw that with the Samsung's SPDIF controller which has
> fifo depth only for a few samples and it gets very demanding if pro
> quality is expected. Aggravate that with high irq-latency under system
> load.
> And in such cases, it is much more preferable to employ system timers
> to generate period_elapsed updates and queue the whole ring buffer as
> one transfer item to be iterated endlessly by dma. Ex, PL330 doesn't
> lend to LLI but can be programmed endlessly looping one transfer item.

So you're talking about the _hardware_ circular buffer case which I
mentioned in my email.  No problem with the DMA engine API as has
already been said - it supports preparation of circular buffers.

So, from everything discussed so far, there's nothing lacking from
the DMA engine API for your purposes.
