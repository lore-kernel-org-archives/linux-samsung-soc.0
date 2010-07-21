From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/5] Add RTC support SMDK6410, SMDKC100, SMDKC110 and SMDKV210
Date: Wed, 21 Jul 2010 18:00:09 +0900
Message-ID: <1279702814-14929-1-git-send-email-kgene.kim@samsung.com>
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
Cc: p_gortmaker@yahoo.com, ben-linux@fluff.org, a.zummo@towertech.it
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds RTC support for Samsung SoCs such as S5P6440, S5PC100, S5PV210,
and S5PC110.

NOTE: depends on previous Samsung RTC patches.

[PATCH 1/5] ARM: S3C64XX: Add RTC support for S3C64XX
[PATCH 2/5] rtc: rtc-s3c: Add extra option to include RTC for Samsung SoCs
[PATCH 3/5] ARM: S5P6440: Add RTC support for S5P6440
[PATCH 4/5] ARM: S5PC100: Add RTC support for S5PC100
[PATCH 5/5] ARM: S5PV210: Add RTC support for S5PV210 and S5PC110
