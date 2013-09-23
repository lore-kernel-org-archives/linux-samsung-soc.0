From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] clk: exynos-audss: convert to platform device
Date: Tue, 24 Sep 2013 00:50:29 +0200
Message-ID: <5240C5B5.4090702@gmail.com>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org> <1530327.jvk44KuFQA@flatron> <CAL1qeaGjUTrfDaAr1rgsgDaZscjaV7tqi3Jd_-zo2sMtCCFSAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaGjUTrfDaAr1rgsgDaZscjaV7tqi3Jd_-zo2sMtCCFSAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Yadwinder Singh Brar <yadi.brar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rahul Sharma <rahul.sharma@samsung.>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 09/23/2013 11:25 PM, Andrew Bresticker wrote:
>>> +static int exynos_audss_clk_remove(struct platform_device *pdev)
>>> +{
>>> +     of_clk_del_provider(pdev->dev.of_node);
>>> +
>>> +     return 0;
>>>   }
>>
>> Don't we need to unregister all the registered clocks in remove? This also
>> leads to another question: Do we even need removal support for this
>> driver?
>
> Agreed - I don't think we should support removal of this device, but
> it looks like __device_release_driver() just ignores the lack of a
> remove callback or the return value from remove.  I suppose we could
> just yell that removal is not supported if it is ever attempted.

That might be a good idea, without proper remove() method deferred
probing will also not work. I'd assume there should be only, e.g.
WARN() in the remove() callback or it should be properly implemented,
with clk_unregister() call for each currently registered clock.

Note that clk_unregister() is currently not implemented and removal
of this driver cannot be properly supported at the moment anyway.

Not sure what's more appropriate, it's probably better to add
clk_unregister() calls. This would be effectively a dead code though,
as long as core_initcall is used.

>>> +static int __init exynos_audss_clk_init(void)
>>> +{
>>> +     return platform_driver_register(&exynos_audss_clk_driver);
>>> +}
>>> +core_initcall(exynos_audss_clk_init);
>>
>> Does it need to be core_initcall? Drivers depending on clocks provided by
>> this driver should be able to defer probing if they are probed before this
>> driver.
>
> Unfortunately there are a couple of issues with making this a module_initcall:
>      1. On the Exynos5420, the AudioSS block provides the apb_pclk gate
> for the ADMA bus, which is probed at postcore_initcall time and does
> not support deferred probing, and
>      2. the common clock framework doesn't differentiate between the
> clock not being specified at all and the clock being specified, but
> the provider not being registered yet (i.e. the case where probe
> deferral would be appropriate) - it just returns ENOENT in both cases.

AFAICS this shouldn't be difficult to improve. I guess it has not been
properly addressed so far because there is currently no properly working
modular clock provider drivers, using the common clock framework, yet.
Unless someone bits me to it, I might have a look at that, as I also found
it a bit it inconvenient.

--
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
