From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/2] Add GPLL, APLL, KPLL,
 EPLL and VPLL freq table for exynos5420 and exynos5250
Date: Wed, 14 Aug 2013 17:37:31 +0200
Message-ID: <6501649.Hcij7zmiRh@amdc1227>
References: <1376301734-21847-1-git-send-email-vikas.sajjan@linaro.org>
 <CAGm_ybjdmO3Oisco7eYbQ3=bLjsAi7A4mt8R53tqM=z96m0QjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=nextPart1463818.zjgWJdZtmq;
 micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29720 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758380Ab3HNPhm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 11:37:42 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRJ00BI922FYT40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Aug 2013 16:37:41 +0100 (BST)
In-reply-to: <CAGm_ybjdmO3Oisco7eYbQ3=bLjsAi7A4mt8R53tqM=z96m0QjA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <sajjan.linux@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, patches@linaro.org, linaro-kernel@lists.linaro.org


--nextPart1463818.zjgWJdZtmq
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Vikas,

On Wednesday 14 of August 2013 10:36:53 Vikas Sajjan wrote:
> Hi Mike,
> 
> On Mon, Aug 12, 2013 at 3:32 PM, Vikas Sajjan <vikas.sajjan@linaro.org> 
wrote:
> > Adds GPLL, APLL, KPLL, EPLL and VPLL freq table for exynos5420 and
> > exynos5250.
> > 
> > is rebased on Mike's
> > https://git.linaro.org/gitweb?p=people/mturquette/linux.git;a=shortlog;
> > h=refs/heads/clk-next> 
> > Vikas Sajjan (2):
> >   clk: samsung: Add GPLL freq table for exynos5250 SoC
> >   clk: samsung: Add APLL, KPLL, EPLL and VPLL freq table for exynos5420
> >   
> >     SoC
> >  
> >  drivers/clk/samsung/clk-exynos5250.c |   19 +++++++-
> >  drivers/clk/samsung/clk-exynos5420.c |   81
> >  ++++++++++++++++++++++++++++++++++ 2 files changed, 99 insertions(+),
> >  1 deletion(-)
> 
> Can you apply this patchset.

Please give few more days for the patch to be reviewed by people.

A reasonable period of time which should pass after submitting a patch to 
ping the maintainers is around a week. This allows people to find some time 
to read your patches and share their opinions (and/or give their reviewed-
by/acked-by tags).

Best regards,
Tomasz

--nextPart1463818.zjgWJdZtmq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAABAgAGBQJSC6Q/AAoJEIv3Hb8G/XruPrwP/2Q+DQUjhOc1oDEBINHZwAJS
biLu9BSxt83annGFuZz6FqxcVN82PkHZX8YzAAc6OfIFjnPex8FpPfVSp9HOJytf
nmeHGj8tuSHS+A6QWwagAdX6FC90/aSGEVF9iqM1O/pU6sF8BJ0K7qPyNn9V98jP
mcpSVkvc3uYybe6WDiGiHN0czrrh03b3CFRlmV0SN1wQuwTYiJrW6yipB3fZ1GP2
7BlbXCuRigtwhKzQNVZ0kov+xy990WeMxvyY7Xzn0DNVwhuzUJatlPqBaPsKMC07
OWw13FV2sN6DbHe+Eg8MbOYzTO+lpsdDNpJJOR+ZZ+P1DErZgCqPevS/OQkXD6V/
3KjXXmPLwA21ctGWSfEYebpTHnLziUlb7HPxWfU/4HONGFkQ9dZIFwhckDVtvH7C
zF5LC2PtUIa3IoU3imM5Ab7dGoKAtTPRXSevhqr89Ikq79XwpWAnSkJ2cbKsWkqc
OMN3ZmXOn72vJeJalth1rX75IZfppbR1omInI0RCeCaf3DcLQ06h/Q02LOyrUhnb
htgeNEb5dTaFSKCAu5gmZ5eMn/j1wwlbCI03dkD/QmDAL/btt14OiHVRV8RKXeB3
8mL+lHgBeC15EnNz+sHmjBSX5YG3DBsoOszGv5dHAY3uMoY9qk3kbQTIH5pq+wNk
Q85I6w6F2zdMBhr91NXr
=kKws
-----END PGP SIGNATURE-----

--nextPart1463818.zjgWJdZtmq--
