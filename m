From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 3/5] clocksource: exynos_mct: Increase priority over ARM
 arch timer
Date: Mon, 18 Feb 2019 10:49:41 +0100
Message-ID: <fd3aac7b-029e-5873-f472-a0c83dda4da5@samsung.com>
References: <20190215125229.30180-1-m.szyprowski@samsung.com>
 <CGME20190215125239eucas1p2d9167af42f2d04e462c56a070c3371c2@eucas1p2.samsung.com>
 <20190215125229.30180-4-m.szyprowski@samsung.com>
 <01569ba7-2e3e-5811-81e1-ca51cacbcb95@linaro.org>
 <7b994b86-9a84-39a7-e88d-203c64b30de8@samsung.com>
 <4b054e7d-5dd5-5796-6c08-22f15060f940@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4b054e7d-5dd5-5796-6c08-22f15060f940@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Daniel,

On 2019-02-18 10:24, Daniel Lezcano wrote:
> On 18/02/2019 08:41, Marek Szyprowski wrote:
>> On 2019-02-15 17:35, Daniel Lezcano wrote:
>>> On 15/02/2019 13:52, Marek Szyprowski wrote:
>>>> Exynos Multi-Core Timer driver (exynos_mct) must be started before ARM
>>>> Architected Timers (arch_timer), because they both share some common
>>>> hardware blocks (global system counter) and turning on MCT is needed
>>>> to get ARM Architected Timer working properly. Increase MCT timer rating
>>>> and hotplug priority over ARM Archictected timer driver to achieve that.
>>> This is a hack.
>>>
>>> There are mechanisms to handle this kind of dependency.
>>>
>>> eg. https://www.kernel.org/doc/html/v4.15/driver-api/device_link.html
>> Sorry, but this is not a hack, but proper way to handle this in
>> clocksource/timers framework. The ratings assigned to each driver and
>> cpu hotplug priority list are exactly for managing the requested order
>> of operations if more than one driver has been registered.
> Actually, I'm reluctant with this change (even if it is correct) because
> it introduces an implicit dependency in the cpu hotplug enumeration for
> the timer subsystem while it may be more correct to have it explicitly
> with the hardware description (or whatever).

Maybe additional comment in the cpu hotplug list will convince you? For
the current code changing the order of enums it is more than enough.
There are no dynamic CPU hotplug priorities, so MCT driver cannot change
its behavior depending on any dt-property or so. Increasing MCT priority
has no side-effects in relation to other drivers (as they cannot
existing on the same board).

> However I don't see a proper way to describe this dependency without
> touching the DT and add a phandle to the arch timer in the exynos_mct
> timer description.
>
>> Device links operates on the 'kernel device' objects, which are created
>> and managed much later than clocksource/timers are initialized. I see no
>> use of device links in this context.
> Yes, that was just an example to show there are mechanisms to allow
> proper ordering. As said before, not the best example for this situation.
>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> ---
>>>>  drivers/clocksource/exynos_mct.c | 4 ++--
>>>>  include/linux/cpuhotplug.h       | 2 +-
>>>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
>>>> index 49413900b24c..58090f57ada3 100644
>>>> --- a/drivers/clocksource/exynos_mct.c
>>>> +++ b/drivers/clocksource/exynos_mct.c
>>>> @@ -211,7 +211,7 @@ static void exynos4_frc_resume(struct clocksource *cs)
>>>>  
>>>>  static struct clocksource mct_frc = {
>>>>  	.name		= "mct-frc",
>>>> -	.rating		= 400,
>>>> +	.rating		= 450,
>>>>  	.read		= exynos4_frc_read,
>>>>  	.mask		= CLOCKSOURCE_MASK(32),
>>>>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
>>>> @@ -465,7 +465,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
>>>>  	evt->set_state_oneshot_stopped = set_state_shutdown;
>>>>  	evt->tick_resume = set_state_shutdown;
>>>>  	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
>>>> -	evt->rating = 450;
>>>> +	evt->rating = 500;
>>>>  
>>>>  	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
>>>>  
>>>> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
>>>> index fd586d0301e7..bdd544f21102 100644
>>>> --- a/include/linux/cpuhotplug.h
>>>> +++ b/include/linux/cpuhotplug.h
>>>> @@ -115,10 +115,10 @@ enum cpuhp_state {
>>>>  	CPUHP_AP_PERF_ARM_ACPI_STARTING,
>>>>  	CPUHP_AP_PERF_ARM_STARTING,
>>>>  	CPUHP_AP_ARM_L2X0_STARTING,
>>>> +	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
>>>>  	CPUHP_AP_ARM_ARCH_TIMER_STARTING,
>>>>  	CPUHP_AP_ARM_GLOBAL_TIMER_STARTING,
>>>>  	CPUHP_AP_JCORE_TIMER_STARTING,
>>>> -	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
>>>>  	CPUHP_AP_ARM_TWD_STARTING,
>>>>  	CPUHP_AP_QCOM_TIMER_STARTING,
>>>>  	CPUHP_AP_ARMADA_TIMER_STARTING,
>>>>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
