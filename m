From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/4] clk: samsung: Add driver to control CLKOUT line on
 Exynos SoCs
Date: Thu, 22 May 2014 14:10:46 +0200
Message-ID: <537DE946.9090303@samsung.com>
References: <1400604211-9447-1-git-send-email-t.figa@samsung.com>
 <1400604211-9447-4-git-send-email-t.figa@samsung.com>
 <537D8788.8030904@linaro.org> <537DD2C0.4060802@samsung.com>
 <CAHbNUh2gkpV-rt6S+-bUmFvYAuK_HNoXfyOStwYe29sZMJonUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAHbNUh2gkpV-rt6S+-bUmFvYAuK_HNoXfyOStwYe29sZMJonUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 22/05/14 13:44, Tushar Behera wrote:
> On 22 May 2014 16:04, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> On 22.05.2014 07:13, Tushar Behera wrote:
>>> On 05/20/2014 10:13 PM, Tomasz Figa wrote:
>>>> This patch introduces a driver that handles configuration of CLKOUT pin
>>>> of Exynos SoCs that can be used to output certain clocks from inside of
>>>> the SoC to a dedicated output pin.
>>>>
>>>> Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/arm/samsung/pmu.txt        |  30 ++++
>>>>  drivers/clk/samsung/Makefile                       |   1 +
>>>>  drivers/clk/samsung/clk-exynos-clkout.c            | 153 +++++++++++++++++++++
>>>>  3 files changed, 184 insertions(+)
>>>>  create mode 100644 drivers/clk/samsung/clk-exynos-clkout.c
>>>>
>>>
>>> [ ... ]
>>>
>>>> +    clkout->clk_table[0] = clk_register_composite(NULL, "clkout",
>>>> +                            parent_names, parent_count, &clkout->mux.hw,
>>>> +                            &clk_mux_ops, NULL, NULL, &clkout->gate.hw,
>>>> +                            &clk_gate_ops, CLK_SET_RATE_PARENT
>>>> +                            | CLK_SET_RATE_NO_REPARENT);
>>>
>>> Would you please remove CLK_SET_RATE_NO_REPARENT flag from here? Let me
>>> know if you have reservations against this.
>>
>> The problem with clock reparenting is that there are certain parent
>> clocks of CLKOUT, rate of which changes at runtime, e.g. clocks derived
>> from APLL or bus clocks, which can be reconfigured by cpufreq or devfreq.
>>
> 
> +CC: Sylwester Nawrocki
> 
> Okay. But in cases where there is only 1 valid parent clock provided
> through DT (at the moment for Exynos5250/Exynos5420), would it be safe
> to set that clock as the parent of CLKOUT? Otherwise, this clock is
> not usable ATM.

I'd prefer to not allow re-parenting here, as it will not work in all system
configurations and seems not reliable in general.

>>> With RFC patches, I am able to do a clk_set_rate() on this clock to
>>> get a 24MHz output to the codec clock. With this flag set, I again have
>>> to rely on the default value set to this register in bootloader.
>>>
>>
>> This problem should be handled by initializing clocks from DT. I'm not
>> sure why it hasn't been implemented yet...
> 
> I would be happy to get it done that way. I can see a patch from
> Sylwester regarding this, but there hasn't been a conclusion as of
> yet.
> 
> https://lkml.org/lkml/2014/4/9/173

I posted a next version recently [1], any feedback on that is welcome.
I used these patches for the camera on Trats2 and the audio on Odroid U3
clocks configuration.

[1] http://www.spinics.net/lists/devicetree/msg34718.html

--
Thanks,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
