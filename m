From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RE-SEND] [PATCH 3/4] s3c-fb: Add support EXYNOS4 FIMD
Date: Wed, 15 Jun 2011 11:08:14 +0100
Message-ID: <20110615100814.GD28989@n2100.arm.linux.org.uk>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com> <1307693723-14971-4-git-send-email-anand.kn@samsung.com> <4DF39A92.5050609@gmail.com> <BANLkTinuAnaoo2hA6MLBDncXxXtL8NO2pg@mail.gmail.com> <4DF866D9.7090406@samsung.com> <BANLkTi=K6SJ-Scnr6wBojFaWQMZQK6YT3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:38090 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751500Ab1FOKIi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 06:08:38 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTi=K6SJ-Scnr6wBojFaWQMZQK6YT3w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Sylwester Nawrocki <snjw23@gmail.com>, Anand Kumar N <anand.kn@samsung.com>, lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com

On Wed, Jun 15, 2011 at 03:34:40PM +0530, Thomas Abraham wrote:
> Ok. Thanks for clarifying this point. In this case, maybe we could use
> the clk_add_alias API. With this API, we can have a instance of clock
> by name 'fimd' and then create a clkdev alias by name 'lcd' in the
> machine code. The driver can then continue to lookup with 'lcd' as the
> con_id.

That's additional needless complexity.  If you don't embed the clk_lookup
structure in your struct clk but list out the dev/con/clk stuff separately
like OMAP does, you can easily assign the dev/con pairs to multiple
clks without hastle - and then it really doesn't matter what the clk
itself is called.
