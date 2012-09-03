From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 6/6] ARM: Exynos: Add basic dts file for Samsung Trats board
Date: Mon, 03 Sep 2012 14:28:32 +0200
Message-ID: <1968975.iys2N65Q5Y@amdc1227>
References: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
 <1346311903-15920-7-git-send-email-t.figa@samsung.com>
 <CAJuYYwSPfEk7fkcR=vP0GmSe924BJPNwoO=1CaSXX3zUFWwBoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64798 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756375Ab2ICM2j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Sep 2012 08:28:39 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9R00HIIXBIBNS0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Sep 2012 21:28:37 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9R00FZVXBLE7C0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Sep 2012 21:28:37 +0900 (KST)
In-reply-to: <CAJuYYwSPfEk7fkcR=vP0GmSe924BJPNwoO=1CaSXX3zUFWwBoQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com

Hi Thomas,

Thanks for reviewing the patch.

On Friday 31 of August 2012 09:54:20 Thomas Abraham wrote:
> > +       wakeup_eint: interrupt-controller-wakeup-eint {
> > +               compatible = "samsung,exynos4210-wakeup-eint";
> > +               reg = <0x11000000 0x1000>;
> > +               #interrupt-cells = <2>;
> > +               interrupt-controller;
> > +               interrupts =    <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>,
> > +                               <0 20 0>, <0 21 0>, <0 22 0>, <0 23 0>,
> > +                               <0 24 0>, <0 25 0>, <0 26 0>, <0 27 0>,
> > +                               <0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>,
> > +                               <0 32 0>;
> > +       };
> 
> The external wakeup node should be in the exynos4.dtsi file since this
> is common across all Exynos4 SoC's. Besides, the device tree support
> patches for wakeup-interrupts is not being pursed anymore, since it is
> now handled in pinctrl driver itself. So it would be better not to
> include this node.

Right. We will eventually add support for external wakeup sources using 
pinctrl.

> > +       spi_2: spi@13940000 {
> > +               status = "disabled";
> > +       };
> > +};
> 
> If we choose to mark the nodes in dtsi files as "disabled" then we can
> avoid these here.

OK.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
