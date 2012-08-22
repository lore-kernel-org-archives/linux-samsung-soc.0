From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: add samsung pinctrl and gpiolib driver
Date: Wed, 22 Aug 2012 10:30:02 +0530
Message-ID: <CAJuYYwQx35bNJdNeNexGoxzenstT7GaOLa3=+6uYMMGoYrCtRQ@mail.gmail.com>
References: <1345060656-32201-1-git-send-email-thomas.abraham@linaro.org>
	<1345060656-32201-2-git-send-email-thomas.abraham@linaro.org>
	<CACRpkdYqPYesgE-YxPLZqROw1T2fsPWR6R+aDTTz2=XbP7oe9A@mail.gmail.com>
	<5033FFE0.5070209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:47597 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751422Ab2HVFAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Aug 2012 01:00:04 -0400
Received: by lbbgj3 with SMTP id gj3so417294lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Aug 2012 22:00:02 -0700 (PDT)
In-Reply-To: <5033FFE0.5070209@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, Dong Aisheng <dong.aisheng@linaro.org>

On 22 August 2012 03:08, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 08/21/2012 05:25 AM, Linus Walleij wrote:
>> On Wed, Aug 15, 2012 at 9:57 PM, Thomas Abraham
>> <thomas.abraham@linaro.org> wrote:
>>
>>> Add a new device tree enabled pinctrl and gpiolib driver for Samsung
>>> SoC's.
> ...
>>> +  The child node can also optionally specify one or more of the pin
>>> +  configuration that should be applied on all the pins listed in the
>>> +  "samsung,pins" property of the child node. The following pin configuration
>>> +  properties are supported.
>>> +
>>> +  - samsung,pin-pud: Pull up/down configuration.
>>> +  - samsung,pin-drv: Drive strength configuration.
>>> +  - samsung,pin-pud-pdn: Pull up/down configuration in power down mode.
>>> +  - samsung,pin-drv-pdn: Drive strength configuration in power down mode.
>>
>> This looks a bit scary, as it seems to be orthogonal to the pin config
>> interface. I.e. this will be programmed "behind the back" of the
>> pin config system. However as long as the pin config implementation
>> reads back these things from the registers it will work, too.
>>
>> In the U300 and Ux500 I explicitly use pin config hogs to set up
>> the pin configuration, and when we enter a state such as
>> "default" the mux setting and config settings are set from the
>> framework separately.
>
> I know that some HW has a separate set of registers (or fields) for the
> "awake" and "sleep" configuration, and the HW switches between the two
> automatically when sleeping. I have no idea if the Samsung SoCs do this,
> but I think if this were the case, it'd be quite legitimate to define
> both these HW states as separate sets of properties within a single
> pinctrl SW state. So, that might be the explanation here?
>

Hi Stephen,

Yes, Samsung SoC support the "awake" and "sleep" configuration in that
way you described.

Thanks,
Thomas.
