From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] PM / Domains: Add OF support
Date: Mon, 26 Dec 2011 11:29:32 +0000
Message-ID: <20111226112931.GE8722@opensource.wolfsonmicro.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37291 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754488Ab1LZL3f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 06:29:35 -0500
Content-Disposition: inline
In-Reply-To: <1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, patches@linaro.org

On Mon, Dec 12, 2011 at 09:16:28PM +0530, Thomas Abraham wrote:
> A device node pointer is added to generic pm domain structure to associate
> the domain with a node in the device tree. The platform code parses the
> device tree to find available nodes representing the generic power domain,
> instantiates the available domains and initializes them by calling
> pm_genpd_init().

This sounds useful but the binding needs to be documented properly.
