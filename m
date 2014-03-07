From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
 panel nodes
Date: Fri, 07 Mar 2014 14:07:52 +0100
Message-ID: <5319C4A8.8080900@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
 <1392204688-4591-20-git-send-email-a.hajda@samsung.com>
 <53108FA0.4040903@ti.com> <53109193.3000604@ti.com>
 <5315C07B.3090705@samsung.com>
 <CAAQKjZPVvAxC7=voKJ1Jid3Ynnrjcg6s5m95fwetx7iDeZUN+w@mail.gmail.com>
 <5319B9FF.50201@samsung.com> <5319BC45.4040308@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:30694 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751929AbaCGNIK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 08:08:10 -0500
In-reply-to: <5319BC45.4040308@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Inki Dae <inki.dae@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 03/07/2014 01:32 PM, Tomi Valkeinen wrote:
> On 07/03/14 14:22, Andrzej Hajda wrote:
>
>> I think we should even extend the bindings to fimd:
>> dsi {
>>     port@0 {
>>         dsi_0: endpoint {
>>             remote-endpoint=<&fimd_0>;
>>         }
>>     }
>>     port@1 {
>>         dsi_1: endpoint {
>>             remote-endpoint=<&lvds_0>;
>>         }
>>     }
>> }
>>
>> fimd {
>>     port@0 {
>>         fimd_0: endpoint {
>>             remote-endpoint=<&dsi_0>;
>>         }
>>     }
>> }
> If both fimd and dsi are SoC components, I don't see any strict need for
> that. I think the ports/endpoints are only important when dealing with
> external components, which can be used on any platform. For SoC internal
> components you can have relevant data directly in the drivers, as it is
> fixed (for that SoC).
>
> Of course, if using ports for SoC internal components makes things
> easier for you, I don't see any problems with it either.
There are many possible connections from FIMD, some of them:
FIMD ---> RGB panel, external
FIMD ---> DSI, on SoC
FIMD ---> eDP, on SoC
FIMD ---> ImageEnhacer, on SoC

In the first case port should be created.
In other cases connection could be determined by presence/absence
of specific nodes, so in fact the port can be optional, almost like in
my proposal :)


>
> For OMAP, the SoC's display blocks are all inside one bigger DSS
> "container", so I have not seen need to represent the connections
> between the internal components in the DT data.
How do you deal with situation when IPs in SoC can be connected in
different ways ?

Andrzej
> If the display components were truly independent IPs on the SoC, then
> using ports might make things easier.
>
>  Tomi
>
>
