From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [RFC v3 PATCH v6 11/16] ARM: dts: s6e3fa0: add DT bindings
Date: Wed, 07 May 2014 10:05:46 +0900
Message-ID: <536986EA.2050103@samsung.com>
References: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
 <1398563412-21781-12-git-send-email-yj44.cho@samsung.com>
 <53676965.4020800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <53676965.4020800@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej

Thank you for comments.

On 05/05/2014 07:35 PM, Andrzej Hajda wrote:
> On 04/27/2014 03:50 AM, YoungJun Cho wrote:
>> This patch adds DT bindings for s6e3fa0 panel.
>> The bindings describes panel resources, display timings and cpu mode timings.
>>
>> Changelog v2:
>> - Adds unit address (commented by Sachin Kamat)
>> Changelog v3:
>> - Removes optional delay, size properties (commented by Laurent Pinchart)
>> - Adds OLED detection, TE gpio properties
>> Changelog v4:
>> - Moves CPU timings relevant properties from FIMD DT
>>    (commeted by Laurent Pinchart, Andrzej Hajda)
>> Changelog v5:
>> - Fixes gpio property names (commented by Andrzej Hajda)
>> Changelog v6:
>> - Renames CPU timings to CPU mode timings
>> - Modifies CPU mode timings internal properties relevant things
>>    (commeted by Laurent Pinchart, Andrzej Hajda)
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Acked-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   68 ++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
>>
>> diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
>> new file mode 100644
>> index 0000000..9f06645
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
>> @@ -0,0 +1,68 @@
>> +Samsung S6E3FA0 AMOLED LCD 5.7 inch panel
>> +
>> +Required properties:
>> +  - compatible: "samsung,s6e3fa0"
>> +  - reg: the virtual channel number of a DSI peripheral
>> +  - vdd3-supply: core voltage supply
>> +  - vci-supply: voltage supply for analog circuits
>> +  - reset-gpios: a GPIO spec for the reset pin
>> +  - det-gpios: a GPIO spec for the OLED detection pin
>> +  - te-gpios: a GPIO spec for the TE pin
>> +  - display-timings: timings for the connected panel as described by [1]
>
> This still bothers me, it forces users to provide bunch of fake
> properties (four porches, two syncs and clock-frequency) just because we
> need to pass somehow pixel width and height. And do we really need pixel
> dimension to be passed via DT? I guess it could be:
> - hardcoded into the driver,
> - derived from the panel id,
> - maybe read from the panel, this is the best option I guess but I am
> not sure if panel provides an API for this.
>

I have been trying to only use cpu-mode-timings without display-timings 
for next RFC v4.

As you mentioned, the only required things in display-timings are 
clock-frequency, hactive and vactive.
I put them into cpu-mode-timings, but strictly speaking, 
cpu-mode-timings is not related with display timing, it is data 
transmission mode switch timing.
And there is no interface for this in drm (display) mode yet.
So I'm not sure what is the generic method to treat them.

Thank you.
Best regards YJ

> Regards
> Andrzej
>
>
>> +  - cpu-mode-timings: CPU interface timings for the connected panel,
>> +      and it contains following properties.
>> +        Required properties:
>> +          - wr-active: clock cycles for the active period of CS enable in CPU
>> +              interface.
>> +        Optional properties:
>> +          - cs-setup: clock cycles for the active period of address signal
>> +              enable until chip select is enable in CPU interface.
>> +              If not specified, the default value(0) will be used.
>> +          - wr-setup: clock cycles for the active period of CS signal enable
>> +              until write signal is enable in CPU interface.
>> +              If not specified, the default value(0) will be used.
>> +          - wr-hold: clock cycles for the active period of CS disable until
>> +              write signal is disable in CPU interface.
>> +              If not specified, the default value(0) will be used.
>> +
>> +Optional properties:
>> +
>> +The device node can contain one 'port' child node with one child 'endpoint'
>> +node, according to the bindings defined in [2]. This node should describe
>> +panel's video bus.
>> +
>> +[1]: Documentation/devicetree/bindings/video/display-timing.txt
>> +[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
>> +
>> +Example:
>> +
>> +	panel@0 {
>> +		compatible = "samsung,s6e3fa0";
>> +		reg = <0>;
>> +		vdd3-supply = <&vcclcd_reg>;
>> +		vci-supply = <&vlcd_reg>;
>> +		reset-gpios = <&gpy7 4 0>;
>> +		det-gpios = <&gpg0 6 0>;
>> +		te-gpios = <&gpd1 7 0>;
>> +
>> +		display-timings {
>> +			timing0: timing-0 {
>> +				clock-frequency = <0>;
>> +				hactive = <1080>;
>> +				vactive = <1920>;
>> +				hfront-porch = <2>;
>> +				hback-porch = <2>;
>> +				hsync-len = <1>;
>> +				vfront-porch = <1>;
>> +				vback-porch = <4>;
>> +				vsync-len = <1>;
>> +			};
>> +		};
>> +
>> +		cpu-mode-timings {
>> +			cs-setup = <0>;
>> +			wr-setup = <0>;
>> +			wr-active = <1>;
>> +			wr-hold = <0>;
>> +		};
>> +	};
>>
>
>
