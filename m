From: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Sat, 21 May 2016 16:43:08 +0200
Message-ID: <20160521144308.GA13960@sesse.net>
References: <20160515173900.GC21194@sesse.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:48780 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751209AbcEUOnN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 10:43:13 -0400
Received: from pannekake.samfundet.no ([2001:67c:29f4::50] ident=unknown)
	by cassarossa.samfundet.no with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2)
	(envelope-from <sesse@samfundet.no>)
	id 1b487Q-00046x-Tr
	for linux-samsung-soc@vger.kernel.org; Sat, 21 May 2016 16:43:09 +0200
Received: from sesse by pannekake.samfundet.no with local (Exim 4.84_2)
	(envelope-from <sesse@samfundet.no>)
	id 1b487Q-0004aX-RV
	for linux-samsung-soc@vger.kernel.org; Sat, 21 May 2016 16:43:08 +0200
Content-Disposition: inline
In-Reply-To: <20160515173900.GC21194@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

On Sun, May 15, 2016 at 07:39:00PM +0200, Steinar H. Gunderson wrote:
> [   47.161428] exynos-dwc3 usb@12000000: no suspend clk specified               
> [   47.162811] usb_phy_generic.49646.auto supply vcc not found, using dummy regulator 
> [   47.163532] usb_phy_generic.49647.auto supply vcc not found, using dummy regulator
> 
> They appear to go on forever, blocking boot -- until I set the log level to 0
> to suppress them (using magic SysRq over the serial console), nothing else seems
> to happen on the machine. (loglevel=0 on the kernel command line also works
> fine.)

Hi,

I still have this problem.

I've noticed that somehow, there's a huge amount of USB PHYs being autodetected;
probably related to this issue.

  sesse@soldroid:~$ ls -ld /sys/devices/platform/usb_phy* | wc -l
  4288

/* Steinar */
-- 
Homepage: https://www.sesse.net/
