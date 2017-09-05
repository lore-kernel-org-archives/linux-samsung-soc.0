From: Maciej Purski <m.purski@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: add Silicon Image SiI9234 driver
Date: Tue, 05 Sep 2017 15:01:54 +0200
Message-ID: <b8df49d4-4636-f52e-c974-699a8a81872a@samsung.com>
References: <1504182434-8201-1-git-send-email-m.purski@samsung.com>
        <CGME20170831122745eucas1p27a178da2e30023292c57653a8dc45813@eucas1p2.samsung.com>
        <1504182434-8201-2-git-send-email-m.purski@samsung.com>
        <2326944.Wi9TMObRze@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35478 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751236AbdIENB7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 09:01:59 -0400
In-reply-to: <2326944.Wi9TMObRze@avalon>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com, krzk@kernel.org, robh+dt@kernel.org, Andrzej Hajda <a.hajda@samsung.com>

Hi Laurent,

Thank you for your reply. The problem was already discussed when adding sil8620 driver.
It can be solved later. I'm CC-ing Andrzej Hajda, as he used to discuss it with you.

https://patchwork.freedesktop.org/patch/114224/
https://lists.freedesktop.org/archives/dri-devel/2015-December/096756.html

Regards,

	Maciej

On 31/08/17 15:30, Laurent Pinchart wrote:

> Hi Maciej,
>
> Thank you for the patch.
>
> On Thursday, 31 August 2017 15:27:13 EEST Maciej Purski wrote:
>> SiI9234 transmitter converts eTMDS/HDMI signal to MHL 1.0.
>> It is controlled via I2C bus. Its interaction with other
>> devices in video pipeline is performed mainly on HW level.
>> The only interaction it does on device driver level is
>> filtering-out unsupported video modes, it exposes drm_bridge
>> interface to perform this operation.
>>
>> This patch is based on the code refactored by Tomasz Stanislawski
>> <t.stanislaws@samsung.com>, which was initially developed by:
>> Adam Hampson <ahampson@sta.samsung.com>
>> Erik Gilling <konkers@android.com>
>> Shankar Bandal <shankar.b@samsung.com>
>> Dharam Kumar <dharam.kr@samsung.com>
>>
>> Signed-off-by: Maciej Purski <m.purski@samsung.com>
>> ---
>> Changes in v2:
>> - use bulk_requlators instead of single one
>> - substitute some of the magic values with macros
>> - improve coding style
>> - improved error handling in sii9234_probe()
>> ---
>>   .../devicetree/bindings/display/bridge/sii9234.txt |  34 +
>>   drivers/gpu/drm/bridge/Kconfig                     |   8 +
>>   drivers/gpu/drm/bridge/Makefile                    |   1 +
>>   drivers/gpu/drm/bridge/sii9234.c                   | 993 ++++++++++++++++++
>>   4 files changed, 1036 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/display/bridge/sii9234.txt create mode
>> 100644 drivers/gpu/drm/bridge/sii9234.c
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/sii9234.txt
>> b/Documentation/devicetree/bindings/display/bridge/sii9234.txt new file
>> mode 100644
>> index 0000000..3ce7413
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/sii9234.txt
>> @@ -0,0 +1,34 @@
>> +Silicon Image SiI9234 HDMI/MHL bridge bindings
>> +
>> +Required properties:
>> +	- compatible : "sil,sii9234".
>> +	- reg : I2C address for TPI interface, use 0x39
>> +	- avcc33-supply : MHL/USB Switch Supply Voltage (3.3V)
>> +	- iovcc18-supply : I/O Supply Voltage (1.8V)
>> +	- avcc12-supply : TMDS Analog Supply Voltage (1.2V)
>> +	- cvcc12-supply : Digital Core Supply Voltage (1.2V)
>> +	- interrupts, interrupt-parent: interrupt specifier of INT pin
>> +	- reset-gpios: gpio specifier of RESET pin (active low)
>> +	- video interfaces: Device node can contain video interface port
>> +			    node for HDMI encoder according to [1].
>> +
>> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> Doesn't this chip have two ports, one input connected to the SoC and one
> output connected to an HDMI connector ? If so there should be two ports in DT
> too.
>
>> +Example:
>> +	sii9234@39 {
>> +		compatible = "sil,sii9234";
>> +		reg = <0x39>;
>> +		avcc33-supply = <&vcc33mhl>;
>> +		iovcc18-supply = <&vcc18mhl>;
>> +		avcc12-supply = <&vsil12>;
>> +		cvcc12-supply = <&vsil12>;
>> +		reset-gpios = <&gpf3 4 GPIO_ACTIVE_LOW>;
>> +		interrupt-parent = <&gpf3>;
>> +		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +		port {
>> +			mhl_to_hdmi: endpoint {
>> +				remote-endpoint = <&hdmi_to_mhl>;
> It would be useful to include the remote DT nodes in the example too.
>
>> +			};
>> +		};
>> +	};
