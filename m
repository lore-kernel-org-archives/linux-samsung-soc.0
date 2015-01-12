From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: add fimd device support for exynos3250-rinato
Date: Mon, 12 Jan 2015 18:12:26 +0900
Message-ID: <54B38FFA.9060103@kernel.org>
References: <1417174791-7339-1-git-send-email-inki.dae@samsung.com> <1417174791-7339-2-git-send-email-inki.dae@samsung.com> <54A7914D.5080601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34753 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751859AbbALJMg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jan 2015 04:12:36 -0500
In-Reply-To: <54A7914D.5080601@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, airlied@linux.ie, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, kgene.kim@samsung.com, thierry.reding@gmail.com

On 01/03/15 15:50, Inki Dae wrote:
> On 2014=EB=85=84 11=EC=9B=94 28=EC=9D=BC 20:39, Inki Dae wrote:
>> This patch adds fimd device node which is a display controller
>> for Exynos3250 Rinato board.
>=20
> Hi Kukjin,
>=20
> Please, ping~
>=20
> Thanks,
> Inki Dae
>=20
>>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos3250-rinato.dts |   11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot=
/dts/exynos3250-rinato.dts
>> index 80aa8b4..79aa916 100644
>> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
>> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
>> @@ -125,6 +125,17 @@
>>  	};
>>  };
>> =20
>> +&fimd {
>> +	status =3D "okay";
>> +
>> +	i80-if-timings {
>> +		cs-setup =3D <0>;
>> +		wr-setup =3D <0>;
>> +		wr-act =3D <1>;
>> +		wr-hold =3D <0>;
>> +	};
>> +};
>> +
>>  &i2c_0 {
>>  	#address-cells =3D <1>;
>>  	#size-cells =3D <0>;
>>

Applied this and 3rd one.
BTW, I can't see the "samsung,s6e63j0x03" support yet?

- Kukjin
