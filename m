From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFC 1/2] ARM: dts: exynos: Add proper regulator states for
 suspend-to-mem for odroid-u3
Date: Fri, 15 Feb 2019 19:28:11 +0530
Message-ID: <CANAwSgR43=p-YitdHm1q9rQTHYYH31pnUqJgavRe3vQ6Zjb1qw@mail.gmail.com>
References: <20190213214052.2427-1-linux.amoon@gmail.com> <20190213214052.2427-2-linux.amoon@gmail.com>
 <CAJKOXPeyFmKUGwqS1sgf_k2WSx9i0AETjpOLXtsmLFupTpgqnw@mail.gmail.com>
 <CANAwSgQB-=iwX1L0m6N=dbe6jbfUMYyjgna_QMmJyggj6rxzwQ@mail.gmail.com> <CAJKOXPcrkVEgsaTFrQbCvn=gx3h6av7zvaXcfroNMYk6qgs8mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcrkVEgsaTFrQbCvn=gx3h6av7zvaXcfroNMYk6qgs8mQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Fri, 15 Feb 2019 at 13:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, 14 Feb 2019 at 19:35, Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > hi Krzysztof,
> >
> > Thanks fro your review comments.
> >
> > On Thu, 14 Feb 2019 at 18:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > Hi Anand,
> > >
> > > Thanks for the patch. See comments below.
> > >
> > > On Wed, 13 Feb 2019 at 22:41, Anand Moon <linux.amoon@gmail.com> wrote:
> > > >
> > > > Add suspend-to-mem node to regulator core to be enabled or disabled
> > > > during system suspend and also support changing the regulator operating
> > > > mode during runtime and when the system enter sleep mode.
> > > >
> > > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > > > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > >
> > > > Changes from previos patch
> > > > [0] https://patchwork.kernel.org/patch/10712549/
> > > >
> > > > Set all the WAKEUP source regulator in suspend-on state.
> > > > LD04, LD012, LD015, LD020, LD022
> > > > Set all the non used regulator in suspend-odd state
> > > > LD02, LD03, LD05, LD06, LD07, LD011, LD013, LDO14, LD016
> > > >
> > > > BUCK5, BUCK6, BUCK7 and not confirable as per driver max77686-regulator
> > > >
> > > > Tested on microSD card and it resumes correcly after suspend.
> > > > eMMC is not able to resume after entering into suspend state,
> > > > which need to be investigated and how to debug more.
> > > > ---
> > > >  .../boot/dts/exynos4412-odroid-common.dtsi    | 63 +++++++++++++++++++
> > > >  arch/arm/boot/dts/exynos4412-odroidu3.dts     |  3 +
> > > >  2 files changed, 66 insertions(+)
> > > >
> > > > diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > > > index 08d3a0a7b4eb..e984461c37d9 100644
> > > > --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > > > +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > > > @@ -288,6 +288,9 @@
> > > >                                 regulator-min-microvolt = <1800000>;
> > > >                                 regulator-max-microvolt = <1800000>;
> > > >                                 regulator-always-on;
> > > > +                               regulator-state-mem {
> > > > +                                       regulator-off-in-suspend;
> > > > +                               };
> > >
> > > I see my comment from previous patch was not addressed.
> >
> > I left this unchanged since this regulator is not active linked and used.
> > Ok I will change this to regulator-on-in-suspend,
>
> Why?
>
> Previous patch was setting this to "on". I said that this is noop and
> if you want to add it, I need explanation why this regulator has to
> stay on during suspend.
>
> So you changed to "off"... which is still noop... and you did not
> provide explanation. Now you replied that you will change to "on"...
> so this will be circle. Still without explanation.
>
------------------------------------------------------------------------------------------------
I have added some debug prints to get more inputs.

Here is the boot logs for sdcard suspend resume

[1] https://pastebin.com/wvJvJidp

