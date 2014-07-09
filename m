From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 5/6] pinctrl: samsung: Allow grouping multiple pinmux/pinconf
 nodes
Date: Wed, 09 Jul 2014 10:06:24 +0200
Message-ID: <53BCF800.5000106@gmail.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>	<1404315664-3174-6-git-send-email-t.figa@samsung.com> <CACRpkdYG7kc+rUHSMoiZCwDAhzWsbBze3djgiWQna0AG6oTwfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:60385 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114AbaGIIGq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 04:06:46 -0400
In-Reply-To: <CACRpkdYG7kc+rUHSMoiZCwDAhzWsbBze3djgiWQna0AG6oTwfw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>

On 09.07.2014 09:32, Linus Walleij wrote:
> On Wed, Jul 2, 2014 at 5:41 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> 
>> One of remaining limitations of current pinctrl-samsung driver was
>> the inability to parse multiple pinmux/pinconf group nodes grouped
>> inside a single device tree node. It made defining groups of pins for
>> single purpose, but with different parameters very inconvenient.
>>
>> This patch implements Tegra-like support for grouping multiple pinctrl
>> groups inside one device tree node, by completely changing the way
>> pin groups and functions are parsed from device tree. The code creating
>> pinctrl maps from DT nodes has been borrowed from pinctrl-tegra, while
>> the initial creation of groups and functions has been completely
>> rewritten with following assumptions:
>>  - each group consists of just one pin and does not depend on data
>>    from device tree,
>>  - each function is represented by a device tree child node of the
>>    pin controller, which in turn can contain multiple child nodes
>>    for pins that need to have different configuration values.
>>
>> Device Tree bindings are fully backwards compatible. New functionality
>> can be used by defining a new pinctrl group consisting of several child
>> nodes, as on following example:
>>
>>         sd4_bus8: sd4-bus-width8 {
>>                 part-1 {
>>                         samsung,pins = "gpk0-3", "gpk0-4",
>>                                         "gpk0-5", "gpk0-6";
>>                         samsung,pin-function = <3>;
>>                         samsung,pin-pud = <3>;
>>                         samsung,pin-drv = <3>;
>>                 };
>>                 part-2 {
>>                         samsung,pins = "gpk1-3", "gpk1-4",
>>                                         "gpk1-5", "gpk1-6";
>>                         samsung,pin-function = <4>;
>>                         samsung,pin-pud = <4>;
>>                         samsung,pin-drv = <3>;
>>                 };
>>         };
>>
>> Tested on Exynos4210-Trats board and a custom Exynos4212-based one.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Reviewed-by: Stephen Warren <swarren@nvidia.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
> 
> Patch applied.
> 
> (This decision is mainly based on trust, I got lost in the patch :-)

Thanks Linus.

The patch mostly transplants the way of parsing the DT of Tegra driver
into our driver, so that a logical pin group could consist from multiple
smaller groups in DT. I posted it first time as a stand alone patch long
time ago and I believe it was positively acknowledged, with some minor
comments only, which I unfortunately didn't have time to address until now.

The next step could be trying to make some code shared, although I'm not
sure how much that could be, due to the need to handle subtle
differences between both bindings in a backwards compatible way. I will
think about it.

Best regards,
Tomasz
