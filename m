From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: add support for mixer to exynos4
Date: Mon, 28 Jan 2013 09:38:55 +0100
Message-ID: <1461207.5d9zQy0FHx@flatron>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com> <5105965F.9050402@gmail.com> <CAPdUM4P_jf0w+B22p1hmso8uhmTXs=fLdF8WrzDWL8cPyLeTCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:34314 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753823Ab3A1IjC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 03:39:02 -0500
Received: by mail-ee0-f44.google.com with SMTP id l10so1193153eei.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jan 2013 00:39:00 -0800 (PST)
In-Reply-To: <CAPdUM4P_jf0w+B22p1hmso8uhmTXs=fLdF8WrzDWL8cPyLeTCw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com

Hi Rahul, Sylwester,

On Monday 28 of January 2013 12:14:38 Rahul Sharma wrote:
> On Mon, Jan 28, 2013 at 2:34 AM, Sylwester Nawrocki
> 
> <sylvester.nawrocki@gmail.com> wrote:
> > On 01/25/2013 11:39 AM, Rahul Sharma wrote:
> >> diff --git a/arch/arm/boot/dts/exynos4.dtsi
> >> b/arch/arm/boot/dts/exynos4.dtsi
> >> index 6c2c79d..07cb7d4 100644
> >> --- a/arch/arm/boot/dts/exynos4.dtsi
> >> +++ b/arch/arm/boot/dts/exynos4.dtsi
> >> @@ -296,4 +296,12 @@
> >> 
> >>                 interrupts =<0 95 0>;
> >>                 hpd-gpio =<&gpx3 7 0xf 1 3>;
> >>         
> >>         };
> >> 
> >> +
> >> +       mixer: mixer {
> >> +               compatible = "samsung,exynos4-mixer";
> > 
> > I'm afraid this compatible property it too generic. Is the video mixer
> > IP really identical an all the Exynos4 series SoCs ?
> 
> It is same in Exynos4210, 4212 and 4412.

The convention is to use the name of SoC on which this IP version appeared 
first. In this case it would be samsung,exynos4210-mixer.

Best regards,
Tomasz
