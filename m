From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
 panel nodes
Date: Fri, 07 Mar 2014 13:22:23 +0100
Message-ID: <5319B9FF.50201@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
 <1392204688-4591-20-git-send-email-a.hajda@samsung.com>
 <53108FA0.4040903@ti.com> <53109193.3000604@ti.com>
 <5315C07B.3090705@samsung.com>
 <CAAQKjZPVvAxC7=voKJ1Jid3Ynnrjcg6s5m95fwetx7iDeZUN+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24131 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753138AbaCGMWk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 07:22:40 -0500
In-reply-to: <CAAQKjZPVvAxC7=voKJ1Jid3Ynnrjcg6s5m95fwetx7iDeZUN+w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 03/05/2014 01:06 PM, Inki Dae wrote:
> Sorry for interrupting,
>
>
> 2014-03-04 21:00 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>> On 02/28/2014 02:39 PM, Tomi Valkeinen wrote:
>>> On 28/02/14 15:31, Tomi Valkeinen wrote:
>>>
>>>> Compared to what I've done on OMAP, you don't seem to specify the video
>>>> inputs for the tc358764 at all. In this case it's obvious, as the chip
>>>> is a child of the DSI master. But the chip could as well be controlled
>>>> via i2c, and so be placed as a child of the i2c nodes.
>>>>
>>>> So even if the driver doesn't use it, maybe it would be more future
>>>> proof to have both input and output endpoints for the tc358764?
>>> Oh, and one addition: how me and Laurent see the DSI case (and other
>>> similar ones), the child/parent relationship gives the control bus path,
>>> and the video ports give the video data path.
>>>
>>> So both are always needed. A DSI panel may be controlled via DSI, i2c,
>>> spi, but the video path will always go from DSI master to the panel.
>> I have made video path binding optional, in case of video bus
>> if the specific video path is not present driver uses the bus it is
>> connected to.
> You mean the case that video path isn't wrote in dt file for some
> machine? If so, shouldn't we always write video patch in the dt file
> correctly? I'm not sure the optional binding is needed because which
> bus and which panel are used depends on machine.
>
> And If I understood correctly the video interfaces document, it seems
> that you don't deal with the document.
I have followed the document, I have even specified it in bridge bindings.
I have just made those bindings optional in case control bus is the same
as video bus - DSI master/slave case.
>
> The below is simple dt binding I think in case that video path goes
> from MIPI-DSI to LVDS bridge, and then from LVDS bridge to LCD Panel,
>
> panel {
>         ...
>         port {
>                 ...
>                 panel_0: endpoint {
>                         remote-endpoint=<&lvds_1>;
>                 };
>         };
> };
>
> lvds {
>        ...
>        port@1 {
>                ...
>                lvds_0: endpoint {
>                        remote-endpoint=<&dsi_0>;
>                };
>        };
>        port@2 {
>               ...
>               lvds_1: endpoint {
>                        remote-endpoint=<&panel_0>;
>               };
>        };
> };
>
> dsi {
>         ...
>         port {
>                 dsi_0: endpoint {
>                         remote-endpoint=<&lvds_0>;
>                 };
>         };
> };
>
I think we should even extend the bindings to fimd:
dsi {
    port@0 {
        dsi_0: endpoint {
            remote-endpoint=<&fimd_0>;
        }
    }
    port@1 {
        dsi_1: endpoint {
            remote-endpoint=<&lvds_0>;
        }
    }
}

fimd {
    port@0 {
        fimd_0: endpoint {
            remote-endpoint=<&dsi_0>;
        }
    }
}


> panel and lvds node could be a child of other masters, maybe i2c or spi.
As I mentioned earlier, in such cases bindings should be specified
explicitly.
My proposition of omitting obvious bindings was made to simplify a bit
dts files,
but as I stated earlier it is not something I want to die for :)

Regards
Andrzej
