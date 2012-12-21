From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V5 2/2] ASoC: SAMSUNG: Add DT support for i2s
Date: Fri, 21 Dec 2012 11:02:06 -0800
Message-ID: <008401cddfad$ae2d19e0$0a874da0$@samsung.com>
References: <1355395373-22058-1-git-send-email-padma.v@samsung.com>
 <1355395373-22058-3-git-send-email-padma.v@samsung.com>
 <20121219132414.2CF653E0AD7@localhost>
 <20121219170937.GV4985@opensource.wolfsonmicro.com>
 <CAAgF-Bc3zSyhaMwSOy977PJ-PdtMfDXjFrTvpzETeHJAAQU3vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25747 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752008Ab2LUTCN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Dec 2012 14:02:13 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFE00BEGA7LH230@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Dec 2012 04:02:11 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFE001DXA7J7ZD0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Dec 2012 04:02:11 +0900 (KST)
In-reply-to: <CAAgF-Bc3zSyhaMwSOy977PJ-PdtMfDXjFrTvpzETeHJAAQU3vQ@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padma Venkat' <padma.kvr@gmail.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, sbkim73@samsung.com, tiwai@suse.de, ben-linux@fluff.org, lrg@ti.com

Padma Venkat wrote:
> 
> Hi,
> 
> On Wed, Dec 19, 2012 at 10:39 PM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
> > On Wed, Dec 19, 2012 at 01:24:14PM +0000, Grant Likely wrote:
> >> On Thu, 13 Dec 2012 16:12:53 +0530, Padmavathi Venna
> <padma.v@samsung.com> wrote:
> >
> >> > +- compatible : "samsung,samsung-i2s"
> >
> >> Isn't that kind of redundant?  :-)
> >
> >> The format of the compatible strings should be "<vendor>,<part-
> number>-i2s".
> >> Please be specific about the part number that you're doing the binding
> >> for. For example; use "samsung,exynos4210-i2s" instead of
> "samsung,exynos-i2s".
> >
> > There are actually versioned IPs here (where the versions are used
> > publically in a few places) but it's not clearly documented which is
> > which.  It would be reasonable to use the IP versions here I think.
> 
> Samsung has three i2s drivers one for s3c24xx, one for s3c2412 and one
> for rest of the platforms. The above mentioned other platforms has
> Version 3/4/5 of i2s controllers. This dt binding is for for the i2s

Where is the version defined such as 3, 4, 5? So, what is the
"sound/soc/Samsung/s3c-i2s-v2.[ch]"?

> driver that has support for Version 3/4/5 of i2s controller. So
> "samsung,i2s-v5" is okay as compatible name? Please suggest me.
> 
I agree with using version here but we need some consensus about that.

- Kukjin
