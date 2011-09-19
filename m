From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v8 00/16] To use DMA generic APIs for Samsung DMA
Date: Mon, 19 Sep 2011 08:29:34 +0530
Message-ID: <1316401174.21359.3.camel@vkoul-udesk3>
References: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com>
	 <1315980099.26251.498.camel@vkoul-udesk3>
	 <CABb+yY25NTbtRPOw-KH8U4zA1Bo8q0BDM8SXyrsobG7NEv8edg@mail.gmail.com>
	 <1315999032.26251.501.camel@vkoul-udesk3>
	 <CAJe_ZhdrPMbBOkfwg=PFyVU14eT0Gc0=rtKwEiQCH5-Q5-CtVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:7001 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753610Ab1ISDDb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Sep 2011 23:03:31 -0400
In-Reply-To: <CAJe_ZhdrPMbBOkfwg=PFyVU14eT0Gc0=rtKwEiQCH5-Q5-CtVQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Boojin Kim <boojin.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Wed, 2011-09-14 at 17:03 +0530, Jassi Brar wrote:
> On 14 September 2011 16:47, Vinod Koul <vinod.koul@intel.com> wrote:
> 
> >> The changelog for [PATCH v8 04/16] is misleading - we don't need any
> >> modification for the reason mentioned in changelog. But the modification
> >> has positive side-effect of preventing callbacks during terminate_all which
> >> is no way understood from the changelog. So I would like to changelog
> >> corrected.
> > I thought change log was correct in depicting what patch does and Boojin
> > had replied.... I will check again...
> 
> I didn't reply because I ran out of ways to explain the same thing in
> different words.
I checked again the patch, change log and your comments.
I agree with current change log, and also your observation is right but
that is just a side effect, which IMO should be best left to developer
to choose or not, in this case she ignored it

So no changes to this and I a ready to merge it to my next in a day or
two...

-- 
~Vinod
