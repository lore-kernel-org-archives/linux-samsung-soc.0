From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 02/16] pinctrl: exynos: Parse wakeup-eint parameters from DT
Date: Wed, 10 Oct 2012 10:23:53 +0200
Message-ID: <2083377.E0rtGYPSc2@amdc1227>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
 <1349685556-23718-3-git-send-email-t.figa@samsung.com>
 <CACRpkdZ97BRHo1Usen-D9CnojU4HLqkNb5CKNOmx7uP1A9ttgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58639 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753014Ab2JJIYA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 04:24:00 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBO006X84NYQCO0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Oct 2012 17:23:58 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBO003RY4NWY940@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Oct 2012 17:23:58 +0900 (KST)
In-reply-to: <CACRpkdZ97BRHo1Usen-D9CnojU4HLqkNb5CKNOmx7uP1A9ttgw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Wednesday 10 of October 2012 09:18:51 Linus Walleij wrote:
> On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> > This patch converts the pinctrl-exynos driver to parse wakeup interrupt
> > count and register offsets from device tree. It reduces the amount of
> > static platform-specific data and facilitates adding further SoC
> > variants to pinctrl-samsung driver.
> 
> So these are:
> > +       ret = of_property_read_u32(wkup_np, "samsung,weint-count",
> > &val); +       ret = of_property_read_u32(wkup_np,
> > "samsung,weint-con", &val); +       ret =
> > of_property_read_u32(wkup_np, "samsung,weint-mask", &val); +       ret
> > = of_property_read_u32(wkup_np, "samsung,weint-pend", &val);
> Are these all four register offsets?
> 
> I don't think it's proper for the device tree to contain register
> offsets.
> 
> Base address, "regs" property, yes. Individual registers, no. That just
> makes the code hard to read and compare to the datasheet.
> 
> Or what are you aiming at here?

See my reply to your comments for patch 1. I think it should explain how 
these values are used.

One thing worth mentioning is that registers for GPIO interrupts and wakeup 
interrupts can be located at different areas of pin controller address 
space, so these offsets have to be specified for both (using geint-* and 
weint-* properties).

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
