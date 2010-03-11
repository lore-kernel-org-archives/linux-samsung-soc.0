From: Frans Pop <elendil@planet.nl>
Subject: Re: spi_s3c64xx.c - plat/spi.h: No such file or directory
Date: Thu, 11 Mar 2010 04:42:23 +0100
Message-ID: <201003110442.24196.elendil@planet.nl>
References: <201003100911.06148.elendil@planet.nl> <201003110351.40711.elendil@planet.nl> <1b68c6791003101854k26fcf327pfb4bf321484f7e4f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpm-eml104.kpnxchange.com ([195.121.3.8]:64799 "EHLO
	CPSMTPM-EML104.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755439Ab0CKDm0 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Mar 2010 22:42:26 -0500
In-Reply-To: <1b68c6791003101854k26fcf327pfb4bf321484f7e4f@mail.gmail.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

On Thursday 11 March 2010, jassi brar wrote:
> On Thu, Mar 11, 2010 at 11:51 AM, Frans Pop <elendil@planet.nl> wrote=
:
> > On Thursday 11 March 2010, jassi brar wrote:
> >> On Thu, Mar 11, 2010 at 1:17 AM, Frans Pop <elendil@planet.nl> wro=
te:
> >> > On Wednesday 10 March 2010, jassi brar wrote:
> >> >> On Wed, Mar 10, 2010 at 5:11 PM, Frans Pop <elendil@planet.nl>=20
wrote:
> >> >> > When building with an SMDK6410 config with CONFIG_SPI_S3C64XX=
=3Dm
> >> >> > I get the following compilation error:
> >> >> >
> >> >> > CC [M] =C2=A0drivers/spi/spi_s3c64xx.o
> >> >> > drivers/spi/spi_s3c64xx.c:31:22: error: plat/spi.h: No such f=
ile
> >> >> > or directory
> >> >> >
> >> >> > This is with Ben Dooks' next-samsung branch merged into 2.6.3=
3.
> >> >>
> >> >> There has recently been a major shuffle of headers in plat and
> >> >> mach, please test against some unmodified kernel and let me kno=
w
> >> >> which one if the error still occurs. Maybe you(or I) can submit=
 a
> >> >> fix upstream.
> >> >
> >> > The same error occurs with vanilla 2.6.33.
> >>
> >> yeah, i remember. that was due to driver being accepted in SPI tre=
e
> >> but plat headers put on hold in S3C ARCH tree.
> >> The patches are already queued on Ben Dooks' and Grant Likely's tr=
ee.
> >
> > Which branch in Ben's tree would that be? As mentioned above I stil=
l
> > see the error when using his current "next-samsung" branch...
> > I have not try building with Grant's tree.
>
> try for-rmk/samsung6

That branch is identical to next-samsung...
