From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC PATCH 01/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init()
Date: Fri, 26 Jul 2019 19:52:30 +0900
Message-ID: <ea48649f-736e-4d76-e1f5-47731fb44a74@samsung.com>
References: <CGME20190723122022eucas1p1266d90873d564894bd852c20140f8474@eucas1p1.samsung.com>
        <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <20190723122016.30279-2-a.swigon@partner.samsung.com>
        <CAGTfZH0JE0PmiCHaT3vMrDaP0-8eZ3afyHy_zT9aFmMOGNTR8g@mail.gmail.com>
        <CAJKOXPe4nOjjuA2MXLP1n=dPa7o6egjLZScSBNhyi9agHqqM7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPe4nOjjuA2MXLP1n=dPa7o6egjLZScSBNhyi9agHqqM7A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, cwchoi00@gmail.com
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, georgi.djakov@linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 19. 7. 26. 오후 7:42, Krzysztof Kozlowski wrote:
> On Thu, 25 Jul 2019 at 14:44, Chanwoo Choi <cwchoi00@gmail.com> wrote:
>>
>> 2019년 7월 24일 (수) 오전 8:09, Artur Świgoń <a.swigon@partner.samsung.com>님이 작성:
>>>
>>> This patch adds a new static function, exynos_bus_profile_init(), extracted
>>> from exynos_bus_probe().
>>>
>>> Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
>>> ---
>>>  drivers/devfreq/exynos-bus.c | 106 ++++++++++++++++++++---------------
>>>  1 file changed, 60 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
>>> index d9f377912c10..d8f1efaf2d49 100644
>>> --- a/drivers/devfreq/exynos-bus.c
>>> +++ b/drivers/devfreq/exynos-bus.c
>>> @@ -372,12 +372,69 @@ static int exynos_bus_parse_of(struct device_node *np,
>>>         return ret;
>>>  }
>>>
>>> +static int exynos_bus_profile_init(struct exynos_bus *bus,
>>> +                                  struct devfreq_dev_profile *profile)
>>> +{
>>> +       struct device *dev = bus->dev;
>>> +       struct devfreq_simple_ondemand_data *ondemand_data;
>>> +       int ret;
>>> +
>>> +       /* Initialize the struct profile and governor data for parent device */
>>> +       profile->polling_ms = 50;
>>> +       profile->target = exynos_bus_target;
>>> +       profile->get_dev_status = exynos_bus_get_dev_status;
>>> +       profile->exit = exynos_bus_exit;
>>> +
>>> +       ondemand_data = devm_kzalloc(dev, sizeof(*ondemand_data), GFP_KERNEL);
>>> +       if (!ondemand_data) {
>>> +               ret = -ENOMEM;
>>> +               goto err;
>>> +       }
>>> +       ondemand_data->upthreshold = 40;
>>> +       ondemand_data->downdifferential = 5;
>>> +
>>> +       /* Add devfreq device to monitor and handle the exynos bus */
>>> +       bus->devfreq = devm_devfreq_add_device(dev, profile,
>>> +                                               DEVFREQ_GOV_SIMPLE_ONDEMAND,
>>> +                                               ondemand_data);
>>> +       if (IS_ERR(bus->devfreq)) {
>>> +               dev_err(dev, "failed to add devfreq device\n");
>>> +               ret = PTR_ERR(bus->devfreq);
>>> +               goto err;
>>> +       }
>>> +
>>> +       /* Register opp_notifier to catch the change of OPP  */
>>> +       ret = devm_devfreq_register_opp_notifier(dev, bus->devfreq);
>>> +       if (ret < 0) {
>>> +               dev_err(dev, "failed to register opp notifier\n");
>>> +               goto err;
>>> +       }
>>> +
>>> +       /*
>>> +        * Enable devfreq-event to get raw data which is used to determine
>>> +        * current bus load.
>>> +        */
>>> +       ret = exynos_bus_enable_edev(bus);
>>> +       if (ret < 0) {
>>> +               dev_err(dev, "failed to enable devfreq-event devices\n");
>>> +               goto err;
>>> +       }
>>> +
>>> +       ret = exynos_bus_set_event(bus);
>>> +       if (ret < 0) {
>>> +               dev_err(dev, "failed to set event to devfreq-event devices\n");
>>> +               goto err;
>>> +       }
>>> +
>>> +err:
>>> +       return ret;
>>> +}
>>> +
>>>  static int exynos_bus_probe(struct platform_device *pdev)
>>>  {
>>>         struct device *dev = &pdev->dev;
>>>         struct device_node *np = dev->of_node, *node;
>>>         struct devfreq_dev_profile *profile;
>>> -       struct devfreq_simple_ondemand_data *ondemand_data;
>>>         struct devfreq_passive_data *passive_data;
>>>         struct devfreq *parent_devfreq;
>>>         struct exynos_bus *bus;
>>> @@ -418,52 +475,9 @@ static int exynos_bus_probe(struct platform_device *pdev)
>>>         if (ret < 0)
>>>                 goto err;
>>>
>>> -       /* Initialize the struct profile and governor data for parent device */
>>> -       profile->polling_ms = 50;
>>> -       profile->target = exynos_bus_target;
>>> -       profile->get_dev_status = exynos_bus_get_dev_status;
>>> -       profile->exit = exynos_bus_exit;
>>> -
>>> -       ondemand_data = devm_kzalloc(dev, sizeof(*ondemand_data), GFP_KERNEL);
>>> -       if (!ondemand_data) {
>>> -               ret = -ENOMEM;
>>> +       ret = exynos_bus_profile_init(bus, profile);
>>> +       if (ret < 0)
>>>                 goto err;
>>> -       }
>>> -       ondemand_data->upthreshold = 40;
>>> -       ondemand_data->downdifferential = 5;
>>> -
>>> -       /* Add devfreq device to monitor and handle the exynos bus */
>>> -       bus->devfreq = devm_devfreq_add_device(dev, profile,
>>> -                                               DEVFREQ_GOV_SIMPLE_ONDEMAND,
>>> -                                               ondemand_data);
>>> -       if (IS_ERR(bus->devfreq)) {
>>> -               dev_err(dev, "failed to add devfreq device\n");
>>> -               ret = PTR_ERR(bus->devfreq);
>>> -               goto err;
>>> -       }
>>> -
>>> -       /* Register opp_notifier to catch the change of OPP  */
>>> -       ret = devm_devfreq_register_opp_notifier(dev, bus->devfreq);
>>> -       if (ret < 0) {
>>> -               dev_err(dev, "failed to register opp notifier\n");
>>> -               goto err;
>>> -       }
>>> -
>>> -       /*
>>> -        * Enable devfreq-event to get raw data which is used to determine
>>> -        * current bus load.
>>> -        */
>>> -       ret = exynos_bus_enable_edev(bus);
>>> -       if (ret < 0) {
>>> -               dev_err(dev, "failed to enable devfreq-event devices\n");
>>> -               goto err;
>>> -       }
>>> -
>>> -       ret = exynos_bus_set_event(bus);
>>> -       if (ret < 0) {
>>> -               dev_err(dev, "failed to set event to devfreq-event devices\n");
>>> -               goto err;
>>> -       }
>>>
>>>         goto out;
>>>  passive:
>>> --
>>> 2.17.1
>>>
>>
>> NACK.
>>
>> It has not any benefit and I don't understand reason why it is necessary.
>> I don't agree. Please drop it.
> 
> The probe has 12 local variables and around 140 lines of code (so much
> more than coding style recommendations). Therefore splitting some
> logical part out of probe to make code better organized and more
> readable is pretty obvious benefit.

After checked the patch3, I changed my opinion. It seems more simple than before
and I replied on patch3. But, I think that can merge patch1/2/2 to one patch.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
