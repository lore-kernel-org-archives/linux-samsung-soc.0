From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: dts: Remove DP PHY node from exynos5250.dtsi
Date: Mon, 26 Aug 2013 15:46:59 +0900
Message-ID: <003501cea228$10805340$3180f9c0$%han@samsung.com>
References: <003401cea225$a3dc0c40$eb9424c0$%han@samsung.com>
 <CAD025yTVbZnycfwQKq8OEL_WBzDbQECFQt-ZTuwpCXbWhtTv+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17764 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755928Ab3HZGrG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 02:47:06 -0400
In-reply-to: <CAD025yTVbZnycfwQKq8OEL_WBzDbQECFQt-ZTuwpCXbWhtTv+A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>, 'devicetree' <devicetree@vger.kernel.org>, 'InKi Dae' <inki.dae@samsung.com>, 'Ajay kumar' <ajaynumb@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Monday, August 26, 2013 3:43 PM, Vikas Sajjan wrote:
> On 26 August 2013 11:59, Jingoo Han <jg1.han@samsung.com> wrote:
> > Since DP PHY driver is not yet merged, DP PHY node should be
> > removed from exynos5250.dtsi.
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> >

[.....]

> >         dp-controller@145B0000 {
> >                 clocks = <&clock 342>;
> >                 clock-names = "dp";
> > -               phys = <&dp_phy>;
> > -               phy-names = "dp";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> 
> I think you can skip the above 2 lines, as those are already present
> in exynos5.dtsi.

OK, I see.
I will remove above 2 lines, and send V2 patch soon.
Thank you for your comment.

Best regards,
Jingoo Han
