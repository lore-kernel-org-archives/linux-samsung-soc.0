From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Sat, 20 Sep 2014 17:27:50 +0200
Message-ID: <CABxcv=kGTmYtjDc0isgy=-Ga+w69zVefJwK1qQY7dmER5fhhJg@mail.gmail.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
	<5419760A.7020908@ti.com>
	<CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
	<5419B52D.4060107@ti.com>
	<CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
	<541C279A.2030601@ti.com>
	<CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>
	<541C3D95.7080200@ti.com>
	<CAEC9eQNshrP6wW_9mEDbFR5hRpW6Hy=GBFzV=rf05Wpxz6gtiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:54162 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753015AbaITP1v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 20 Sep 2014 11:27:51 -0400
Received: by mail-we0-f182.google.com with SMTP id q59so1014701wes.27
        for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Sep 2014 08:27:50 -0700 (PDT)
In-Reply-To: <CAEC9eQNshrP6wW_9mEDbFR5hRpW6Hy=GBFzV=rf05Wpxz6gtiw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[adding Kukjin as cc]

Hello Ajay,

On Sat, Sep 20, 2014 at 1:22 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
>> Generally speaking, I sense that we have different views of how display
>> devices and drivers are structured. You say "If some XYZ platform wishes
>> to pick the DT node via a different method, they are always welcome to
>> do it.". This sounds to me that you see the connections between display
>> devices as something handled by a platform specific driver.
>> I, on the other hand, see connections between display devices as common
>> properties.
> Well, I am okay with using video ports to describe the relationship
> between the encoder, bridge and the panel.
> But, its just that I need to make use of 2 functions when phandle
> does it using just one function ;)
> -        panel_node = of_parse_phandle(dev->of_node, "panel", 0)
> +       endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +       if (!endpoint)
> +               return -EPROBE_DEFER;
> +
> +       panel_node = of_graph_get_remote_port_parent(endpoint);
> +       if (!panel_node)
> +               return -EPROBE_DEFER;
>
>
> If nobody else has objections over using of_graph functions instead
> of phandles, I can respin this patchset by making use of video ports.

I certainly have no objections about re-using the video
ports/endpoints DT bindings for the bridges but just wanted to point
out that Kukjin has already merged on his tree the DTS changes for
display on Snow and Peach Pit using the current binding and also sent
the pull request [0] to ARM SoC maintainers since he probably was
expecting this series to make ti for 3.18. So that should be handled
somehow.

Tomi,

I see that Documentation/devicetree/bindings/video/ti,omap-dss.txt
mentions that the Video Ports binding documentation is in
Documentation/devicetree/bindings/video/video-ports.txt but I don't
see that this file exists in the kernel [1]. I see though that is was
included on your series adding DSS DT support [2].

Do you know what happened with this file?

Best regards,
Javier

[0]: https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg36681.html
[1]: https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/video
[2]: http://lists.infradead.org/pipermail/linux-arm-kernel/2014-January/227088.html
