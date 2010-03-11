From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: spi_s3c64xx.c - plat/spi.h: No such file or directory
Date: Thu, 11 Mar 2010 11:20:23 +0900
Message-ID: <1b68c6791003101820y1d3c1313u7fc47c30f851869c@mail.gmail.com>
References: <201003100911.06148.elendil@planet.nl>
	 <1b68c6791003100040m519ceb3bo8cd8cf987f043c68@mail.gmail.com>
	 <201003101717.09810.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.26]:17679 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753162Ab0CKCUY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Mar 2010 21:20:24 -0500
Received: by qw-out-2122.google.com with SMTP id 9so331841qwb.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Mar 2010 18:20:24 -0800 (PST)
In-Reply-To: <201003101717.09810.elendil@planet.nl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Frans Pop <elendil@planet.nl>
Cc: linux-samsung-soc@vger.kernel.org

On Thu, Mar 11, 2010 at 1:17 AM, Frans Pop <elendil@planet.nl> wrote:
> On Wednesday 10 March 2010, jassi brar wrote:
>> On Wed, Mar 10, 2010 at 5:11 PM, Frans Pop <elendil@planet.nl> wrote=
:
>> > When building with an SMDK6410 config with CONFIG_SPI_S3C64XX=3Dm =
I get
>> > the following compilation error:
>> >
>> > CC [M] =C2=A0drivers/spi/spi_s3c64xx.o
>> > drivers/spi/spi_s3c64xx.c:31:22: error: plat/spi.h: No such file o=
r
>> > directory
>> >
>> > This is with Ben Dooks' next-samsung branch merged into 2.6.33.
>>
>> There has recently been a major shuffle of headers in plat and mach,
>> please test against some unmodified kernel and let me know which one
>> if the error still occurs. Maybe you(or I) can submit a fix upstream=
=2E
>
> The same error occurs with vanilla 2.6.33.
yeah, i remember. that was due to driver being accepted in SPI tree but
plat headers put on hold in S3C ARCH tree.
The patches are already queued on Ben Dooks' and Grant Likely's tree.
