From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH RESEND 3/4] mfd: sec-core: Add cells for S5M8767-clocks
Date: Thu, 26 Dec 2013 15:49:00 +0530
Message-ID: <1388053141-30085-4-git-send-email-tushar.behera@linaro.org>
References: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
 <1388053141-30085-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1388053141-30085-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, lee.jones@linaro.org, kgene.kim@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

S5M8767 chip has 3 crystal oscillators running at 32KHz. These are
supported by s2mps11-clk driver.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
CC: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/sec-core.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 66936b8..a139798 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -56,7 +56,9 @@ static const struct mfd_cell s5m8767_devs[] = {
 		.name = "s5m8767-pmic",
 	}, {
 		.name = "s5m-rtc",
-	},
+	}, {
+		.name = "s5m8767-clk",
+	}
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-- 
1.7.9.5
