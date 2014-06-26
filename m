From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: exynos4412-odroidx: add support for USB
 (phy, host, device)
Date: Thu, 26 Jun 2014 08:07:00 +0200
Message-ID: <53ABB884.8040209@samsung.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
 <1403702773-9141-4-git-send-email-m.szyprowski@samsung.com>
 <CAFp+6iHScs_wycE9XcDN46xg_N8hYf_BtJKNdtUVwg36sfZqMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50134 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109AbaFZGHE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 02:07:04 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7R002IOIBK5I00@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jun 2014 07:06:56 +0100 (BST)
In-reply-to: <CAFp+6iHScs_wycE9XcDN46xg_N8hYf_BtJKNdtUVwg36sfZqMA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

Hello,

On 2014-06-25 15:58, Vivek Gautam wrote:
> On Wed, Jun 25, 2014 at 6:56 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> From: Kamil Debski <k.debski@samsung.com>
>>
>> This patch adds basic support for USB modules (host and device) on
>> OdroidX board.
>>
>> Signed-off-by: Kamil Debski <k.debski@samsung.com>
>> [removed incorrect port@2 node]
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos4412-odroidx.dts | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
>> index fda9ac23dd55..4c853fbf7202 100644
>> --- a/arch/arm/boot/dts/exynos4412-odroidx.dts
>> +++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
>> @@ -148,6 +148,16 @@
>>                  pinctrl-names = "default";
>>                  status = "okay";
>>
>> +               usb3503@08 {
>> +                       compatible = "smsc,usb3503";
>> +                       reg = <0x08>;
>> +
>> +                       intn-gpios = <&gpx3 0 0>;
>> +                       connect-gpios = <&gpx3 4 0>;
>> +                       reset-gpios = <&gpx3 5 0>;
>> +                       initial-mode = <1>;
>> +               };
>> +
>>                  max77686: pmic@09 {
>>                          compatible = "maxim,max77686";
>>                          reg = <0x09>;
>> @@ -338,4 +348,21 @@
>>                          };
>>                  };
>>          };
>> +
>> +       exynos-usbphy@125B0000 {
>> +               status = "okay";
>> +       };
>> +
>> +       hsotg@12480000 {
>> +               status = "okay";
>> +               vusb_d-supply = <&ldo15_reg>;
>> +               vusb_a-supply = <&ldo12_reg>;
> Can you please point me to the documentation for these two properties
> in the DT bindings ?

Documentation/devicetree/bindings/usb/samsung-hsotg.txt:
- vusb_d-supply: phandle to voltage regulator of digital section,
- vusb_a-supply: phandle to voltage regulator of analog section.

> Which tree i should grep to find that ?

Support for vusb_d and vusb_a regulators is already in s3c-hsotg driver
(now a part of dwc2/gadget driver) since v3.5.

> We have similar supplies for ehci/ohci and other host controllers too,
> so just wondering
> if we can use similar nomenclature for hsotg as well as host.
>
> I have posted driver side patches for host (with DT documentation) a
> while back :
> https://lkml.org/lkml/2014/6/25/363

Ok, I will take a look into your patches, but I'm not sure if it makes
sense to change the s3c-hsotg bindings now.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
