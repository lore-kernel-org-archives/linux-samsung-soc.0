From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 1/1] dmaengine: s3c24xx-dma: use DMA_COMPLETE for dma
 completion status
Date: Fri, 29 Nov 2013 10:41:20 +0530
Message-ID: <20131129051120.GB8834@intel.com>
References: <1383196690-28307-1-git-send-email-sachin.kamat@linaro.org>
 <20131031134227.GH18788@intel.com>
 <086101cedf91$e2a1ce70$a7e56b50$@org>
 <20131113085858.GS8834@intel.com>
 <20131128072509.GT8834@intel.com>
 <CAA9_cmcYpS0R4CqpjtEAWe=ZhtU+aehWE6g+aik49QJJzLHxPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:13276 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751296Ab3K2GIk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Nov 2013 01:08:40 -0500
Content-Disposition: inline
In-Reply-To: <CAA9_cmcYpS0R4CqpjtEAWe=ZhtU+aehWE6g+aik49QJJzLHxPA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Kukjin Kim <kgene@kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>

On Thu, Nov 28, 2013 at 02:33:22PM -0800, Dan Williams wrote:
> On Wed, Nov 27, 2013 at 11:25 PM, Vinod Koul <vinod.koul@intel.com> w=
rote:
> > On Wed, Nov 13, 2013 at 02:28:58PM +0530, Vinod Koul wrote:
> >> On Tue, Nov 12, 2013 at 07:28:10PM +0900, Kukjin Kim wrote:
> >> > Vinod Koul wrote:
> >> > >
> >> > > On Thu, Oct 31, 2013 at 10:48:09AM +0530, Sachin Kamat wrote:
> >> > > > Use the recently introduced DMA_COMPLETE instead of DMA_SUCC=
ESS.
> >> > > > Without this patch we get the following build error:
> >> > > > drivers/dma/s3c24xx-dma.c: In function =E2=80=98s3c24xx_dma_=
tx_status=E2=80=99:
> >> > > > drivers/dma/s3c24xx-dma.c:798:13: error: =E2=80=98DMA_SUCCES=
S=E2=80=99 undeclared
> >> > > > (first use in this function)
> >> > > I missed it because this is not in my tree! This needs to go t=
hru kgene's
> >> > > tree
> >> > > and for that you can merge dma_complete branch from my tree. I=
 will not
> >> > > rebase
> >> > > that
> >> > >
> >> > > Acked-by: Vinod Koul <vinod.koul@intel.com>
> >> > >
> >> >
> >> > Oops, I missed :(
> >> >
> >> > Vinod, since the s3c24xx-dma is in Linus' tree now, you can go a=
head with my ack into your fixes.
> >> >
> >> > If you want me to take this into samsung tree, let me know :-)
> >> Okay, I will apply this after merge window
> > Applied now,
> >
>=20
> This driver also missed the unmap rework.  Fixing now.
yup, this is a new driver and got merged thru samsung tree

> Vinod, I'll send you the pile after I finish my build regression suit=
e.
sure, i think these should go into fixes

--
~Vinod
