From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 04/10] ARM: dts: Add MSHC2 dt node for Exynos3250 SoC
Date: Mon, 14 Mar 2016 17:28:34 +0900
Message-ID: <56E67632.30602@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-5-git-send-email-cw00.choi@samsung.com>
 <56E658AE.5070806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50082 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752069AbcCNI2r convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 04:28:47 -0400
In-reply-to: <56E658AE.5070806@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 15:22, Krzysztof Kozlowski wro=
te:
> On 14.03.2016 11:04, Chanwoo Choi wrote:
>> This patch adds the MSHC2 (Mobile Storage Host Controller) Device Tr=
ee node for
>> Exynos3250 SoC.
>>
>> Cc: Kukjin Kim <kgene@kernel.org>
>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 35 ++++++++++++++++++++=
+++++++++++
>>  arch/arm/boot/dts/exynos3250.dtsi         | 13 ++++++++++++
>>  2 files changed, 48 insertions(+)
>=20
>=20
> After looking at your other patch ("ARM: dts: Add initial pin
> configuration for exynos3250-rinato") I have doubts. The Monk will be
> affected.

You're right. On monk board, this line may be not stable.

>=20
> Here you are configuring all the gpk2 GPIOS for EMMC2 mode. Then on
> Rinato you are setting it back to default non-used state. However the
> Monk board will remain with this new configuration... so you would ha=
ve
> to add initial-state also for Monk.

OK. I'll do it.

>=20
> But how about doing opposite? Configure here the pins to unused state
> and enable them only for Artik board?
>=20
> What do you think?

I think that gpk2-[0~6] pins are fixed for MMC2 device.
So, it is good to add the pin setting for gpk2-[0~6] to exynos3250-pinc=
trl.dtsi.

If mmc2 device is not used like rinato and monk board,
we should add the initial setting as NC (not connected) pin state
as other patch (ARM: dts: Add initial pin configuration for exynos3250-=
rinato).

Best Regards,
Chanwoo Choi
