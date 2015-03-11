From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: EXYNOS: Fix failed second suspend on Exynos4
Date: Wed, 11 Mar 2015 11:29:25 +0100
Message-ID: <1426069765.30407.7.camel@AMDC1943>
References: <1426069206-13667-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32577 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751501AbbCKK3a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 06:29:30 -0400
In-reply-to: <1426069206-13667-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org, BartlomiejZolnierkiewicz <b.zolnierkie@samsung.com>

On =C5=9Bro, 2015-03-11 at 11:20 +0100, Krzysztof Kozlowski wrote:
> On Exynos4412 boards (Trats2, Odroid U3) after enabling L2 cache in
> 56b60b8bce4a ("ARM: 8265/1: dts: exynos4: Add nodes for L2 cache
> controller") the second suspend to RAM failed. First suspend worked f=
ine
> but the next one hang just after powering down of secondary CPUs (sys=
tem
> consumed energy as it would be running but was not responsive).
>=20
> The issue was caused by enabling delayed reset assertion for CPU0 jus=
t
> after issuing power down of cores. This was introduced for Exynos4 in
> 13cfa6c4f7fa ("ARM: EXYNOS: Fix CPU idle clock down after CPU off").
>=20
> The whole behavior is not well documented but after checking with ven=
dor
> code this should be done like this (on Exynos4):
> 1. Enable delayed reset assertion when system is running (for all CPU=
s).
> 2. Disable delayed reset assertion before suspending the system.
>    This can be done after powering off secondary CPUs.
> 3. Re-enable the delayed reset assertion when system is resumed.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Fixes: 13cfa6c4f7fa ("ARM: EXYNOS: Fix CPU idle clock down after CPU =
off")
> Cc: <stable@vger.kernel.org>
> Tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>

Dear Kukjin,

This patch was first sent on 3rd of February. It could enter before
opening 4.0 merge window. I did not receive any response from you in
that time.

So let me point next steps:
1. The Exynos4412 suspend on 4.0 is broken and now this patch applies a=
s
a fix.
2. I resent it on 18th of February.
3. I received tested-by from Bartlomiej and Chanwoo.
4. Bartlomiej pinged you on 3rd March.

Still no response. If the patch does not look good then please share
your comments. I'll fix it.
If this patch looks good, why does it take so much time?


Dear Arnd and Olof,

Could you pick it up to your arm-soc?


Best regards,
Krzysztof
