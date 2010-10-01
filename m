From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] ARM: S5PV210: Add voltage consumer of WM8994 to
 the regulator framework
Date: Fri, 1 Oct 2010 00:24:26 -0700
Message-ID: <20101001072425.GD20529@opensource.wolfsonmicro.com>
References: <4CA5623D.3000002@samsung.com>
 <20101001053139.GE30949@sirena.org.uk>
 <AANLkTinRgTJdPowTEZX0nix2FR31A-8cVmBUf7n8zdE7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37434 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751862Ab0JAHYQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 03:24:16 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTinRgTJdPowTEZX0nix2FR31A-8cVmBUf7n8zdE7@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Fri, Oct 01, 2010 at 02:40:02PM +0900, Kyungmin Park wrote:

> FYI: now wm8994 codec is connected to I/O power directly. and there's
> no connection with PMIC.

Presumably there's a power rail connection...

> Maybe you mean the I/O power LDO and use it. but it's always on in
> case of s5pc110.

...like this.

> and can't turn off the this LDO on max8998 except the sleep.

It's still good to show the actual connection on the board for clarity -
like I say, the regulator API can handle always on regulators and
keeping the regulator setup in software close to the schematic helps
make the code easier to follow.
