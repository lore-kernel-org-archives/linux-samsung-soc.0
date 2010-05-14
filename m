From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 11/11] ARM: S5P6440: Remove redundant defines
Date: Fri, 14 May 2010 06:35:50 +0100
Message-ID: <20100514053550.GP26401@trinity.fluff.org>
References: <1273710481-14856-1-git-send-email-kgene.kim@samsung.com> <AANLkTimTm_Vxvb2xvJnVxTxUaYguFgGeaWGypzA1yjwM@mail.gmail.com> <20100513020236.GS6684@trinity.fluff.org> <AANLkTilIvm2AlZeh_1cdcgZFFL5YuJUnYiytXA2tZktB@mail.gmail.com> <20100513090608.GA5382@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:46634 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751159Ab0ENFf5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 01:35:57 -0400
Content-Disposition: inline
In-Reply-To: <20100513090608.GA5382@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kyungmin Park <kmpark@infradead.org>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org

On Thu, May 13, 2010 at 10:06:08AM +0100, Russell King - ARM Linux wrot=
e:
> On Thu, May 13, 2010 at 01:54:12PM +0900, Kyungmin Park wrote:
> > On Thu, May 13, 2010 at 11:02 AM, Ben Dooks <ben-linux@fluff.org> w=
rote:
> > > 1) It takes two lines of code, where one is sufficient.
> > >
> > > 2) You only have to look in the relevant .c file to find out the
> > > =A0 value instead of tracking down a header. This makes it easier
> > > =A0 to verify the value against the manual and easier to compare
> > > =A0 against simialr code.
> >=20
> > Then define it at c code and use the macro. I also don't like the
> > hard-coded values.
>=20
> I'm almost with Ben on this; but we can do better to satisfy both cam=
ps.
>=20
> 	.ctrlbit	=3D 1 << 2, /* CLKCON_MEM0_HCLK_NFCON */

As a note, the following awk will do that to this patch:

#!/bin/awk

{
    if ($0 ~ /^-.*ctrlbit*/) {
	last =3D $4;
	gsub(/,/,"",last)
	print $0;
    } else if ($0 ~ /^\+.*ctrlbit*/) {
	print $0 " /* " last " */";
    } else {
	print $0 default;
    }
}

--=20
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
