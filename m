From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] ARM: S3C64XX: Implement basic power domain support
Date: Fri, 2 Dec 2011 00:56:05 +0000
Message-ID: <20111202005604.GA31948@opensource.wolfsonmicro.com>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1322765339-29879-3-git-send-email-broonie@opensource.wolfsonmicro.com>
 <CAH9JG2WLO-wFT_QEv4qBeCcz-pE2CNoMqV8f8u3BKF8r+GSBvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48974 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755987Ab1LBA4J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 19:56:09 -0500
Content-Disposition: inline
In-Reply-To: <CAH9JG2WLO-wFT_QEv4qBeCcz-pE2CNoMqV8f8u3BKF8r+GSBvA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?utf-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>, =?utf-8?B?7ZWo66qF7KO8?= <myungjoo.ham@samsung.com>

On Fri, Dec 02, 2011 at 09:35:44AM +0900, Kyungmin Park wrote:

> I'm not sure what's the next step at s3c64xx for generic power domain.
> Related with exysno4 series, it's helpful to read following threads.
> http://68.183.106.108/lists/linux-pm/msg26291.html

> "I don't think we should control/gate the clocks with regarding power
> domain" from Mr. Kim

I tend to agree with him that gating the clocks automatically using
runtime PM would be nice as if nothing else it saves code in drivers.
I'm not sure how easy it's going to be to transition to doing that in
one jump, though - there's a lot of SoCs sharing IP right back to
S3C24xx.

Of course it should be fairly easy for most of the domains on s3c64xx
right now as there's only one actual driver involved in mainline, we
should just be gating almost all of the clocks concerned immediately
after we boot (assuming they aren't gated by default, I'd need to check)
and never touching them again anyway.  It'd only be the framebuffer
clocks that'd need some work and for a first pass we could just mark the
framebuffer domain as always on and get most of the win.  Sometimes lack
of driver support is a good thing :)
