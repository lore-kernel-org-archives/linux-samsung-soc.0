From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
Date: Tue, 20 Aug 2019 08:44:05 +0900
Message-ID: <08bd637a-2038-9f64-a189-682427ce5bfb@samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
        <20190723122016.30279-10-a.swigon@partner.samsung.com>
        <5a82bf8a-d925-ba54-a26f-98b64bedc6e1@samsung.com>
        <VI1PR04MB7023B5095F706635354C4C50EED70@VI1PR04MB7023.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB7023B5095F706635354C4C50EED70@VI1PR04MB7023.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>, "georgi.djakov@linaro.org" <georgi.djakov@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "krzk@kernel.org" <krzk@kernel.org>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@google.com>, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Artur and Leonard,

On 19. 8. 9. 오전 12:00, Leonard Crestez wrote:
> On 29.07.2019 04:49, Chanwoo Choi wrote:
>> On 19. 7. 23. 오후 9:20, Artur Świgoń wrote:
>>> This patch adds interconnect functionality to the exynos-bus devfreq
>>> driver.
>>>
>>> The devfreq target() callback provided by exynos-bus now selects either the
>>> frequency calculated by the devfreq governor or the frequency requested via
>>> the interconnect API for the given node, whichever is higher.
>>
>> Basically, I agree to support the QoS requirement between devices.
>> But, I think that need to consider the multiple cases.
>>
>> 1. When changing the devfreq governor by user,
>> For example of the connection between bus_dmc/leftbus/display on patch8,
>> there are possible multiple cases with various devfreq governor
>> which is changed on the runtime by user through sysfs interface.
>>
>> If users changes the devfreq governor as following:
>> Before,
>> - bus_dmc (simple_ondemand, available frequency 100/200/300/400 MHz)
>> --> bus_leftbus(simple_ondemand, available frequency 100/200/300/400 MHz)
>> ----> bus_display(passive)
>>
>> After changed governor of bus_dmc,
>> if the min_freq by interconnect requirement is 400Mhz,
>> - bus_dmc (powersave) : min_freq and max_freq and cur_freq is 100MHz
>> --> bus_leftbus(simple_ondemand) : cur_freq is 400Mhz
>> ----> bus_display(passive)
>>
>> The final frequency is 400MHz of bus_dmc
>> even if the min_freq/max_freq/cur_freq is 100MHz.
>> It cannot show the correct min_freq/max_freq through
>> devfreq sysfs interface.
>>
>>
>> 2. When disabling the some frequency by devfreq-thermal throttling,
>> This patch checks the min_freq of interconnect requirement
>> in the exynos_bus_target() and exynos_bus_passive_target().
>> Also, it cannot show the correct min_freq/max_freq through
>> devfreq sysfs interface.
>>
>> For example of bus_dmc bus,
>> - The available frequencies are 100MHz, 200MHz, 300MHz, 400MHz
>> - Disable 400MHz by devfreq-thermal throttling
>> - min_freq is 100MHz
>> - max_freq is 300MHz
>> - min_freq of interconnect is 400MHz
>>
>> In result, the final frequency is 400MHz by exynos_bus_target()
>> There are no problem for working. But, the user cannot know
>> reason why cur_freq is 400MHz even if max_freq is 300MHz.
>>
>> Basically, update_devfreq() considers the all constraints
>> of min_freq/max_freq to decide the proper target frequency.
> 
> I think that applying the interconnect min_freq via dev_pm_qos can help 
> with many of these concerns: update_devfreq controls all the min/max 
> handling, sysfs is accurate and better decisions can be made regarding 
> thermal. Enforcing constraints in the core is definitely better.
> 
> This wouldn't even be a very big change, you don't need to actually move 
> the interconnect code outside of devfreq. Just make every devfreq/icc 
> node register a dev_pm_qos_request for itself during registration and 
> call dev_pm_qos_update_request inside exynos_bus_icc_set.
> 
> See: https://patchwork.kernel.org/patch/11084279/

I agree this approach of Leonard. If we use the dev_pm_qos[1] feature,
it resolve the issue of my comment1/2.

In summary, when receive the minimum frequency requirement
from interconnect path, the each bus uses the dev_pm_qos interface
in order to inform the minimum frequency from interconnect to devfreq.
And then the devfreq core will execute the update_devfreq()
with all frequency requirements as following:
- the user input (min/max frequency though devfreq sysfs
- the target frequency provided by devfreq governor
- the minimum frequency from interconnect path

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
