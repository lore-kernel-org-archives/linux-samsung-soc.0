From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Sat, 20 Sep 2014 16:52:05 +0530
Message-ID: <CAEC9eQNshrP6wW_9mEDbFR5hRpW6Hy=GBFzV=rf05Wpxz6gtiw@mail.gmail.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
	<5419760A.7020908@ti.com>
	<CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
	<5419B52D.4060107@ti.com>
	<CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
	<541C279A.2030601@ti.com>
	<CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>
	<541C3D95.7080200@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:45966 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750903AbaITLWH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 20 Sep 2014 07:22:07 -0400
In-Reply-To: <541C3D95.7080200@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Fri, Sep 19, 2014 at 7:58 PM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> On 19/09/14 16:59, Ajay kumar wrote:
>
>> I am not really able to understand, what's stopping us from using this
>> bridge on a board with "complex" display connections. To use ps8622 driver,
>> one needs to "attach" it to the DRM framework. For this, the DRM driver
>
> Remember that when we talk about DT bindings, there's no such thing as
> DRM. We talk about hardware. The same bindings need to work on any
> operating system.
Agreed.

>> would need the DT node for ps8622 bridge. For which I use a phandle.
>
> A complex one could be for example a case where you have two different
> panels connected to ps8622, and you can switch between the two panels
> with, say, a gpio. How do you present that with a simple phandle?
>
> In the exynos5420-peach-pit.dts, which you linked earlier, I see a
> "panel" property in the ps8625 node. That's missing from the bindings in
> this patch. Why is that? How is the panel linked in this version?
Oops, my bad!  Panel should also be present in the DT binding(for which,
I am using a phandle for panel node)

>> If some XYZ platform wishes to pick the DT node via a different method,
>> they are always welcome to do it. Just because I am not specifying a
>> video port/endpoint in the DT binding example, would it mean that platform
>> cannot make use of ports in future? If that is the case, I can add something
>
> All the platforms share the same bindings for ps8622. If you now specify
> that ps8622 bindings use a simple phandle, then anyone who uses ps8622
> should support that.
>
> Of course the bindings can be extended in the future. In that case the
> drivers need to support both the old and the new bindings, which is
> always a hassle.
>
> Generally speaking, I sense that we have different views of how display
> devices and drivers are structured. You say "If some XYZ platform wishes
> to pick the DT node via a different method, they are always welcome to
> do it.". This sounds to me that you see the connections between display
> devices as something handled by a platform specific driver.
> I, on the other hand, see connections between display devices as common
> properties.
Well, I am okay with using video ports to describe the relationship
between the encoder, bridge and the panel.
But, its just that I need to make use of 2 functions when phandle
does it using just one function ;)
-        panel_node = of_parse_phandle(dev->of_node, "panel", 0)
+       endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+       if (!endpoint)
+               return -EPROBE_DEFER;
+
+       panel_node = of_graph_get_remote_port_parent(endpoint);
+       if (!panel_node)
+               return -EPROBE_DEFER;


If nobody else has objections over using of_graph functions instead
of phandles, I can respin this patchset by making use of video ports.

Ajay

> Say, we could have a display board, with a panel and an encoder and
> maybe some other components, which takes parallel RGB as input. The same
> display board could as well be connected to an OMAP board or to an
> Exynos board.
>
> I think the exact same display-board.dtsi file, which describes the
> devices and connections in the display board, should be usable on both
> OMAP and Exynos platforms. This means we need to have a common way to
> describe video devices, just as we have for other things.
>
>  Tomi
>
>
