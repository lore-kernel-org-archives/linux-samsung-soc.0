From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 3/3] ARM: dts: Fix MDMA0 clock number
Date: Wed, 18 Dec 2013 11:32:03 -0800
Message-ID: <20131218193203.23538.30551@quantum>
References: <1386817322-11265-1-git-send-email-a.kesavan@samsung.com>
 <1386817322-11265-3-git-send-email-a.kesavan@samsung.com>
 <2082327.zpbOvCVe5P@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:56600 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751052Ab3LRTcJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 14:32:09 -0500
Received: by mail-qc0-f180.google.com with SMTP id w7so87614qcr.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 11:32:08 -0800 (PST)
In-Reply-To: <2082327.zpbOvCVe5P@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, kgene.kim@samsung.com
Cc: Abhilash Kesavan <a.kesavan@samsung.com>, dianders@chromium.org, tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Quoting Tomasz Figa (2013-12-18 06:49:10)
> Hi Kukjin,
> 
> On Thursday 12 of December 2013 08:32:02 Abhilash Kesavan wrote:
> > Fix wrong clock number in mdma0 node.
> > 
> > Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos5250.dtsi |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> > index 9db5047..177becd 100644
> > --- a/arch/arm/boot/dts/exynos5250.dtsi
> > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > @@ -559,7 +559,7 @@
> >                       compatible = "arm,pl330", "arm,primecell";
> >                       reg = <0x10800000 0x1000>;
> >                       interrupts = <0 33 0>;
> > -                     clocks = <&clock 271>;
> > +                     clocks = <&clock 346>;
> >                       clock-names = "apb_pclk";
> >                       #dma-cells = <1>;
> >                       #dma-channels = <8>;
> > 
> 
> Can we have your ack for this patch?
> 
> I'd like to apply the whole series into samsung-clk fixes branch and
> send a pull request to Mike to get it and one more fix into his tree.

Do these fixes need to go into the current -rc fixes cycle or can they
go for 3.14?

Regards,
Mike

> 
> Best regards,
> Tomasz
> 
