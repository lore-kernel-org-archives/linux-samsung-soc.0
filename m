Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899DAC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 May 2022 08:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389825AbiEFIOC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 May 2022 04:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389826AbiEFIN5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 May 2022 04:13:57 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE0967D19;
        Fri,  6 May 2022 01:10:13 -0700 (PDT)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N8ojI-1nqXY51jgU-015v1Q; Fri, 06 May 2022 10:10:11 +0200
Received: by mail-wr1-f49.google.com with SMTP id d5so8963947wrb.6;
        Fri, 06 May 2022 01:10:11 -0700 (PDT)
X-Gm-Message-State: AOAM532UVvxjRAmaeokODx3XeoykF4BfKAqEGQ6UyhdCDQWFJnx7SJzJ
        kEGwCWc5N++GZ4Rz5m/L9tcR85iqSWo1BZhJeuQ=
X-Google-Smtp-Source: ABdhPJwDQvOXPjSlN7skIa381NhchVwgH8Yl45OAiXGcPLWTFXHTr8DbsSUxsHtsk8T8LQ8/sqwqDN289pNPOOzF2oo=
X-Received: by 2002:adf:e106:0:b0:20a:b31b:213d with SMTP id
 t6-20020adfe106000000b0020ab31b213dmr1568918wrz.219.1651823522731; Fri, 06
 May 2022 00:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220506063340epcas2p4c9d88670f9be952f3637e3a545a7d1da@epcas2p4.samsung.com>
 <1651818679-10594-1-git-send-email-dh10.jung@samsung.com> <1651818679-10594-7-git-send-email-dh10.jung@samsung.com>
In-Reply-To: <1651818679-10594-7-git-send-email-dh10.jung@samsung.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 6 May 2022 09:51:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a22wWExGymOC__KxgMLsh4AMdnRRKUdgD=qqmj6JQZ1KA@mail.gmail.com>
Message-ID: <CAK8P3a22wWExGymOC__KxgMLsh4AMdnRRKUdgD=qqmj6JQZ1KA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 6/6] usb: dwc3: dwc3-exynos: add host init
To:     Daehwan Jung <dh10.jung@samsung.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Juergen Gross <jgross@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>, sc.suh@samsung.com,
        taehyun cho <taehyun.cho@samsung.com>, jh0801.jung@samsung.com,
        eomji.oh@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dZjcVOg+BgbLysg5IGWujHyvm3v/K4wGkm7+Kt5VV1UcZ2J7c/c
 rXbV5cCegKSkmoH9seMliw6kpzSwKzWW9+dqr09Ywzq2sk+96NRvtgcvL5MQ5Mx4dQOYXQt
 e512+3cauEcCXiNHHf5sCxs7x9e87+FCJvn5vRr4EvP+XK27a35mMFiQ8MhPHd3y+s3YkVT
 cND82ooMhvT+GsfrCZBAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bXgJboYL97I=:+TykByUuV5DUSIIUzgQK1m
 I9W5tS497m8wQ0uyIe7L4EcD+TKK9lT8wNi27fZIiTBLVPaT1t3St7+BksvAzsQG21ZBBFmGH
 nLubK2Tv+MRxxF6O4AFVrGIg5HW+F4UTUnk15UmXiHnlNpKgbfem4kw0q7u50c+Pi1aWGrFFO
 eF1iK+uzd05qiPi/S0YNcP88jaKRZ7eldBumznSvu/wMKJwdlOq+hzxaKJMQDOy/sWiknqVNe
 MPSvpkuB+IcLPnOFuV9LUCz+lgl4AU9xF7hVgq6VnOOa6qZCfXqNt1/VCSXg7ZUxDiVNjcOW4
 3646oSKt7IXsbjiM6tDUEy2/BuDTMvDEQQKlXtmpu9bFW6JN6WOo4DfsBTnPHJmICGw0ruuCY
 BZ8aRrpbqUJHSAGMbDWCat5wuLK1r9KSB8S1J6m771DHJFo81QmIgz+LzglM9zVa8iKfTXsGj
 AnIncxeWk3UmOXw6izSyOwLaCk8f6ZiJC10dCmb731fFMcIO+5s5eNv2UxCi5rWJnUithvFKx
 YWKg1ZmPn1qDMOT4N61IAvri56N+d1VbYWfOH2tJXju6FsZL1NVrtQ1KLkVpuweIW9BLAxG+e
 hNOx2PG6pSwqa3b0Ps8AkkeY7opyB/FvvnsR1trAq1cvxizwrTiE7RV7g46VRosqt19hYmoOv
 o6mVdZmSs1z1oxrc6tOLLGMJM9J11x4VvxPGuQxyw2XKt6Rj4cin25i5fu4jPrbK1CsSvcbrb
 AyH7pTIWD5aC4m/MjO+xNNNWvwT95500B30t3NAmlw5fzSMsjlRr3W/khYhkR1kjzdseaNz7c
 /zbyPw2zRVHWuwtVwRhaHgSq43A+A2qukSzp6Uecx9L5fla6qE=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, May 6, 2022 at 8:31 AM Daehwan Jung <dh10.jung@samsung.com> wrote:
