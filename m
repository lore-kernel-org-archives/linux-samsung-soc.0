From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [PATCH v6 09/14] ARM: dts: s6e3fa0: add DT bindings
Date: Fri, 18 Jul 2014 11:00:08 +0900
Message-ID: <53C87FA8.3070303@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
 <1405587689-1466-10-git-send-email-yj44.cho@samsung.com>
 <20140717103844.GE17877@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47004 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751093AbaGRCAL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 22:00:11 -0400
In-reply-to: <20140717103844.GE17877@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

Hi Thierry,

On 07/17/2014 07:38 PM, Thierry Reding wrote:
> On Thu, Jul 17, 2014 at 06:01:24PM +0900, YoungJun Cho wrote:
>> This patch adds DT bindings for s6e3fa0 panel.
>> The bindings describes panel resources and display timings.
>
> The commit message here should preferably say which platform this is
> used on.

Although only exynos drm could use this panel now, I think this panel 
could be used by any platform.
Do you have any good idea for that?

>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Acked-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   .../devicetree/bindings/panel/samsung,s6e3fa0.txt  | 46 ++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
>>
>> diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
>> new file mode 100644
>> index 0000000..2cd32f5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
>> @@ -0,0 +1,46 @@
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
> display-timings should be optional. The panel driver should provide a
> default mode. And only if you really need to override the default mode
> you should provide the option of getting an alternative set of values
> from DT.

Could you explain why this display-timings should be optional?
Most of DTs regard display-timings as required property.

Thank you.
Best regards YJ

>
> Thierry
>
