From: "Koul, Vinod" <vinod.koul@intel.com>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Tue, 07 Jun 2011 15:35:29 +0530
Message-ID: <1307441129.10976.86.camel@vkoul-udesk3>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
	 <BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
	 <BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
	 <BANLkTimid914CxUdf2j6X3c=1c1MuRbxXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:27611 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752713Ab1FGKkb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 06:40:31 -0400
In-Reply-To: <BANLkTimid914CxUdf2j6X3c=1c1MuRbxXg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Kyungmin Park <kmpark@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jassi Brar <jassi.brar@samsung.com>, root <alim.akhtar@samsung.com>, Ben Dooks <ben-linux@fluff.org>, "Williams, Dan J" <dan.j.williams@intel.com>

On Tue, 2011-06-07 at 15:45 +0530, Linus Walleij wrote:
> On Tue, Jun 7, 2011 at 10:09 AM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> 
> > There are some features of Samsung's DMA API that
> > the drivers have come to rely upon.
> 
> Can we get an overview of what these features are?
> 
> When I look at this specific code I cannot see anything that
> the dmaengine does not already support or can be made to
> support easily.
> 
> s3c2410_dma_getposition => device_tx_status()
> 
> s3c2410_dma_devconfig - not even needed with dmaengine
>  sematics, we already know the directions for any transfer.
> 
> s3c2410_dma_setflags => device_control() if it needs to be
>   runtime, else platform data. device_control() is prepared to
>   be extended for any custom weirdness flags if need be.
> 
> s3c2410_dma_set_buffdone_fn - no clue what this is, help
>   us. If related to cyclic transfer as one could guess, we
>   already have an API for that.
> 
> s3c2410_dma_ctrl => device_control() - there are two
>   weird controls named TIMEOUT and FLUSH, TIMEOUT
>   seem strange semantically for a ctrl* function, it seems like
>   something that should come from the hardware, and flush
>   is maybe an applicable extension, though I think any DMA
>   engine with a running channel will indeed flush anything
>   as quick as it can, if related to circular transfers we can
>   handle that.
> 
> The rest seems to be about retrieveing channels, putting them
> back on the heap and allocating resources for them as we
> already do in dmaengine.
> 
> > I am not particularly a fan of the generic API. And IIRC,
> > neither is Ben Dooks, the designer of the
> > Samsung's DMA API.
> 
> This is not soccer/football/cricket. ;-)
> 
> Seriously, if there are any longstanding issues with the API we
> need them nailed down, please help!
Looking back at the archives two main things seems to be of concern [1]
1) need of circular API
2) being able to do submit(issue_pending) in callback
Both of them are already available and people using them.

If you have any more requirement, lets discuss, there are drivers in
sound spi and mmc which use dmaengine. The API supports a generic
implementation as well as passing custom parameters, so not sure why it
wont work. 

-- 
~Vinod
[1]: http://comments.gmane.org/gmane.linux.ports.arm.kernel/74524
