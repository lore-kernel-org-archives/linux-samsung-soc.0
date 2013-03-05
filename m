From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] dma: of-dma: return error when 'dma-cells' not found
Date: Tue, 5 Mar 2013 19:48:02 +0000
Message-ID: <201303051948.02468.arnd@arndb.de>
References: <1362475531-32260-1-git-send-email-padma.v@samsung.com> <1859273.NY466Orvuh@wuerfel> <51360797.6000007@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:50305 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752875Ab3CETsI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 14:48:08 -0500
In-Reply-To: <51360797.6000007@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, boojin.kim@samsung.com, sbkim73@samsung.com, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, vinod.koul@intel.com, kgene.kim@samsung.com, jon-hunter@ti.com, padma.kvr@gmail.com

On Tuesday 05 March 2013, Rob Herring wrote:
> > Why would you call of_dma_controller_register() for a dma
> > engine that does not support slave channels, when that is the
> > only purpose of that interface?
> 
> Well maybe then that function should be allowed to fail without erroring
> out. I just fixed it a the line that failed.

We have a lot of interfaces that fall back to silently doing nothing
when there is no need.

> Doing be32_to_cpup directly
> on a function return that can be NULL is not correct either.

Agreed.
 
> > Note that the binding defines #dma-cells as required, and it
> > does not make any sense otherwise.
> 
> The 2nd patch I submitted changes that. It does not make sense to
> require it if you have no requests and hence will never have a phandle
> reference in a slave device.

I still don't see why you would want to use the binding for
dma slaves to describe a dmaengine that does not have slaves.

> The simple fact is that the pl330 had an
> existing binding that worked for the memory to memory only case and
> kernel changes broke this. Kernel changes should not break existing
> device-trees.

Of course we should not break the existing device tree, but I think
it would be more sensible to change the pl330 specific binding in this
case to require the use of the generic dma slave binding only when
there are slaves connected to it.

If the #dma-cells property is absent, the pl330 driver can be changed
not to call of_dma_controller_register.

	Arnd
