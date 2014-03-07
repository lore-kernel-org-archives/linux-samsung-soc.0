From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
 panel nodes
Date: Fri, 07 Mar 2014 15:17:32 +0100
Message-ID: <5319D4FC.5090703@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
 <1392204688-4591-20-git-send-email-a.hajda@samsung.com>
 <53108FA0.4040903@ti.com> <53109193.3000604@ti.com>
 <5315C07B.3090705@samsung.com>
 <CAAQKjZPVvAxC7=voKJ1Jid3Ynnrjcg6s5m95fwetx7iDeZUN+w@mail.gmail.com>
 <5319B9FF.50201@samsung.com> <5319BC45.4040308@ti.com>
 <5319C4A8.8080900@samsung.com> <5319C976.3060908@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30405 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753138AbaCGORt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 09:17:49 -0500
In-reply-to: <5319C976.3060908@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Inki Dae <inki.dae@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 03/07/2014 02:28 PM, Tomi Valkeinen wrote:
(...)
> There are many possible connections from FIMD, some of them:
> FIMD ---> RGB panel, external
> FIMD ---> DSI, on SoC
> FIMD ---> eDP, on SoC
> FIMD ---> ImageEnhacer, on SoC
> This sounds similar to OMAP, at least roughly.
>
>> In the first case port should be created.
>> In other cases connection could be determined by presence/absence
>> of specific nodes, so in fact the port can be optional, almost like in
>> my proposal :)
> Well, I think not.
>
> In the external encoder case, the ports are there, and they are used.
> You just didn't specify them, and thus make the driver deduce them from
> the DT.
>
> In the FIMD case, if the the RGB port is needed, you need to specify it
> in the DT data, and it's used. If you only need, say, DSI, the RGB port
> is not used and thus it doesn't need to be present in the DT data.
>
> It's fine to leave the port definition out if it is not used at all.
On Exynos, DSI is in fact RGB/DSI encoder (or I80/DSI). DSI and RGB pins
are connected to the same FIMD output. So from FIMD point of view
RGB port is used in both cases.
>
>>> For OMAP, the SoC's display blocks are all inside one bigger DSS
>>> "container", so I have not seen need to represent the connections
>>> between the internal components in the DT data.
>> How do you deal with situation when IPs in SoC can be connected in
>> different ways ?
> Basically so that (using exynos terms) if, say DSI panel is to be
> enabled, the DSI panel driver will reserve the DSI master for itself,
> and the DSI master will reserve the FIMD for itself, presuming FIMD has
> not already been reserved. When the DSI panel is disabled, FIMD is freed.
>
>  Tomi
>
>
