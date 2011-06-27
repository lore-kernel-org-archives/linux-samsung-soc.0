From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 0/3] RTC-S3C Bugfixes
Date: Mon, 27 Jun 2011 20:43:23 +0900
Message-ID: <1309175006-9218-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: a.zummo@towertech.it, Kukjin Kim <kgene.kim@samsung.com>, dg77.kim@samsung.com, kyungmin.park@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

1. Bugfix: incorrect debug messages
2. Bugfix: alarm entires not being reset
3. Bugfix (More like update?): allow to open rtc-s3c multiple times.

MyungJoo Ham (3):
  rtc: rtc-s3c: Correct debug messages.
  rtc: rtc-s3c: Disable alarm entries that are not chosen.
  rtc: rtc-s3c: allow multiple open / allow no-ioctl-open'ed rtc to
    have irq.

 drivers/rtc/rtc-s3c.c |   77 +++++++++++++++++-------------------------------
 1 files changed, 27 insertions(+), 50 deletions(-)

-- 
1.7.4.1