[root@archl-u3m ~]# rtcwake -d /dev/rtc0 -m mem -s 10
rtcwake: assuming RTC uses UTC ...
rtcwake: wakeup from "mem" using /dev/rtc0 at Fri Feb 15 13:28:06 2019
[   97.165349] PM: suspend entry (deep)
[   97.165846] PM: Syncing filesystems ... done.
[   97.344436] Freezing user space processes ... (elapsed 0.006 seconds) done.
[   97.354738] OOM killer disabled.
[   97.356028] Freezing remaining freezable tasks ... (elapsed 0.004
seconds) done.
[   97.413453] smsc95xx 1-2:1.0 eth0: entering SUSPEND2 mode
[   97.423227] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[   97.444346] dwc2 12480000.hsotg: suspending usb gadget g_ether
[   97.446728] dwc2 12480000.hsotg: dwc2_hsotg_ep_disable: called for ep0
[   97.451287] dwc2 12480000.hsotg: dwc2_hsotg_ep_disable: called for ep0
[   97.457742] dwc2 12480000.hsotg: new device is full-speed
[   97.465766] wake enabled for irq 119
[   97.466979] BUCK9: No configuration
[   97.470417] BUCK8_P3V3: No configuration
[   97.474131] BUCK7_2.0V: No configuration
[   97.477954] BUCK6_1.35V: No configuration
[   97.481946] VDDQ_CKEM1_2_1.2V: No configuration
[   97.487930] BUCK4: regulator suspend disable supported
[   97.491964] BUCK3: regulator suspend disable supported
[   97.497184] BUCK1: regulator suspend disable supported
[   97.501838] LDO26: No configuration
[   97.505383] LDO24: No configuration
[   97.508761] LDO23: No configuration
[   97.512368] LDO19: No configuration
[   97.515706] LDO18: No configuration
[   97.519178] LDO17: No configuration
[   97.523076] LDO16: regulator suspend disable supported
[   97.528154] LDO15: regulator suspend disable supported
[   97.533367] LDO14: regulator suspend disable supported
[   97.538447] LDO12: regulator suspend disable supported
[   97.543603] LDO11: regulator suspend disable supported
[   97.548308] LDO9: No configuration
[   97.552107] LDO7: regulator suspend disable supported
[   97.557064] LDO6: regulator suspend disable supported
[   97.562251] LDO2: regulator suspend disable supported
[   97.566769] VDD_ALIVE_1.0V: No configuration
[   97.581717] usb3503 0-0008: switched to STANDBY mode
[   97.582496] wake enabled for irq 123
[   97.602770] samsung-pinctrl 11000000.pinctrl: Setting external
wakeup interrupt mask: 0xfbfff7ff
[   97.623616] Disabling non-boot CPUs ...
[   97.681453] s3c2410-wdt 10060000.watchdog: watchdog disabled
[   97.681743] wake disabled for irq 123
[   97.692569] usb3503 0-0008: switched to HUB mode
[   97.801553] wake disabled for irq 119
[   97.802087] dwc2 12480000.hsotg: resuming usb gadget g_ether
[   98.080458] usb 1-2: reset high-speed USB device number 2 using exynos-ehci
[   98.432321] usb 1-3: reset high-speed USB device number 3 using exynos-ehci
[   98.970441] usb 1-3.3: reset high-speed USB device number 4 using exynos-ehci
[   99.135835] OOM killer enabled.
[   99.135940] Restarting tasks ... done.
[   99.140760] PM: suspend exit
[root@archl-u3m ~]# [   99.877843] smsc95xx 1-2:1.0 eth0: link up,
100Mbps, full-duplex, lpa 0xC5E1

------------------------------------------------
Here is the boot log for emmc suspend resume. after disable of emmc regulator.

[2]  https://pastebin.com/Z05K3kj2

