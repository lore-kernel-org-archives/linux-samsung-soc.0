From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH v2] ARM: Kconfig: let ARM9TDMI and ARM7TDMI invisible.
Date: Thu, 25 Apr 2013 09:16:14 +0800
Message-ID: <517883DE.2080603@asianux.com>
References: <51775BB3.6000607@asianux.com> <51775D88.2000406@asianux.com> <20130424174602.GA14496@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:24557 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758658Ab3DYBRJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Apr 2013 21:17:09 -0400
In-Reply-To: <20130424174602.GA14496@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Will Deacon <will.deacon@arm.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>

On 2013=E5=B9=B404=E6=9C=8825=E6=97=A5 01:46, Russell King - ARM Linux =
wrote:
> On Wed, Apr 24, 2013 at 12:20:24PM +0800, Chen Gang wrote:
>> > If CONFIG_MMU is disabled, it will let ARM9TDMI and ARM7TDMI visib=
le,
>> > but in fact, only AT91X40 need ARM7TDMI, so need not let them visi=
ble.
> I'll apply it myself this evening.  Can I add:
>=20
> Tested-by: Chen Gang <gang.chen@asianux.com>
>=20
> to it?
>=20
>=20

Ok, thanks. this patch is really provided by you (Arnd also provided th=
e
same patch, but it seems a little later than you). And I really only
reported and tested it.

And next, I should continue to find and make another patches for ARM.

Thanks.

--=20
Chen Gang

Asianux Corporation
