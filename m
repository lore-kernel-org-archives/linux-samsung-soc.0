From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC v2 PATCH v4 09/14] ARM: dts: s6e3fa0: add DT bindings
Date: Wed, 23 Apr 2014 14:48:31 +0200
Message-ID: <5357B69F.7070405@samsung.com>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <1398083321-8668-10-git-send-email-yj44.cho@samsung.com>
 <5357819D.7050802@samsung.com> <1827288.zC58DZqqVB@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1827288.zC58DZqqVB@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, sachin.kamat@linaro.org, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 04/23/2014 01:34 PM, Laurent Pinchart wrote:
> Hi Andrzej,
>
> On Wednesday 23 April 2014 11:02:21 Andrzej Hajda wrote:
>> On 04/21/2014 02:28 PM, YoungJun Cho wrote:
>>> This patch adds DT bindings for s6e3fa0 panel.
>>> The bindings describes panel resources, display timings and cpu timings.
>>>
>>> Changelog v2:
>>> - Adds unit address (commented by Sachin Kamat)
>>> Changelog v3:
>>> - Removes optional delay, size properties (commented by Laurent Pinchart)
>>> - Adds OLED detection, TE gpio properties
>>> Changelog v4:
>>> - Moves CPU timings relevant properties from FIMD DT
>>>
>>>   (commeted by Laurent Pinchart, Andrzej Hajda)
>>>
>>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>>> Acked-by: Inki Dae <inki.dae@samsung.com>
>>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>> ---
>>>
>>>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   63 +++++++++++++++
>>> 1 file changed, 63 insertions(+)
>>>  create mode 100644
>>>  Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt> 
>>> diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
>>> b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt new file
>>> mode 100644
>>> index 0000000..9eeb38b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
>>> @@ -0,0 +1,63 @@
>>> +Samsung S6E3FA0 AMOLED LCD 5.7 inch panel
>>> +
>>> +Required properties:
>>> +  - compatible: "samsung,s6e3fa0"
>>> +  - reg: the virtual channel number of a DSI peripheral
>>> +  - vdd3-supply: core voltage supply
>>> +  - vci-supply: voltage supply for analog circuits
>>> +  - reset-gpio: a GPIO spec for the reset pin
>>> +  - det-gpio: a GPIO spec for the OLED detection pin
>>> +  - te-gpio: a GPIO spec for the TE pin
>>> +  - display-timings: timings for the connected panel as described by [1]
>> Which properties of display-timings are relevant for CPU mode?
>> I guess width and height. Anything more?
>>
>>> +  - cpu-timings: CPU interface timings for the connected panel, and it
>>> contains
>>> +        following optional properties.
>>> +          - cs-setup: clock cycles for the active period of address
>>> signal
>>> +                enable until chip select is enable in CPU interface
>>> +          - wr-setup: clock cycles for the active period of CS signal
>>> enable
>>> +                until write signal is enable in CPU interface
>>> +          - wr-act: clock cycles for the active period of CS enable in
>>> CPU
>>> +                interface
> What about calling this property wr-active ? I had called this wr-cycle in a 
> previous implementation, that could be an option as well.
>
>>> +          - wr-hold: clock cycles for the active period of CS disable
>>> until
>>> +                write signal is disable in CPU interface
>> cpu-timings name does not sound to be related to display.
>> I wonder if it would not be better to merge cpu-timings into
>> display-timings but this will require more discussion I guess.
> The panel has a memory-like interface with chip select, read/write and access 
> strobe, address (1 bit) and data signals. The interface is defined in the MIPI 
> DBI specification (a quick search turned up 
> http://www.scribd.com/doc/206899854/MIPI-DPI-Specification-v2, there might be 
> direct PDF downloads available), even if some panels implement a similar 
> interface that predates MIPI DBI (with names such as i80 or SYS-80 probably 
> due to the similarities with the 8051 external bus).
>
> The cpu-timings properties describe the read and write access timings for 
> those signals, unrelated to the display video timings. I thus believe that 
> they should be separate from the display timings. We will probably need to add 
> properties for the read signal as well, but that can be done later.

cpu-timings suggests these timings are for CPU, but they are for display
panel in CPU mode.
I though rather about something like display-cpu-timings or i80-timings,
just to avoid confusion.

Regards
Andrzej

>> If you want to stay with separate node please consider to make it
>> optional as whole node or make some properties required. Making node
>> required with all sub-properties optional is weird.
>> By the way I hope all timings properties are generic for CPU mode,
>> if not they should be prefixed by vendor or model.
> The timings description should be pretty generic I believe, especially given 
> that the interface is standardized by the MIPI alliance. Could you have a 
> quick look at the spec and share your opinion ?
>
>>> +
>>> +Optional properties:
>>> +
>>> +The device node can contain one 'port' child node with one child
>>> +'endpoint' node, according to the bindings defined in [2]. This
>>> +node should describe panel's video bus.
>>> +
>>> +[1]: Documentation/devicetree/bindings/video/display-timing.txt
>>> +[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
>>> +
>>> +Example:
>>> +
>>> +	panel@0 {
>>> +		compatible = "samsung,s6e3fa0";
>>> +		reg = <0>;
>>> +		vdd3-supply = <&vcclcd_reg>;
>>> +		vci-supply = <&vlcd_reg>;
>>> +		reset-gpio = <&gpy7 4 0>;
>>> +		det-gpio = <&gpg0 6 0>;
>>> +		te-gpio = <&gpd1 7 0>;
>>> +
>>> +		display-timings {
>>> +			timing0: timing-0 {
>>> +				clock-frequency = <0>;
>>> +				hactive = <1080>;
>>> +				vactive = <1920>;
>>> +				hfront-porch = <2>;
>>> +				hback-porch = <2>;
>>> +				hsync-len = <1>;
>>> +				vfront-porch = <1>;
>>> +				vback-porch = <4>;
>>> +				vsync-len = <1>;
>>> +			};
>>> +		};
>>> +
>>> +		cpu-timings {
>>> +			cs-setup = <0>;
>>> +			wr-setup = <0>;
>>> +			wr-act = <1>;
>>> +			wr-hold = <0>;
>>> +		};
>>> +	};
