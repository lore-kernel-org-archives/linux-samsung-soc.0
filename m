From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH v2 1/2] PM / Domains: Add OF support
Date: Tue, 17 Jan 2012 21:45:35 +0100
Message-ID: <201201172145.35407.rjw@sisk.pl>
References: <1325931055-14486-1-git-send-email-thomas.abraham@linaro.org> <201201082223.18603.rjw@sisk.pl> <001e01ccd4e8$d04b03a0$70e10ae0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:38663 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751504Ab2AQUmG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jan 2012 15:42:06 -0500
In-Reply-To: <001e01ccd4e8$d04b03a0$70e10ae0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, broonie@opensource.wolfsonmicro.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, patches@linaro.org

On Tuesday, January 17, 2012, Kukjin Kim wrote:
> Rafael J. Wysocki wrote:
> > 
> > On Saturday, January 07, 2012, Thomas Abraham wrote:
> > > A device node pointer is added to generic pm domain structure to
> > associate
> > > the domain with a node in the device tree. The platform code parses the
> > > device tree to find available nodes representing the generic power
> > domain,
> > > instantiates the available domains and initializes them by calling
> > > pm_genpd_init().
> > >
> > > Nodes representing the devices include a phandle of the power domain to
> > > which it belongs. As these devices get instantiated, the driver code
> > > checkes for availability of a power domain phandle, converts the phandle
> > > to a device node and uses the new pm_genpd_of_add_device() api to
> > > associate the device with a power domain.
> > >
> > > pm_genpd_of_add_device() runs through its list of registered power
> > domains
> > > and matches the OF node of the domain with the one specified as the
> > > parameter. If a match is found, the device is associated with the
> > matched
> > > domain.
> > >
> > > Cc: Rafael J. Wysocki <rjw@sisk.pl>
> > > Cc: Rob Herring <rob.herring@calxeda.com>
> > > Cc: Grant Likely <grant.likely@secretlab.ca>
> > > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> > 
> > I can take this patch for 3.4, but your [2/2] depends on it, so I'm not
> > sure how to handle that.  If you want me to take the other patch too,
> > it'll need ACKs from the Exynos maintaniers.
> > 
> Hi Rafael,
> 
> Basically, looks ok to me.
> 
> But it would be good if [v3 2/2] patch of this series (this patch) could be
> applied in samsung tree to avoid conflicts as it modifies many files. I
> don't want to make a trouble when sending my tree to upstream. Of course, as
> you said, this have a dependency with [v2 1/2]. So if you're ok, let me
> create topic branch will have both(1/2 and 2/2) to merge in your tree.
> 
> How do you think?

That would work for me too.

Thanks,
Rafael
