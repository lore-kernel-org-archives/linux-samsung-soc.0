From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: Fix MDMA0 clock number
Date: Mon, 30 Dec 2013 15:32:32 +0100
Message-ID: <19574645.fFapTcOjJm@amdc1227>
References: <1386817322-11265-1-git-send-email-a.kesavan@samsung.com>
 <2082327.zpbOvCVe5P@amdc1227> <20131218193203.23538.30551@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18904 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755956Ab3L3Oc6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 09:32:58 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MYM0092AJ2VMSB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Dec 2013 14:32:55 +0000 (GMT)
In-reply-to: <20131218193203.23538.30551@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: kgene.kim@samsung.com, Abhilash Kesavan <a.kesavan@samsung.com>, dianders@chromium.org, tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Mike,

On Wednesday 18 of December 2013 11:32:03 Mike Turquette wrote:
> Quoting Tomasz Figa (2013-12-18 06:49:10)
> > Hi Kukjin,
> > 
> > On Thursday 12 of December 2013 08:32:02 Abhilash Kesavan wrote:
> > > Fix wrong clock number in mdma0 node.
> > > 
> > > Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> > > ---
> > >  arch/arm/boot/dts/exynos5250.dtsi |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> > > index 9db5047..177becd 100644
> > > --- a/arch/arm/boot/dts/exynos5250.dtsi
> > > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > > @@ -559,7 +559,7 @@
> > >                       compatible = "arm,pl330", "arm,primecell";
> > >                       reg = <0x10800000 0x1000>;
> > >                       interrupts = <0 33 0>;
> > > -                     clocks = <&clock 271>;
> > > +                     clocks = <&clock 346>;
> > >                       clock-names = "apb_pclk";
> > >                       #dma-cells = <1>;
> > >                       #dma-channels = <8>;
> > > 
> > 
> > Can we have your ack for this patch?
> > 
> > I'd like to apply the whole series into samsung-clk fixes branch and
> > send a pull request to Mike to get it and one more fix into his tree.
> 
> Do these fixes need to go into the current -rc fixes cycle or can they
> go for 3.14?

I'd say that this should go as an -rc fix, because on some systems on
which the firmware may leave the mdma0 clock disabled by default,
trying to initialize MDMA0 by PL330 driver might cause booting failure.

Can we get your ack on this, so I could apply this and send you a pull
request with all fixes?

Best regards,
Tomasz
