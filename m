From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Boot hang on Origen with (!SMP && CPU_IDLE)
Date: Mon, 6 Jan 2014 16:30:56 +0100
Message-ID: <201401061630.56740.arnd@arndb.de>
References: <CAHbNUh1LF9+v1en==t8znAL518ERWE2LffTDykAEb2HST+WKTw@mail.gmail.com> <2428340.zXRbG18t7N@amdc1227> <CAHbNUh18WkH4CFcaeP1Tdjm3L-Rr0xVzgCnAHoPbbCFRWjKyxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:62566 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425AbaAFPbC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jan 2014 10:31:02 -0500
In-Reply-To: <CAHbNUh18WkH4CFcaeP1Tdjm3L-Rr0xVzgCnAHoPbbCFRWjKyxg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kgene Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Monday 06 January 2014, Tushar Behera wrote:
> The device tree node for l2x0 device was missing. After adding a node
> as below I can start booting Origen board.
> 
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
> b/arch/arm/boot/dts/exynos4210-origen.dts
> index 1a12fb2..675f323 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -32,6 +32,13 @@
> 
> +       l2-cache-controller@10502000 {
> +               compatible = "arm,pl310-cache";
> +               reg = <0x10502000 0x1000>;
> +               cache-unified;
> +               cache-level = <2>;
> +       };
> +

Ok, very good!

> >> be a good time to get rid of the L2_AUX_VAL and L2_AUX_MASK defines and
> >> just read the respective settings from DT.
> 
> Ok.

Does the node you list above have the right settings for this?

> > 2) There is no L2 cache controller node in Exynos4*.dtsi.
> >
> > It should be added, but L2 cache can't be enabled on all boards yet,
> > since on boards where secure firmware is enabled, special configuration
> > involving SMC calls is required. Patches for this are queued on my work
> > queue, but it's quite tricky due to 1), which needs to consider whether
> > secure firmware is enabled or not.
> >
> 
> In that case, would it be ok to add the node for Origen board only?

Wouldn't that leave other systems still broken? I'm particularly worried
about what patch to backport to linux-stable. We should definitely add
the node for Origen, but we may also have to revert my broken patch
in all affected kernel versions.

Are there any systems that may or may not have secure firmware enabled
depending on the boot loader, or do we always know whether secure firmware
is there or not?

	Arnd
