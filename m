From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 1/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Sun, 1 Nov 2015 17:15:44 +0900
Message-ID: <5635CA30.8070901@samsung.com>
References: <cover.1446122247.git.p.fedin@samsung.com>
 <f1fbd1a7877090f4318705f0fccbf4d96c0ebc9c.1446122247.git.p.fedin@samsung.com>
 <56330E6E.50003@samsung.com> <00a101d112e0$537a18e0$fa6e4aa0$@samsung.com>
 <56331ADB.1070602@samsung.com>
 <CAL_JsqKhyB7d+HQ08241-za-7vHbU49TiWJHM2vrp6jVVh4h=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:33581 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751047AbbKAIPu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Nov 2015 03:15:50 -0500
In-Reply-To: <CAL_JsqKhyB7d+HQ08241-za-7vHbU49TiWJHM2vrp6jVVh4h=A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: k.kozlowski.k@gmail.com, Pavel Fedin <p.fedin@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>

W dniu 31.10.2015 o 02:15, Rob Herring pisze:
> On Fri, Oct 30, 2015 at 2:23 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> On 30.10.2015 15:58, Pavel Fedin wrote:
>>>  Hello!
>>>
>>>>> Add documentation for new subnode properties, allowing bank configuration.
>>>>> Based on u-boot implementation, but heavily reworked.
>>>>
>>>> Please, carefully look at:
>>>> Documentation/devicetree/bindings/net/gpmc-eth.txt
>>>> Documentation/devicetree/bindings/bus/ti-gpmc.txt
>>>
>>>  Thank you very much. Indeed, this looks very similar. By the way, should i document smsc over sromc in the same manner, writing
>>> devicetree/bindings/net/sromc-eth.txt?
>>>
>>>  This is a short reply for now, i'll make longer one (or just a new version) after studying these existing bindings and trying to
>>> apply them.
>>
>> Existing SROMC bindings document is small so one document for everything
>> should be sufficient. This can be always split if new type of devices
>> will be using SROMC (BTW, do you know of any other devices using SROMC
>> on Exynos?).
>>
>>>
>>>  Pankaj:
>>>
>>>>> +&sromc {
>>>>> +       pinctrl-names = "default";
>>>>> +       pinctrl-0 = <&srom_ctl>, <&srom_ebi>;
>>>>> +
>>>>> +       ethernet@07000000 {
>>>>> +               compatible = "smsc,lan9115";
>>>>> +               reg = <0x07000000 0x10000>;
>>>>> +               phy-mode = "mii";
>>>>> +               interrupt-parent = <&gpx0>;
>>>>> +               interrupts = <5 8>;
>>>>> +               reg-io-width = <2>;
>>>>> +               smsc,irq-push-pull;
>>>>> +               smsc,force-internal-phy;
>>>>> +
>>>>> +               samsung,srom-bank = <3>;
>>>>> +               samsung,srom-data-width = <2>;
>>>>> +               samsung,srom-timing = <1 9 12 1 9 1 1>;
>>>>
>>>> I think this is not correct. We can't change binding of "smsc,lan9115"
>>>> which is already documented here [1]. These samsung specific srom
>>>> properties should be in srom node or its subnode, but not in this way.
>>>
>>>  So, if you look at gpmc-eth.txt, you'll see that this approach is perfectly valid (this is a reply to another msg, just don't want
>>> to post one more single-line reply).
>>
>>
>> Yes, the binding of smsc,lan9115 is not changed.
>>
>> Putting srom properties in separate bank node would be good also but
>> then some mapping (connection) between ethernet and bank should be added
>> probably...
> 
> Is this to get some data needed by the ethernet from the ROM? We have
> the nvmem binding to support that.

No, this does not act like nvram driver. It is rather a memory
controller. The same as existing TI GPMC:
Documentation/devicetree/bindings/net/gpmc-eth.txt
although configuration is different so gpmc driver cannot be reused.

Best regards,
Krzysztof
