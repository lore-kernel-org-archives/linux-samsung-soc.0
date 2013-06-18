From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 07/10] Samsung S3C24XX PINCTRL-2 for v3.11
Date: Wed, 19 Jun 2013 05:00:43 +0900
Message-ID: <51C0BC6B.2080507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:56271 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932908Ab3FRUAr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 16:00:47 -0400
Received: by mail-pa0-f45.google.com with SMTP id bi5so4364336pad.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 13:00:46 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>

The following changes since commit af99a7507469d4fa6dd4d8d633e093b1ff7aff6e:

   pinctrl: Add pinctrl-s3c24xx driver (2013-05-21 00:56:13 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/s3c24xx-pinctrl-2

for you to fetch changes up to c2c70a7905dbf97472e9a5fa6919675462373994:

   pinctrl: s3c24xx: use correct header for chained_irq functions 
(2013-06-19 02:41:20 +0900)

----------------------------------------------------------------
based on s3c24xx-pinctrl
- use correct header for chained_irq functions for s3c24xx-pinctrl

----------------------------------------------------------------
Heiko Stuebner (1):
       pinctrl: s3c24xx: use correct header for chained_irq functions

  drivers/pinctrl/pinctrl-s3c24xx.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
