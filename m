From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 05/10] ARM: dts: Add exynos3250-artik5 dtsi file for ARTIK5
 module
Date: Mon, 14 Mar 2016 16:22:30 +0900
Message-ID: <56E666B6.7060701@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-6-git-send-email-cw00.choi@samsung.com>
 <56E65D5D.8060702@samsung.com> <56E660F1.3060407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <56E660F1.3060407@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 15:57, Chanwoo Choi wrote:
> Hi Krzysztof,
>=20
> On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 15:42, Krzysztof Kozlowski w=
rote:
>> On 14.03.2016 11:04, Chanwoo Choi wrote:
>>> This patch adds the support for Device Tree source for Samsung ARTI=
K5 module[1]
>>> based on Exynos3250 SoC. The ARTIK5 module includes the follwoing d=
evices:
>>> - Application Processor (Samsung Exynos3250)
>>> - WiFi/BT Combo chip (Broadcom4354)
>>> - PMIC (Samsung S2MPS14)
>>> - eMMC (4GB)
>>> - DRAM LPDDR3 (512MB)
>>> - Connectors pin (60 Pins x 3 set)
>>>
>>> Also, this patch adds the ARTIK5 development board[2] dts file whic=
h includes
>>> the ARTIK5 module[1] and have the devices such as sound codec, sd c=
ard port,
>>> ethernet port, uart port and so on.
>>>
>>> [1] https://www.artik.io/hardware/artik-5
>>> [2] http://www.digikey.com/product-search/en?FV=3Dffecca14
>>>
>>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>>> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
>>> ---
>>>  arch/arm/boot/dts/Makefile                    |   1 +
>>>  arch/arm/boot/dts/exynos3250-artik5-devel.dts |  26 +++
>>>  arch/arm/boot/dts/exynos3250-artik5.dtsi      | 282 ++++++++++++++=
++++++++++++
>>
>> Plus changes in
>> Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt.

OK.
Also, I'll change the board name from 'artik5-devel' to 'artik5-eval'.

[snip]

Best Regards,
Chanwoo Choi
