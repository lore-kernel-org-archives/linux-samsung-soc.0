From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [rtc-s3c.c] add =?UTF-8?Q?=2Eneeds=5Fsrc=5Fclk=20to=20s=33c=36=34?=
 =?UTF-8?Q?=31=30=20RTC=20data=20/=20break=20exynos=34?=
Date: Wed, 18 Mar 2015 14:00:55 +0100
Message-ID: <1d0ae8204c93040d4cfe35c8551f201f@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:49473 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755717AbbCRNA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Mar 2015 09:00:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: javier.martinez@collabora.co.uk
Cc: linux-samsung-soc@vger.kernel.org

Hello Javier,

I noticed that this recent commit breaks rtc-s3c on my Odroid-X2 
(Exynos4412). The exynos4 dtsi includes a rtc of type s3c6410. Hence all 
board files based on exynos4, and using the rtc-s3c, are now required to 
specific the rtc_src clock. I don't think that this is correct, since 
the rtc was properly working on this board before the commit.

Maybe the check should be relaxed to make the clock optional again?

Anyway, here's a short dmesg snip:
[    1.611352] s3c-rtc 10070000.rtc: s3c2410_rtc: tick irq 65, alarm irq 
64
[    1.611430] s3c-rtc 10070000.rtc: failed to find rtc source clock
[    1.616740] s3c-rtc: probe of 10070000.rtc failed with error -2

With best wishes,
Tobias Jakobi
