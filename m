From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH v2] ARM: Kconfig: let ARM9TDMI and ARM7TDMI invisible.
Date: Thu, 25 Apr 2013 09:16:47 +0800
Message-ID: <517883FF.4050206@asianux.com>
References: <51775BB3.6000607@asianux.com> <51775D88.2000406@asianux.com> <20130424174602.GA14496@n2100.arm.linux.org.uk> <8EB7C52E-5044-4B8A-99F2-BCFF9DFDBD2E@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:24568 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758658Ab3DYBRe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Apr 2013 21:17:34 -0400
In-Reply-To: <8EB7C52E-5044-4B8A-99F2-BCFF9DFDBD2E@jcrosoft.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, kgene.kim@samsung.com, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, dhowells@redhat.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 2013=E5=B9=B404=E6=9C=8825=E6=97=A5 01:59, Jean-Christophe PLAGNIOL-=
VILLARD wrote:
> On Apr 25, 2013, at 1:46 AM, Russell King - ARM Linux <linux@arm.linu=
x.org.uk> wrote:
>=20
>> > On Wed, Apr 24, 2013 at 12:20:24PM +0800, Chen Gang wrote:
>>> >> If CONFIG_MMU is disabled, it will let ARM9TDMI and ARM7TDMI vis=
ible,
>>> >> but in fact, only AT91X40 need ARM7TDMI, so need not let them vi=
sible.
>> >=20
>> > I'll apply it myself this evening.  Can I add:
>> >=20
>> > Tested-by: Chen Gang <gang.chen@asianux.com>
> you add it mine too
>=20
> Tested-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Thanks.

--=20
Chen Gang

Asianux Corporation
