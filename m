From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: add support for hdmi to exynos4
Date: Mon, 28 Jan 2013 09:44:53 +0100
Message-ID: <2444735.ZYdaJLrTT3@flatron>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com> <CAJuYYwSHDoc40obSnPZwvS3LFxZEbrhHx6-Vd-yLKPGOnXxmoQ@mail.gmail.com> <CAPdUM4Mx=Wq1pRshWBF-L=+AUbhBOL-N+0VU4QjUkxuZcLYf5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f182.google.com ([209.85.215.182]:35690 "EHLO
	mail-ea0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753823Ab3A1Io7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 03:44:59 -0500
Received: by mail-ea0-f182.google.com with SMTP id a12so1018518eaa.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jan 2013 00:44:58 -0800 (PST)
In-Reply-To: <CAPdUM4Mx=Wq1pRshWBF-L=+AUbhBOL-N+0VU4QjUkxuZcLYf5Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com

Hi Rahul,

On Monday 28 of January 2013 12:25:27 Rahul Sharma wrote:
> Hi Thomas,
> 
> On Fri, Jan 25, 2013 at 11:10 PM, Thomas Abraham
> 
> <thomas.abraham@linaro.org> wrote:
> > On 25 January 2013 02:39, Rahul Sharma <rahul.sharma@samsung.com> 
wrote:
> >> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> >> 
> >> Conflicts:
> >>         arch/arm/mach-exynos/mach-exynos4-dt.c
> >> 
> >> ---
> >> 
> >>  arch/arm/boot/dts/exynos4.dtsi         | 7 +++++++
> >>  arch/arm/mach-exynos/mach-exynos4-dt.c | 2 ++
> >>  2 files changed, 9 insertions(+)
> >> 
> >> diff --git a/arch/arm/boot/dts/exynos4.dtsi
> >> b/arch/arm/boot/dts/exynos4.dtsi index e1347fc..6c2c79d 100644
> >> --- a/arch/arm/boot/dts/exynos4.dtsi
> >> +++ b/arch/arm/boot/dts/exynos4.dtsi
> >> @@ -289,4 +289,11 @@
> >> 
> >>                         interrupts = <0 34 0>;
> >>                 
> >>                 };
> >>         
> >>         };
> >> 
> >> +
> >> +       hdmi {
> >> +               compatible = "samsung,exynos4-hdmi14";
> >> +               reg = <0x12D00000 0x70000>;
> >> +               interrupts = <0 95 0>;
> >> +               hpd-gpio = <&gpx3 7 0xf 1 3>;
> > 
> > This is using the older gpio dt bindings but exynos4 has started using
> > the pinctrl bindings. So this is not sufficient to do the
> > pinmux/pinconfig settings on Exynos4.
> > 
> > Thanks,
> > Thomas.
> 
> I have chosen this as exynos5 DT using it in same way and parsed by
> common code in driver for exy4 and 5. Secondly, one-time initial
> configuration is sufficient for
> hdmi hpd-gpio. Please share your opinion.

Exynos4 SoCs use pin control for pin mux configuration, which implies 
different GPIO specifiers than what you used. On Exynos4 generic GPIO 
specifiers are used:

<&gpio-controller pin flags>

As you can see, it does not contain pin mux configuration, which must be 
configured if special function is to be used. In case of EINTs and 
input/output functions, they are configured automatically, respectively by 
request_irq (with appropriate interrupt trigger flag) and gpio_direction_*.

Keep in mind that Exynos5 will be eventually moved to pin control as well 
and its old GPIO bindings will be dropped as they are only temporary.

Best regards,
Tomasz
