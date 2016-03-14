From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 09/10] ARM: dts: Add MSHC2 dt node for SD card for
 exynos3250-artik5-devel board
Date: Mon, 14 Mar 2016 19:22:34 +0900
Message-ID: <56E690EA.50205@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-11-git-send-email-cw00.choi@samsung.com>
 <56E676EE.8060500@samsung.com> <56E67AE0.9060306@samsung.com>
 <56E687E6.3070305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51393 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932AbcCNKWh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 06:22:37 -0400
In-reply-to: <56E687E6.3070305@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 18:44, Krzysztof Kozlowski wro=
te:
> On 14.03.2016 17:48, Chanwoo Choi wrote:
>> On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 17:31, Krzysztof Kozlowski =
wrote:
>>> On 14.03.2016 11:04, Chanwoo Choi wrote:
>>>> From: Jaehoon Chung <jh80.chung@samsung.com>
>>>>
>>>> This patch adds MSHC (Mobile Storage Host Controller) dt node for
>>>> Exynos3250 SoC. MSHC is an interface between the system and the SD=
 card
>>>>
>>>> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
>>>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>>>> ---
>>>>  arch/arm/boot/dts/exynos3250-artik5-devel.dts | 16 ++++++++++++++=
++
>>>>  1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos3250-artik5-devel.dts b/arch/=
arm/boot/dts/exynos3250-artik5-devel.dts
>>>> index d17c28969118..a371baf8536d 100644
>>>> --- a/arch/arm/boot/dts/exynos3250-artik5-devel.dts
>>>> +++ b/arch/arm/boot/dts/exynos3250-artik5-devel.dts
>>>> @@ -21,6 +21,22 @@
>>>>  			"samsung,exynos3250", "samsung,exynos3";
>>>>  };
>>>> =20
>>>> +&mshc_2 {
>>>> +	num-slots =3D <1>;
>>>> +	cap-sd-highspeed;
>>>> +	disable-wp;
>>>> +	card-detect-delay =3D <200>;
>>>> +	clock-frequency =3D <100000000>;
>>>> +	clock-freq-min-max =3D <400000 100000000>;
>>>> +	samsung,dw-mshc-ciu-div =3D <1>;
>>>> +	samsung,dw-mshc-sdr-timing =3D <0 1>;
>>>> +	samsung,dw-mshc-ddr-timing =3D <1 2>;
>>>> +	pinctrl-names =3D "default";
>>>> +	pinctrl-0 =3D <&sd2_cmd &sd2_clk &sd2_cd &sd2_bus1 &sd2_bus4>;
>>>> +	bus-width =3D <4>;
>>>> +	status =3D "okay";
>>>
>>> vqmmc-supply =3D ldo3?
>>
>> ldo3 is always on state because ldo3 is used for various IP in exyno=
s3250.
>> I think that we had better to remain always on state for ldo3.
>=20
> Yes, I wasn't thinking about toggling ldo3 but about taking the
> regulator here to model the dependencies between components.

Okay. I'll add it as following:

	vmmc-supply =3D <&ldo18_reg>;
	vqmmc-supply =3D <&ldo3>;


Best Regards,
Chanwoo Choi
