From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v4 1/2] mfd: add irq domain support for max8997 interrupts
Date: Mon, 16 Apr 2012 17:32:24 +0200
Message-ID: <20120416153224.GF24130@sortiz-mobl>
References: <1332582590-16382-1-git-send-email-thomas.abraham@linaro.org>
 <1332582590-16382-2-git-send-email-thomas.abraham@linaro.org>
 <20120404212257.GE10787@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:51500 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753732Ab2DPPXe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Apr 2012 11:23:34 -0400
Content-Disposition: inline
In-Reply-To: <20120404212257.GE10787@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-kernel@vger.kernel.org, k.lewandowsk@samsung.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org

Hi Mark,

On Wed, Apr 04, 2012 at 10:22:57PM +0100, Mark Brown wrote:
> On Sat, Mar 24, 2012 at 03:19:49PM +0530, Thomas Abraham wrote:
> > Add irq domain support for max8997 interrupts. The reverse mapping method
> > used is linear mapping since the sub-drivers of max8997 such as regulator
> > and charger drivers can use the max8997 irq_domain to get the linux irq
> > number for max8997 interrupts. All uses of irq_base in platform data and
> > max8997 driver private data are removed.
> 
> > Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> > Acked-by: Grant Likely <grant.likely@secretlab.ca>
> 
> CCing in Samuel for the MFD review - review tends to be faster if you CC
> maintainers!  Samuel, there's a followup patch for the regulator API
> which is likely to collide with some API updates so is it OK to merge
> via regulator if the patch is OK?
Yes, the patch looks fine, you can merge it through the regulator tree with my

Acked-by: Samuel Ortiz <sameo@linux.intel.com>

if you think that's necessary.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
