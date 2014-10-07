From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 7 Oct 2014 16:06:55 +0530
Message-ID: <CAEC9eQPq28GFS+1GweECM9QHfCM+LzOL9ySq05i6RfVG6-2ubQ@mail.gmail.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
	<5419760A.7020908@ti.com>
	<CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
	<5419B52D.4060107@ti.com>
	<CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
	<541C279A.2030601@ti.com>
	<CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>
	<541C3D95.7080200@ti.com>
	<CAEC9eQNshrP6wW_9mEDbFR5hRpW6Hy=GBFzV=rf05Wpxz6gtiw@mail.gmail.com>
	<5433C0CC.5040804@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:43813 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752758AbaJGKg4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 06:36:56 -0400
In-Reply-To: <5433C0CC.5040804@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Tue, Oct 7, 2014 at 4:00 PM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> On 20/09/14 14:22, Ajay kumar wrote:
>
>> Well, I am okay with using video ports to describe the relationship
>> between the encoder, bridge and the panel.
>> But, its just that I need to make use of 2 functions when phandle
>> does it using just one function ;)
>> -        panel_node = of_parse_phandle(dev->of_node, "panel", 0)
>> +       endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
>> +       if (!endpoint)
>> +               return -EPROBE_DEFER;
>> +
>> +       panel_node = of_graph_get_remote_port_parent(endpoint);
>> +       if (!panel_node)
>> +               return -EPROBE_DEFER;
>>
>>
>> If nobody else has objections over using of_graph functions instead
>> of phandles, I can respin this patchset by making use of video ports.
>
> The discussion did digress somewhat.
>
> As a clarification, I'm in no way nack'ing this series because it
> doesn't use the graphs for video connections. I don't see the simple
> phandle bindings used here as broken as such.
Well, I am okay with any approach you guys decide on. I desperately want
this to get this in since it has been floating around for quite sometime.
The more we drag this, the more rework for me since the number of platforms
using bridge support is increasing daily!

Ajay
