From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: add Silicon Image SiI9234 driver
Date: Mon, 11 Sep 2017 15:18:52 +0200
Message-ID: <CAJKOXPcfOUGDYL0BEa2-XZkpnoOGb4QRvEyWFwbgRxjAXD0Rng@mail.gmail.com>
References: <1504620099-20024-1-git-send-email-m.purski@samsung.com>
 <CGME20170905140209eucas1p1ee010819751b86ad8a41e5847c115e01@eucas1p1.samsung.com>
 <1504620099-20024-2-git-send-email-m.purski@samsung.com> <20170908170529.po5v6wuus4llwdan@kozik-lap>
 <a7c84f2c-855f-0e65-d794-d9a3331a6516@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a7c84f2c-855f-0e65-d794-d9a3331a6516-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Sep 11, 2017 at 1:42 PM, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> +       ctx->client[I2C_MHL] = client;
>>> +
>>> +       ctx->client[I2C_TPI] = i2c_new_dummy(adapter, I2C_TPI_ADDR);
>>> +       if (!ctx->client[I2C_TPI]) {
>>> +               dev_err(ctx->dev, "failed to create TPI client\n");
>>> +               return -ENODEV;
>>> +       }
>>> +
>>> +       ctx->client[I2C_HDMI] = i2c_new_dummy(adapter, I2C_HDMI_ADDR);
>>> +       if (!ctx->client[I2C_HDMI]) {
>>> +               dev_err(ctx->dev, "failed to create HDMI RX client\n");
>>> +               goto fail_tpi;
>>> +       }
>>> +
>>> +       ctx->client[I2C_CBUS] = i2c_new_dummy(adapter, I2C_CBUS_ADDR);
>>> +       if (!ctx->client[I2C_CBUS]) {
>>> +               dev_err(ctx->dev, "failed to create CBUS client\n");
>>> +               goto fail_hdmi;
>>> +       }
>>
>> You are using i2c_smbus_* calls. Why not converting to regmap_i2c? It is
>> preferred interface.
>
>
> According to my search, there are only 5 drivers, which use regmap_i2c and
> none of them in drm. If you think that it is really needed, could you please
> explain
> why?

There are slightly more than five drivers:

$ git grep regmap_init_i2c | wc -l
352

... and even more using regmap interface in generic (not i2c).

I think this is really wanted because for free you get:
1. locking,
2. proper locking - with lockdep and nested mutexes :),
3. caching of accesses,
4. handling of endianness,
5. optionally a trivial way of handling interrupts (regmap_irq_chip),

Also this brings unified interface for most of the drivers regardless
of protocol used beneath (I2C, SPI and even MMIO but for simple cases
MMIO might not have much sense). This last argument actually brings
the most benefit for me because it abstracts driver from trivial I2C
implementation and it could allow even easy code-reuse for e.g. SPI
version.


>>
>>> +
>>> +       return 0;
>>> +
>>> +fail_hdmi:
>>> +       i2c_unregister_device(ctx->client[I2C_HDMI]);
>>> +fail_tpi:
>>> +       i2c_unregister_device(ctx->client[I2C_TPI]);
>>> +
>>> +       return -ENODEV;
>>> +}
>>> +
>>> +static void sii9234_deinit_resources(struct sii9234 *ctx)
>>> +{
>>> +       i2c_unregister_device(ctx->client[I2C_CBUS]);
>>> +       i2c_unregister_device(ctx->client[I2C_HDMI]);
>>> +       i2c_unregister_device(ctx->client[I2C_TPI]);
>>> +}
>>> +
>>> +static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge
>>> *bridge)
>>> +{
>>> +       return container_of(bridge, struct sii9234, bridge);
>>> +}
>>> +
>>> +static enum drm_mode_status sii9234_mode_valid(struct drm_bridge
>>> *bridge,
>>> +                                       const struct drm_display_mode
>>> *mode)
>>> +{
>>> +       if (mode->clock > MHL1_MAX_CLK)
>>> +               return MODE_CLOCK_HIGH;
>>> +
>>> +       return MODE_OK;
>>> +}
>>> +
>>> +static const struct drm_bridge_funcs sii9234_bridge_funcs = {
>>> +       .mode_valid = sii9234_mode_valid,
>>> +};
>>> +
>>> +static int sii9234_probe(struct i2c_client *client,
>>> +                                             const struct i2c_device_id
>>> *id)
>>> +{
>>> +       struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
>>> +       struct sii9234 *ctx;
>>> +       struct device *dev = &client->dev;
>>> +       int ret;
>>> +
>>> +       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>> +       if (!ctx)
>>> +               return -ENOMEM;
>>> +
>>> +       ctx->dev = dev;
>>> +       mutex_init(&ctx->lock);
>>> +
>>> +       if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
>>> {
>>> +               dev_err(dev, "I2C adapter lacks SMBUS feature\n");
>>> +               return -EIO;
>>> +       }
>>> +
>>> +       if (!client->irq) {
>>> +               dev_err(dev, "no irq provided\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
>>> +       ret = devm_request_threaded_irq(dev, client->irq, NULL,
>>> +                                       sii9234_irq_thread,
>>> +                                       IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>>> +                                       "sii9234", ctx);
>>> +       if (ret < 0) {
>>> +               dev_err(dev, "failed to install IRQ handler\n");
>>> +               return ret;
>>> +       }
>>
>> You are setting up interrupts before initialization of I2C. Can the
>> interrupt happen in this short window?
>
>
> It can't happen, because in the previous line there is a status flag set to
> IRQ_NOAUTOEN. IRQs are enabled in sii9234_cable_in() function which is
> called after initialization of I2C.

Ah, okay, I missed that. Thanks!

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
