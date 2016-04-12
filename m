From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v6] drivers: amba: properly handle devices with power domains
Date: Tue, 12 Apr 2016 16:49:11 +0200
Message-ID: <CAPDyKFqhaLUzzVtSosRQgd1p=QquwHpXEkV9BdgHrBs1nLiLMw@mail.gmail.com>
References: <570D017E.7060105@samsung.com>
	<1460470193-24928-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:32890 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756556AbcDLOtN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Apr 2016 10:49:13 -0400
Received: by mail-wm0-f48.google.com with SMTP id f198so191009293wme.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Apr 2016 07:49:12 -0700 (PDT)
In-Reply-To: <1460470193-24928-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

[...]

>
> +static int __init amba_deferred_device_init(void)
> +{
> +       struct deferred_device *ddev, *tmp;
> +
> +       list_for_each_entry_safe(ddev, tmp, &deferred_devices, node) {
> +               int ret = amba_device_try_add(ddev->dev, ddev->parent);
> +
> +               if (ret == -EPROBE_DEFER)
> +                       continue;

What happens with devices that still fails to be added here? Should we
schedule a periodic work to re-try?

> +
> +               list_del_init(&ddev->node);
> +               kfree(ddev);
> +       }
> +
> +       return 0;
> +}
> +late_initcall(amba_deferred_device_init);
> +
>  static struct amba_device *
>  amba_aphb_device_add(struct device *parent, const char *name,
>                      resource_size_t base, size_t size, int irq1, int irq2,
> --
> 1.9.2
>

I assume there are other similar buses like AMBA that needs
enumeration before it can bind an appropriate driver for its device.

Perhaps that's a good reason to make this new "device add re-try"
mechanism a generic thing supported by the driver core?

Kind regards
Uffe
