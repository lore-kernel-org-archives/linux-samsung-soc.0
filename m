From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
	reg control
Date: Thu, 13 Jun 2013 20:21:23 +0900
Message-ID: <02c101ce6828$29ab0f20$7d012d60$%dae@samsung.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
	<CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com>
	<CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com>
	<CAPdUM4Nis0uwyZf1hNDOMmdqFm0K7beVPoyAWRjMBwq0jcwwCQ@mail.gmail.com>
	<51B98908.8050403@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-reply-to: <51B98908.8050403@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Rahul Sharma' <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Stephen Warren' <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'sunil joshi' <joshi@samsung.com>, 'DRI mailing list' <dri-devel@lists.freedesktop.org>, 'Kishon Vijay Abraham I' <kishon@ti.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, grant.likely@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: Sylwester Nawrocki [mailto:s.nawrocki@samsung.com]
> Sent: Thursday, June 13, 2013 5:56 PM
> To: Rahul Sharma
> Cc: Rahul Sharma; Inki Dae; linux-samsung-soc@vger.kernel.org; devicetree-
> discuss@lists.ozlabs.org; DRI mailing list; Kukjin Kim; Seung-Woo Kim;
> Sean Paul; sunil joshi; Kishon Vijay Abraham I; Stephen Warren;
> grant.likely@linaro.org
> Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with
> pmu reg control
> 
> Hi,
> 
> On 06/13/2013 06:26 AM, Rahul Sharma wrote:
> > Mr. Dae,
> >
> > Thanks for your valuable inputs.
> >
> > I posted it as RFC because, I also have received comments to register
> > hdmiphy as a clock controller. As we always configure it for specific
> > frequency, hdmi-phy looks similar to a PLL. But it really doesn't
> > belong to that class. Secondly prior to exynos5420, it was a i2c
> > device. I am not sure we can register a I2C device as a clock
> > controller. I wanted to discuss and explore this option here.
> 
> Have you considered using the generic PHY framework for those HDMI
> PHY devices [1] ? I guess we could add a dedicated group of ops for
> video PHYs, similarly as is is done with struct v4l2_subdev_ops. For
> configuring things like the carrier/pixel clock frequency or anything
> what's common across the video PHYs.
> 
> Perhaps you could have a look and see if this framework would be
> useful for HDMI and possibly point out anything what might be missing ?
> 
> I'm not sure it it really solves the issues specific to the Exynos
> HDMI but at least with a generic PHY driver the PHY module would be
> separate from the PHY controller, as often same HDMI DPHY can be used
> with various types of a HDMI controller. So this would allow to not
> duplicate the HDMI PHY drivers in the long-term perspective.

Yeah, at least, it seems that we could use PHY module to control PMU
register, HDMI_PHY_CONTROL. However, PHY module provides only init/on/off
callbacks. As you may know, HDMIPHY needs i2c interfaces to control HDMIPHY
clock. So with PHY module, HDMIPHY driver could enable PMU more generically,
but also has to use existing i2c stuff to control HDMIPHY clock. I had a
quick review to Generic PHY Framework[v6] but I didn't see that the PHY
module could generically support more features such as i2c stuff.

Thanks,
Inki Dae

> 
> [1] https://lkml.org/lkml/2013/4/29/95
> 
> Thanks,
> Sylwester
> 
> > As you said, in parallel, I will align these changes and along with
> > "drm/exynos: hdmi: move hdmiphy related code to hdmiphy driver"
> > series and post them.
> >
> > I hope we should be able to close on one of the above approaches for
> > hdmiphy.
> >
> > regards,
> > Rahul Sharma.
> >
> > On Wed, Jun 12, 2013 at 9:57 AM, Inki Dae <inki.dae@samsung.com> wrote:
> >>
> >> 2013/6/12 Inki Dae <inki.dae@samsung.com>
> >>>
> >>> Hi Rahul,
> >>>
> >>> This patch is important to us. Actually, previous hdmi driver had
> >>> controlled hdmiphy HDMI_PHY_CONTROL as if that were a clock but now
> that
> >>> doesn't exist anymore. So we need to discuss how hdmiphy should be
> handled.
> >>> I konw that you had already posted hdmiphy relevant patch set, [PATCH
> 0/4]
> >>> drm/exynos: hdmi: move hdmiphy related code to hdmiphy driver.
> >>>
> >>> I think we can couple pmu register controlling codes with that patch
> set
> >>> without RFC. Could you update and post them again? like below,
> >>> [PATCH 0/4] drm/exynos: hdmi: move hdmiphy related code to hdmiphy
> driver
> >>> + [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu reg
> >>> control
> >>>
> >>> And then let's start review :)
> >>
> >> And I think It would be better to move the pmu register controlling
> codes
> >> into hdmiphy driver like drivers/usb/phy/phy-samsung-usb2.c driver
does.
> >>>
> >>> Thanks,
> >>> Inki Dae
> >>>
> >>> 2013/6/11 Rahul Sharma <rahul.sharma@samsung.com>
> >>>>
> >>>> Previously, hdmiphy is added as a dummy clock in clock file for
> >>>> exynos SoCs. Enable/Disable to this clock, actually toggles the power
> >>>> control bit in PMU, instead of controlling the clock gate.
> >>>>
> >>>> This RFC adds the support to parse hdmiphy control node which is a
> child
> >>>> node to hdmi, and map the pmu register to toggle the power control
> bit.
> >>>>
> >>>> This is based on drm-next branch in Inki Dae's tree.
> >>>>
> >>>> Rahul Sharma (2):
> >>>>   drm/exynos: replace dummy hdmiphy clock with pmu register control
> >>>>   ARM/dts: add hdmiphy power control pmu register to hdmi dt node
> >>>>
> >>>>  arch/arm/boot/dts/exynos5250.dtsi    |    6 +++
> >>>>  drivers/gpu/drm/exynos/exynos_hdmi.c |   69
> >>>> ++++++++++++++++++++++++++++++----
> >>>>  drivers/gpu/drm/exynos/regs-hdmi.h   |    4 ++
> >>>>  3 files changed, 71 insertions(+), 8 deletions(-)
> >>>>
> >>>> --
> >>>> 1.7.10.4
> 
> --
> Sylwester Nawrocki
> Samsung R&D Institute Poland
> Samsung Electronics
