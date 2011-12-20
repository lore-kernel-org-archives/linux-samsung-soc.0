From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] s5p-g2d: add G2D to mach-nuri
Date: Tue, 20 Dec 2011 01:13:40 +0000
Message-ID: <20111220011340.GR2860@opensource.wolfsonmicro.com>
References: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
 <1323446682-25252-3-git-send-email-k.debski@samsung.com>
 <20111212052745.GA686@sirena.org.uk>
 <CAH9JG2UBb0Dp3i9Hzwx36AykKS5wZd5fsaP3y-og8VVoGqfhtg@mail.gmail.com>
 <20111212100316.GB31568@opensource.wolfsonmicro.com>
 <CAH9JG2XLiFqGyjohtLBT9U6jfwnP4xfuoNMEA=ds_2-gBs2Ong@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60025 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752124Ab1LTBNo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Dec 2011 20:13:44 -0500
Content-Disposition: inline
In-Reply-To: <CAH9JG2XLiFqGyjohtLBT9U6jfwnP4xfuoNMEA=ds_2-gBs2Ong@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kamil Debski <k.debski@samsung.com>, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kgene.kim@samsung.com

On Mon, Dec 12, 2011 at 11:32:28PM +0900, Kyungmin Park wrote:
> On Mon, Dec 12, 2011 at 7:03 PM, Mark Brown

> > I'm not sure I understand why we would not be ready to do things li=
ke
> > this? =A0I'd also expect that doing things in a board specific fash=
ion
> > might create issues with things being set up twice.

> Please see the below,
> https://lkml.org/lkml/2011/11/15/16

> Even though I can't agree with his opinions. There are other voice li=
ke this.

> I also want to common registration and select at each board.

So, I looked at the discussion there and I'm not sure I'm buying what's
being said; it seems to be as much a fear of change and a lack of
awareness of modern infrastructure as anything else.  It seems to me
that this is a case where we should just be turning round and saying
that the default position ought to be the other way around, if things
need to be done per board there should be a strong reason for it.
