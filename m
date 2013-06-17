From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH] Documentation: Add examples to samsung-pinctrl device
 tree bindings documentation
Date: Mon, 17 Jun 2013 17:58:54 +0530
Message-ID: <CAL1wa8ed+UKHu5-RKb_2DxNCkRCODEkqLEbwCWBwc2+NWz1zQQ@mail.gmail.com>
References: <1371465896-2762-1-git-send-email-l.krishna@samsung.com> <2164838.KETqnlhoKR@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:45430 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932641Ab3FQM3P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 08:29:15 -0400
Received: by mail-vc0-f175.google.com with SMTP id hr11so1917841vcb.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 05:29:14 -0700 (PDT)
In-Reply-To: <2164838.KETqnlhoKR@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>

Hi Tomasz,
Thanks for reviewing the patch.
Will post version 2 soon addressing your comments.

Best Wishes,
Leela Krishna.

On Mon, Jun 17, 2013 at 5:40 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Leela,
>
> On Monday 17 of June 2013 16:14:55 Leela Krishna Amudala wrote:
>> This patch adds examples to samsung-pinctrl.txt documentaion file
>> on how to make gpio binding and gpio request
>>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>> ---
>>  .../bindings/pinctrl/samsung-pinctrl.txt           |   48
>> +++++++++++++++++++- 1 file changed, 46 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>> b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt index
>> b2bc219..f1cf177 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>> @@ -25,8 +25,18 @@ Required Properties:
>>
>>    - gpio-controller: identifies the node as a gpio controller and pin bank.
>> - #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO -
>>   binding is used, the amount of cells must be specified as 2. See generic
>> -    GPIO binding documentation for description of particular cells. +
>> binding is used, the amount of cells must be specified as 2. See the below
>> +    mentioned gpio binding representation for description of particular
>> cells. +
>> +     Eg: <&gpx2 6 0>
>> +     <[phandle of the gpio controller node]
>> +     [pin number within the gpio controller]
>> +     [flags]>
>> +
>> +     Values for gpio specifier:
>> +     - Pin number: is a value between 0 to 7.
>> +     - Flags: 0 - Active High
>> +              1 - Active Low
>>
>>  - Pin mux/config groups as child nodes: The pin mux (selecting pin function
>> mode) and pin config (pull up/down, driver strength) settings are
>> represented @@ -274,3 +284,37 @@ Example 4: Set up the default pin state
>> for uart controller.
>>
>>               pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
>>       }
>> +
>> +Example 5: A display port client node that supports 'default' pinctrl state
>> +        and gpio binding.
>> +
>> +     display-port-controller {
>> +             samsung,color-space = <0>;
>> +             samsung,dynamic-range = <0>;
>> +             samsung,ycbcr-coeff = <0>;
>> +             samsung,color-depth = <1>;
>> +             samsung,link-rate = <0x06>;
>> +             samsung,lane-count = <2>;
>
> Maybe it would be better to omit those properties above for readability of the
> example? Just like you did with example 6.
>
> But generally it's a good addition to our documentation. Thanks.
>
> Best regards,
> Tomasz
>
>> +             samsung,hpd-gpio = <&gpx2 6 0>;
>> +             pinctrl-names = "default";
>> +             pinctrl-0 = <&dp_hpd>;
>> +     };
>> +
>> +Example 6: Request the gpio for display port controller
>> +
>> +     static int exynos_dp_probe(struct platform_device *pdev)
>> +     {
>> +             int hpd_gpio, ret;
>> +             struct device *dev = &pdev->dev;
>> +             struct device_node *dp_node = dev->of_node;
>> +
>> +             /* ... */
>> +
>> +             hpd_gpio = of_get_named_gpio(dp_node, "samsung,hpd-gpio", 0);
>> +
>> +             /* ... */
>> +
>> +             ret = devm_gpio_request_one(&pdev->dev, hpd_gpio, GPIOF_IN,
>> +                                         "hpd_gpio");
>> +             /* ... */
>> +     }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
