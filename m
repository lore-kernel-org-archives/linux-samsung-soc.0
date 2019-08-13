From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC PATCH 00/11] Simple QoS for exynos-bus driver using
 interconnect
Date: Tue, 13 Aug 2019 15:19:46 +0900
Message-ID: <08be4ed8-5a6c-e0da-61a3-ca7b9fa61aab@samsung.com>
References: <CGME20190723122022eucas1p2f568f74f981f9de9012eb693c3b446d5@eucas1p2.samsung.com>
        <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <6be31199-a93d-c440-e0cd-7453e3ac1648@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6be31199-a93d-c440-e0cd-7453e3ac1648@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Artur,

On 19. 8. 13. 오후 3:17, Chanwoo Choi wrote:
> Hi Artur.
> 
> The patch1-4 in this series depend on other patches[1] on mainline.
> On next v2 version, please make some patches based on patches[1]
> in order to prevent the merge conflict. 
> 
> [1] [RESEND PATCH v5 0/4] add coupled regulators for Exynos5422/5800
> - https://protect2.fireeye.com/url?k=4f35944fb07b6ba2.4f341f00-9498e831e3c86bfb&u=https://lkml.org/lkml/2019/8/8/217

Add correct reference url as following:
- https://lkml.org/lkml/2019/8/8/217

> 
> Also, as I commented, we better to discuss it before sending the v2.
> 
> On 19. 7. 23. 오후 9:20, Artur Świgoń wrote:
>> The following patchset adds interconnect[1][2] framework support to the
>> exynos-bus devfreq driver. Extending the devfreq driver with interconnect
>> capabilities started as a response to the issue referenced in [3]. The
>> patches can be subdivided into four logical groups:
>>
>> (a) Refactoring the existing devfreq driver in order to improve readability
>> and accommodate for adding new code (patches 01--04/11).
>>
>> (b) Tweaking the interconnect framework to support the exynos-bus use case
>> (patches 05--07/11). Exporting of_icc_get_from_provider() allows us to
>> avoid hardcoding every single graph edge in the DT or driver source, and
>> relaxing the requirement contained in that function removes the need to
>> provide dummy node IDs in the DT. Adjusting the logic in
>> apply_constraints() (drivers/interconnect/core.c) accounts for the fact
>> that every bus is a separate entity and therefore a separate interconnect
>> provider, albeit constituting a part of a larger hierarchy.
>>
>> (c) Implementing interconnect providers in the exynos-bus devfreq driver
>> and adding required DT properties for one selected platform, namely
>> Exynos4412 (patches 08--09/11). Due to the fact that this aims to be a
>> generic driver for various Exynos SoCs, node IDs are generated dynamically
>> rather than hardcoded. This has been determined to be a simpler approach,
>> but depends on changes described in (b).
>>
>> (d) Implementing a sample interconnect consumer for exynos-mixer targeted
>> at the issue referenced in [3], again with DT info only for Exynos4412
>> (patches 10--11/11).
>>
>> Integration of devfreq and interconnect functionalities comes down to one
>> extra line in the devfreq target() callback, which selects either the
>> frequency calculated by the devfreq governor, or the one requested with the
>> interconnect API, whichever is higher. All new code works equally well when
>> CONFIG_INTERCONNECT is 'n' (as in exynos_defconfig) in which case all
>> interconnect API functions are no-ops.
>>
>> ---
>> Artur Świgoń
>> Samsung R&D Institute Poland
>> Samsung Electronics
>>
>> ---
>> References:
>> [1] Documentation/interconnect/interconnect.rst
>> [2] Documentation/devicetree/bindings/interconnect/interconnect.txt
>> [3] https://patchwork.kernel.org/patch/10861757
>>
>> Artur Świgoń (10):
>>   devfreq: exynos-bus: Extract exynos_bus_profile_init()
>>   devfreq: exynos-bus: Extract exynos_bus_profile_init_passive()
>>   devfreq: exynos-bus: Change goto-based logic to if-else logic
>>   devfreq: exynos-bus: Clean up code
>>   icc: Export of_icc_get_from_provider()
>>   icc: Relax requirement in of_icc_get_from_provider()
>>   icc: Relax condition in apply_constraints()
>>   arm: dts: exynos: Add parents and #interconnect-cells to Exynos4412
>>   devfreq: exynos-bus: Add interconnect functionality to exynos-bus
>>   arm: dts: exynos: Add interconnects to Exynos4412 mixer
>>
>> Marek Szyprowski (1):
>>   drm: exynos: mixer: Add interconnect support
>>
>>  .../boot/dts/exynos4412-odroid-common.dtsi    |   1 +
>>  arch/arm/boot/dts/exynos4412.dtsi             |  10 +
>>  drivers/devfreq/exynos-bus.c                  | 296 ++++++++++++++----
>>  drivers/gpu/drm/exynos/exynos_mixer.c         |  68 +++-
>>  drivers/interconnect/core.c                   |  12 +-
>>  include/linux/interconnect-provider.h         |   6 +
>>  6 files changed, 314 insertions(+), 79 deletions(-)
>>
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
