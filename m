From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: add Silicon Image SiI9234 driver
Date: Mon, 11 Sep 2017 17:19:05 +0200
Message-ID: <CAJKOXPe1ufJngR037jH_c1=jvAQtHtDW1WBDrertxkRJShrA9A@mail.gmail.com>
References: <1504620099-20024-1-git-send-email-m.purski@samsung.com>
 <CGME20170905140209eucas1p1ee010819751b86ad8a41e5847c115e01@eucas1p1.samsung.com>
 <1504620099-20024-2-git-send-email-m.purski@samsung.com> <20170908170529.po5v6wuus4llwdan@kozik-lap>
 <a7c84f2c-855f-0e65-d794-d9a3331a6516@samsung.com> <CAJKOXPcfOUGDYL0BEa2-XZkpnoOGb4QRvEyWFwbgRxjAXD0Rng@mail.gmail.com>
 <626dfd33-a824-c480-16eb-bf677dcb3d26@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <626dfd33-a824-c480-16eb-bf677dcb3d26-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Sep 11, 2017 at 3:39 PM, Marek Szyprowski
<m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi Krzysztof,
>
>
> On 2017-09-11 15:18, Krzysztof Kozlowski wrote:
>>
>> On Mon, Sep 11, 2017 at 1:42 PM, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> wrote:
>>>>>
>>>>> +       ctx->client[I2C_MHL] = client;
>>>>> +
>>>>> +       ctx->client[I2C_TPI] = i2c_new_dummy(adapter, I2C_TPI_ADDR);
>>>>> +       if (!ctx->client[I2C_TPI]) {
>>>>> +               dev_err(ctx->dev, "failed to create TPI client\n");
>>>>> +               return -ENODEV;
>>>>> +       }
>>>>> +
>>>>> +       ctx->client[I2C_HDMI] = i2c_new_dummy(adapter, I2C_HDMI_ADDR);
>>>>> +       if (!ctx->client[I2C_HDMI]) {
>>>>> +               dev_err(ctx->dev, "failed to create HDMI RX client\n");
>>>>> +               goto fail_tpi;
>>>>> +       }
>>>>> +
>>>>> +       ctx->client[I2C_CBUS] = i2c_new_dummy(adapter, I2C_CBUS_ADDR);
>>>>> +       if (!ctx->client[I2C_CBUS]) {
>>>>> +               dev_err(ctx->dev, "failed to create CBUS client\n");
>>>>> +               goto fail_hdmi;
>>>>> +       }
>>>>
>>>> You are using i2c_smbus_* calls. Why not converting to regmap_i2c? It is
>>>> preferred interface.
>>>
>>>
>>> According to my search, there are only 5 drivers, which use regmap_i2c
>>> and
>>> none of them in drm. If you think that it is really needed, could you
>>> please
>>> explain
>>> why?
>>
>> There are slightly more than five drivers:
>>
>> $ git grep regmap_init_i2c | wc -l
>> 352
>>
>> ... and even more using regmap interface in generic (not i2c).
>>
>> I think this is really wanted because for free you get:
>> 1. locking,
>> 2. proper locking - with lockdep and nested mutexes :),
>> 3. caching of accesses,
>> 4. handling of endianness,
>> 5. optionally a trivial way of handling interrupts (regmap_irq_chip),
>>
>> Also this brings unified interface for most of the drivers regardless
>> of protocol used beneath (I2C, SPI and even MMIO but for simple cases
>> MMIO might not have much sense). This last argument actually brings
>> the most benefit for me because it abstracts driver from trivial I2C
>> implementation and it could allow even easy code-reuse for e.g. SPI
>> version.
>
>
> Regmap make sense for multi-function chips, which require more than one
> client driver (so proper locking is important). It also makes sense if
> the chip is produced in more than one flavor (like i2c, spi, MMIO, etc).
>
> None of the above takes place in this case... So in case of this driver
> using regmap is IMHO an over-engineering.

Good points and true that setting up regmap requires some more code
around probe. However it will remove half or even more of your
interrupt handler. Less driver specific code, more generic code used.
Also current code around I2C (sii9234_writeb() etc) is not thread
safe... which for now is not a problem as the only entrance point is
the interrupt. Maybe it's fine then to use existing implementation
especially if you do not see any future enhancements to the driver.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
