From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] PM / Domains: Add OF support
Date: Mon, 26 Dec 2011 19:24:25 +0000
Message-ID: <20111226192424.GN8722@opensource.wolfsonmicro.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>
 <201112262013.19995.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60263 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752261Ab1LZTY3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 14:24:29 -0500
Content-Disposition: inline
In-Reply-To: <201112262013.19995.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, patches@linaro.org

On Mon, Dec 26, 2011 at 08:13:19PM +0100, Rafael J. Wysocki wrote:
> On Monday, December 12, 2011, Thomas Abraham wrote:

> > A device node pointer is added to generic pm domain structure to associate
> > the domain with a node in the device tree.

> That sounds fine except for one thing: PM domains are not devices, so adding
> "device node" pointers to them is kind of confusing.  Perhaps there should be
> something like struct dt_node, representing a more general device tree node?

There's struct of_node which is exactly that, though practically
speaking you need a device if you're going to bind automatically to
something from the device tree in a sensible fashion and there is actual
hardware under there so a device does make some sense.

This is in part compatibility with the existing Exynos code which uses
devices to probe the domains for non-DT systems.
