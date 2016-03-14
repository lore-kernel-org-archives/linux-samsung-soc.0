From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 06/10] ARM: dts: Add MSHC0 dt node for eMMC device for
 exynos3250-artik5 module
Date: Mon, 14 Mar 2016 18:59:45 +0900
Message-ID: <56E68B91.3080906@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-7-git-send-email-cw00.choi@samsung.com>
 <56E660D2.9090706@samsung.com> <56E67319.1050502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32160 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964805AbcCNJ7x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 05:59:53 -0400
In-reply-to: <56E67319.1050502@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 14.03.2016 17:15, Chanwoo Choi wrote:
> On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 15:57, Krzysztof Kozlowski w=
rote:
>> On 14.03.2016 11:04, Chanwoo Choi wrote:
>>> From: Jaehoon Chung <jh80.chung@samsung.com>
>>>
>>> This patch adds MSHC (Mobile Storage Host Controller) dt node for E=
xynos3250
>>> SoC. MSHC is an interface between the system and the eMMC device.
>>>
>>> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
>>> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
>>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>>> ---
>>>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/bo=
ot/dts/exynos3250-artik5.dtsi
>>> index 97d0087efb9f..75b291c10cdc 100644
>>> --- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
>>> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
>>> @@ -277,6 +277,25 @@
>>>  	};
>>>  };
>>> =20
>>> +&mshc_0 {
>>> +	num-slots =3D <1>;
>>> +	broken-cd;
>>> +	non-removable;
>>
>> Broken or non-removable, not both.
>=20
> I'll remove the 'broken-cd' property.
>=20
>>
>>> +	cap-mmc-highspeed;
>>> +	desc-num =3D <4>;
>>> +	card-detect-delay =3D <200>;
>>> +	vmmc-supply =3D <&ldo11_reg>;
>>
>> Isn't this vqmmc-supply?
>=20
> I'll fix it as following by using ldo12_reg:
> 	vmmc-supply =3D <&ldo12_reg>;

Sure, looks good.

>=20
>>
>> BTW, both MMC0 regulators (ldo11, ldo12) are marked as always-on. Wh=
y
>> they cannot be controlled by XMMC0CDN (just like on Rinato)?
>=20
> I'll fix it like rinato board to handle the ldo11/ldo12 as following:
> gpk0-2 is XMMC0CDN pin.

Great! Thanks,
Krzysztof
