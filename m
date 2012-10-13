From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v1 1/6] dts: exynos: add device tree support for exynos5 hdmi
Date: Sat, 13 Oct 2012 15:33:45 +0200
Message-ID: <5536400.sBKdPAYhzo@flatron>
References: <1349981868-2116-1-git-send-email-rahul.sharma@samsung.com> <2112429.s4dA1rqnG4@flatron> <CAPdUM4Nmyv1AeRxYxdTxL=WzFDfotz5xsNh_ADgdrnN_MJJBLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:46037 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925Ab2JMNdq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Oct 2012 09:33:46 -0400
Received: by mail-wg0-f42.google.com with SMTP id fm10so165893wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Oct 2012 06:33:45 -0700 (PDT)
In-Reply-To: <CAPdUM4Nmyv1AeRxYxdTxL=WzFDfotz5xsNh_ADgdrnN_MJJBLw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com

On Saturday 13 of October 2012 08:15:46 Rahul Sharma wrote:
> Hi Tomasz,
> 
> On Sat, Oct 13, 2012 at 3:34 AM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > Hi Rahul,
> > 
> > On Friday 12 of October 2012 00:27:42 Rahul Sharma wrote:
> >> This patch adds support for device tree based discovery for exynos5
> >> hdmi. Hdmi node is also renamed with "exynos5-hdmi".
> >> 
> >> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> >> ---
> >> 
> >>  arch/arm/boot/dts/exynos5250-smdk5250.dts |    4 ++++
> >>  arch/arm/boot/dts/exynos5250.dtsi         |    7 +++++++
> >>  arch/arm/mach-exynos/include/mach/map.h   |    1 +
> >>  arch/arm/mach-exynos/mach-exynos5-dt.c    |    2 ++
> >>  4 files changed, 14 insertions(+), 0 deletions(-)
> >> 
> >> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> >> b/arch/arm/boot/dts/exynos5250-smdk5250.dts index a352df4..2a478ab
> >> 100644
> >> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> >> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> >> @@ -166,4 +166,8 @@
> >> 
> >>       spi_2: spi@12d40000 {
> >>       
> >>               status = "disabled";
> >>       
> >>       };
> >> 
> >> +
> >> +     hdmi {
> >> +             hpd-gpio = <&gpx3 7 0xf 1 3>;
> >> +     };
> >> 
> >>  };
> >> 
> >> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> >> b/arch/arm/boot/dts/exynos5250.dtsi index f69e389..4e019b5 100644
> >> --- a/arch/arm/boot/dts/exynos5250.dtsi
> >> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> >> @@ -492,4 +492,11 @@
> >> 
> >>                       #gpio-cells = <4>;
> >>               
> >>               };
> >>       
> >>       };
> >> 
> >> +
> >> +     hdmi {
> > 
> > hdmi@14530000
> > 
> >> +             compatible = "samsung,exynos5-hdmi";
> >> +             reg = <0x14530000 0x100000>;
> >> +             interrupts = <0 95 0>;
> >> +             version = "1.4";
> >> +        };
> > 
> > Is it just me or there is something wrong with indentation of this
> > bracket?
> > 
> > Best regards,
> > Tomasz Figa
> 
> My understanding was when there are multiple hardware instances of
> same IP, addresses
> are put along with the name like i2c, uart. But when only single hw IP
> is present like
> hdmi, mixer, watchdog, rtc etc address concatenation is optional.
> Please correct me if
> I am wrong. I will do the respective change.

I guess there might be no strict convention on this, but whichever dts 
file I look at, it has @addr in any node that contains reg property.
 
> in V2 patchset "version", "vp-support" properties are dropped and made
> part of driver data
> inside driver. I also added DT binding documentation for new nodes.
> 
> I had posted V2 yesterday but not visible on samsung-soc mailing list.
> I will forward you the
> patches.

I can see V2 now on linux-samsung-soc, so I will review it as well.

Best regards,
Tomasz Figa
