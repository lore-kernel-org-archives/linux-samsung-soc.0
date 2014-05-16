From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RFC 3/4] clk: samsung: Add driver to control CLKOUT line on
 Exynos SoCs
Date: Fri, 16 May 2014 16:58:36 +0200
Message-ID: <5376279C.4070006@samsung.com>
References: <1400175151-27779-1-git-send-email-t.figa@samsung.com>
 <1400175151-27779-4-git-send-email-t.figa@samsung.com>
 <CAPdUM4P7Z1eLVKuc0N1iPaekM_7kNv7KCve2MgrEziszfnzz7A@mail.gmail.com>
 <5375EDFD.1020708@samsung.com>
 <CAPdUM4O4RKFZFR_tcwG4pd7E6KMkneG9R_VbZPt+m4fGG_UFVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAPdUM4O4RKFZFR_tcwG4pd7E6KMkneG9R_VbZPt+m4fGG_UFVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 16.05.2014 16:35, Rahul Sharma wrote:
> On 16 May 2014 16:22, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Hi Rahul,
>>
>> On 16.05.2014 12:39, Rahul Sharma wrote:
>>> [snip]
>>>> +       gate->lock = &clkout_lock;
>>>> +
>>>> +       mux->reg = reg + EXYNOS_PMU_DEBUG_REG;
>>>> +       mux->mask = EXYNOS_CLKOUT_MUX_MASK;
>>>> +       mux->shift = EXYNOS_CLKOUT_MUX_SHIFT;
>>>> +       mux->lock = &clkout_lock;
>>>> +
>>>> +       clk = clk_register_composite(NULL, "clkout", parent_names,
>>>> +                                       parent_count, &mux->hw,
>>>> +                                       &clk_mux_ops, NULL, NULL, &gate->hw,
>>>> +                                       &clk_gate_ops, 0);
>>>> +       if (IS_ERR(clk))
>>>> +               goto err_unmap;
>>>> +
>>>
>>> Hi Tomasz,
>>>
>>> Do we really need a composite clock here? How about registering
>>> a mux and a gate separately?
>>
>> What's wrong with a composite clock? It simplifies the code as just a
>> single clock needs to be registered. I don't see any drawbacks compared
>> to registering two clocks separately.
>>
> 
> I always took it as a thumb rule to not to use composite clocks if you
> can easily represent the block using basic clocks structures.
> 
> There can be a problem when drivers using such clocks assume that such
> clock continue to offer composite functionality for all futures SoCs and
> write code around it. This is what we faced when fixing drivers during
> CCF migration.

The drivers using CLKOUT need to be designed this way, because they are
not Exynos-specific, such as drivers for HSIC hubs or audio codecs. They
can't have any Exynos-specific knowledge about clock hierarchy.

So regardless of whether this is implemented using the composite clock
or not, consumer device drivers need to be able to use just a single
clock to do whatever they need, e.g. gating or rate configuration.

However I can see one problem here with my implementation - it is
missing the CLK_SET_RATE_PARENT flag, so dividers of particular CLK_OUTs
from CMU blocks could be reconfigured.

Also the driver is missing save and restore of PMU_DEBUG register.

I will fix both in next version.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
