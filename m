From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] ARM: S5PV210: Add voltage consumer of WM8994 to
	the regulator framework
Date: Fri, 1 Oct 2010 06:31:39 +0100
Message-ID: <20101001053139.GE30949@sirena.org.uk>
References: <4CA5623D.3000002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:36942 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751671Ab0JAFbk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 01:31:40 -0400
Content-Disposition: inline
In-Reply-To: <4CA5623D.3000002@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Fri, Oct 01, 2010 at 01:23:25PM +0900, Chanwoo Choi wrote:

> Additionally, I explain the constraints of the regulator of WM8994 codec.
> All these consumer supply of WM8994 codec connected the regulator(VCC_1.8V)
> on a circuit diagram. "VCC_1.8V" regulator is always enabled, because it is
> used to many devices on Goni/Aquila board. This is required especially

It would be nicer to connect this to the regulator on the PMIC (I'm
assuming there is one), even if it is always enabled.  That said, is the
PMIC on these boards supported by Linux yet?

> when there are many devices physically attached to "VCC_1.8V" and some of
> they did not "register" as consumers to "VCC_1.8V". "VCC_1.8V" might be
> turned off by those who are registered while "unregistered" are still active

You can set the always_on flag in the regulator constraints to prevent
this happening - if that flag is set the supply will be kept active even
if all consumers are disabled.
