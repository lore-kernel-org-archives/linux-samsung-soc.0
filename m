From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
Subject: Re: [RFC PATCH v2 00/11] Simple QoS for exynos-bus driver using
 interconnect
Date: Wed, 25 Sep 2019 07:47:43 +0200
Message-ID: <c06ca89f2b40e0282f19727b95da5e5b0158d7e3.camel@samsung.com>
References: <CGME20190919142321eucas1p164c2591ad402427cb71fd00c348a29ec@eucas1p1.samsung.com>
        <20190919142236.4071-1-a.swigon@samsung.com>
        <fe6d026d-71b5-438d-6932-6a2234fc72c2@samsung.com>
        <d8550f93-d4cf-f215-c083-8ecad267d430@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8550f93-d4cf-f215-c083-8ecad267d430@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, leonard.crestez@nxp.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, krzk@kernel.org, "cpgs (cpgs@samsung.com)" <cpgs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Fri, 2019-09-20 at 11:14 +0900, Chanwoo Choi wrote:
> Hi Artur,
> 
> I tried to just build this patch on mainline kernel or linux-next.
> But, when I applied them, merge conflict happens. You didn't develop
> them on latest version. Please rebase them based on latest mainline kernel.

I developed on top of next-20190918 on which I applied
https://patchwork.kernel.org/cover/11149497/ as I mentioned in the cover
letter. The dev_pm_qos patches and my RFC have just cleanly rebased together on
top of next-20190920. Could you check if you have the dev_pm_qos patches (v5,
the version number is missing in this one; link above) and if so, where does the
conflict appear?

> On 19. 9. 20. 오전 10:07, Chanwoo Choi wrote:
> > Hi Artur,
> > 
> > On v1, I mentioned that we need to discuss how to change
> > the v2 for this. But, I have not received any reply from you on v1.
> > And, without your reply from v1, you just send v2.
> > 
> > I think that it is not proper development sequence.
> > I have spent many times to review your patches
> > and also I'll review your patches. You have to take care
> > the reply of reviewer and and keep the basic rule
> > of mailing contribution for discussion.
> > 
> > On 19. 9. 19. 오후 11:22, Artur Świgoń wrote:
> > > The following patchset adds interconnect[1][2] framework support to the
> > > exynos-bus devfreq driver. Extending the devfreq driver with interconnect
> > > capabilities started as a response to the issue referenced in [3]. The
> > > patches can be subdivided into four logical groups:
> > > 
> > > (a) Refactoring the existing devfreq driver in order to improve readability
> > > and accommodate for adding new code (patches 01--04/11).
> > > 
> > > (b) Tweaking the interconnect framework to support the exynos-bus use case
> > > (patches 05--07/11). Exporting of_icc_get_from_provider() allows us to
> > > avoid hardcoding every single graph edge in the DT or driver source, and
> > > relaxing the requirement contained in that function removes the need to
> > > provide dummy node IDs in the DT. Adjusting the logic in
> > > apply_constraints() (drivers/interconnect/core.c) accounts for the fact
> > > that every bus is a separate entity and therefore a separate interconnect
> > > provider, albeit constituting a part of a larger hierarchy.
> > > 
> > > (c) Implementing interconnect providers in the exynos-bus devfreq driver
> > > and adding required DT properties for one selected platform, namely
> > > Exynos4412 (patches 08--09/11). Due to the fact that this aims to be a
> > > generic driver for various Exynos SoCs, node IDs are generated dynamically
> > > rather than hardcoded. This has been determined to be a simpler approach,
> > > but depends on changes described in (b).
> > > 
> > > (d) Implementing a sample interconnect consumer for exynos-mixer targeted
> > > at the issue referenced in [3], again with DT info only for Exynos4412
> > > (patches 10--11/11).
> > > 
> > > Integration of devfreq and interconnect functionalities is achieved by
> > > using dev_pm_qos_*() API[5]. All new code works equally well when
> > > CONFIG_INTERCONNECT is 'n' (as in exynos_defconfig) in which case all
> > > interconnect API functions are no-ops.
> > > 
> > > This patchset depends on [5].
> > > 
> > > --- Changes since v1 [6]:
> > > * Rebase on [4] (coupled regulators).
> > > * Rebase on [5] (dev_pm_qos for devfreq).
> > > * Use dev_pm_qos_*() API[5] instead of overriding frequency in
> > >   exynos_bus_target().
> > > * Use IDR for node ID allocation.
> > > * Avoid goto in functions extracted in patches 01 & 02 (cf. patch 04).
> > > * Reverse order of multiplication and division in
> > >   mixer_set_memory_bandwidth() (patch 11) to avoid integer overflow.
> > > 
> > > ---
> > > Artur Świgoń
> > > Samsung R&D Institute Poland
> > > Samsung Electronics
> > > 
> > > ---
> > > References:
> > > [1] Documentation/interconnect/interconnect.rst
> > > [2] Documentation/devicetree/bindings/interconnect/interconnect.txt
> > > [3] https://patchwork.kernel.org/patch/10861757/ (original issue)
> > > [4] https://patchwork.kernel.org/cover/11083663/ (coupled regulators; merged)
> > > [5] https://patchwork.kernel.org/cover/11149497/ (dev_pm_qos for devfreq)
> > > [6] https://patchwork.kernel.org/cover/11054417/ (v1 of this RFC)
> > > 
> > > Artur Świgoń (10):
> > >   devfreq: exynos-bus: Extract exynos_bus_profile_init()
> > >   devfreq: exynos-bus: Extract exynos_bus_profile_init_passive()
> > >   devfreq: exynos-bus: Change goto-based logic to if-else logic
> > >   devfreq: exynos-bus: Clean up code
> > >   interconnect: Export of_icc_get_from_provider()
> > >   interconnect: Relax requirement in of_icc_get_from_provider()
> > >   interconnect: Relax condition in apply_constraints()
> > >   arm: dts: exynos: Add parents and #interconnect-cells to Exynos4412
> > >   devfreq: exynos-bus: Add interconnect functionality to exynos-bus
> > >   arm: dts: exynos: Add interconnects to Exynos4412 mixer
> > > 
> > > Marek Szyprowski (1):
> > >   drm: exynos: mixer: Add interconnect support
> > > 
> > >  .../boot/dts/exynos4412-odroid-common.dtsi    |   1 +
> > >  arch/arm/boot/dts/exynos4412.dtsi             |  10 +
> > >  drivers/devfreq/exynos-bus.c                  | 319 +++++++++++++-----
> > >  drivers/gpu/drm/exynos/exynos_mixer.c         |  71 +++-
> > >  drivers/interconnect/core.c                   |  12 +-
> > >  include/linux/interconnect-provider.h         |   6 +
> > >  6 files changed, 327 insertions(+), 92 deletions(-)
> > > 
> > 
> > 
> 
> 
-- 
Artur Świgoń
Samsung R&D Institute Poland
Samsung Electronics
