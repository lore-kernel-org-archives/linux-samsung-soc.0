From: Vinod Koul <vkoul@infradead.org>
Subject: Re: [PATCH] Improve slave/cyclic DMA engine documentation (was:
	[PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability)
Date: Wed, 27 Jul 2011 08:08:20 +0530
Message-ID: <1311734300.1536.35.camel@vkoul-udesk3>
References: <002001cc4ab6$0d7cd590$287680b0$%kim@samsung.com>
	<20110725103629.GF9653@n2100.arm.linux.org.uk>
	<1311590884.29703.2.camel@vkoul-mobl4>
	<20110725105754.GG9653@n2100.arm.linux.org.uk>
	<1311591717.29703.7.camel@vkoul-mobl4>
	<20110725113926.GH9653@n2100.arm.linux.org.uk>
	<1311595303.29703.31.camel@vkoul-mobl4>
	<20110726075720.GL9653@n2100.arm.linux.org.uk>
	<1311672933.24316.1.camel@vkoul-mobl4>
	<CABb+yY1P21hbMD2mG_cCvW3N5WqWzc2ZVt-HTOrC1J3dc5RbhA@mail.gmail.com>
	<20110726172027.GD1655@n2100.arm.linux.org.uk>
	<CABb+yY31N6ubWcjQnMqze5hH66eoSxPQCaRVqf7=jZ3L_h+P6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY31N6ubWcjQnMqze5hH66eoSxPQCaRVqf7=jZ3L_h+P6Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Boojin Kim <boojin.kim@samsung.com>, vinod.koul@intel.com, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 2011-07-26 at 23:25 +0530, Jassi Brar wrote:
> On Tue, Jul 26, 2011 at 10:50 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Tue, Jul 26, 2011 at 08:07:44PM +0530, Jassi Brar wrote:
> >> Dear Vinod,
> >>
> >>  Since it came from the RMK, most probably it'll be the best.
> >>
> >> But applying patches upon personal timeout seems very dangerous.
> >
> > Ehh what?  Is there any contention over this documentation patch?
> I haven't yet read it... even after reading I would object only if I found
> your patch disturbing enough to disrupt my bowel movements. Which
> I don't think would be the case.
Jassi,
Since this was a doc patch, I applied it soon enough, doesn't sound
dangerous to me !
If you have any updates you would like, pls feel free to send a patch.

> 
> I just observed it is second time that Vinod applied a patch without any
> ack or prior alert.
And you can't ignore the fact that you had almost _two_ weeks to ack the
patch from Rob, but....
You will get ample time to ack a patch, if you don't you can always
point out and I will do the right thing, which in this case was to
revert.
> 
> >
> >> People not responding doesn't mean only either people agree completely
> >> or they don't care. Some might be interested but too busy with current tasks
> >> that they need time to check... please make some policy for such cases.
> >>
> >> It already happened with the patch from Rob, which you probably have to
> >> revert.
> >>
> >> IMHO, if nobody replied, maybe you could first ack the patch and wait
> >> for, say a week, before applying?
> >> That way people will know they have to hurry if they care otherwise
> >> the patch is going upstream as such.
> >
> > A week is far too long.  That's how patches get lost and missed.
> >
> He may decide to wait shorter, but imho a week after the first ack
> isn't that long.
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
