From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V4 0/5] Add generic DMA DT binding support
Date: Thu, 14 Feb 2013 15:09:57 +0530
Message-ID: <20130214093957.GB27887@intel.com>
References: <1360571905-15285-1-git-send-email-padma.v@samsung.com>
 <20130212144950.GJ3789@intel.com>
 <CAAgF-Be1w-8yjuyXT+d8sUO8dee1x7oYFJLXHCmcJSf17eXWyw@mail.gmail.com>
 <20130214044704.GE7777@intel.com>
 <CAAgF-BfAE4Qt5KOBsn1iD7HW7_1e=TSEbuxNuTk0w8X+t3i-5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:46982 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932311Ab3BNJlC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Feb 2013 04:41:02 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-BfAE4Qt5KOBsn1iD7HW7_1e=TSEbuxNuTk0w8X+t3i-5Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org, robherring2@gmail.com

On Thu, Feb 14, 2013 at 11:12:51AM +0530, Padma Venkat wrote:
> Hi Vinod,
> 
> On Thu, Feb 14, 2013 at 10:17 AM, Vinod Koul <vinod.koul@intel.com> wrote:
> > On Wed, Feb 13, 2013 at 09:52:30AM +0530, Padma Venkat wrote:
> >> Hi Vinod,
> >>
> >> On Tue, Feb 12, 2013 at 8:19 PM, Vinod Koul <vinod.koul@intel.com> wrote:
> >> > On Mon, Feb 11, 2013 at 02:08:20PM +0530, Padmavathi Venna wrote:
> >> >
> >> > This looks fine, I have only question. The code seems to assume that pl330 dma
> >> > controller always uses DT. But I dont see that as dependency for pl330.
> > Have you checked this?
> 
> Sorry I didn't see this comment previously. I verified on SMDK6410
> board which doesn't have DT support.
> I didn't see any build error and it detected the sound card.
Okay, sound good...

I will try the series now.

--
~Vinod
