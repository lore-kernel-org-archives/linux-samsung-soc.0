From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: [PATCH v4 1/5] devfreq: exynos-bus: correct clock enable
 sequence
Date: Thu, 25 Jul 2019 17:07:30 +0200
Message-ID: <a7aba1d0-8e15-ae23-aff9-bf35f991ecb7@partner.samsung.com>
References: <CGME20190725144325eucas1p1463ecde90f9c93cb73d3c54c7cf3f1ff@eucas1p1.samsung.com>
        <20190725144300.25014-1-k.konieczny@partner.samsung.com>
        <20190725144300.25014-2-k.konieczny@partner.samsung.com>
        <CAGTfZH0=skWJ3Dny7voeRzDp5oRkbNO=Pf6j+PM03=epmX-86g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGTfZH0=skWJ3Dny7voeRzDp5oRkbNO=Pf6j+PM03=epmX-86g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: cwchoi00@gmail.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 25.07.2019 16:59, Chanwoo Choi wrote:
> Hi,
> 
> You are missing my Acked tag.

I changed code, so I can not add your Ack in v4.
Please send new Ack for this patch.

> 2019년 7월 25일 (목) 오후 11:44, <k.konieczny@partner.samsung.com>님이 작성:
>>
>> Regulators should be enabled before clocks to avoid h/w hang. This
>> require change in exynos_bus_probe() to move exynos_bus_parse_of()
>> after exynos_bus_parent_parse_of() and change in error handling.
>> Similar change is needed in exynos_bus_exit() where clock should be
>> disabled before regulators.
>>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
>> Changes:
>> v4:
>> - move regulator disable after clock disable
>> - remove unrelated changes
>> - add disabling regulators in error path in exynos_bus_probe()
>>
>> ---
>>  drivers/devfreq/exynos-bus.c | 31 +++++++++++++++++--------------
>>  1 file changed, 17 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
>> index 486cc5b422f1..f34fa26f00d0 100644
>> --- a/drivers/devfreq/exynos-bus.c
>> +++ b/drivers/devfreq/exynos-bus.c
>> @@ -194,11 +194,10 @@ static void exynos_bus_exit(struct device *dev)
>>         if (ret < 0)
>>                 dev_warn(dev, "failed to disable the devfreq-event devices\n");
>>
>> -       if (bus->regulator)
>> -               regulator_disable(bus->regulator);
>> -
>>         dev_pm_opp_of_remove_table(dev);
>>         clk_disable_unprepare(bus->clk);
>> +       if (bus->regulator)
>> +               regulator_disable(bus->regulator);
>>  }
>>
>>  /*
>> @@ -386,6 +385,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
>>         struct exynos_bus *bus;
>>         int ret, max_state;
>>         unsigned long min_freq, max_freq;
>> +       bool passive = false;
>>
>>         if (!np) {
>>                 dev_err(dev, "failed to find devicetree node\n");
>> @@ -399,27 +399,27 @@ static int exynos_bus_probe(struct platform_device *pdev)
>>         bus->dev = &pdev->dev;
>>         platform_set_drvdata(pdev, bus);
>>
>> -       /* Parse the device-tree to get the resource information */
>> -       ret = exynos_bus_parse_of(np, bus);
>> -       if (ret < 0)
>> -               return ret;
>> -
>>         profile = devm_kzalloc(dev, sizeof(*profile), GFP_KERNEL);
>> -       if (!profile) {
>> -               ret = -ENOMEM;
>> -               goto err;
>> -       }
>> +       if (!profile)
>> +               return -ENOMEM;
>>
>>         node = of_parse_phandle(dev->of_node, "devfreq", 0);
>>         if (node) {
>>                 of_node_put(node);
>> -               goto passive;
>> +               passive = true;
>>         } else {
>>                 ret = exynos_bus_parent_parse_of(np, bus);
>> +               if (ret < 0)
>> +                       return ret;
>>         }
>>
>> +       /* Parse the device-tree to get the resource information */
>> +       ret = exynos_bus_parse_of(np, bus);
>>         if (ret < 0)
>> -               goto err;
>> +               goto err_reg;
>> +
>> +       if (passive)
>> +               goto passive;
>>
>>         /* Initialize the struct profile and governor data for parent device */
>>         profile->polling_ms = 50;
>> @@ -510,6 +510,9 @@ static int exynos_bus_probe(struct platform_device *pdev)
>>  err:
>>         dev_pm_opp_of_remove_table(dev);
>>         clk_disable_unprepare(bus->clk);
>> +err_reg:
>> +       if (!passive)
>> +               regulator_disable(bus->regulator);
>>
>>         return ret;
>>  }
>> --
>> 2.22.0
>>
> 
> 

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
