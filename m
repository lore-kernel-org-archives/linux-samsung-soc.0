From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Tue, 5 Jul 2011 08:53:11 +0100
Message-ID: <20110705075311.GO8286@n2100.arm.linux.org.uk>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com> <201107041859.11548.heiko@sntech.de> <20110704170217.GH28042@ponder.secretlab.ca> <201107042151.44075.heiko@sntech.de> <20110704232758.GB12824@ponder.secretlab.ca> <00bd01cc3ae1$f1dbfac0$d593f040$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:55209 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754183Ab1GEHx3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 03:53:29 -0400
Content-Disposition: inline
In-Reply-To: <00bd01cc3ae1$f1dbfac0$d593f040$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, 'Heiko =?iso-8859-1?Q?St=FCbner'?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, 'Boojin Kim' <boojin.kim@samsung.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Liam Girdwood' <lrg@ti.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jul 05, 2011 at 04:05:32PM +0900, Kukjin Kim wrote:
> Of course, if we can remove every S3C_DMA_API, that can be the best solution
> but it needs more time. I'd like to go to our goal step by step.

Surely one of the preconditions then is to improve the existing PL080
dmaengine driver to do what you need it to.

I've worked on that driver to bring it closer to sanity and correctness,
and its almost there.  The problem I have working on the driver is the
crippled ARM development hardware, where most DMA just doesn't work in
one way or another.
