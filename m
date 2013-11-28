From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 1/1] dmaengine: s3c24xx-dma: use DMA_COMPLETE for dma
 completion status
Date: Thu, 28 Nov 2013 14:33:22 -0800
Message-ID: <CAA9_cmcYpS0R4CqpjtEAWe=ZhtU+aehWE6g+aik49QJJzLHxPA@mail.gmail.com>
References: <1383196690-28307-1-git-send-email-sachin.kamat@linaro.org>
	<20131031134227.GH18788@intel.com>
	<086101cedf91$e2a1ce70$a7e56b50$@org>
	<20131113085858.GS8834@intel.com>
	<20131128072509.GT8834@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f45.google.com ([209.85.216.45]:63682 "EHLO
	mail-qa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750948Ab3K1WdY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Nov 2013 17:33:24 -0500
In-Reply-To: <20131128072509.GT8834@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Kukjin Kim <kgene@kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>

On Wed, Nov 27, 2013 at 11:25 PM, Vinod Koul <vinod.koul@intel.com> wro=
te:
> On Wed, Nov 13, 2013 at 02:28:58PM +0530, Vinod Koul wrote:
>> On Tue, Nov 12, 2013 at 07:28:10PM +0900, Kukjin Kim wrote:
>> > Vinod Koul wrote:
>> > >
>> > > On Thu, Oct 31, 2013 at 10:48:09AM +0530, Sachin Kamat wrote:
>> > > > Use the recently introduced DMA_COMPLETE instead of DMA_SUCCES=
S.
>> > > > Without this patch we get the following build error:
>> > > > drivers/dma/s3c24xx-dma.c: In function =91s3c24xx_dma_tx_statu=
s=92:
>> > > > drivers/dma/s3c24xx-dma.c:798:13: error: =91DMA_SUCCESS=92 und=
eclared
>> > > > (first use in this function)
>> > > I missed it because this is not in my tree! This needs to go thr=
u kgene's
>> > > tree
>> > > and for that you can merge dma_complete branch from my tree. I w=
ill not
>> > > rebase
>> > > that
>> > >
>> > > Acked-by: Vinod Koul <vinod.koul@intel.com>
>> > >
>> >
>> > Oops, I missed :(
>> >
>> > Vinod, since the s3c24xx-dma is in Linus' tree now, you can go ahe=
ad with my ack into your fixes.
>> >
>> > If you want me to take this into samsung tree, let me know :-)
>> Okay, I will apply this after merge window
> Applied now,
>

This driver also missed the unmap rework.  Fixing now.

Vinod, I'll send you the pile after I finish my build regression suite.

--
Dan
