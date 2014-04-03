From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 5/6] Samsung PM updates for v3.15
Date: Thu, 03 Apr 2014 19:03:52 +0900
Message-ID: <017201cf4f24$048a8e80$0d9fab80$@samsung.com>
References: <8259832.260591393840570438.JavaMail.weblogic@epml16>
 <20140403071912.8250.98981@quantum>
 <015d01cf4f1e$8153a6f0$83faf4d0$@samsung.com> <2387249.KfAueze2Lh@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55616 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220AbaDCKDz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Apr 2014 06:03:55 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3G00B3P9AHO530@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Apr 2014 19:03:53 +0900 (KST)
In-reply-to: <2387249.KfAueze2Lh@diego>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: 'Mike Turquette' <mturquette@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Heiko St=FCbner wrote:
>=20
> Am Donnerstag, 3. April 2014, 18:24:25 schrieb Kukjin Kim:
> > Mike Turquette wrote:
> > > Quoting Kukjin Kim (2014-04-01 21:25:45)
> > >
> > > > Heiko St=FCbner wrote:
> > > > > Hi Arnd,
> > > > >
> > > > > Am Samstag, 29. M=E4rz 2014, 02:47:33 schrieb Arnd Bergmann:
> > > > > > On Friday 28 March 2014, Kukjin Kim wrote:
> > > > > > > Kukjin Kim wrote:
> > > > > > > > On 03/19/14 13:01, Mike Turquette wrote:
> > > > > > > >
> > > > > > > > Thanks :-)
> > > > > > > >
> > > > > > > > > Acked-by: Mike Turquette<mturquette@linaro.org>
> > > > > > > >
> > > > > > > > It's time. Please pull this [5/6] and "[GIT PULL 6/6]
> Samsung
> > > > > > > > clk-s3c24xx updates for v3.15".
> > > > > > >
> > > > > > > Hi Arnd, Olof and Mike,
> > > > > > >
> > > > > > > Still I cannot see this in arm-soc. Any problems?
> > > > > >
> > > > > > Sorry, I didn't have this one on my radar any more, merged =
into
> > > > > > next/drivers now.
> > > > >
> > > > > maybe you could also take a look at the depending "[GIT PULL =
6/6]
> > >
> > > Samsung
> > >
> > > > > clk-
> > > > > s3c24xx updates for v3.15" we walked about at the beginning o=
f the
> > > > > week? :-)
> > > >
> > > > Yeah, so I've informed that [5/6] and [6/6] is needed...
> > > >
> > > > Arnd, Olof and Mike,
> > > >
> > > > Probably you guys missed "[6/6] Samsung clk-s3c24xx updates" wh=
en
> > >
> > > dependency
> > >
> > > > with [5/6] has been cleared but since it's already 3.15 merge
window,
> > >
> > > I'm
> > >
> > > > not sure it can be sent to Linus in this time...
> > >
> > > Both PRs were Acked by me, so no problems from my end. Pretty lat=
e for
> > > 3.15 though.
> >
> > Yeah, I know. I mean 'Arnd, Olof and Kevin' ;-)
> >
> > BTW, hmm...I know, it's too late for v3.15...so...unfortunately may=
be I
> > should queue it for v3.16?...
>=20
> I guess this would be the best option. I should also be able to finis=
h the
> s3c2410/2440/2442 conversion until then, which needs a bit more work.
>=20
Hi Heiko,

OK, I will rebase the branch once 3.15-rc1 is ready for 3.16. Thanks an=
d
Sorry ;-)

- Kukjin
