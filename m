From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v6 11/17] Documentation: phy: add document for rockchip
 dp phy
Date: Tue, 13 Oct 2015 09:21:41 +0800
Message-ID: <561C5CA5.1030403@rock-chips.com>
References: <1444491357-26095-1-git-send-email-ykk@rock-chips.com> <1444492695-27241-1-git-send-email-ykk@rock-chips.com> <561C3410.8090600@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:40533 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752009AbbJMBV7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 21:21:59 -0400
In-Reply-To: <561C3410.8090600@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, joe@perches.com, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Hi Kishon,

On 10/13/2015 06:28 AM, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Saturday 10 October 2015 09:28 PM, Yakir Yang wrote:
>> This phy driver is binded with the Rockchip DisplayPort
>> driver, here are the brief properties:
>> 	edp_phy: edp-phy@ff770274 {
>> 		compatible = "rockchip,rk3288-dp-phy";
>> 		rockchip,grf = <&grf>;
>> 		clocks = <&cru SCLK_EDP_24M>;
>> 		clock-names = "24m";
>> 		#phy-cells = <0>;
>> 	};
> The commit message can simply be "Add dt binding documentation for
> rockchip display port PHY".

Okay, thanks.

- Yakir

>
> Thanks
> Kishon
>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> Changes in v6: None
>> Changes in v5:
>> - Split binding doc's from driver changes. (Rob)
>> - Update the rockchip,grf explain in document, and correct the clock required
>>    elemets in document. (Rob & Heiko)
>>
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2: None
>>
>>   .../devicetree/bindings/phy/rockchip-dp-phy.txt    | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>> new file mode 100644
>> index 0000000..505194e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>> @@ -0,0 +1,22 @@
>> +Rockchip Soc Seroes Display Port PHY
>> +------------------------------------
>> +
>> +Required properties:
>> +- compatible : should be one of the following supported values:
>> +	 - "rockchip.rk3288-dp-phy"
>> +- clocks: from common clock binding: handle to dp clock.
>> +	of memory mapped region.
>> +- clock-names: from common clock binding:
>> +	Required elements: "24m"
>> +- rockchip,grf: phandle to the syscon managing the "general register files"
>> +- #phy-cells : from the generic PHY bindings, must be 0;
>> +
>> +Example:
>> +
>> +edp_phy: edp-phy@ff770274 {
>> +	compatible = "rockchip,rk3288-dp-phy";
>> +	rockchip,grf = <&grf>;
>> +	clocks = <&cru SCLK_EDP_24M>;
>> +	clock-names = "24m";
>> +	#phy-cells = <0>;
>> +};
>>
>
>
