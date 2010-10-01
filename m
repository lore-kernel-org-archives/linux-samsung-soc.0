From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] ARM: S5PV210: Add voltage consumer of WM8994 to
 the regulator framework
Date: Fri, 1 Oct 2010 11:27:53 -0700
Message-ID: <20101001182752.GD21157@opensource.wolfsonmicro.com>
References: <4CA5623D.3000002@samsung.com>
 <20101001053139.GE30949@sirena.org.uk>
 <AANLkTinRgTJdPowTEZX0nix2FR31A-8cVmBUf7n8zdE7@mail.gmail.com>
 <20101001072425.GD20529@opensource.wolfsonmicro.com>
 <AANLkTi=4XjbTDb_vukFicO2tXYvww-dGFyaErwx1i-BF@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37415 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754300Ab0JAS1j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 14:27:39 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTi=4XjbTDb_vukFicO2tXYvww-dGFyaErwx1i-BF@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Fri, Oct 01, 2010 at 05:25:43PM +0900, Kyungmin Park wrote:
> On Fri, Oct 1, 2010 at 4:24 PM, Mark Brown

> > It's still good to show the actual connection on the board for clarity -
> > like I say, the regulator API can handle always on regulators and
> > keeping the regulator setup in software close to the schematic helps
> > make the code easier to follow.

> It's best but in most case schematic is confidential. so it's impossible.

Right, this is normal - even with widely available reference boards the
schematics are often distributed only under NDA.  Since the information
exposed is at the same level as describing where the devices are on
buses and so on this isn't usually a problem.

> And as you concerns there's no power issues related with codes. it's
> already verified design. I think wolfsonmicro already confirmed.

Using a fixed voltage regulator won't cause a problem in operation, the
issue is one of code quality.
