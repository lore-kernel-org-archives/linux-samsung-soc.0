From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [GIT PULL 5/6] Samsung PM updates for v3.15
Date: Thu, 03 Apr 2014 11:58:51 +0200
Message-ID: <2387249.KfAueze2Lh@diego>
References: <8259832.260591393840570438.JavaMail.weblogic@epml16> <20140403071912.8250.98981@quantum> <015d01cf4f1e$8153a6f0$83faf4d0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:39035 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751690AbaDCJ6w convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Apr 2014 05:58:52 -0400
In-Reply-To: <015d01cf4f1e$8153a6f0$83faf4d0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Mike Turquette' <mturquette@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Am Donnerstag, 3. April 2014, 18:24:25 schrieb Kukjin Kim:
> Mike Turquette wrote:
> > Quoting Kukjin Kim (2014-04-01 21:25:45)
> >=20
> > > Heiko St=FCbner wrote:
> > > > Hi Arnd,
> > > >=20
> > > > Am Samstag, 29. M=E4rz 2014, 02:47:33 schrieb Arnd Bergmann:
> > > > > On Friday 28 March 2014, Kukjin Kim wrote:
> > > > > > Kukjin Kim wrote:
> > > > > > > On 03/19/14 13:01, Mike Turquette wrote:
> > > > > > >=20
> > > > > > > Thanks :-)
> > > > > > >=20
> > > > > > > > Acked-by: Mike Turquette<mturquette@linaro.org>
> > > > > > >=20
> > > > > > > It's time. Please pull this [5/6] and "[GIT PULL 6/6] Sam=
sung
> > > > > > > clk-s3c24xx updates for v3.15".
> > > > > >=20
> > > > > > Hi Arnd, Olof and Mike,
> > > > > >=20
> > > > > > Still I cannot see this in arm-soc. Any problems?
> > > > >=20
> > > > > Sorry, I didn't have this one on my radar any more, merged in=
to
> > > > > next/drivers now.
> > > >=20
> > > > maybe you could also take a look at the depending "[GIT PULL 6/=
6]
> >=20
> > Samsung
> >=20
> > > > clk-
> > > > s3c24xx updates for v3.15" we walked about at the beginning of =
the
> > > > week? :-)
> > >=20
> > > Yeah, so I've informed that [5/6] and [6/6] is needed...
> > >=20
> > > Arnd, Olof and Mike,
> > >=20
> > > Probably you guys missed "[6/6] Samsung clk-s3c24xx updates" when
> >=20
> > dependency
> >=20
> > > with [5/6] has been cleared but since it's already 3.15 merge win=
dow,
> >=20
> > I'm
> >=20
> > > not sure it can be sent to Linus in this time...
> >=20
> > Both PRs were Acked by me, so no problems from my end. Pretty late =
for
> > 3.15 though.
>=20
> Yeah, I know. I mean 'Arnd, Olof and Kevin' ;-)
>=20
> BTW, hmm...I know, it's too late for v3.15...so...unfortunately maybe=
 I
> should queue it for v3.16?...

I guess this would be the best option. I should also be able to finish =
the=20
s3c2410/2440/2442 conversion until then, which needs a bit more work.


Heiko
