From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RE-SEND] [PATCH 3/4] s3c-fb: Add support EXYNOS4 FIMD
Date: Wed, 15 Jun 2011 09:06:51 +0100
Message-ID: <20110615080651.GC28989@n2100.arm.linux.org.uk>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com> <1307693723-14971-4-git-send-email-anand.kn@samsung.com> <4DF39A92.5050609@gmail.com> <BANLkTinuAnaoo2hA6MLBDncXxXtL8NO2pg@mail.gmail.com> <4DF866D9.7090406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:44709 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752201Ab1FOIHQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 04:07:16 -0400
Content-Disposition: inline
In-Reply-To: <4DF866D9.7090406@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <snjw23@gmail.com>, Anand Kumar N <anand.kn@samsung.com>, lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com

On Wed, Jun 15, 2011 at 10:01:29AM +0200, Sylwester Nawrocki wrote:
> With the above I2C example I was trying to illustrate the additional
> level of indirection that is present in case of OMAP clock mappings,
> comparing to your implementation.
> As long as IP clock names are same among various SoC there is no issue
> at all with your clk lookup approach.
> But this is already not the case with LCD controller IP. 
> On S3C series the IP bus clock name is "lcd" while on S5P series it's "fimd".
> There is a common framebuffer driver for S3C and S5P SoCs.
> It just does not look right to me to be adding in the driver switch/case
> for the clock names. I thought clkdev is meant to resolve such differences.

You are not mistaken.  clk_get() takes the device and a connection id
to identify the clock _on_ _that_ _device_ to separate individual clock
inputs on the _same_ _device_.  It does not take a platform specific
clock name.

The clock API was created long ago to remove this kind of crud from
drivers and keep it local to the platforms.  The problem is people seem
to like this crud.
