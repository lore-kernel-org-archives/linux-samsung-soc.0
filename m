From: Woody Wu <narkewoody@gmail.com>
Subject: Incorrect memory size reported
Date: Sat, 17 Nov 2012 07:19:37 +0000 (UTC)
Message-ID: <slrnkaeeir.354.narkewoody@zuhnb712.local.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:49002 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751224Ab2KQHY5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 17 Nov 2012 02:24:57 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1TZcm0-0003L6-SV
	for linux-samsung-soc@vger.kernel.org; Sat, 17 Nov 2012 08:25:04 +0100
Received: from 119.120.107.227 ([119.120.107.227])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 Nov 2012 08:25:04 +0100
Received: from narkewoody by 119.120.107.227 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 Nov 2012 08:25:04 +0100
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

I built a 2.6.36 kernel for a s3c2410 board.  In the beginning of the
boot log, I see the memory size is reported as "Memory: 16MB = 16MB
total".  This is incorrect, since the board has 64M SDRAM.   Can you
know what's the most possible cause?  What I can ensure is that it's not
the board or the SDRAM's problem.

Thanks in advance.

-- 
-woody
I can't go back to yesterday - because I was a different person then.
