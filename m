From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 1/7] ARM: dts: Move display-timimg information inside FIMD DT node for exynos5250
Date: Wed, 14 Aug 2013 10:16:21 +0200
Message-ID: <1502617.tZjjGUmS3P@flatron>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org> <171932162.BeOHtLbZec@amdc1227> <105c01ce98b3$14b3d1e0$3e1b75a0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:59443 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759447Ab3HNIQZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 04:16:25 -0400
In-Reply-To: <105c01ce98b3$14b3d1e0$3e1b75a0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, 'Vikas Sajjan' <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, jg1.han@samsung.com, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org, grant.likely@secretlab.ca, swarren@wwwdotorg.org, mark.rutland@arm.com

On Wednesday 14 of August 2013 14:56:55 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > Hi Vikas,
> > 
> > On Tuesday 30 of July 2013 16:49:32 Vikas Sajjan wrote:
> > > As the display-timing information is parsed by FIMD driver, it makes
> > > sense to move the display-timimg DT node inside FIMD DT node for
> > > exynos5250
> > > 
> > > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> > > ---
> > > 
> > >  arch/arm/boot/dts/exynos5250-smdk5250.dts |   29
> > > 
> > > ++++++++++++++++------------- 1 file changed, 16 insertions(+), 13
> > > deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > > b/arch/arm/boot/dts/exynos5250-smdk5250.dts index 49f18c2..d176dbb
> > > 100644
> > > --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > > +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > > @@ -262,19 +262,22 @@
> > > 
> > >  		pinctrl-0 = <&dp_hpd>;
> > >  	
> > >  	};
> > > 
> > > -	display-timings {
> > > -		native-mode = <&timing0>;
> > > -		timing0: timing@0 {
> > > -			/* 1280x800 */
> > > -			clock-frequency = <50000>;
> > > -			hactive = <1280>;
> > > -			vactive = <800>;
> > > -			hfront-porch = <4>;
> > > -			hback-porch = <4>;
> > > -			hsync-len = <4>;
> > > -			vback-porch = <4>;
> > > -			vfront-porch = <4>;
> > > -			vsync-len = <4>;
> > > +	fimd@14400000 {
> > > +		status = "okay";
> > > +		display-timings {
> > > +			native-mode = <&timing0>;
> > > +			timing0: timing@0 {
> > > +				/* 1280x800 */
> > > +				clock-frequency = <50000>;
> > > +				hactive = <1280>;
> > > +				vactive = <800>;
> > > +				hfront-porch = <4>;
> > > +				hback-porch = <4>;
> > > +				hsync-len = <4>;
> > > +				vback-porch = <4>;
> > > +				vfront-porch = <4>;
> > > +				vsync-len = <4>;
> > > +			};
> > > 
> > >  		};
> > >  	
> > >  	};
> > 
> > Looks good to me, but I would like some other people from the device
> > tree mailing list to comment on node naming: Do we want to conform to
> > the recommendation of ePAPR about node naming, which states that node
> > names should be generic, not platform specific or we are free to
> > ignore it?
> The name of node looks good to me and the name had been being used for a
> long time

Like a lot of things used in device trees of ARM platforms, since we did 
not have any proper processes defined for creating device tree bindings 
and device trees themselves, including any recommended set of good 
practices.

We are now trying to define all of this and so it's time to rethink all 
the DT related things that has been added for ARM platforms since the time 
DT for ARM was introduced and make sure that everything is reasonable.

> , and if we change that now, that will cause the bigger
> confusion.

Still, I think this patch can go as is and node naming can be fixed in 
separate patches, including any other quirks of Exynos device trees.

So, for the whole series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
