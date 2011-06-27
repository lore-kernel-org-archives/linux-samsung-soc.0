From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/3] gpio/samsung: move gpio drivers into drivers/gpio/
Date: Mon, 27 Jun 2011 20:15:37 +0900
Message-ID: <1309173340-12369-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45191 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757614Ab1F0LW4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jun 2011 07:22:56 -0400
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.72)
	(envelope-from <kgene.kim@samsung.com>)
	id 1Qb9u3-0007u1-Ld
	for linux-samsung-soc@vger.kernel.org; Mon, 27 Jun 2011 13:22:55 +0200
Received: from [12.23.102.184] (helo=starstone.dsn.sec.samsung.com)
	by jackpot.kr.gnumonks.org with esmtp (Exim 4.69)
	(envelope-from <kgene.kim@samsung.com>)
	id 1Qb99R-0001Ug-0M
	for linux-samsung-soc@vger.kernel.org; Mon, 27 Jun 2011 19:34:45 +0900
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This patch moves remaining samsung(s3c24xx, s3c64xx and s5p64x0) gpio
drivers into drivers/gpio/.

NOTE:
- made based on git://git.secretlab.ca/git/linux-2.6.git #gpio/next
- need to sort out current samsung gpiolibs in drivers/gpio/
  (that will be submitted soon)

[PATCH 1/3] gpio/s3c24xx: move gpio driver into drivers/gpio/
[PATCH 2/3] gpio/s3c64xx: move gpio driver into drivers/gpio/
[PATCH 3/3] gpio/s5p64x0: move gpio driver into drivers/gpio/
