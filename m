From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: [PATCH 0/1] ARM: dts: exynos: Add timer node for exynos5420
Date: Sun, 3 Apr 2016 22:39:38 +0200
Message-ID: <57017F8A.6030307@free.fr>
References: <cover.1459167385.git.bugs.a.b@free.fr>
 <56FA539F.1000208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtpfb2-g21.free.fr ([212.27.42.10]:59405 "EHLO
	smtpfb2-g21.free.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751298AbcDCUjs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Apr 2016 16:39:48 -0400
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 4229ED1A774
	for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Apr 2016 22:39:43 +0200 (CEST)
In-Reply-To: <56FA539F.1000208@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

Le 29/03/2016 12:06, Krzysztof Kozlowski a =E9crit :
> Please look at this thread:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-July/35980=
6.html
>=20
> Unfortunately I do not have any more details about this.

So I understand MCT and Arch Timer use the same hardware timer and
there were issues when the MCT interface reset it at boot and during
resume and the Arch Timer consumers didn't expect it. In this thread th=
ere
were links [1] to a patch to have the MCT not writing the timer anymore=
,
thus allowing the two interfaces to co-exist.

This patch was applied in commit 1d80415db64b. So no problem is to be
expected when using both interfaces at the same time.

I can see  exynos5250 got its Arch Timer definition for KVM:

- From the description of commit 2b7da98870bc
ARM: dts: Add architected timer nodes for exynos5250
[...]
This is required by KVM.

So is there something else blocking adding this definition for 542x/580=
0
considering its effect is enabling KVM ?

[1]
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-May/257350.h=
tml
=3D> https://chromium-review.googlesource.com/#/c/200298/
=3D> https://chromium-review.googlesource.com/#/c/201143/
for 3.8

[2]
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-May/258622.h=
tml

best regards,
Adel
