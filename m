From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
 panel nodes
Date: Wed, 5 Mar 2014 21:06:20 +0900
Message-ID: <CAAQKjZPVvAxC7=voKJ1Jid3Ynnrjcg6s5m95fwetx7iDeZUN+w@mail.gmail.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
	<1392204688-4591-20-git-send-email-a.hajda@samsung.com>
	<53108FA0.4040903@ti.com>
	<53109193.3000604@ti.com>
	<5315C07B.3090705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:37218 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755781AbaCEMG2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Mar 2014 07:06:28 -0500
In-Reply-To: <5315C07B.3090705@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Sorry for interrupting,


2014-03-04 21:00 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> On 02/28/2014 02:39 PM, Tomi Valkeinen wrote:
>> On 28/02/14 15:31, Tomi Valkeinen wrote:
>>
>>> Compared to what I've done on OMAP, you don't seem to specify the video
>>> inputs for the tc358764 at all. In this case it's obvious, as the chip
>>> is a child of the DSI master. But the chip could as well be controlled
>>> via i2c, and so be placed as a child of the i2c nodes.
>>>
>>> So even if the driver doesn't use it, maybe it would be more future
>>> proof to have both input and output endpoints for the tc358764?
>> Oh, and one addition: how me and Laurent see the DSI case (and other
>> similar ones), the child/parent relationship gives the control bus path,
>> and the video ports give the video data path.
>>
>> So both are always needed. A DSI panel may be controlled via DSI, i2c,
>> spi, but the video path will always go from DSI master to the panel.
> I have made video path binding optional, in case of video bus
> if the specific video path is not present driver uses the bus it is
> connected to.

You mean the case that video path isn't wrote in dt file for some
machine? If so, shouldn't we always write video patch in the dt file
correctly? I'm not sure the optional binding is needed because which
bus and which panel are used depends on machine.

And If I understood correctly the video interfaces document, it seems
that you don't deal with the document.

The below is simple dt binding I think in case that video path goes
from MIPI-DSI to LVDS bridge, and then from LVDS bridge to LCD Panel,

panel {
        ...
        port {
                ...
                panel_0: endpoint {
                        remote-endpoint=<&lvds_1>;
                };
        };
};

lvds {
       ...
       port@1 {
               ...
               lvds_0: endpoint {
                       remote-endpoint=<&dsi_0>;
               };
       };
       port@2 {
              ...
              lvds_1: endpoint {
                       remote-endpoint=<&panel_0>;
              };
       };
};

dsi {
        ...
        port {
                dsi_0: endpoint {
                        remote-endpoint=<&lvds_0>;
                };
        };
};

panel and lvds node could be a child of other masters, maybe i2c or spi.

Thanks,
Inki Dae


> In case DSI panel is controlled via different bus the path should be
> specified
> explicitly.
>
> I have no strong feelings against making this binding required but as
> you have
> stated above "in this case it's obvious" and for me quite redundant.
>
> What is the gain in specifying explicitly video paths in such cases?
>
>
>> Or, as a theoretical panel, you could have a DSI controlled panel, being
>> a child of the DSI master, but the video data would come via, say,
>> parallel RGB. You can actually do that with some panels/encoders, even
>> if the concept is silly.
>
> In this case explicit binding will work also.
>
> Regards
> Andrzej
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
