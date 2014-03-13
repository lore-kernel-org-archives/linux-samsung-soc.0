From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 2/3] ARM: dts: add dts files for exynos5260 SoC
Date: Thu, 13 Mar 2014 19:32:09 +0100
Message-ID: <5321F9A9.9030904@samsung.com>
References: <1394637394-3960-1-git-send-email-rahul.sharma@samsung.com>
 <1394637394-3960-3-git-send-email-rahul.sharma@samsung.com>
 <532102CE.708@samsung.com>
 <CAPdUM4McDh5gqk2Z=-n5XTZqsLLVe18rO4s810Zrk0vHQu-M2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62167 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754468AbaCMScO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 14:32:14 -0400
In-reply-to: <CAPdUM4McDh5gqk2Z=-n5XTZqsLLVe18rO4s810Zrk0vHQu-M2A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Arun Kumar K <arun.kk@samsung.com>, Mark Rutland <Mark.Rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@secretlab.ca>

On 13.03.2014 06:06, Rahul Sharma wrote:
> On 13 March 2014 06:28, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>> On 03/13/2014 12:16 AM, Rahul Sharma wrote:

[snip]

>>> +               clocks {
>>> +                       compatible = "simple-bus";
>>> +                       #address-cells = <1>;
>>> +                       #size-cells = <0>;
>>
>>
>> Even though you added  #address-cells property I can not see "reg" property
>> in any of "fixed-clock".
>> Isn't it better either we can remove this or add "reg" property?
>> Also all these fixed-clock are missing #clock-cells property.
>>
>
> Since it is a soc level addition, I enabled provision for adding reg
> property for
> fixed clocks in boards files (or in SoC file).
>

All sub-nodes should follow the same pattern.

After recent discussion with DT people, the conclusion is that 
simple-bus should be used only for MMIO platform devices with "reg" 
values mapped directly into address space in which the simple-bus node 
resides.

So for now I'd remove the grouping and keep the clocks in "soc" node 
directly.

[snip]

>>> +
>>> +                       dptx_phy_ch0: phyclk_dptx_phy_ch0_txd {
>>> +                               compatible = "fixed-clock";
>>> +                               clock-frequency = <270000000>;
>>> +                               clock-output-names =
>>> "phyclk_dptx_phy_ch0_txd_clk";
>>> +                       };

I'm not sure whether these clocks are really fixed clocks. They are 
output from certain PHY blocks which are not always-on, while using the 
fixed clock binding would suggest otherwise. IMHO they should be hidden 
inside the clock driver, without DT IDs assigned as a temporary hack, 
until proper support gets added for them (e.g. proper clock provider 
from appropriate PHY).

Best regards,
Tomasz
