From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v4 5/5] ARM: dts: Add LEDs to exynos5410-odroidxu
Date: Tue, 02 Jun 2015 22:38:42 +0900
Message-ID: <556DB1E2.5080607@suse.de>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de> <1426456834-6308-6-git-send-email-afaerber@suse.de> <556DA96A.90800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36654 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753884AbbFBNi5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 09:38:57 -0400
In-Reply-To: <556DA96A.90800@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Am 02.06.2015 um 22:02 schrieb Krzysztof Kozlowski:
> W dniu 16.03.2015 o 07:00, Andreas F=C3=A4rber pisze:
>> Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>>  v2 -> v3: Unchanged
>> =20
>>  v1 -> v2:
>>  * Filled in Sob from Hakjoo Kim
>> =20
>>  arch/arm/boot/dts/exynos5410-odroidxu.dts | 25 ++++++++++++++++++++=
+++++
>>  1 file changed, 25 insertions(+)
>=20
> What is the rationale behind doing this in separate patch, not as par=
t
> of 2/5? You can just add new board DTS with all of its features at on=
ce,
> but maybe I am missing something?

This patch depends on the pinctrl driver, 2/5 on nothing.

By keeping it a separate patch it was intended to go in more quickly
(clear fail there ;)) and it's easier to review the actual changes -
squashing is always easier than picking apart.

Thanks for your review! Both me and Ben have follow-ups once this moves
forward.

Kind regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton=
; HRB
21284 (AG N=C3=BCrnberg)
