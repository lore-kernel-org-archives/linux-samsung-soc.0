From: Subash Patel <subashrp@gmail.com>
Subject: boot failure of exynos4 on 3.1.0-rc7
Date: Wed, 28 Sep 2011 12:03:41 +0530
Message-ID: <4E82BFC5.2020409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:53166 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742Ab1I1Gdp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 02:33:45 -0400
Received: by iaqq3 with SMTP id q3so6552541iaq.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Sep 2011 23:33:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hello,

I am attempting to boot linux version in subject on SMDKV310 
board[EVT0]. The booting stops after "Uncompressing Linux... done, 
booting the kernel." After some debugging I found that the timer 
initialization fails. exynos4_mct_frc_start() calls 
exynos4_mct_write(lo, EXYNOS4_MCT_G_CNT_L) which fails to write to the 
register, which should have asserted G-CNT_WSTAT[0] to 1. Hence panic() 
will be called which halts booting.

I have booted 3.0.0-rc1 before this, which used PWM. I found a related 
thread for C210, which I couldnt make head-tail out of it :(
http://www.spinics.net/lists/arm-kernel/msg140431.html

Can anyone let me know if this is known issue and if there is a solution 
available for this.

Regards,
Subash