>
> This is for xHCI Host Controller driver on Exynos SOC.
> It registers vendor ops before loading xhci platform driver.
>
> Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
> ---
>  drivers/usb/dwc3/dwc3-exynos.c | 100 ++++++++++++++++++++++++++++++++-
>  1 file changed, 99 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index 0ecf20eeceee..c22ea5cd6ab0 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -17,6 +17,12 @@
>  #include <linux/of_platform.h>
>  #include <linux/regulator/consumer.h>
>
> +#include "core.h"
> +
> +#if IS_ENABLED(CONFIG_USB_XHCI_EXYNOS)
> +int xhci_exynos_register_vendor_ops(void);
> +#endif

Function declarations should always be in a header file, and not guarded
by an #ifdef. This particular one is probably not needed anyway if the
driver is done correctly though, see below.

> @@ -46,12 +53,81 @@ static int dwc3_exynos_remove_child(struct device *dev, void *unused)
>         return 0;
>  }
>
> +#if IS_ENABLED(CONFIG_USB_XHCI_EXYNOS)
> +static int dwc3_exynos_host_init(struct dwc3_exynos *exynos)
> +{
> +       struct dwc3             *dwc = exynos->dwc;
> +       struct device           *dev = exynos->dev;
> +       struct platform_device  *xhci;
> +       struct resource         *res;
> +       struct platform_device  *dwc3_pdev = to_platform_device(dwc->dev);
> +       int                     ret = 0;
> +
> +       /* Configuration xhci resources */
> +       xhci_exynos_register_vendor_ops();
> +
> +       res = platform_get_resource(dwc3_pdev, IORESOURCE_MEM, 0);
> +       if (!res) {
> +               dev_err(dev, "missing memory resource\n");
> +               return -ENODEV;
> +       }
> +       dwc->xhci_resources[0].start = res->start;
> +       dwc->xhci_resources[0].end = dwc->xhci_resources[0].start +
> +                                       DWC3_XHCI_REGS_END;
> +       dwc->xhci_resources[0].flags = res->flags;
> +       dwc->xhci_resources[0].name = res->name;
> +
> +       res = platform_get_resource(dwc3_pdev, IORESOURCE_IRQ, 0);
> +       if (!res) {
> +               dev_err(dev, "missing irq resource\n");
> +               return -ENODEV;
> +       }
> +
> +       dwc->xhci_resources[1].start = dwc->irq_gadget;
> +       dwc->xhci_resources[1].end = dwc->irq_gadget;
> +       dwc->xhci_resources[1].flags = res->flags;
> +       dwc->xhci_resources[1].name = res->name;
> +
> +       xhci = platform_device_alloc("xhci-hcd", PLATFORM_DEVID_AUTO);
> +       if (!xhci) {
> +               dev_err(dwc->dev, "couldn't allocate xHCI device\n");
> +               return -ENOMEM;
> +       }
> +
> +       xhci->dev.parent        = dwc->dev;
> +       ret = dma_set_mask_and_coherent(&xhci->dev, DMA_BIT_MASK(36));
> +       if (ret) {
> +               pr_err("xhci dma set mask ret = %d\n", ret);
> +               return ret;
> +       }

This looks like you have the abstraction backwards from what normal
drivers do. If you need a specialization of a driver that already exists,
create a new driver module with a platform_driver that matches the
specialized of_device_id, and have it call into the more general driver,
do avoid having the general driver know about the specializations.

Allocating a platform_device and making it DMA capable
doesn't generally work correctly, and misses the IOMMU setup, so make
sure you have a device node for it instead and probe it from DT.

        Arnd
