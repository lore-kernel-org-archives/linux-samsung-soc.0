From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [Suggestion] ARM:S5pv210: compiling issue for s5pv210 by using
 randconfig
Date: Wed, 17 Apr 2013 18:11:36 +0800
Message-ID: <516E7558.4080005@asianux.com>
References: <514FB202.3040807@asianux.com> <515BFA8D.2000204@asianux.com> <20130403101018.GE11040@mudshark.cambridge.arm.com> <515C047A.9010906@asianux.com> <516E6A8E.3000001@asianux.com> <20130417100136.GB19492@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:17389 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755303Ab3DQKMS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Apr 2013 06:12:18 -0400
In-Reply-To: <20130417100136.GB19492@mudshark.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, "dhowells@redhat.com" <dhowells@redhat.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, arnd@arndb.de

On 2013=E5=B9=B404=E6=9C=8817=E6=97=A5 18:01, Will Deacon wrote:
> The problem here is that you've ended up targetting a platform (s5pv2=
10)
> that selects CPU_V7. VFP is then subsequently selected, but CONFIG_MM=
U=3Dn, so
> 7TDMI and 9TDMI (v4 CPUs, no VFP) are selectable. Selecting either of=
 those,
> causes these warnings.
>=20
> Unfortunately, I'm not sure how best to fix this. Most of the !MMU CP=
Us are
> tied to a particular board (lots of `if ARCH_INTEGRATOR' predicates),=
 but we
> don't want to do that for 7tdmi.
>=20
> If we could enforce the strict exclusion of {<=3D ARMv5} and {ARMv6+}=
 in the
> Kconfig, that would solve your problem.

  thank you very much for your analysing.

  :-)

--=20
Chen Gang

Asianux Corporation
