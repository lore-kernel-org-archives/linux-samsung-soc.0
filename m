From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] s5p-g2d: add G2D to mach-nuri
Date: Mon, 12 Dec 2011 18:03:17 +0800
Message-ID: <20111212100316.GB31568@opensource.wolfsonmicro.com>
References: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
 <1323446682-25252-3-git-send-email-k.debski@samsung.com>
 <20111212052745.GA686@sirena.org.uk>
 <CAH9JG2UBb0Dp3i9Hzwx36AykKS5wZd5fsaP3y-og8VVoGqfhtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:46483 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751497Ab1LLKDW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Dec 2011 05:03:22 -0500
Content-Disposition: inline
In-Reply-To: <CAH9JG2UBb0Dp3i9Hzwx36AykKS5wZd5fsaP3y-og8VVoGqfhtg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kgene.kim@samsung.com

On Mon, Dec 12, 2011 at 06:27:30PM +0900, Kyungmin Park wrote:
> On 12/12/11, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:

> >> +	&s5p_device_g2d,

> > For devices like g2d which are always part of the SoC and which don't
> > require any external wiring on the board I was thinking we should just
> > have the core code for the SoC register the device rather than including
> > it in each board individually.  It'd save effort and ensure that people
> > automatically get to use the feature.

> I'm welcome to use these scheme. make a common.c and register it automatically.
> but I'm not sure we're ready to use this scheme. and I hope to start
> these work at smdk board instead of this patch.

I'm not sure I understand why we would not be ready to do things like
this?  I'd also expect that doing things in a board specific fashion
might create issues with things being set up twice.
