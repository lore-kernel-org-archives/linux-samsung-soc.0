From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 3/5] pinctrl: exynos: add exynos5410 SoC specific data
Date: Tue, 02 Jun 2015 21:46:31 +0900
Message-ID: <556DA5A7.4080502@samsung.com>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de> <1426456834-6308-4-git-send-email-afaerber@suse.de> <CA+Ln22Fq6Z6vSy2zCsx61j-JVe_x=yAjkySXy_Lit0tBbPmo9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:35102 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753246AbbFBMqi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 08:46:38 -0400
In-Reply-To: <CA+Ln22Fq6Z6vSy2zCsx61j-JVe_x=yAjkySXy_Lit0tBbPmo9Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: Humberto Naves <hsnaves@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, linux-kernel <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

W dniu 24.03.2015 o 02:22, Tomasz Figa pisze:
> Hi Andreas, Hakjoo,
>=20
> Thanks for the patch.
>=20
> 2015-03-16 7:00 GMT+09:00 Andreas F=C3=A4rber <afaerber@suse.de>:
>> From: Hakjoo Kim <ruppi.kim@hardkernel.com>
>>
>> Add Samsung EXYNOS5410 SoC specific data to enable pinctrl
>> support for all platforms based on EXYNOS5410.
>>
>> Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
>> [AF: Rebased onto Exynos5260, irq_chip consolidation, const'ificatio=
n]
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>>  v2 -> v3:
>>  * Rebased (.svc, .{g,w}eint_{con,mask,pend} fields dropped)
>>
>>  v1 -> v2:
>>  * Filled in Sob from Hakjoo Kim
>>
>>  .../bindings/pinctrl/samsung-pinctrl.txt           |   1 +
>>  drivers/pinctrl/samsung/pinctrl-exynos.c           | 103 ++++++++++=
+++++++++++
>>  drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
>>  drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
>>  4 files changed, 107 insertions(+)
>>
>=20
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

So I assume this may go through Kukjin tree.

Best regards,
Krzysztof
