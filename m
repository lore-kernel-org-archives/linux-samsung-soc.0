From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/2] clk: exynos-audss: Adapt to exising clock framework
Date: Fri, 11 Jul 2014 11:51:27 +0200
Message-ID: <53BFB39F.6040606@samsung.com>
References: <1405071475-31946-1-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22902 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752701AbaGKJwF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jul 2014 05:52:05 -0400
In-reply-to: <1405071475-31946-1-git-send-email-tushar.b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.b@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: robh+dt@kernel.org, grant.likely@linaro.org, kgene.kim@samsung.com, mturquette@linaro.org, trblinux@gmail.com

Hi Tushar,

On 11.07.2014 11:37, Tushar Behera wrote:
> The patchset is targetted as moving exising exynos-audss clock driver from being
> a module driver. The driver is now registered through CLK_OF_DECLARE and is
> inline with other Samsung clock drivers.

I'm afraid I have to NAK this series or at least the part converting the
driver back to use CLK_OF_DECLARE().

We have deliberately made this driver a platform driver, because this is
how drivers should be modeled in Linux kernel whenever possible.
CLK_OF_DECLARE() should be only considered a hack to work around late
initialization of driver model. Reverting this change without a good
reason (and you haven't provided such) is just going backwards.

Rest of this series is actually quite nice, though, as reusing Samsung
clock helpers reduces the line count significantly, so if you could
rework this to keep this driver a platform driver then we could get
something I could ack.

Best regards,
Tomasz
