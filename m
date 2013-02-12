From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c-core: dt: Pick i2c bus number from i2c alias
 if present
Date: Mon, 11 Feb 2013 16:48:40 -0800
Message-ID: <CAD=FV=V89FQPsZ46NF4v2--9dLLT6q4r=msqKbwNhZ57NXpVYA@mail.gmail.com>
References: <1357927027-4857-2-git-send-email-dianders@chromium.org>
	<1358189602-24180-1-git-send-email-dianders@chromium.org>
	<1358189602-24180-2-git-send-email-dianders@chromium.org>
	<20130210121901.GA15546@nekote.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130210121901.GA15546-8EAEigeeuNG034pCzgS/Qg7AFbiQbgqx@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Wolfram,

Thanks for the review.  New patch was just sent.  :)

On Sun, Feb 10, 2013 at 4:19 AM, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> +static int i2c_get_number_from_dt(struct i2c_adapter *adap)
>
> i2c_get_id_from_dt()?

Done.


>> +     if (!dev->of_node)
>> +             return -1;
>
> -ESOMETHING?

Function has been removed, as per below.


>> +
>> +     id = of_alias_get_id(dev->of_node, "i2c");
>> +     if (id < 0)
>> +             return -1;
>> +     return id;
>
> Simply 'return of_alias_get_id(...)'? Even more, since this function
> boils down to calling of_alias_get_id only and is only used once, I'd
> think we can implement that directly and drop this function. That
> shouldn't hurt readability.

Good point.  Done.

>> +/**
>> + * _i2c_add_numbered_adapter - i2c_add_numbered_adapter where nr is never -1
>> + * @adap: the adapter to register (with adap->nr initialized)
>> + * Context: can sleep
>> + *
>> + * See i2c_add_numbered_adapter() for details.
>> + */
>> +static int _i2c_add_numbered_adapter(struct i2c_adapter *adap)
>
> All other internal functions are prefixed with '__'.

Done.


>> +{
>> +     int     id;
>> +     int     status;
>> +
>> +     /* Handled by wrappers */
>> +     BUG_ON(adap->nr == -1);
>
> Is that a reason to halt the kernel? WARN and bailing out would do IMO.

Done.


>> +
>> +     if (adap->nr & ~MAX_IDR_MASK)
>> +             return -EINVAL;
>
> Note the idr-cleanup series from Tejun Heo. Given that his series is
> scheduled for v3.9, I'd like to have your patches on top of his.

Done.
