From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: dts: Add peach-pit board support
Date: Sat, 26 Apr 2014 19:56:48 +0900
Message-ID: <0b4001cf613e$38abbf00$aa033d00$@samsung.com>
References: <1398313031-14848-1-git-send-email-arun.kk@samsung.com>
 <CAD=FV=X8ZPrz=wHOzPXYXvO+FNWfDEJvENnDPoNTfw8uniEDXg@mail.gmail.com>
 <CALt3h7-TmqtZRqdG=KxqeYdeWEKEbiyNaXAdQMoOb-aCLrD1_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20711 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751552AbaDZK4t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Apr 2014 06:56:49 -0400
In-reply-to: <CALt3h7-TmqtZRqdG=KxqeYdeWEKEbiyNaXAdQMoOb-aCLrD1_w@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arun Kumar K' <arunkk.samsung@gmail.com>, 'Doug Anderson' <dianders@chromium.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, 'Olof Johansson' <olofj@google.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Tushar Behera' <tushar.behera@linaro.org>

Arun Kumar K wrote:
> 
> Thanks Doug & Tushar for the Reviewed-by.
> 
> On Fri, Apr 25, 2014 at 12:27 AM, Doug Anderson <dianders@chromium.org>
> wrote:
> > Arun,
> >
> > On Wed, Apr 23, 2014 at 9:17 PM, Arun Kumar K <arun.kk@samsung.com>
> wrote:
> >> Adds the google peach-pit board dts file which uses
> >> exynos5420 SoC.
> >>
> >> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> >> Signed-off-by: Doug Anderson <dianders@chromium.org>
> >> ---
> >> Changes from v1
> >> ---------------
> >> - Addressed review comments from Doug, Sachin & Tushar
> >> - Removed adc and lid-switch nodes
> >> ---
> >>  arch/arm/boot/dts/Makefile                 |    1 +
> >>  arch/arm/boot/dts/exynos5420-peach-pit.dts |  182
> ++++++++++++++++++++++++++++
> >>  2 files changed, 183 insertions(+)
> >> +       spi@12d30000 {
> >> +               status = "okay";
> >> +               samsung,spi-src-clk = <0>;
> >> +               num-cs = <1>;
> >> +
> >> +               spidev@0 {
> >> +                       compatible = "spidev";
> >> +                       reg = <0>;
> >> +                       spi-max-frequency = <50000000>;
> >> +                       pinctrl-names = "default";
> >> +                       pinctrl-0 = <&spi_flash_cs>;
> >> +
> >> +                       controller-data {
> >> +                               cs-gpio = <&gpa2 5 0>;
> >
> > Technically this could be
> >
> > cs-gpio = <&gpa2 5 GPIO_ACTIVE_HIGH>;
> >
> > ...but I don't think that's a huge deal...
> >
> 
> Kukjin, please let me know if I need to re-send this or can you take
> care while applying?
> 
Arun, can you please re-spin with tag of reviewed-by?

Thanks,
Kukjin

> 
> > Reviewed-by: Doug Anderson <dianders@chromium.org>
