From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v2 5/7] ARM: dts: Update DP controller DT Node for Exynos5
 based SoCs
Date: Thu, 12 Sep 2013 19:36:56 +0900
Message-ID: <06f501ceafa4$00ed4490$02c7cdb0$@org>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
 <1375183178-8201-6-git-send-email-vikas.sajjan@linaro.org>
 <002d01cea207$ff2c57d0$fd850770$%han@samsung.com>
 <CAD025yQ62VW4ou67GEi5=WwQy+j5r80haBp--ioPiw9U0o-e=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47808 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216Ab3ILKg6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 06:36:58 -0400
In-reply-to: <CAD025yQ62VW4ou67GEi5=WwQy+j5r80haBp--ioPiw9U0o-e=Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>, 'devicetree' <devicetree@vger.kernel.org>, 'InKi Dae' <inki.dae@samsung.com>, 'Ajay kumar' <ajaynumb@gmail.com>, 'Patch Tracking' <patches@linaro.org>, linaro-kernel@lists.linaro.org

Vikas Sajjan wrote:
> 
> Hi Mr. Jingoo Han,
> 
> On 26 August 2013 08:27, Jingoo Han <jg1.han@samsung.com> wrote:
> > On Tuesday, July 30, 2013 8:20 PM, Vikas Sajjan wrote:
> >>
> >> Moves the properties of DP controller to exynos5.dtsi which are common
> >> across exynos5 SoCs like Exynos5250 and Exynos5420.
> >>
> >> The PHY DP Node is based on Jingoo Han's <jg1.han@samsung.com> patch at
> >> https://patchwork.linuxtv.org/patch/19189/
> >>
> >> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> >> ---
> >>  arch/arm/boot/dts/exynos5.dtsi            |   11 +++++++++++
> >>  arch/arm/boot/dts/exynos5250-arndale.dts  |    3 ++-
> >>  arch/arm/boot/dts/exynos5250-smdk5250.dts |    3 ++-
> >>  arch/arm/boot/dts/exynos5250.dtsi         |   21 +++++++++------------
> >>  4 files changed, 24 insertions(+), 14 deletions(-)
> >>
> >
> > [....]
> >
> >> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> >> index 238bdb2..1c017dc 100644
> >> --- a/arch/arm/boot/dts/exynos5250.dtsi
> >> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> >> @@ -614,20 +614,17 @@
> >>               interrupts = <0 94 0>;
> >>       };
> >>
> >> -     dp-controller {
> >> -             compatible = "samsung,exynos5-dp";
> >> -             reg = <0x145b0000 0x1000>;
> >> -             interrupts = <10 3>;
> >> -             interrupt-parent = <&combiner>;
> >> +     dp_phy: video-phy@10040720 {
> >> +             compatible = "samsung,exynos5250-dp-video-phy";
> >> +             reg = <0x10040720 4>;
> >> +             #phy-cells = <0>;
> >> +     };
> >
> > Oops!!!
> >
> > This patch should be reverted.
> > Or, fix patch should be re-sent.
> > 'dp phy' driver is not yet merged to mainline kernel.
> >
> 
> As you suggest, since the DP-PHY driver is NOT yet in mainline, we may
> have to keep this patch reverted till your patch series gets merged to
> have DP working on exynos5 .
> 
OK, got it. Please send patch fixing this issue for v3.12. Of course, we
need this from v3.13 which will be including the DP-PHY driver.

Thanks,
Kukjin

> >
> >> +
> >> +     dp-controller@145b0000 {
> >>               clocks = <&clock 342>;
> >>               clock-names = "dp";
> >> -             #address-cells = <1>;
> >> -             #size-cells = <0>;
> >> -
> >> -             dptx-phy {
> >> -                     reg = <0x10040720>;
> >> -                     samsung,enable-mask = <1>;
> >> -             };
> >> +             phys = <&dp_phy>;
> >> +             phy-names = "dp";
> >>       };
> >
> > Thus, 'dptx-phy' node should be used until dp phy driver is merged.
> >
> > Vikas Sajjan,
> > Please test your patch on real boards when you send your patch.
> >
> 
> I tested the patch before sending on Exynos5250-SMDK5250 using  Kishon
> Vijay Abraham's series at http://lwn.net/Articles/559487/
>  which contains DP-PHY driver posted by you
>  1.  phy: Add driver for Exynos DP PHY
>  2.  video: exynos_dp: remove non-DT support for Exynos Display Port
>  3.  video: exynos_dp: Use the generic PHY driver
