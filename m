From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC PATCH 04/11] devfreq: exynos-bus: Clean up code
Date: Fri, 26 Jul 2019 20:04:24 +0900
Message-ID: <2871b90b-f8e6-13c0-0e0b-66ce70e3ec86@samsung.com>
References: <CGME20190723122024eucas1p25a480ccddaa69ee1d0f1a07960ca3f22@eucas1p2.samsung.com>
        <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <20190723122016.30279-5-a.swigon@partner.samsung.com>
        <CAGTfZH3Z334D3OKpBOGSfS9RoHkOX-s_2M858z1Ye2NoMtVh4g@mail.gmail.com>
        <CAJKOXPfsD0XFs2hM64Kf0eG2G+xhWef3QZKjk9NU2ECzgQeqsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfsD0XFs2hM64Kf0eG2G+xhWef3QZKjk9NU2ECzgQeqsA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, cwchoi00@gmail.com
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, georgi.djakov@linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 19. 7. 26. 오후 7:45, Krzysztof Kozlowski wrote:
> On Thu, 25 Jul 2019 at 14:51, Chanwoo Choi <cwchoi00@gmail.com> wrote:
>>
>> 2019년 7월 24일 (수) 오전 8:07, Artur Świgoń <a.swigon@partner.samsung.com>님이 작성:
>>>
>>> This patch adds minor improvements to the exynos-bus driver.
>>>
>>> Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
>>> ---
>>>  drivers/devfreq/exynos-bus.c | 49 ++++++++++++++++--------------------
>>>  1 file changed, 22 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
>>> index 4bb83b945bf7..412511ca7703 100644
>>> --- a/drivers/devfreq/exynos-bus.c
>>> +++ b/drivers/devfreq/exynos-bus.c
>>> @@ -15,11 +15,10 @@
>>>  #include <linux/device.h>
>>>  #include <linux/export.h>
>>>  #include <linux/module.h>
>>> -#include <linux/of_device.h>
>>> +#include <linux/of.h>
>>>  #include <linux/pm_opp.h>
>>>  #include <linux/platform_device.h>
>>>  #include <linux/regulator/consumer.h>
>>> -#include <linux/slab.h>
>>>
>>>  #define DEFAULT_SATURATION_RATIO       40
>>>  #define DEFAULT_VOLTAGE_TOLERANCE      2
>>> @@ -256,7 +255,7 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
>>>                                         struct exynos_bus *bus)
>>>  {
>>>         struct device *dev = bus->dev;
>>> -       int i, ret, count, size;
>>> +       int i, ret, count;
>>>
>>>         /* Get the regulator to provide each bus with the power */
>>>         bus->regulator = devm_regulator_get(dev, "vdd");
>>> @@ -283,8 +282,7 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
>>>         }
>>>         bus->edev_count = count;
>>>
>>> -       size = sizeof(*bus->edev) * count;
>>> -       bus->edev = devm_kzalloc(dev, size, GFP_KERNEL);
>>> +       bus->edev = devm_kcalloc(dev, count, sizeof(*bus->edev), GFP_KERNEL);
>>>         if (!bus->edev) {
>>>                 ret = -ENOMEM;
>>>                 goto err_regulator;
>>> @@ -388,7 +386,7 @@ static int exynos_bus_profile_init(struct exynos_bus *bus,
>>>         ondemand_data = devm_kzalloc(dev, sizeof(*ondemand_data), GFP_KERNEL);
>>>         if (!ondemand_data) {
>>>                 ret = -ENOMEM;
>>> -               goto err;
>>> +               goto out;
>>>         }
>>>         ondemand_data->upthreshold = 40;
>>>         ondemand_data->downdifferential = 5;
>>> @@ -400,14 +398,14 @@ static int exynos_bus_profile_init(struct exynos_bus *bus,
>>>         if (IS_ERR(bus->devfreq)) {
>>>                 dev_err(dev, "failed to add devfreq device\n");
>>>                 ret = PTR_ERR(bus->devfreq);
>>> -               goto err;
>>> +               goto out;
>>>         }
>>>
>>>         /* Register opp_notifier to catch the change of OPP  */
>>>         ret = devm_devfreq_register_opp_notifier(dev, bus->devfreq);
>>>         if (ret < 0) {
>>>                 dev_err(dev, "failed to register opp notifier\n");
>>> -               goto err;
>>> +               goto out;
>>>         }
>>>
>>>         /*
>>> @@ -417,16 +415,16 @@ static int exynos_bus_profile_init(struct exynos_bus *bus,
>>>         ret = exynos_bus_enable_edev(bus);
>>>         if (ret < 0) {
>>>                 dev_err(dev, "failed to enable devfreq-event devices\n");
>>> -               goto err;
>>> +               goto out;
>>>         }
>>>
>>>         ret = exynos_bus_set_event(bus);
>>>         if (ret < 0) {
>>>                 dev_err(dev, "failed to set event to devfreq-event devices\n");
>>> -               goto err;
>>> +               goto out;
>>>         }
>>>
>>> -err:
>>> +out:
>>>         return ret;
>>>  }
>>>
>>> @@ -446,27 +444,28 @@ static int exynos_bus_profile_init_passive(struct exynos_bus *bus,
>>>         parent_devfreq = devfreq_get_devfreq_by_phandle(dev, 0);
>>>         if (IS_ERR(parent_devfreq)) {
>>>                 ret = -EPROBE_DEFER;
>>> -               goto err;
>>> +               goto out;
>>>         }
>>>
>>>         passive_data = devm_kzalloc(dev, sizeof(*passive_data), GFP_KERNEL);
>>>         if (!passive_data) {
>>>                 ret = -ENOMEM;
>>> -               goto err;
>>> +               goto out;
>>>         }
>>>         passive_data->parent = parent_devfreq;
>>>
>>>         /* Add devfreq device for exynos bus with passive governor */
>>> -       bus->devfreq = devm_devfreq_add_device(dev, profile, DEVFREQ_GOV_PASSIVE,
>>> +       bus->devfreq = devm_devfreq_add_device(dev, profile,
>>> +                                               DEVFREQ_GOV_PASSIVE,
>>>                                                 passive_data);
>>>         if (IS_ERR(bus->devfreq)) {
>>>                 dev_err(dev,
>>>                         "failed to add devfreq dev with passive governor\n");
>>>                 ret = PTR_ERR(bus->devfreq);
>>> -               goto err;
>>> +               goto out;
>>>         }
>>>
>>> -err:
>>> +out:
>>>         return ret;
>>>  }
>>>
>>> @@ -484,11 +483,11 @@ static int exynos_bus_probe(struct platform_device *pdev)
>>>                 return -EINVAL;
>>>         }
>>>
>>> -       bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
>>> +       bus = devm_kzalloc(dev, sizeof(*bus), GFP_KERNEL);
>>>         if (!bus)
>>>                 return -ENOMEM;
>>>         mutex_init(&bus->lock);
>>> -       bus->dev = &pdev->dev;
>>> +       bus->dev = dev;
>>>         platform_set_drvdata(pdev, bus);
>>>
>>>         /* Parse the device-tree to get the resource information */
>>> @@ -502,7 +501,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
>>>                 goto err;
>>>         }
>>>
>>> -       node = of_parse_phandle(dev->of_node, "devfreq", 0);
>>> +       node = of_parse_phandle(np, "devfreq", 0);
>>>         if (node) {
>>>                 of_node_put(node);
>>>                 ret = exynos_bus_profile_init_passive(bus, profile);
>>> @@ -547,12 +546,10 @@ static int exynos_bus_resume(struct device *dev)
>>>         int ret;
>>>
>>>         ret = exynos_bus_enable_edev(bus);
>>> -       if (ret < 0) {
>>> +       if (ret < 0)
>>>                 dev_err(dev, "failed to enable the devfreq-event devices\n");
>>> -               return ret;
>>> -       }
>>>
>>> -       return 0;
>>> +       return ret;
>>>  }
>>>
>>>  static int exynos_bus_suspend(struct device *dev)
>>> @@ -561,12 +558,10 @@ static int exynos_bus_suspend(struct device *dev)
>>>         int ret;
>>>
>>
>> NACK.
> 
> Instead of simple nack you should explain what is wrong with proposed
> approach. The existing code could be improved and this patch clearly
> improves the readability. "err" label is confusing if it is used for
> correct exit path. The last "if() return" block is subjective - but
> then explain exactly why you prefer one over another. No just "nack"
> for peoples contributions.

OK. Sorry for my lack comment.

Actually, I prefer 'err' instead of 'out' because jump to 'err'
statement point when failed to call some functions. In my case,
'err' is proper without any problem.


> 
>>>         ret = exynos_bus_disable_edev(bus);
>>> -       if (ret < 0) {
>>> +       if (ret < 0)
>>>                 dev_err(dev, "failed to disable the devfreq-event devices\n");
>>> -               return ret;
>>> -       }

When happen error by function call, I think that have to print
the error log, just return or jump some point like 'err'
for restoring the previous state.

But, in this case, even if happen the error, the exception handling
of exynos_bus_disable_edev() just prints the error log without return.

I knew that this it is possible because the exynos_bus_disable_edev(bus)
was called at the end of function. But, I want to keep the same style
for exception handling if there are no any critical benefits.

>>>
>>> -       return 0;
>>> +       return ret;
>>>  }
>>>  #endif
>>>
>>> --
>>> 2.17.1
>>>
>>
>> NACK.
>>
>> As I already commented, It has never any benefit.
>> I think that it is not usful. Please drop it.
> 
> The benefit for me is clear - makes the code easier to understand.
> 
> Best regards,
> Krzysztof
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
