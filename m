From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 03/11] ARM: EXYNOS: add clock part for EXYNOS5250 SoC
Date: Thu, 16 Feb 2012 12:42:58 +0900
Message-ID: <052801ccec5d$137aa460$3a6fed20$%kim@samsung.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
 <201202112007.08672.arnd@arndb.de> <20120211201430.GB24564@sirena.org.uk>
 <201202130547.48530.arnd@arndb.de>
 <20120213110453.GA13673@n2100.arm.linux.org.uk>
 <20120213205444.GH11077@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43907 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756360Ab2BPDnF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Feb 2012 22:43:05 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZG00LSAVNRI8G0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 12:43:03 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZG00I5KVNM3Q80@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 12:43:02 +0900 (KST)
In-reply-to: <20120213205444.GH11077@ponder.secretlab.ca>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Grant Likely' <grant.likely@secretlab.ca>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Kyungmin Park' <kmpark@infradead.org>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, olof@lixom.net, linux-arm-kernel@lists.infradead.org, 'Mike Turquette' <mturquette@ti.com>, jhbird.choi@samsung.com

Grant Likely wrote:
> 
> On Mon, Feb 13, 2012 at 11:04:53AM +0000, Russell King - ARM Linux wrote:
> > On Mon, Feb 13, 2012 at 05:47:48AM +0000, Arnd Bergmann wrote:
> > > On Saturday 11 February 2012, Mark Brown wrote:
> > > > On Sat, Feb 11, 2012 at 08:07:08PM +0000, Arnd Bergmann wrote:
> > > > > what the risk is in changing exynos4 at the same time. It would
> > > > > be great if we can have all exynos use the common struct clk in 3.4,
> > > > > but I'm also happy if we just get exynos5 to do it that way from the
> > > > > beginning and move exynos4 over in 3.5 after you have had a chance
> > > > > to make sure everything still works.
> > > >
> > > > Are we likely to get the common struct clk in 3.4?  It's all been
> > > > extremely quiet on that front except for complaints about the lack of
> > > > progress.
> > >
> > > Yes, we discussed it during the subarch maintainers meeting at Linaro
> > > Connect last week and it looks like we're finally going forward on
> > > this now. Maybe Grant or Mike are better at explaining the current
> > > status regarding the clk implementation and bindings.
> >
> > That would be good for those who weren't there to be updated with what
> > was discussed.
> 
> The decision was essentially Mike would repost his series ASAP with a view
> to getting it queued up for v3.4.  I think he is also going to get it into
> linux-next so at least it gets testing, even if the ultimate decision is to
> wait for v3.5.
> 
Hmm...so I'm not sure if some exynos5250 products use v3.4, it can use common struct clk for mass production?

If not, I think, this should be kept on v3.4 then it can be changed to use common struct clk from v3.5.

> I'm going to rebase my clk series on top of his patches rather that trying

OK, sounds good to me.

> to merge my temporary versatile-only code.  If his series isn't ready to go
> in, I can still probably merge parts of the DT clock bindings anyway, but I'll
> need to do some cherry picking to do so.
> 
If any branch is ready for it, please let me know.

> The rough notes can be found here:
> 
> https://blueprints.launchpad.net/linux-linaro/+spec/linaro-kernel-q112-maintainer-summit-1
> 
Thanks for your sharing.

OK, I and my team will follow up 'common struct clk' for exynos5250 and it will be done maybe next week. And since I need to
implement other features for exynos5250 now, firstly let me use this and test this series in linux-next in a day.

Of course, if any updates, let you know.

Ah, one more, would be better to us if arm-soc tree could provide the topic branch for 'common struct clk' working as a base.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
