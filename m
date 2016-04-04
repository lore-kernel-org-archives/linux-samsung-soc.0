From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/1] ARM: dts: exynos: Add timer node for exynos5420
Date: Mon, 04 Apr 2016 10:57:01 +0900
Message-ID: <5701C9ED.2080303@samsung.com>
References: <cover.1459167385.git.bugs.a.b@free.fr>
 <56FA539F.1000208@samsung.com> <57017F8A.6030307@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60857 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751018AbcDDB5J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Apr 2016 21:57:09 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5300AO96R5Q670@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Apr 2016 02:57:05 +0100 (BST)
In-reply-to: <57017F8A.6030307@free.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Adel Belhouane <bugs.a.b@free.fr>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

On 04.04.2016 05:39, Adel Belhouane wrote:
> Le 29/03/2016 12:06, Krzysztof Kozlowski a =E9crit :
>> Please look at this thread:
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-July/3598=
06.html
>>
>> Unfortunately I do not have any more details about this.
>=20
> So I understand MCT and Arch Timer use the same hardware timer and
> there were issues when the MCT interface reset it at boot and during
> resume and the Arch Timer consumers didn't expect it. In this thread =
there
> were links [1] to a patch to have the MCT not writing the timer anymo=
re,
> thus allowing the two interfaces to co-exist.
>=20
> This patch was applied in commit 1d80415db64b. So no problem is to be
> expected when using both interfaces at the same time.
>=20
> I can see  exynos5250 got its Arch Timer definition for KVM:
>=20
> - From the description of commit 2b7da98870bc
> ARM: dts: Add architected timer nodes for exynos5250
> [...]
> This is required by KVM.
>=20
> So is there something else blocking adding this definition for 542x/5=
800
> considering its effect is enabling KVM ?

Yeah, this is blocking:
> Doug Anderson:
> According to Samsung, there are issues where using cp15 could
> sometimes return the wrong value, especially if you happen to read it
> while on an A7 instead of an A15.

> Kukjin Kim:
> One more thing, if you change it for your own private platform, it's =
> up
> to you but if not, i.e., for mass product, please don't change it.
> Because it's not guaranteed even you haven't seen its failure...

Best regards,
Krzysztof
