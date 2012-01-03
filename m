From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 1/2] PM / Domains: Add OF support
Date: Tue, 3 Jan 2012 23:28:44 +0100
Message-ID: <201201032328.45288.rjw@sisk.pl>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org> <201112262013.19995.rjw@sisk.pl> <20120102065956.GA13015@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:47108 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751566Ab2ACWZ0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 17:25:26 -0500
In-Reply-To: <20120102065956.GA13015@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, patches@linaro.org

On Monday, January 02, 2012, Grant Likely wrote:
> On Mon, Dec 26, 2011 at 08:13:19PM +0100, Rafael J. Wysocki wrote:
> > Hi,
> > 
> > On Monday, December 12, 2011, Thomas Abraham wrote:
> > > A device node pointer is added to generic pm domain structure to associate
> > > the domain with a node in the device tree.
> > 
> > That sounds fine except for one thing: PM domains are not devices, so adding
> > "device node" pointers to them is kind of confusing.  Perhaps there should be
> > something like struct dt_node, representing a more general device tree node?
> 
> struct device_node has nothing to do with struct device.  device_node is a
> generic device tree node.

So the name is kind of confusing. :-)

> Thomas' approach is fine.

Well, I guess so.

Thanks,
Rafael
