From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 1/3] phy: Add new Exynos USB PHY driver
Date: Wed, 06 Nov 2013 14:23:48 +0100
Message-ID: <10911451.fGryrFqfmX@amdc1227>
References: <1383668001-19141-1-git-send-email-k.debski@samsung.com>
 <2413995.ezl3Ca2YTh@amdc1227>
 <AE90C24D6B3A694183C094C60CF0A2F6026B73E7@saturn3.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62771 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932208Ab3KFNXz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Nov 2013 08:23:55 -0500
In-reply-to: <AE90C24D6B3A694183C094C60CF0A2F6026B73E7@saturn3.aculab.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: David Laight <David.Laight@aculab.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org, kyungmin.park@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org

Hi David,

On Wednesday 06 of November 2013 13:03:45 David Laight wrote:
> > > I just did a diff of registers in exynos 4210 and 4212 PHY drivers [1]
> > > and couldn't find that big a difference in register layout. Of course
> > > there are a few changes in HSIC bit fields and PHYFSEL but that's only
> > > minimal and could well be handled in a single driver.
> > >
> > > [1] -> http://diffchecker.com/py3tp68m
> > 
> > This is quite a lot of differences, especially including shifted
> > bitfields... In addition there is another set of available PHYs
> > and inter-dependencies between them.
> 
> Might be worth feeding both files through "sed -e 's/_421[02]_/_421x_/'"
> prior to doing the diff.
> And maybe changing the order of some definitions so they match.
> Then the actual differences will be more obvious.

I have fed it already through my built-in sed when reading.

Still despite many similarities, I think there is enough difference to
justify having different callback functions for both, especially based on
my experience with the old Exynos USB2 PHY driver in drivers/usb/phy, when
trying to make it more complete.

Best regards,
Tomasz
