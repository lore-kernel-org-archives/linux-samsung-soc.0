From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: S3C2416, S3C2443 HS-SPI driver?
Date: Thu, 28 Apr 2011 22:05:32 +0200
Message-ID: <201104282205.33100.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:51352 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757013Ab1D1UFr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Apr 2011 16:05:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

Hi,

does a driver for spi on s3c2416/s3c2443 SoCs exist somewhere? The one for the 
other s3c24XX SoCs seems to be different.

I did a comparison of the spi-parts of s3c2416 and s3c6400 manuals and they 
seem very much alike in their registers and working descriptions.

The only real differences I found are bit 6 of CH_CFG (High_speed_en) which 
only exists on 2416/2443 and the max values of RxTrigger and TxTrigger are 
greater on 2416 than on 6400 (63 vs 40).

So question for the samsung experts, could the s3c64xx spi-driver be a valid 
starting point for me?

Thanks
Heiko
