From: Frans Pop <elendil@planet.nl>
Subject: Re: spi_s3c64xx.c - plat/spi.h: No such file or directory
Date: Thu, 25 Mar 2010 00:26:14 +0100
Message-ID: <201003250026.15514.elendil@planet.nl>
References: <47F3F98010FF784EBEE6526EAAB078D10635E6A1@tq-mailsrv.tq-net.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpm-eml101.kpnxchange.com ([195.121.3.5]:49210 "EHLO
	CPSMTPM-EML101.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751119Ab0CXX0V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Mar 2010 19:26:21 -0400
In-Reply-To: <47F3F98010FF784EBEE6526EAAB078D10635E6A1@tq-mailsrv.tq-net.de>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Martin Krause <Martin.Krause@tqs.de>
Cc: jassi brar <jassisinghbrar@gmail.com>, linux-samsung-soc@vger.kernel.org

On Tuesday 23 March 2010, Martin Krause wrote:
>   CC      drivers/spi/spi.o
>   CC      drivers/spi/spi_s3c64xx.o
> drivers/spi/spi_s3c64xx.c:31:30: error: plat/s3c64xx-spi.h: No such file
> or directory
>
> The file 's3c64xx-spi.h' seems not to exist in my repo. What am I
> doing wrong?

I have it:
arch/arm/plat-samsung/include/plat/s3c64xx-spi.h

Looks like you're missing this commit:
commit 398ccccb770e6ed3e138925404f0746cbe57c5a1
Author: Jassi Brar <@@@>
Date:   Mon Jan 18 17:45:52 2010 +0900

    ARM: S3C64XX: SPI: Header for passing platform data

    We need a way to pass controller specific information to the SPI driver.
    For that purpose new headers are made.

    SPI Controller is assumed 'type-s3c64xx' and can be defined for newer SoCs.
     Hence, that part is placed under plat-samsung to be shared across newer SoCs.

    SoC specific part - spi source clocks, will be placed
    under plat-<soc>/include/plat/

Note that both samsung the and spi branches have been included in
mainline git in the mean time (for 2.6.34).

Cheers,
FJP
