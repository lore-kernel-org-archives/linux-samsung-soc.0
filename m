From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 11/11] ARM: S5P6440: Remove redundant defines
Date: Thu, 13 May 2010 10:06:08 +0100
Message-ID: <20100513090608.GA5382@n2100.arm.linux.org.uk>
References: <1273710481-14856-1-git-send-email-kgene.kim@samsung.com> <AANLkTimTm_Vxvb2xvJnVxTxUaYguFgGeaWGypzA1yjwM@mail.gmail.com> <20100513020236.GS6684@trinity.fluff.org> <AANLkTilIvm2AlZeh_1cdcgZFFL5YuJUnYiytXA2tZktB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:47582 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755909Ab0EMJGn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 May 2010 05:06:43 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTilIvm2AlZeh_1cdcgZFFL5YuJUnYiytXA2tZktB@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org

On Thu, May 13, 2010 at 01:54:12PM +0900, Kyungmin Park wrote:
> On Thu, May 13, 2010 at 11:02 AM, Ben Dooks <ben-linux@fluff.org> wro=
te:
> > 1) It takes two lines of code, where one is sufficient.
> >
> > 2) You only have to look in the relevant .c file to find out the
> > =A0 value instead of tracking down a header. This makes it easier
> > =A0 to verify the value against the manual and easier to compare
> > =A0 against simialr code.
>=20
> Then define it at c code and use the macro. I also don't like the
> hard-coded values.

I'm almost with Ben on this; but we can do better to satisfy both camps=
=2E

	.ctrlbit	=3D 1 << 2, /* CLKCON_MEM0_HCLK_NFCON */

It's now documented what the magic constant is.
