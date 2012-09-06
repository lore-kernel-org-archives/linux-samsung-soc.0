From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: SAMSUNG: Add SND_SOC_DAIFMT_CONT option for
 snd_soc_set_fmt()
Date: Thu, 6 Sep 2012 08:21:46 +0800
Message-ID: <20120906002145.GU10580@opensource.wolfsonmicro.com>
References: <003101cd8367$3476e650$9d64b2f0$@samsung.com>
 <20120827204550.GA4400@opensource.wolfsonmicro.com>
 <001d01cd85d6$59298040$0b7c80c0$@samsung.com>
 <20120830174317.GG4356@opensource.wolfsonmicro.com>
 <001001cd8979$3b260d10$b1722730$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:45787 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754880Ab2IFAVw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Sep 2012 20:21:52 -0400
Content-Disposition: inline
In-Reply-To: <001001cd8979$3b260d10$b1722730$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangsu Park <sangsu4u.park@samsung.com>
Cc: alsa-devel@alsa-project.org, 'Kukjin Kim' <kgene.kim@samsung.com>, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org

On Mon, Sep 03, 2012 at 11:10:03AM +0900, Sangsu Park wrote:
> On Sun, Aug 31, 2012 at 2:43 AM +0900, Mark Brown wrote:
> > On Wed, Aug 29, 2012 at 08:06:32PM +0900, Sangsu Park wrote:

> > Please check your mailer configuration, it looks like it's reformatting
> > all the text with much longer line widths.

> I've changed line width configuration. Is it ok now?

Looks like it, thanks.

> Do you think that changing pcm driver is right approach?
> Then I'll fix pcm driver. (I think that pcm driver has some strange code.)

Well, we could do both.  It'd certainly be more natural to make it have
a default given that this isn't something that normally needs to be
configured.
