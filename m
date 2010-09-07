From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 0/2] s3c24xx: fix s3cmci DMA support
Date: Tue,  7 Sep 2010 18:09:01 +0300
Message-ID: <1283872143-32492-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:36137 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757192Ab0IGPJ6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 11:09:58 -0400
Received: by ewy23 with SMTP id 23so2381879ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2010 08:09:56 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Kleffel <tk@maintech.de>, anarsoul@gmail.com

This series fixes DMA support for s3c24xx SoCs, now it's
possible to use DMA with s3cmci driver. It was tested on
rx1950 (s3c2442), h1940 (s3c2410) and freerunner (s3c2442),
unfortunately s3cmci doesn't work with SDIO cards when DMA
is enabled, but at least patch breaks nothing - sound works
OK on freerunner, and it's still possible to use PIO.
