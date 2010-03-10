From: Frans Pop <elendil@planet.nl>
Subject: Re: spi_s3c64xx.c - plat/spi.h: No such file or directory
Date: Wed, 10 Mar 2010 17:17:09 +0100
Message-ID: <201003101717.09810.elendil@planet.nl>
References: <201003100911.06148.elendil@planet.nl> <1b68c6791003100040m519ceb3bo8cd8cf987f043c68@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from Cpsmtpm-eml108.kpnxchange.com ([195.121.3.12]:52956 "EHLO
	CPSMTPM-EML108.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750839Ab0CJQRM convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Mar 2010 11:17:12 -0500
In-Reply-To: <1b68c6791003100040m519ceb3bo8cd8cf987f043c68@mail.gmail.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

On Wednesday 10 March 2010, jassi brar wrote:
> On Wed, Mar 10, 2010 at 5:11 PM, Frans Pop <elendil@planet.nl> wrote:
> > When building with an SMDK6410 config with CONFIG_SPI_S3C64XX=3Dm I=
 get
> > the following compilation error:
> >
> > CC [M] =C2=A0drivers/spi/spi_s3c64xx.o
> > drivers/spi/spi_s3c64xx.c:31:22: error: plat/spi.h: No such file or
> > directory
> >
> > This is with Ben Dooks' next-samsung branch merged into 2.6.33.
>
> There has recently been a major shuffle of headers in plat and mach,
> please test against some unmodified kernel and let me know which one
> if the error still occurs. Maybe you(or I) can submit a fix upstream.

The same error occurs with vanilla 2.6.33.

Cheers,
=46JP
