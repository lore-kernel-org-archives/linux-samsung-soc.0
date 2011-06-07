From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Tue, 7 Jun 2011 09:15:27 +0100
Message-ID: <20110607081527.GB20929@n2100.arm.linux.org.uk>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com> <BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com> <BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:50919 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499Ab1FGIQK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 04:16:10 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, root <alim.akhtar@samsung.com>

On Tue, Jun 07, 2011 at 01:39:43PM +0530, Jassi Brar wrote:
> Unfortunately, no. There are some features of Samsung's DMA API that
> the drivers have come to rely upon.
> Besides, I am not particularly a fan of the generic API. And IIRC,
> neither is Ben Dooks, the designer of the
> Samsung's DMA API.

We are now at the point where this is non-optional.  If the generic API
doesn't fit what Samsung needs, then that needs to be discussed and
whatever problems there are need to be resolved.

Continuing the platform specific DMA APIs is not sustainable.

I'm getting rather fed up with Samsung needing custom this and that, and
refusing to use the generic infrastructure such as clkdev.  This attitude
needs to change NOW.

Fix your platform specific crap and start using the generic services.
