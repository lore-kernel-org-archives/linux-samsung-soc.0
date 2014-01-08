From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH RFC alternative ver 1] phy: Exynos 421x USB 2.0 PHY support
Date: Wed, 08 Jan 2014 18:42:27 +0100
Message-ID: <04db01cf0c99$00f79970$02e6cc50$%debski@samsung.com>
References: <1387545857-9472-1-git-send-email-k.debski@samsung.com>
 <1387545857-9472-11-git-send-email-k.debski@samsung.com>
 <52CA845C.5080308@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:32895 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751118AbaAHRmc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jan 2014 12:42:32 -0500
In-reply-to: <52CA845C.5080308@ti.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kishon Vijay Abraham I' <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, tjakobi@math.uni-bielefeld.de, stern@rowland.harvard.edu

Hi Kishon,

Thank you for your review.

> From: Kishon Vijay Abraham I [mailto:kishon@ti.com]
> Sent: Monday, January 06, 2014 11:24 AM
> 
> Hi,
> 
> On Friday 20 December 2013 06:54 PM, Kamil Debski wrote:
> > This the alternative version of the support for Exynos 421x USB 2.0
> > PHY in the Generic PHY framework. In this version the support for
> > Exynos
> > 4210 and 4212 was joined into one file.
> >
> > Signed-off-by: Kamil Debski <k.debski@samsung.com>
> > ---
> > Hi,
> >
> > Me and Kishon were discussing for quite a long time the way how
> Exynos
> > 4 should be handled. I have decided to post the original patches and
> > try to make an alternative version with support for Exynos 4210 and
> > 4212 joined in one file. I have prepared two versions. The first one
> > has 506 lines (vs
> > 563 when two files are used). When doing the second version I was a
> > little more aggresive in removing code. This was done at a cost of
> > adding if's deciding which SoC version the driver is dealing with in
> some internal functions.
> > This resulted in a better number of removed lines - the second
> version
> > has only 452 lines (vs 563 original and 506 version 1).
> 
> Alright.. If the alternate approach doesn't give too much of advantage,
> lets stick with the original one. I would recommend creating a
> documentation (Documentation/phy/?) for the samsung PHY since that
> actually creates a layer on top of generic PHY framework. That would
> help while adding new samsung PHY drivers.

Ok, I will prepare an updated set of patches with the documentation
added. Also I will fix other issues you pointed out in reply to other
patches from this series.

> 
> Btw thank you for preparing alternate versions for your original
> patches.

No problem :)

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland
