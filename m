From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V2 2/4] clk: exynos-audss: set correct parent clocks
Date: Wed, 28 Aug 2013 03:02:36 +0200
Message-ID: <7654693.FMY6qS63O6@flatron>
References: <1376639378-20707-1-git-send-email-padma.v@samsung.com> <1376639378-20707-3-git-send-email-padma.v@samsung.com> <20130828004341.8231.3654@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:34795 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753247Ab3H1BCk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 21:02:40 -0400
In-Reply-To: <20130828004341.8231.3654@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, broonie@kernel.org, kgene.kim@samsung.com, abrestic@chromium.org

On Tuesday 27 of August 2013 17:43:41 Mike Turquette wrote:
> Quoting Padmavathi Venna (2013-08-16 00:49:36)
> 
> > From: Andrew Bresticker <abrestic@chromium.org>
> > 
> > Different Exynos SoCs have different names for certain input clocks
> > to the AudioSS block.  Since the order in which clock providers are
> > probed is not guaranteed, we can't use the device-tree to pass the
> > correct input clocks.
> 
> Why not? Could your audss binding include something like a "clocks"
> property with phandles to the input clocks? Then your audss clock driver
> could just use clk_get like a regular driver to get the parents.

AFAIR, the driver is currently probed using of_clk_init(), so the reason 
was probably being unable to defer probing.

However this is not the core system clock controller, so I believe there 
is no reason for it not to be a normal platform driver.

Best regards,
Tomasz
