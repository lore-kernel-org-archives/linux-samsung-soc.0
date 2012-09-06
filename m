From: Sangsu Park <sangsu4u.park@samsung.com>
Subject: RE: [PATCH] ASoC: SAMSUNG: Add SND_SOC_DAIFMT_CONT option for
 snd_soc_set_fmt()
Date: Thu, 06 Sep 2012 17:57:45 +0900
Message-ID: <006601cd8c0d$aeca9d30$0c5fd790$@samsung.com>
References: <003101cd8367$3476e650$9d64b2f0$@samsung.com>
 <20120827204550.GA4400@opensource.wolfsonmicro.com>
 <001d01cd85d6$59298040$0b7c80c0$@samsung.com>
 <20120830174317.GG4356@opensource.wolfsonmicro.com>
 <001001cd8979$3b260d10$b1722730$@samsung.com>
 <20120906002145.GU10580@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43723 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752305Ab2IFI5r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 04:57:47 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9X003627JWR2Q0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Sep 2012 17:57:46 +0900 (KST)
Received: from DOSANGSU4UP02 ([12.23.118.226])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9X00J6T7K90300@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Sep 2012 17:57:45 +0900 (KST)
In-reply-to: <20120906002145.GU10580@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, 'Kukjin Kim' <kgene.kim@samsung.com>, ben-linux@fluff.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org

On Thurs, Sep 06, 2012 at 9:22 AM +0900, Mark Brown wrote:
> On Mon, Sep 03, 2012 at 11:10:03AM +0900, Sangsu Park wrote:
> > On Sun, Aug 31, 2012 at 2:43 AM +0900, Mark Brown wrote:
> > > On Wed, Aug 29, 2012 at 08:06:32PM +0900, Sangsu Park wrote:
> 
> > > Please check your mailer configuration, it looks like it's reformatting
> > > all the text with much longer line widths.
> 
> > I've changed line width configuration. Is it ok now?
> 
> Looks like it, thanks.
> 
> > Do you think that changing pcm driver is right approach?
> > Then I'll fix pcm driver. (I think that pcm driver has some strange code.)
> 
> Well, we could do both.  It'd certainly be more natural to make it have
> a default given that this isn't something that normally needs to be
> configured.
> 
Then, I'll fix pcm driver to use default given
and resend that patch.

Thanks.
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
