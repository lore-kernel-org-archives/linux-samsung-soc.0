From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [RESEND] [PATCH] ARM: dts: exynos5: add pwm DT nodes to Exynos5250
 and Exynos5420
Date: Tue, 12 Nov 2013 20:39:12 +0900
Message-ID: <086801cedf9b$cef3c450$6cdb4cf0$@org>
References: <1381383731-4359-1-git-send-email-l.krishna@samsung.com>
 <CAK9yfHyB=Uqjg1HhMx6BXSihDmwRpmpkeLrm2YgDj2Yyo4ySuA@mail.gmail.com>
 <CAL1wa8e0e1NwrntEPTnm8=_bSXj3k=Gk+jenphYPEAh8tXKwiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40879 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559Ab3KLLjO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 06:39:14 -0500
In-reply-to: <CAL1wa8e0e1NwrntEPTnm8=_bSXj3k=Gk+jenphYPEAh8tXKwiA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>, abrestic@chromium.org, olofj@chromium.org

Leela Krishna Amudala wrote:
> 
> Hi Sachin,
> 
> On Thu, Oct 10, 2013 at 11:18 AM, Sachin Kamat <sachin.kamat@linaro.org>
> wrote:
> > Hi Leela,
> >
> > On 10 October 2013 11:12, Leela Krishna Amudala <l.krishna@samsung.com>
> wrote:
> >> Add the device-tree binding for the PWM controller to Exynos5250 and
> Exynos5420
> >>
> >> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> >> Signed-off-by: Olof Johansson <olofj@chromium.org>
> >> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> >> ---
> >>  arch/arm/boot/dts/exynos5250.dtsi |    9 +++++++++
> >>  arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++++
> >>  2 files changed, 18 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> >> index 864ae90..99abc72 100644
> >> --- a/arch/arm/boot/dts/exynos5250.dtsi
> >> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> >> @@ -521,6 +521,15 @@
> >>                 };
> >>         };
> >>
> >> +       pwm: pwm@12dd0000 {
> >> +               compatible = "samsung,exynos4210-pwm";
> >> +               reg = <0x12dd0000 0x100>;
> >> +               samsung,pwm-outputs = <0>, <1>, <2>, <3>;
> >> +               #pwm-cells = <3>;
> >> +               clocks = <&clock 311>;
> >> +               clock-names = "timers";
> >> +       };
> >> +
> >>         amba {
> >>                 #address-cells = <1>;
> >>                 #size-cells = <1>;
> >> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi
> >> index d537cd7..80afc8b 100644
> >> --- a/arch/arm/boot/dts/exynos5420.dtsi
> >> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> >> @@ -206,6 +206,15 @@
> >>                 clock-names = "uart", "clk_uart_baud0";
> >>         };
> >>
> >> +       pwm: pwm@12dd0000 {
> >> +               compatible = "samsung,exynos4210-pwm";
> >> +               reg = <0x12dd0000 0x100>;
> >> +               samsung,pwm-outputs = <0>, <1>, <2>, <3>;
> >> +               #pwm-cells = <3>;
> >> +               clocks = <&clock 279>;
> >> +               clock-names = "timers";
> >> +       };
> >> +
> >
> > Looking at the properties in the above 2 nodes, can't we have the
> > common ones defined in exynos5.dtsi?
> >
> 
Sorry for late, I missed...

Well, upcoming exynos5 SoC has different properties so would be better if we
could keep current version for pwm.

> Yes, we can do it, will change and post the next version
> 
Let me ignore your v2 patch and take this one.

Thanks,
Kukjin
