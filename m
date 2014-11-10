From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: Fix booting on Rinato market device
Date: Mon, 10 Nov 2014 10:03:03 +0900
Message-ID: <54600EC7.4020008@samsung.com>
References: <1415360662-30390-1-git-send-email-k.kozlowski@samsung.com>
 <545CB220.9030007@samsung.com> <1415361564.31102.2.camel@AMDC1943>
 <004701cffb3d$1edef9e0$5c9ceda0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29942 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751538AbaKJBDI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Nov 2014 20:03:08 -0500
In-reply-to: <004701cffb3d$1edef9e0$5c9ceda0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'BartlomiejZolnierkiewicz' <b.zolnierkie@samsung.com>

Dear Kukjin,

On 11/08/2014 07:16 PM, Kukjin Kim wrote:
> Krzysztof Kozlowski wrote:
>>
>> On pi=C4=85, 2014-11-07 at 20:50 +0900, Chanwoo Choi wrote:
>>> Hi Krzysztof,
>>>
>>> On 11/07/2014 08:44 PM, Krzysztof Kozlowski wrote:
>>>> The bootloader on market Rinato (Gear 2) device checks for revisio=
n in
>>>> compatible field of DTB. If it is not present or lower than requir=
ed
>>>> then booting fails with: "Could not do normal boot. (no DTB found)=
".
>>>>
>>>> Log of bootloader in case of failure:
>>>> h/w: revision  =3D 0x06
>>>> h/w: schematic =3D SM-R380_Rev0.5_Final_0205
>>>> date =3D 2000/01/01 12:00:21 (UTC)
>>>> cmu_div:4, div:5, src_clk:800000000, pixel_clk:31860720
>>>> load_kernel: loading boot image from 57344.. (BOOT)
>>>> load_kernel: found zImage, size: 0x3267e8
>>>> 0xbc Error!
>>>> Verify_Binary_Signature: failed.
>>>> pit_check_signature (BOOT) invalid.
>>>> load_kernel: found custom kernel (ret:-2147483647)
>>>>  No need to update kernel type.
>>>> Detected board: samsung,rinato-rev06
>>>> Could not do normal boot. (no DTB found)
>>>> : Entering usb mode for SM-R380_EUR_XX (65535)..
>>>>
>>>> Add a "rev06" suffix to compatible to satisfy the bootloader.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>> ---
>>>>  arch/arm/boot/dts/exynos3250-rinato.dts | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/bo=
ot/dts/exynos3250-rinato.dts
>>>> index 84380fa13e37..f72ba0a1d915 100644
>>>> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
>>>> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
>>>> @@ -18,7 +18,8 @@
>>>>
>>>>  / {
>>>>  	model =3D "Samsung Rinato board";
>>>> -	compatible =3D "samsung,rinato", "samsung,exynos3250", "samsung,=
exynos3";
>>>> +	compatible =3D "samsung,rinato", "samsung,rinato-rev06",
>>>> +			"samsung,exynos3250", "samsung,exynos3";
>>>
>>> I think it is wrong. The released bootloader from Samsung is not u-=
boot.
>>> Instead, you have to update u-boot to support Exynos3250-basd Rinat=
o board.
>>
>> The bootloader on device also was not a u-boot. So the fix is for na=
tive
>> bootloader delivered on device.
>>
>> I do not insist that this is proper fix. It was just needed to boot =
the
>> device with custom kernel.
>>
>> Anyway, thanks for comments!
>>
> Hi Krzysztof and Chanwoo,
>=20
> So, we don=E2=80=99t need this to fix the problem Krzysztof said? OK.

Yes.
The released bootloader from Samsung is not general and not opened.
We have to support Exynos3250-based Rinato on general bootloader.

Beset Regards,
Chanwoo Choi
