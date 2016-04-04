From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: [PATCH 0/1] ARM: dts: exynos: Add timer node for exynos5420
Date: Mon, 4 Apr 2016 21:08:12 +0200
Message-ID: <5702BB9C.7090802@free.fr>
References: <cover.1459167385.git.bugs.a.b@free.fr>
 <56FA539F.1000208@samsung.com> <57017F8A.6030307@free.fr>
 <5701C9ED.2080303@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp4-g21.free.fr ([212.27.42.4]:7169 "EHLO smtp4-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752875AbcDDTIT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2016 15:08:19 -0400
In-Reply-To: <5701C9ED.2080303@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

Le 04/04/2016 03:57, Krzysztof Kozlowski a =E9crit :
> On 04.04.2016 05:39, Adel Belhouane wrote:
>> Le 29/03/2016 12:06, Krzysztof Kozlowski a =E9crit :
>>> Please look at this thread:
>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-July/359=
806.html
>>>
>>> Unfortunately I do not have any more details about this.

>> This patch was applied in commit 1d80415db64b. So no problem is to b=
e
>> expected when using both interfaces at the same time.
>>

>> So is there something else blocking adding this definition for 542x/=
5800
>> considering its effect is enabling KVM ?
>=20
> Yeah, this is blocking:
>> Doug Anderson:
>> According to Samsung, there are issues where using cp15 could
>> sometimes return the wrong value, especially if you happen to read i=
t
>> while on an A7 instead of an A15.
>=20
>> Kukjin Kim:
>> One more thing, if you change it for your own private platform, it's=
 > up
>> to you but if not, i.e., for mass product, please don't change it.
>> Because it's not guaranteed even you haven't seen its failure...
>=20
> Best regards,
> Krzysztof
>=20

It seems I jumped to an other thread while reading the link you gave an=
d
didn't manage to read till the end. Now I get it. Thanks for your
replies.

best regards,
Adel.
