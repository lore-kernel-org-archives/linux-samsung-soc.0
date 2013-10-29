From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] pwm: samsung: Fix kernel warning while unexporting a channel
Date: Tue, 29 Oct 2013 10:27:43 +0530
Message-ID: <1383022663-22315-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:47938 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751162Ab3J2E7D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Oct 2013 00:59:03 -0400
Received: by mail-pa0-f52.google.com with SMTP id bj1so2069781pad.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Oct 2013 21:59:02 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pwm@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, tomasz.figa@gmail.com, sachin.kamat@linaro.org

PWM channel data was set to NULL before freeing it. This caused the
following kernel warning while unexporting the channel. Set the channel
data to NULL after freeing it.

[   70.495000] WARNING: CPU: 0 PID: 1 at drivers/base/devres.c:805 pwm_put+0x48/0x80()
[   70.505000] Modules linked in:
[   70.505000] CPU: 0 PID: 1 Comm: sh Not tainted 3.12.0-rc6-next-20131024-00012-gd4aec04-dirty #58
[   70.515000] [<c0014ddc>] (unwind_backtrace+0x0/0xf4) from [<c0011784>] (show_stack+0x10/0x14)
[   70.525000] [<c0011784>] (show_stack+0x10/0x14) from [<c03a3cbc>] (dump_stack+0x7c/0xb0)
[   70.530000] [<c03a3cbc>] (dump_stack+0x7c/0xb0) from [<c001de68>] (warn_slowpath_common+0x6c/0x88)
[   70.540000] [<c001de68>] (warn_slowpath_common+0x6c/0x88) from [<c001df20>] (warn_slowpath_null+0x1c/0x24)
[   70.550000] [<c001df20>] (warn_slowpath_null+0x1c/0x24) from [<c01d1af8>] (pwm_put+0x48/0x80)
[   70.560000] [<c01d1af8>] (pwm_put+0x48/0x80) from [<c01d21c8>] (pwm_unexport_store+0x94/0xac)
[   70.565000] [<c01d21c8>] (pwm_unexport_store+0x94/0xac) from [<c010991c>] (sysfs_write_file+0x148/0x1d8)
[   70.575000] [<c010991c>] (sysfs_write_file+0x148/0x1d8) from [<c00b2a80>] (vfs_write+0xb4/0x1a0)
[   70.585000] [<c00b2a80>] (vfs_write+0xb4/0x1a0) from [<c00b3068>] (SyS_write+0x3c/0x78)
[   70.595000] [<c00b3068>] (SyS_write+0x3c/0x78) from [<c000e2e0>] (ret_fast_syscall+0x0/0x30)

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/pwm/pwm-samsung.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index b2c54c8..6d23eb3 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -226,8 +226,8 @@ static int pwm_samsung_request(struct pwm_chip *chip, struct pwm_device *pwm)
 
 static void pwm_samsung_free(struct pwm_chip *chip, struct pwm_device *pwm)
 {
-	pwm_set_chip_data(pwm, NULL);
 	devm_kfree(chip->dev, pwm_get_chip_data(pwm));
+	pwm_set_chip_data(pwm, NULL);
 }
 
 static int pwm_samsung_enable(struct pwm_chip *chip, struct pwm_device *pwm)
-- 
1.7.9.5
