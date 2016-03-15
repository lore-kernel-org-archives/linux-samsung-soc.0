From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 0/7] ARM: dts: Add new Exynos3250-based ARTIK5 module
 dtsi file
Date: Tue, 15 Mar 2016 11:39:50 +0900
Message-ID: <56E775F6.5060004@samsung.com>
References: <1458007695-3627-1-git-send-email-cw00.choi@samsung.com>
 <56E774DE.4030200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50831 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932942AbcCOCjy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 22:39:54 -0400
In-reply-to: <56E774DE.4030200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 2016=EB=85=84 03=EC=9B=94 15=EC=9D=BC 11:35, Krzysztof Kozlowski wro=
te:
> On 15.03.2016 11:08, Chanwoo Choi wrote:
>> This patchset add the support for Device Tree source for Samsung ART=
IK5 module[1]
>> based on Exynos3250 SoC and development board[2]. The ARTIK5 module =
includes
>> the follwoing devices:
>> - Application Processor (Samsung Exynos3250)
>> - WiFi/BT Combo chip
>> - PMIC (Samsung S2MPS14)
>> - eMMC (4GB)
>> - DRAM LPDDR3 (512MB)
>> - Connectors pin (60 Pins x 3 set)
>>
>> Also, this patchset add the ARTIK5 development board[2] dts file whi=
ch includes
>> the ARTIK5 module[1] and have the devices such as sound codec, sd ca=
rd port,
>> ethernet port, uart port and so on.
>>
>> [1] https://www.artik.io/hardware/artik-5
>> [2] http://www.digikey.com/product-detail/en/SIP-KITNXB001/1510-1316=
-ND/5825102
>=20
> I guess the rest of patches depend on new clocks, right?

Yes. The new clocks(uart2, mmc2) are used for artik5 module.
- uart2 is used for serial log for debug
- mmc2 is for external sd card

Best Regards,
Chanwoo Choi
