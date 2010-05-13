From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 2/9] ARM: SAMSUNG: Move mach/ts.h to plat/ts.h
Date: Thu, 13 May 2010 22:09:59 +0900
Message-ID: <008001caf29d$9a2f9f80$ce8ede80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Ben Dooks' <ben-linux@fluff.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch has been merged into Ben Dooks' tree, for-2635/s3c64xx-ts.
So need to rebase this commit.

---
commit 34b01740be6e010976a2f5aa8f343d3b5dd6d278
Author: Maurus Cuelenaere <mcuelenaere@gmail.com>
Date:   Tue May 4 13:12:41 2010 +0200

    ARM: SAMSUNG: Move mach/ts.h to plat/ts.h

    This moves mach-s3c2410/include/mach/ts.h to
plat-samsung/include/plat/ts.h in
    order to prepare for s3c64xx support in the touchscreen driver.

    Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
    Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
