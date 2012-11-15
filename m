From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] i2c-s3c2410: Fix a bug and optimize code
Date: Thu, 15 Nov 2012 17:43:29 +0530
Message-ID: <1352981613-2098-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

The following set of patches fixes a bug in i2c-s3c2410 driver
with respect to the functioning of dedicated HDMIPHY channel.
1. Removing unwanted spinlock
2. Correcting the Stop sequence
3. Optimizing the wait loop for bus idle.
4. Removing unnecessary HDMI special cases
Respectively.

Daniel Kurtz (4):
  i2c-s3c2410: grab adapter lock while changing i2c clock
  i2c-s3c2410: do not generate STOP for QUIRK_HDMIPHY
  i2c-s3c2410: use exponential back off while polling for bus idle
  i2c-s3c2410: do not special case HDMIPHY stuck bus detection

 drivers/i2c/busses/i2c-s3c2410.c |  134 ++++++++++++++++++++++++++------------
 1 file changed, 91 insertions(+), 43 deletions(-)

-- 
1.7.9.5
