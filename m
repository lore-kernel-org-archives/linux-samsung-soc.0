From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 09/16] pinctrl: exynos: Use one IRQ domain per pin bank
Date: Wed, 10 Oct 2012 10:45:20 +0200
Message-ID: <3063300.jojsnxbhX8@amdc1227>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
 <1349685556-23718-10-git-send-email-t.figa@samsung.com>
 <CACRpkdbNHqwt2X-SNRv3=7Ca-WrDERb=t01K7pFuvRzTNk1+4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:22179 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148Ab2JJIp1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 04:45:27 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBO00LRJ5NOIDW0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Oct 2012 17:45:25 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBO0041D5NOTP70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Oct 2012 17:45:25 +0900 (KST)
In-reply-to: <CACRpkdbNHqwt2X-SNRv3=7Ca-WrDERb=t01K7pFuvRzTNk1+4Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Wednesday 10 of October 2012 09:40:16 Linus Walleij wrote:
> On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> > Instead of registering one IRQ domain for all pin banks of a pin
> > controller, this patch implements registration of per-bank domains.
> > 
> > At a cost of a little memory overhead (~2.5KiB for all GPIO interrupts
> > of Exynos4x12) it simplifies driver code and device tree sources,
> > because GPIO interrupts can be now specified per banks.
> > 
> > Example:
> >         device {
> >         
> >                 /* ... */
> >                 interrupt-parent = <&gpa1>;
> >                 interrupts = <3 0>;
> >                 /* ... */
> >         
> >         };
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> 
> This looks like a very good patch!
> Can it be applied in isolation from the other patches?

This is heavily dependent on previous patches, because each pin bank must 
have its own node that can be bound to the IRQ domain and used as an 
interrupt-controller in interrupt-parent property.

I can imagine kind of hybrid solution, where bank nodes contain almost no 
data, other than gpio-controller, interrupt-controller and #*-cells 
properties, but this would introduce the need of matching bank nodes with 
banks statically defined in the driver.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