rtcwake: wakeup from "mem" using /dev/rtc0 at Fri Feb 15 13:27:26 2019
[   79.775108] PM: suspend entry (deep)
[   79.775462] PM: Syncing filesystems ... done.
[   79.819009] Freezing user space processes ... (elapsed 0.004 seconds) done.
[   79.826300] OOM killer disabled.
[   79.828603] Freezing remaining freezable tasks ... (elapsed 0.001
seconds) done.
[   79.875967] smsc95xx 1-2:1.0 eth0: entering SUSPEND2 mode
[   79.959495] dwc2 12480000.hsotg: suspending usb gadget g_ether
[   79.960480] dwc2 12480000.hsotg: dwc2_hsotg_ep_disable: called for ep0
[   79.966431] dwc2 12480000.hsotg: new device is full-speed
[   79.971805] dwc2 12480000.hsotg: dwc2_hsotg_ep_disable: called for ep0
[   79.980568] wake enabled for irq 119
[   79.982195] BUCK9: No configuration
[   79.985540] BUCK8_P3V3: No configuration
[   79.989201] BUCK7_2.0V: No configuration
[   79.993175] BUCK6_1.35V: No configuration
[   79.997099] VDDQ_CKEM1_2_1.2V: No configuration
[   80.002765] BUCK4: regulator suspend disable supported
[   80.007115] BUCK3: regulator suspend disable supported
[   80.012346] BUCK1: regulator suspend disable supported
[   80.016991] LDO26: No configuration
[   80.020467] LDO24: No configuration
[   80.023991] LDO23: No configuration
[   80.027456] LDO19: No configuration
[   80.030858] LDO18: No configuration
[   80.034388] LDO17: No configuration
[   80.038172] LDO16: regulator suspend disable supported
[   80.043410] LDO15: regulator suspend disable supported
[   80.048429] LDO14: regulator suspend disable supported
[   80.053658] LDO12: regulator suspend disable supported
[   80.058670] LDO11: regulator suspend disable supported
[   80.063522] LDO9: No configuration
[   80.067187] LDO7: regulator suspend disable supported
[   80.072290] LDO6: regulator suspend disable supported
[   80.077321] LDO2: regulator suspend disable supported
[   80.081995] VDD_ALIVE_1.0V: No configuration
[   80.096885] usb3503 0-0008: switched to STANDBY mode
[   80.097568] wake enabled for irq 123
[   80.116002] samsung-pinctrl 11000000.pinctrl: Setting external
wakeup interrupt mask: 0xfbfff7ff
[   80.134695] Disabling non-boot CPUs ...

[snip]

> > > > diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> > > > index 2bdf899df436..4ebde09fc51d 100644
> > > > --- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
> > > > +++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> > > > @@ -82,6 +82,9 @@
> > > >         regulator-name = "LDO22_VDDQ_MMC4_2.8V";
> > > >         regulator-min-microvolt = <2800000>;
> > > >         regulator-max-microvolt = <2800000>;
> > > > +       regulator-state-mem {
> > > > +               regulator-on-in-suspend;
> > >
> > > Why?
> > >
> >
> > I chose not to disable mshc_0 (emmc) regulator,
> > since I could not get suspend resume working on eMMC.
>
> Having "regulator-on-in-suspend" is not the same as not disabling
> regulator during suspend. This property means you will explicitly
> enable it during suspend. To me it looks wrong so I would be happy to
> see explanations.
>

During suspend the driver set the regulator in standby mode until resume.
Opps I understood the regulator in suspend mode enter into

REGULATOR_MODE_STANDBY : MAX77686_OFF_PWRREQ;

[   79.997099] VDDQ_CKEM1_2_1.2V: No configuration
[   80.002765] BUCK4: regulator suspend disable supported
[   80.007115] BUCK3: regulator suspend disable supported
[   80.012346] BUCK1: regulator suspend disable supported
[   80.016991] LDO26: No configuration
[   80.020467] LDO24: No configuration
[   80.023991] LDO23: No configuration
[   80.027456] LDO19: No configuration
[   80.030858] LDO18: No configuration
[   80.034388] LDO17: No configuration
[   80.038172] LDO16: regulator suspend disable supported
[   80.043410] LDO15: regulator suspend disable supported
[   80.048429] LDO14: regulator suspend disable supported
[   80.053658] LDO12: regulator suspend disable supported
[   80.058670] LDO11: regulator suspend disable supported
[   80.063522] LDO9: No configuration
[   80.067187] LDO7: regulator suspend disable supported
[   80.072290] LDO6: regulator suspend disable supported
[   80.077321] LDO2: regulator suspend disable supported

So as per the logs BUCK1 / BUCK3 / BUCK4 successfully entered into suspend mode.

Where as suspend is disabled in groups as per the documentation.
(Group 1)
Buck6-->Buck7-->LD01-->LD011-->LD014
Group 2)
Buck2-->Buck1-->Buck3-->Buck4
Group 3>
LD06-->LD013-->LD08-->LD015-->LD010-->LD016-->LD05-->LD012

Best Regards
-Anand
