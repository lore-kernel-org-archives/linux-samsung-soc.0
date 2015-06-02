From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 5/5] ARM: dts: Add LEDs to exynos5410-odroidxu
Date: Wed, 03 Jun 2015 08:55:55 +0900
Message-ID: <556E428B.8070008@samsung.com>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>
 <1426456834-6308-6-git-send-email-afaerber@suse.de>
 <556DA96A.90800@samsung.com> <556DB1E2.5080607@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35130 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750704AbbFBXz7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 19:55:59 -0400
In-reply-to: <556DB1E2.5080607@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 02.06.2015 22:38, Andreas F=C3=A4rber wrote:
> Am 02.06.2015 um 22:02 schrieb Krzysztof Kozlowski:
>> W dniu 16.03.2015 o 07:00, Andreas F=C3=A4rber pisze:
>>> Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>> ---
>>>  v2 -> v3: Unchanged
>>> =20
>>>  v1 -> v2:
>>>  * Filled in Sob from Hakjoo Kim
>>> =20
>>>  arch/arm/boot/dts/exynos5410-odroidxu.dts | 25 +++++++++++++++++++=
++++++
>>>  1 file changed, 25 insertions(+)
>>
>> What is the rationale behind doing this in separate patch, not as pa=
rt
>> of 2/5? You can just add new board DTS with all of its features at o=
nce,
>> but maybe I am missing something?
>=20
> This patch depends on the pinctrl driver, 2/5 on nothing.
>=20
> By keeping it a separate patch it was intended to go in more quickly
> (clear fail there ;)) and it's easier to review the actual changes -
> squashing is always easier than picking apart.

OK, I'm fine with it.

The patch looks good:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Can you resend everything with the change in chosen/console?

Best regards,
Krzysztof
