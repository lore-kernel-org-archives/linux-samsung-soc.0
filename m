From: Frans Pop <elendil@planet.nl>
Subject: spi_s3c64xx.c - plat/spi.h: No such file or directory
Date: Wed, 10 Mar 2010 09:11:04 +0100
Message-ID: <201003100911.06148.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpm-eml104.kpnxchange.com ([195.121.3.8]:62334 "EHLO
	CPSMTPM-EML104.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755248Ab0CJILK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Mar 2010 03:11:10 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

When building with an SMDK6410 config with CONFIG_SPI_S3C64XX=m I get the
following compilation error:

CC [M]  drivers/spi/spi_s3c64xx.o
drivers/spi/spi_s3c64xx.c:31:22: error: plat/spi.h: No such file or directory

This is with Ben Dooks' next-samsung branch merged into 2.6.33.

Cheers,
FJP
