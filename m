From: Woody Wu <narkewoody@gmail.com>
Subject: S3C2410 LCD Resolution
Date: Fri, 7 Dec 2012 03:24:50 +0000 (UTC)
Message-ID: <slrnkc2oa6.2ck.narkewoody@zuhnb712.local.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:46513 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752722Ab2LGD3y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Dec 2012 22:29:54 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1TgodX-0003WQ-RW
	for linux-samsung-soc@vger.kernel.org; Fri, 07 Dec 2012 04:30:03 +0100
Received: from 59.37.26.98 ([59.37.26.98])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Dec 2012 04:30:03 +0100
Received: from narkewoody by 59.37.26.98 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Dec 2012 04:30:03 +0100
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi, list

Does anyone know what's the maximum display resolution I can expect for
the s3c2410-lcd frame buffer driver (s3c2410fb.c)? I am about to use
8bpp color mode only.

Is there any other requirements for the LCD module to ensure it
compatiable with s3c2410+Linux? One thing I am thinking is, that since
the s3c2410 already has a buid in LCD controller, so there is no
controller needed in the LCD module side, this should give me a chance
to use a low price LCD other than those kind of expensive LCD which
embedded a processor.  Do I understand right?


Thanks in advance.



-- 
woody
I can't go back to yesterday - because I was a different person then.
