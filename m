From: Angus Gratton <gus@projectgus.com>
Subject: Re: PATCH: ARM: S5PV210: Add USB EHCI support for SMDKV210 board
Date: Tue, 27 Dec 2011 15:04:57 +1100
Message-ID: <1324958697.11053.6.camel@gorgon.lan>
References: <1324693303.26918.27.camel@gorgon.lan>
	 <1324706927.26918.33.camel@gorgon.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caiajhbdcbef.dreamhost.com ([208.97.132.145]:49721 "EHLO
	homiemail-a89.g.dreamhost.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753833Ab1L0EFG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 23:05:06 -0500
Received: from homiemail-a89.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a89.g.dreamhost.com (Postfix) with ESMTP id A775B318087
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2011 20:05:05 -0800 (PST)
Received: from [192.168.9.58] (ppp121-45-209-218.lns20.cbr1.internode.on.net [121.45.209.218])
	(using SSLv3 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: gus@projectgus.com)
	by homiemail-a89.g.dreamhost.com (Postfix) with ESMTPSA id 1720C318072
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2011 20:05:04 -0800 (PST)
In-Reply-To: <1324706927.26918.33.camel@gorgon.lan>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

On Sat, 2011-12-24 at 17:08 +1100, Angus Gratton wrote:
> *snip*
> > Support is adapted from in EHCI in an older kernel & from the current
> > mach-exynos EHCI support. I've tried to duplicate the mach-exynos code
> > layout.
> > 
> > I don't actually have an SMDKV210 board to test on, this is tested on a
> > SMDKV210-derived product called a Flexiview FV-1. I believe this should
> > work on SMDKV210, and probably other S5PV210 boards, though.
> 
> Eck, sorry I might have sent this patch a bit early. Please disregard
> for now.
> 
> On my hardware USB devices initially come up happily, but sustained
> reads or writes eventually cause unexpected device resets and errors.
> 
> *snip*

I found the solution in another set of old kernel source, it seems like
a hardware issue where fix depends on SoC errata (my board seems to be
EVT1.)

Below is the change which corrects it on my board. I'd really like to
clean this up for inclusion in the kernel, if anyone can give advice on
best way to do this?

* I noticed a proposal for s5pv210_revision(EVTx) from last year, but it
  was dropped?

* Would CONFIG_CPU_S5PV210_EVTx macros and a multichoice config item 
  be appropriate? With defaults for each board?

* Any clues as to how to describe the addresses listed below? They seem 
  to be above the GPIO address space, but below any addresses in 
  mach/map.h ? Is it appropriate for them to be left as "magic numbers"?

Thanks for any/all tips.

- Angus


diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index 99f4710..668654c 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -135,6 +135,15 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
        /* cache this readonly data; minimize chip reads */
        ehci->hcs_params = readl(&ehci->caps->hcs_params);
 
+       #ifdef CONFIG_CPU_S5PV210_EVT1
+       	writel(0x000E0000, hcd->regs + 0x90);
+       	writel(0x00400040, hcd->regs + 0x94);
+       #else
+       	writel(0x00600040, hcd->regs + 0x94);
+       #endif
+
+
+
        err = usb_add_hcd(hcd, irq, IRQF_SHARED);
        if (err) {
                dev_err(&pdev->dev, "Failed to add USB HCD\n");
