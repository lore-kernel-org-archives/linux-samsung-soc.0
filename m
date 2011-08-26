From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/6] DMA: PL330: Add device tree support
Date: Fri, 26 Aug 2011 15:23:05 +0100
Message-ID: <20110826142305.GA23469@n2100.arm.linux.org.uk>
References: <1314348014-2481-1-git-send-email-thomas.abraham@linaro.org> <1314348014-2481-2-git-send-email-thomas.abraham@linaro.org> <1314348014-2481-3-git-send-email-thomas.abraham@linaro.org> <1314348014-2481-4-git-send-email-thomas.abraham@linaro.org> <1314348014-2481-5-git-send-email-thomas.abraham@linaro.org> <4E579C9B.7030807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:53481 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752917Ab1HZOXw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 10:23:52 -0400
Content-Disposition: inline
In-Reply-To: <4E579C9B.7030807@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, boojin.kim@samsung.com, kgene.kim@samsung.com, patches@linaro.org, vinod.koul@intel.com, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Aug 26, 2011 at 08:16:11AM -0500, Rob Herring wrote:
> Thomas,
> 
> On 08/26/2011 03:40 AM, Thomas Abraham wrote:
> > +  - arm,pl330-peri-reqs: number of actual peripheral requests connected to the
> > +    dma controller. Maximum value is 32.
> 
> Perhaps could be a bitmask for sparsely populated requests. May not
> matter since phandles will define the connections.
> 
> Can be optional and not present means 00 requests (mem-to-mem only).

The number of peripheral requests is readable from configuration register
zero, so this is discoverable.  Why should we put this information into
DT if its provided by the hardware?

The number of DMA channels available is also configurable by the SoC
designer, yet you don't specify that in DT.  And there's a whole bunch
of other configuration options available to the SoC designer, most of
which are discoverable from the configuration registers.

So, I don't think you should be specifying the number of requests.
