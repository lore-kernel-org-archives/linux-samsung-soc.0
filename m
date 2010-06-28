From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: SMDK6440: I2C writes fails
Date: Mon, 28 Jun 2010 15:17:06 +0100
Message-ID: <20100628141706.GD7403@rakim.wolfsonmicro.main>
References: <AANLkTim5qV8N_0iZ9DViJG1-IqYHhO-DKJZrd7RHpWbB@mail.gmail.com>
 <20100624113236.GA3958@opensource.wolfsonmicro.com>
 <AANLkTikxaMB4eqnNuC8lneEt333gRWzKfLHy2-ChQeB5@mail.gmail.com>
 <34703F8C-7A9C-43FE-A748-9F6E90F3D425@opensource.wolfsonmicro.com>
 <AANLkTikPNJXmcdGxAutoScAnrgvowKE9ChsOaOGQM9sC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59899 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754390Ab0F1ORI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jun 2010 10:17:08 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTikPNJXmcdGxAutoScAnrgvowKE9ChsOaOGQM9sC@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>

On Mon, Jun 28, 2010 at 10:53:18AM +0530, Naveen Krishna Ch wrote:
> On 24 June 2010 22:05, Mark Brown <broonie@opensource.wolfsonmicro.com>wrote:

> > That smells rather like a compiler bug to me - the two versions
> > ought to be equivalent apart from the ordering of the comparisons.

> I'm not sure, I'm using arm-2009q3 toolchain.

I don't see any reason to suspect that a particular codesourcery code
drop from last year would be compltely bug free?
