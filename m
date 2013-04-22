From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/3] drm/exynos: Add device tree support for fimc ipp driver
Date: Mon, 22 Apr 2013 17:57:06 +0200
Message-ID: <51755DD2.6020604@samsung.com>
References: <1366133486-22973-1-git-send-email-s.nawrocki@samsung.com>
 <1366133486-22973-4-git-send-email-s.nawrocki@samsung.com>
 <CAAQKjZM_WmKHSrUgN9_PxoFt5BemTp113JEXzj1huu5B-V32=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40696 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753590Ab3DVP5K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 11:57:10 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLN000LIYYGWVC0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Apr 2013 16:57:07 +0100 (BST)
In-reply-to: <CAAQKjZM_WmKHSrUgN9_PxoFt5BemTp113JEXzj1huu5B-V32=A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, DRI mailing list <dri-devel@lists.freedesktop.org>

On 04/20/2013 06:21 PM, Inki Dae wrote:
>     +static int fimc_parse_dt(struct fimc_context *ctx)
>     +{
>     +       struct device_node *node = ctx->dev->of_node;
>     +
>     +       if (!of_property_read_bool(node, "samsung,lcd-wb"))
>     +               return -ENODEV;
> 
> 
> 
> Isn't the above property really needed? This makes the use of write-back
> feature to be forced. I think some machines might not need this feature so
> their dts files have no that property.
>  So in this case, drm fimc driver probing will be failed. is that correct
> action and your intention?

Sorry, I should have added a comment explaining why it is done like this.

"samsung,lcd-wb" is the hardware property, it should be in DT node of each
FIMC that has data path from LCD to its Writeback input. See [1] for full
binding description.
So for Exynos4, FIMC2, FIMC3 will be now bound to the DRM driver. And FIMC0,
FIMC1 will be bound to the V4L2 camera driver. There is complementary check
there:

if (of_property_read_bool(node, "samsung,lcd-wb"))
	return -ENODEV;

Ideally there should be just one core driver for FIMC IP block, which is
associated with the fimc DT nodes. And switching between DRM and V4L2
should be possible at run-time. I think Media Controller API could be
helpful in that (note it is not V4L2 specific at all).
But this is all not trivial, especially WRT power management.

Before we have that I assume we could stick with using the "samsung,lcd-wb"
property.

>     +       if (of_property_read_u32(node, "clock-frequency",
>     +                                       &ctx->clk_frequency))
>     +               ctx->clk_frequency = FIMC_DEFAULT_LCLK_FREQUENCY;
>     +
>     +       ctx->id = of_alias_get_id(node, "fimc");
>     +       if (ctx->id < 0)
>     +               return -EINVAL;
>     +
>     +       return 0;
>     +}


P.S. Html is frowned upon on the mailing lists, can please fix you mailer
to use plain text ?

[1]
http://git.linuxtv.org/media_tree.git/blob/master:/Documentation/devicetree/bindings/media/samsung-fimc.txt
