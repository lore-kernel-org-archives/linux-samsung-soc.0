From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: add support for hdmi to exynos4
Date: Mon, 28 Jan 2013 19:48:21 +0100
Message-ID: <1877374.JGtShV5Erp@flatron>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com> <2444735.ZYdaJLrTT3@flatron> <CAPdUM4N0r0p5BOvtZ2urShkafiavdE-1jxbNZGCtEkecBDTGvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:44421 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019Ab3A1Ss2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 13:48:28 -0500
Received: by mail-ee0-f48.google.com with SMTP id t10so1508583eei.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jan 2013 10:48:27 -0800 (PST)
In-Reply-To: <CAPdUM4N0r0p5BOvtZ2urShkafiavdE-1jxbNZGCtEkecBDTGvg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com

On Monday 28 of January 2013 14:53:10 Rahul Sharma wrote:
> Hi Tomasz,
> 
> On Mon, Jan 28, 2013 at 2:14 PM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > Hi Rahul,
> > 
> > On Monday 28 of January 2013 12:25:27 Rahul Sharma wrote:
> >> Hi Thomas,
> >> 
> >> On Fri, Jan 25, 2013 at 11:10 PM, Thomas Abraham
> >> 
> >> <thomas.abraham@linaro.org> wrote:
> >> > On 25 January 2013 02:39, Rahul Sharma <rahul.sharma@samsung.com>
> > 
> > wrote:
> >> >> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> >> >> 
> >> >> Conflicts:
> >> >>         arch/arm/mach-exynos/mach-exynos4-dt.c
> >> >> 
> >> >> ---
> >> >> 
> >> >>  arch/arm/boot/dts/exynos4.dtsi         | 7 +++++++
> >> >>  arch/arm/mach-exynos/mach-exynos4-dt.c | 2 ++
> >> >>  2 files changed, 9 insertions(+)
> >> >> 
> >> >> diff --git a/arch/arm/boot/dts/exynos4.dtsi
> >> >> b/arch/arm/boot/dts/exynos4.dtsi index e1347fc..6c2c79d 100644
> >> >> --- a/arch/arm/boot/dts/exynos4.dtsi
> >> >> +++ b/arch/arm/boot/dts/exynos4.dtsi
> >> >> @@ -289,4 +289,11 @@
> >> >> 
> >> >>                         interrupts = <0 34 0>;
> >> >>                 
> >> >>                 };
> >> >>         
> >> >>         };
> >> >> 
> >> >> +
> >> >> +       hdmi {
> >> >> +               compatible = "samsung,exynos4-hdmi14";
> >> >> +               reg = <0x12D00000 0x70000>;
> >> >> +               interrupts = <0 95 0>;
> >> >> +               hpd-gpio = <&gpx3 7 0xf 1 3>;
> >> > 
> >> > This is using the older gpio dt bindings but exynos4 has started
> >> > using
> >> > the pinctrl bindings. So this is not sufficient to do the
> >> > pinmux/pinconfig settings on Exynos4.
> >> > 
> >> > Thanks,
> >> > Thomas.
> >> 
> >> I have chosen this as exynos5 DT using it in same way and parsed by
> >> common code in driver for exy4 and 5. Secondly, one-time initial
> >> configuration is sufficient for
> >> hdmi hpd-gpio. Please share your opinion.
> > 
> > Exynos4 SoCs use pin control for pin mux configuration, which implies
> > different GPIO specifiers than what you used. On Exynos4 generic GPIO
> > specifiers are used:
> > 
> > <&gpio-controller pin flags>
> > 
> > As you can see, it does not contain pin mux configuration, which must
> > be
> > configured if special function is to be used. In case of EINTs and
> > input/output functions, they are configured automatically, respectively
> > by request_irq (with appropriate interrupt trigger flag) and
> > gpio_direction_*.
> > 
> > Keep in mind that Exynos5 will be eventually moved to pin control as
> > well and its old GPIO bindings will be dropped as they are only
> > temporary.
> > 
> > Best regards,
> > Tomasz
> 
> Since Exynos5 pinctrl is not yet merged, either I need to add "hpd-
> gpio" in non-pinctrl way and keep the parsing code (in driver) same
> for exynos4 and 5, as I have done in posted patch. This is same for
> exynos5.
> Or, I need to parse gpio information in a two different manners for
> the two SoC series.
> 
> It will remain as a special case till we have exynos5 pinctrl driver.
> IMO, above code looks better till I can provide same solution for both,
> exynos4 & exynos5.

Well, it might look better, but it is incorrect, so I don't see the point 
of merging it. Please either provide a patch which handles Exynos4 properly 
or wait until Exynos5 pin control support gets merged.

You can look at sdhci-s3c driver for an example how to handle multiple pin 
mux configuration methods.

Best regards,
Tomasz
