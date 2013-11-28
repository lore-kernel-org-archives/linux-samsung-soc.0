From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 1/1] dmaengine: s3c24xx-dma: use DMA_COMPLETE for dma
 completion status
Date: Thu, 28 Nov 2013 12:55:09 +0530
Message-ID: <20131128072509.GT8834@intel.com>
References: <1383196690-28307-1-git-send-email-sachin.kamat@linaro.org>
 <20131031134227.GH18788@intel.com>
 <086101cedf91$e2a1ce70$a7e56b50$@org>
 <20131113085858.GS8834@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:8967 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750741Ab3K1IWj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Nov 2013 03:22:39 -0500
Content-Disposition: inline
In-Reply-To: <20131113085858.GS8834@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, dmaengine@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dan.j.williams@intel.com, 'Heiko Stuebner' <heiko@sntech.de>

On Wed, Nov 13, 2013 at 02:28:58PM +0530, Vinod Koul wrote:
> On Tue, Nov 12, 2013 at 07:28:10PM +0900, Kukjin Kim wrote:
> > Vinod Koul wrote:
> > >=20
> > > On Thu, Oct 31, 2013 at 10:48:09AM +0530, Sachin Kamat wrote:
> > > > Use the recently introduced DMA_COMPLETE instead of DMA_SUCCESS=
=2E
> > > > Without this patch we get the following build error:
> > > > drivers/dma/s3c24xx-dma.c: In function =E2=80=98s3c24xx_dma_tx_=
status=E2=80=99:
> > > > drivers/dma/s3c24xx-dma.c:798:13: error: =E2=80=98DMA_SUCCESS=E2=
=80=99 undeclared
> > > > (first use in this function)
> > > I missed it because this is not in my tree! This needs to go thru=
 kgene's
> > > tree
> > > and for that you can merge dma_complete branch from my tree. I wi=
ll not
> > > rebase
> > > that
> > >=20
> > > Acked-by: Vinod Koul <vinod.koul@intel.com>
> > >=20
> >=20
> > Oops, I missed :(
> >=20
> > Vinod, since the s3c24xx-dma is in Linus' tree now, you can go ahea=
d with my ack into your fixes.
> >=20
> > If you want me to take this into samsung tree, let me know :-)
> Okay, I will apply this after merge window
Applied now,

Thanks
