From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH v5 0/17] Add Analogix Core Display Port Driver
Date: Tue, 13 Oct 2015 11:21:13 +0200
Message-ID: <561CCD09.6020801@osg.samsung.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
 <5614BADD.1070307@rock-chips.com> <5614DBE2.6080102@osg.samsung.com>
 <5614DFBC.8060105@rock-chips.com> <5614E553.6060108@osg.samsung.com>
 <5614FC6B.4080702@rock-chips.com> <56150128.2070309@osg.samsung.com>
 <5615BB93.9020008@rock-chips.com> <56192135.2080608@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56192135.2080608-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Yakir,

Sorry for the delay but I was on holidays.

On 10/10/2015 04:31 PM, Yakir Yang wrote:
> Hi Javier,

[snip]

>>>
>>>> Maybe you can email me the method the run mainline kernel on Peach
>>>> Pit, so I can debug the analogix_dp driver at the same time, that would
>>>> be great.
>>> I wrote a little blog post explaining how to run mainline on these boards:
>>>
>>> http://blogs.s-osg.org/install-linux-mainline-kernel-distro-exynos-chromebooks/
>>>
>>> That explains the simplest setup though so if you need a different one
>>> (i.e: chain loading a non verified u-boot) or if you have any questions,
>>> feel free to contact me in private and I can help you with the setup.
>>>
>>
>> Ah, thanks, gonna to step-by-step.
> 
> Thanks for your great material, although I meet some problems in the step-by-step
> process, and failed at this way to setup mainline kernel environment on Exynos chromebooks.
> 
> But i do find another way to install mainline kernel to Exynos Chromebook:
> 1. Install any ChromeOS image into a USB media device (like dd tools)
> 2. "enable_dev_usb_boot" on Exynos chromebooks which would allowed boot from USB.
> 3. Flash the mainline kernel into the KERNEL-A and KERNEL-B partitions on host PC.
> 4. Insert USB device into Exynos chromebooks, and press CTRL+U, boot into USB OS.

Yes, as I mentioned in the blog, there are many options. In fact I also boot from
a uSD instead of the eMMC since is easier for me to flash from the host machine
and chain load a non-verified u-boot so I can boot non signed kernels.

But thought that the most common use case would be to install it in the KERN-C and
ROOT-C partitions in the eMMC. Anyways, I'm glad that you got it working.

> 
> And it's better to enable pstore function on mainline kernel, so we can analysis the last log when
> the mainline kernel crashed. After enable PSTORE_RAM in .config, we still need add ramoops node

Interesting, I knew about pstore but I never used it with the Exynos Chromebooks.

> into file, like:
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -750,6 +750,15 @@
>                 iommu = <&sysmmu_gsc3>;
>         };
> 
> +       ramoops: ramoops {
> +               compatible = "ramoops";
> +               name = "ramoops";
> +               reg = <0x41f00000 0x100000>;
> +               record-size = <0x20000>;
> +               dump-oops;
> +               status = "okay";
> +       };
> +

Are you using mainline? There isn't a "ramoops" compatible string documented
in the upstream DT bindings, platform_match() would match by driver name as
a fallback but I don't see code in fs/pstore/ram.c that parses the properties
in your device node. I wonder how this works for you or did I missunderstand?

>         hdmi: hdmi {
>                 compatible = "samsung,exynos4212-hdmi";
>                 reg = <0x14530000 0x70000>;
> 
> 
> Aha, I have tested this series on two Exynos Chromebooks that I borrowed(Snow and Peach Pit)
> with previously method (actually I believed it's a common method without broken the original
> ChromeOS image).
> 
> And I do find the crash place that make you failed at this series, here is the diff changes:
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 5f8fc11..bcbc009 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1169,6 +1169,7 @@ static int analogix_dp_create_bridge(struct drm_device *drm_dev,
> 
>         dp->bridge = bridge;
> 
> +       dp->encoder->bridge = bridge;
>         bridge->driver_private = dp;
>         bridge->encoder = dp->encoder;
>         bridge->funcs = &analogix_dp_bridge_funcs;
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -151,7 +151,7 @@
>         samsung,color-depth = <1>;
>         samsung,link-rate = <0x06>;
>         samsung,lane-count = <2>;
> -       hpd-gpio = <&gpx2 6 0>;
> +       hpd-gpios = <&gpx2 6 0>;
> 
>         ports {
>                 port@0 {
> 
> 
> Anyway I'm going to send the v6 series, thanks for your good idea.
>

Great, I'll try to test your latest series on my Peach Pi today.

> - Yakir
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
