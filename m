From: Maciej Purski <m.purski@samsung.com>
Subject: Re: [PATCH v2 07/10] dt-bindings: tc358754: add DT bindings
Date: Mon, 18 Jun 2018 13:23:54 +0200
Message-ID: <20180618112356eucas1p1096192ad9dc12c84a3a4beda554b7c44~5PWFYOHzV2540325403eucas1p1m@eucas1p1.samsung.com>
References: <1527682561-1386-1-git-send-email-m.purski@samsung.com>
        <CGME20180530121627eucas1p1c8daf24d7c95e9e8b04a523d4662dfd9@eucas1p1.samsung.com>
        <1527682561-1386-8-git-send-email-m.purski@samsung.com>
        <20180531040211.GA23051@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180531040211.GA23051@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org



On 05/31/2018 06:02 AM, Rob Herring wrote:
> On Wed, May 30, 2018 at 02:15:58PM +0200, Maciej Purski wrote:
>> From: Andrzej Hajda <a.hajda@samsung.com>
>>
>> The patch adds bindings to Toshiba DSI/LVDS bridge TC358764.
>> Bindings describe power supplies, reset gpio and video interfaces.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> Signed-off-by: Maciej Purski <m.purski@samsung.com>
>> ---
>>   .../bindings/display/bridge/toshiba,tc358764.txt   | 37 ++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
>> new file mode 100644
>> index 0000000..6eda14f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
>> @@ -0,0 +1,37 @@
>> +TC358764 MIPI-DSI to LVDS panel bridge
>> +
>> +Required properties:
>> +  - compatible: "toshiba,tc358764"
>> +  - reg: the virtual channel number of a DSI peripheral
>> +  - vddc-supply: core voltage supply, 1.2V
>> +  - vddio-supply: I/O voltage supply, 1.8V or 3.3V
>> +  - vddlvds-supply: LVDS1/2 voltage supply, 3.3V
>> +  - reset-gpios: a GPIO spec for the reset pin
>> +
>> +The device node can contain zero to two 'port' child nodes, each with one
> 
> How would 0 ports be valid?
> 

I'll fix this. In my opinion the output LVDS port should be mandatory
and the input DSI port should be optional, as the bridge might be a DSI
child node. According to documentation, the bridge can also be I2C controlled.
In this case, it should contain a DSI input port and LVDS output port.


>> +child 'endpoint' node, according to the bindings defined in [1].
>> +The following are properties specific to those nodes.
>> +
>> +port:
>> +  - reg: (required) can be 0 for DSI port or 1 for LVDS port;
>> +
>> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
>> +
>> +Example:
>> +
>> +	bridge@0 {
>> +		reg = <0>;
>> +		compatible = "toshiba,tc358764";
>> +		vddc-supply = <&vcc_1v2_reg>;
>> +		vddio-supply = <&vcc_1v8_reg>;
>> +		vddlvds-supply = <&vcc_3v3_reg>;
>> +		reset-gpios = <&gpd1 6 GPIO_ACTIVE_LOW>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		port@1 {
>> +			reg = <1>;
>> +			lvds_ep: endpoint {
>> +				remote-endpoint = <&panel_ep>;
>> +			};
>> +		};
>> +	};
>> -- 
>> 2.7.4
>>
> 
> 
> 
