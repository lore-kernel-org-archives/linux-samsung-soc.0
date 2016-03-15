From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 09/10] ARM: dts: Add MSHC2 dt node for SD card for
 exynos3250-artik5-devel board
Date: Tue, 15 Mar 2016 10:45:14 +0900
Message-ID: <56E7692A.1020407@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-11-git-send-email-cw00.choi@samsung.com>
 <56E676EE.8060500@samsung.com> <56E67AE0.9060306@samsung.com>
 <56E687E6.3070305@samsung.com> <56E690EA.50205@samsung.com>
 <56E7567B.40301@samsung.com> <56E75DC1.7000807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <56E75DC1.7000807-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2016=EB=85=84 03=EC=9B=94 15=EC=9D=BC 09:56, Jaehoon Chung wrote:
> On 03/15/2016 09:25 AM, Krzysztof Kozlowski wrote:
>> On 14.03.2016 19:22, Chanwoo Choi wrote:
>>> On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 18:44, Krzysztof Kozlowski=
 wrote:
>>>> On 14.03.2016 17:48, Chanwoo Choi wrote:
>>>>> On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 17:31, Krzysztof Kozlows=
ki wrote:
>>>>>> On 14.03.2016 11:04, Chanwoo Choi wrote:
>>>>>>> From: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>>>>
>>>>>>> This patch adds MSHC (Mobile Storage Host Controller) dt node f=
or
>>>>>>> Exynos3250 SoC. MSHC is an interface between the system and the=
 SD card
>>>>>>>
>>>>>>> Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>>>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>>>> ---
>>>>>>>  arch/arm/boot/dts/exynos3250-artik5-devel.dts | 16 +++++++++++=
+++++
>>>>>>>  1 file changed, 16 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm/boot/dts/exynos3250-artik5-devel.dts b/ar=
ch/arm/boot/dts/exynos3250-artik5-devel.dts
>>>>>>> index d17c28969118..a371baf8536d 100644
>>>>>>> --- a/arch/arm/boot/dts/exynos3250-artik5-devel.dts
>>>>>>> +++ b/arch/arm/boot/dts/exynos3250-artik5-devel.dts
>>>>>>> @@ -21,6 +21,22 @@
>>>>>>>  			"samsung,exynos3250", "samsung,exynos3";
>>>>>>>  };
>>>>>>> =20
>>>>>>> +&mshc_2 {
>>>>>>> +	num-slots =3D <1>;
>>>>>>> +	cap-sd-highspeed;
>>>>>>> +	disable-wp;
>>>>>>> +	card-detect-delay =3D <200>;
>>>>>>> +	clock-frequency =3D <100000000>;
>>>>>>> +	clock-freq-min-max =3D <400000 100000000>;
>>>>>>> +	samsung,dw-mshc-ciu-div =3D <1>;
>>>>>>> +	samsung,dw-mshc-sdr-timing =3D <0 1>;
>>>>>>> +	samsung,dw-mshc-ddr-timing =3D <1 2>;
>>>>>>> +	pinctrl-names =3D "default";
>>>>>>> +	pinctrl-0 =3D <&sd2_cmd &sd2_clk &sd2_cd &sd2_bus1 &sd2_bus4>=
;
>>>>>>> +	bus-width =3D <4>;
>>>>>>> +	status =3D "okay";
>>>>>>
>>>>>> vqmmc-supply =3D ldo3?
>>>>>
>>>>> ldo3 is always on state because ldo3 is used for various IP in ex=
ynos3250.
>>>>> I think that we had better to remain always on state for ldo3.
>>>>
>>>> Yes, I wasn't thinking about toggling ldo3 but about taking the
>>>> regulator here to model the dependencies between components.
>>>
>>> Okay. I'll add it as following:
>>>
>>> 	vmmc-supply =3D <&ldo18_reg>;
>>> 	vqmmc-supply =3D <&ldo3>;
>>
>> ldo18 is not used by mshc2. At least my schematics show that LDO3 go=
es
>> to DVDD_MMC2 (on different board revision that would be ldo18 instea=
d of
>> ldo3, but not both).

ARTIK5 schema document VLDO18 and VLDO3 are connected to DVDD_MMC2_AP.
But, I'm not sure what is meaning. So, I'll drop the 'vmmc-supply'

>=20
> It's confusing..but it seems that Krzysztof's opinion is right.
>=20
> Best Regards,
> Jaehoon Chung
>=20
>>
>> The card itself is powered by VDDFLASH_28/MAIN_BAT.

You're right.

OK, I'll modify it with only vqmmc-supply =3D <&ldo3>;

Best Regards,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
