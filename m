From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/3] ARM: exynos5420: dt: add clock entries to watchdog node
Date: Wed, 24 Jul 2013 11:54:54 +0200
Message-ID: <1478852.betFXmR41G@amdc1227>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
 <1374658699-3961-3-git-send-email-l.krishna@samsung.com>
 <CAK9yfHwFZunKudPLQsukLt0w4SNSovTWYzy8jRD+u040Pk48dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23924 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752380Ab3GXJzB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 05:55:01 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQF00A42Q4J0000@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 10:54:59 +0100 (BST)
In-reply-to: <CAK9yfHwFZunKudPLQsukLt0w4SNSovTWYzy8jRD+u040Pk48dw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com

Hi Sachin,

On Wednesday 24 of July 2013 15:18:26 Sachin Kamat wrote:
> Hi Leela,
> 
> On 24 July 2013 15:08, Leela Krishna Amudala <l.krishna@samsung.com> 
wrote:
> > This patch adds clock entries to watchdog node for exynos5420
> > as per the common clock framework of exynos5420
> > 
> > Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> > Reviewed-by: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> > ---
> > 
> >  arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> > b/arch/arm/boot/dts/exynos5420.dtsi index 8c54c4b..e1d2d20 100644
> > --- a/arch/arm/boot/dts/exynos5420.dtsi
> > +++ b/arch/arm/boot/dts/exynos5420.dtsi
> > @@ -145,4 +145,10 @@
> > 
> >                 clocks = <&clock 260>, <&clock 131>;
> >                 clock-names = "uart", "clk_uart_baud0";
> >         
> >         };
> > 
> > +
> > +       watchdog {
> > +               clocks = <&clock 316>;
> > +               clock-names = "watchdog";
> > +               status = "okay";
> 
> Generally you do "okay" in specific board dts files.

Not necessarily. The status property should be set to okay whenever the 
device represented by such node can already work with given set of 
information (properties).

Given the fact that watchdog driver does not require any board specific 
information, it can be instantiated regardless of the board.

Best regards,
Tomasz
