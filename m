From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: spi_s3c64xx.c - plat/spi.h: No such file or directory
Date: Wed, 10 Mar 2010 17:40:01 +0900
Message-ID: <1b68c6791003100040m519ceb3bo8cd8cf987f043c68@mail.gmail.com>
References: <201003100911.06148.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.25]:7237 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755412Ab0CJIkD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Mar 2010 03:40:03 -0500
Received: by qw-out-2122.google.com with SMTP id 8so292196qwh.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Mar 2010 00:40:02 -0800 (PST)
In-Reply-To: <201003100911.06148.elendil@planet.nl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Frans Pop <elendil@planet.nl>
Cc: linux-samsung-soc@vger.kernel.org

On Wed, Mar 10, 2010 at 5:11 PM, Frans Pop <elendil@planet.nl> wrote:
> When building with an SMDK6410 config with CONFIG_SPI_S3C64XX=3Dm I g=
et the
> following compilation error:
>
> CC [M] =C2=A0drivers/spi/spi_s3c64xx.o
> drivers/spi/spi_s3c64xx.c:31:22: error: plat/spi.h: No such file or d=
irectory
>
> This is with Ben Dooks' next-samsung branch merged into 2.6.33.
>
There has recently been a major shuffle of headers in plat and mach,
please test against some unmodified kernel and let me know which one
if the error still occurs. Maybe you(or I) can submit a fix upstream.
