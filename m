From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/2] PM / Domains: Add OF support
Date: Sun, 1 Jan 2012 23:59:56 -0700
Message-ID: <20120102065956.GA13015@ponder.secretlab.ca>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>
 <201112262013.19995.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:62334 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812Ab2ABHAA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 02:00:00 -0500
Content-Disposition: inline
In-Reply-To: <201112262013.19995.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, patches@linaro.org

On Mon, Dec 26, 2011 at 08:13:19PM +0100, Rafael J. Wysocki wrote:
> Hi,
> 
> On Monday, December 12, 2011, Thomas Abraham wrote:
> > A device node pointer is added to generic pm domain structure to associate
> > the domain with a node in the device tree.
> 
> That sounds fine except for one thing: PM domains are not devices, so adding
> "device node" pointers to them is kind of confusing.  Perhaps there should be
> something like struct dt_node, representing a more general device tree node?

struct device_node has nothing to do with struct device.  device_node is a
generic device tree node.  Thomas' approach is fine.

g.
