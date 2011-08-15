From: Nikiforov Alex <a.nikiforov@samsung.com>
Subject: Re: Error during compile
Date: Mon, 15 Aug 2011 13:16:38 +0400
Message-ID: <j2ao5n$k2b$1@dough.gmane.org>
References: <j2alr4$6l4$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:43954 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752667Ab1HOJQ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Aug 2011 05:16:57 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1QstHx-0001wW-Ft
	for linux-samsung-soc@vger.kernel.org; Mon, 15 Aug 2011 11:16:55 +0200
Received: from 213.33.187.194 ([213.33.187.194])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Aug 2011 11:16:53 +0200
Received: from a.nikiforov by 213.33.187.194 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Aug 2011 11:16:53 +0200
In-Reply-To: <j2alr4$6l4$1@dough.gmane.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

the same point
commit 93ee7a9340d64f20295aacc3fb6a22b759323280

make ARCH=arm s5pc100_defconfig
make clean
make -j5 ARCH=arm CROSS_COMPILE=..... uImage

CC      drivers/tty/serial/s3c6400.o
drivers/tty/serial/samsung.c: In function 's3c24xx_serial_init':
drivers/tty/serial/samsung.c:1236: error: lvalue required as unary '&' 
operand
make[3]: *** [drivers/tty/serial/samsung.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [drivers/tty/serial] Error 2
make[1]: *** [drivers/tty] Error 2
make: *** [drivers] Error 2
