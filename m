From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: dts: disable PCIe for SD5v1 board
Date: Mon, 28 Oct 2013 14:36:53 +0900
Message-ID: <000101ced39f$b553ec80$1ffbc580$%han@samsung.com>
References: <000301cea9fe$619d2900$24d77b00$%han@samsung.com>
 <CAOesGMjuzKxi_j5pASteHaNXoNQ=nURLPRk5b6pbNLmCPC+txw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10114 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751381Ab3J1Fgz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Oct 2013 01:36:55 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MVD004VA69HITQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Oct 2013 14:36:53 +0900 (KST)
In-reply-to: <CAOesGMjuzKxi_j5pASteHaNXoNQ=nURLPRk5b6pbNLmCPC+txw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Monday, October 28, 2013 1:52 PM, Olof Johansson wrote:
> On Wed, Sep 4, 2013 at 11:08 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> > Disable PCIe for SD5v1 board, because there is no PCIe slot
> > on SD5v1 board.
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> > Tested on SD5v1 board.
> >
> >  arch/arm/boot/dts/exynos5440-sd5v1.dts |    7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
> > index 5b22508..78a239d 100644
> > --- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
> > +++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
> > @@ -36,4 +36,11 @@
> >                 status = "disabled";
> >         };
> >
> > +       pcie@290000 {
> > +               status = "disabled";
> > +       };
> > +
> > +       pcie@2a0000 {
> > +               status = "disabled";
> > +       };
> >  };
> 
> Usually IP blocks like these are always left disabled in the dtsi, and
> explicitly _enabled_ in the DTS on boards that make use of that part
> of the chip.
> So the real solution here should be to move the disabling to the 5440
> .dtsi instead.

OK, right.
Thank you for your guidance.

Then, do you mean the following?
If it is right, I will send the v2 patch.

./arch/arm/boot/dts/exynos5440.dtsi
	pcie@290000 {
		.....
		status = "disabled";
	};
	pcie@2a0000 {
		.....
		status = "disabled";
	};

./arch/arm/boot/dts/exynos5440-ssdk5440.dts
	pcie@290000 {
		.....
		status = "okay";
	};
	pcie@2a0000 {
		.....
		status = "okay";
	};

Best regards,
Jingoo Han
