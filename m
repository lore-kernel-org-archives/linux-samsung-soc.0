From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: RE: [1/2] ARM: dts: Fix bootup issue on smdk5250
Date: Tue, 25 Nov 2014 18:46:17 +0530
Message-ID: <002601d008b2$1a0f5e00$4e2e1a00$%brar@samsung.com>
References: <1416312509-11530-1-git-send-email-yadi.brar@samsung.com>
 <546D67A1.1080804@samsung.com> <038501d00604$034a9640$09dfc2c0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52315 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751189AbaKYNQN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Nov 2014 08:16:13 -0500
In-reply-to: <038501d00604$034a9640$09dfc2c0$@kernel.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene@kernel.org>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, yadi.brar01@gmail.com

Hi Kukjin,

> Subject: RE: [1/2] ARM: dts: Fix bootup issue on smdk5250
> 
> Pankaj Dubey wrote:
> >
> > Hi,
> >
> Hi,
> 
> Yadwinder, please don't miss [PATCH 1/2] in subject, so that my e-mail
> client can't filter wrong ;)
> 

Sure, but I think your mail client had played some trick, as patches
were posted with [PATCH */2] prefix.

> > On Tuesday 18 November 2014 05:38 PM, Yadwinder Singh Brar wrote:
> > > With default config on smdk5250 latest tree throws below message :
> > >
> > > [    2.226049] thermal thermal_zone0: critical temperature
> reached(224 C),shutting down
> > > [    2.227840] reboot: Failed to start orderly shutdown: forcing
> the issue
> > >
> > > and hangs randomly because it reads wrong temperature value.
> > >
> > > I can't figure out any direct relation between LDO10 and TMU from
> > > board schematics which I have. So making LDO10 always-on to fix
> issue for now.
> > >
> Hmm...strange, I also can't see any relations now...but I need to
> contact to hardware guy before applying this, this fixes the problem
> though.
> 

Ok, sure it will be good know actual relation from hardware guy.

Meanwhile can we get another patch[1] merged which was posted along
with patch just because both patches were on same file. Otherwise
there is no dependency between them and can be applied independently.

Best Regards,
Yadwinder

[1] : http://www.spinics.net/lists/linux-samsung-soc/msg39107.html

> Thanks,
> Kukjin
> 
> > > Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> > >
> >
> > Tested this on SMDK5250 board, system boot is fine now, hence
> >
> > Tested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> >
> > > ---
> > > arch/arm/boot/dts/exynos5250-smdk5250.dts |    1 +
> > >   1 files changed, 1 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > > b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > > index bc27cc2..95b5b51 100644
> > > --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > > +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > > @@ -190,6 +190,7 @@
> > >   				regulator-name = "P1.8V_LDO_OUT10";
> > >   				regulator-min-microvolt = <1800000>;
> > >   				regulator-max-microvolt = <1800000>;
> > > +				regulator-always-on;
> > >   			};
> > >
> > >   			ldo11_reg: LDO11 {
> > >
