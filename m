From: Frans Pop <elendil@planet.nl>
Subject: Re: spi_s3c64xx.c - plat/spi.h: No such file or directory
Date: Thu, 11 Mar 2010 03:51:39 +0100
Message-ID: <201003110351.40711.elendil@planet.nl>
References: <201003100911.06148.elendil@planet.nl> <201003101717.09810.elendil@planet.nl> <1b68c6791003101820y1d3c1313u7fc47c30f851869c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpm-eml102.kpnxchange.com ([195.121.3.6]:53589 "EHLO
	CPSMTPM-EML102.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753926Ab0CKCvm convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Mar 2010 21:51:42 -0500
In-Reply-To: <1b68c6791003101820y1d3c1313u7fc47c30f851869c@mail.gmail.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

On Thursday 11 March 2010, jassi brar wrote:
> On Thu, Mar 11, 2010 at 1:17 AM, Frans Pop <elendil@planet.nl> wrote:
> > On Wednesday 10 March 2010, jassi brar wrote:
> >> On Wed, Mar 10, 2010 at 5:11 PM, Frans Pop <elendil@planet.nl> wro=
te:
> >> > When building with an SMDK6410 config with CONFIG_SPI_S3C64XX=3D=
m I
> >> > get the following compilation error:
> >> >
> >> > CC [M] =C2=A0drivers/spi/spi_s3c64xx.o
> >> > drivers/spi/spi_s3c64xx.c:31:22: error: plat/spi.h: No such file=
 or
> >> > directory
> >> >
> >> > This is with Ben Dooks' next-samsung branch merged into 2.6.33.
> >>
> >> There has recently been a major shuffle of headers in plat and mac=
h,
> >> please test against some unmodified kernel and let me know which o=
ne
> >> if the error still occurs. Maybe you(or I) can submit a fix upstre=
am.
> >
> > The same error occurs with vanilla 2.6.33.
>
> yeah, i remember. that was due to driver being accepted in SPI tree b=
ut
> plat headers put on hold in S3C ARCH tree.
> The patches are already queued on Ben Dooks' and Grant Likely's tree.

Which branch in Ben's tree would that be? As mentioned above I still se=
e=20
the error when using his current "next-samsung" branch...
I have not try building with Grant's tree.

It would be great if someone could verify that the issue really is solv=
ed.

Cheers,
=46JP
