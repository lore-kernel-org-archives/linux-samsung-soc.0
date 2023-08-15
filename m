Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AD9C001DE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Aug 2023 06:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234966AbjHOGJf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Aug 2023 02:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbjHOGIo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 02:08:44 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188052684
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 23:07:28 -0700 (PDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RQ11269hLztRwt;
        Tue, 15 Aug 2023 14:03:50 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 15 Aug
 2023 14:07:26 +0800
From:   Yue Haibing <yuehaibing@huawei.com>
To:     <krzysztof.kozlowski@linaro.org>, <alim.akhtar@samsung.com>,
        <yuehaibing@huawei.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <andi.shyti@kernel.org>
Subject: [PATCH v2 -next] i2c: s3c2410: Remove unused extern declarations
Date:   Tue, 15 Aug 2023 14:07:20 +0800
Message-ID: <20230815060720.17360-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

After some cleanups[*] certain s3c_i2c(*)_cfg_gpio() prototypes
have become unused. Remove them.

[*] 0d297df03890 ("ARM: s3c: simplify platform code")
    d78c16ccde96 ("ARM: SAMSUNG: Remove remaining legacy code")
    bad1e6aadd17 ("ARM: SAMSUNG: Cleanup plat-samsung/devs.c and devs.h")

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 
---
v2: rewrite commit message as Andi suggested
---
 include/linux/platform_data/i2c-s3c2410.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/linux/platform_data/i2c-s3c2410.h b/include/linux/platform_data/i2c-s3c2410.h
index 550746715139..c8c3146c34ea 100644
--- a/include/linux/platform_data/i2c-s3c2410.h
+++ b/include/linux/platform_data/i2c-s3c2410.h
@@ -52,23 +52,10 @@ struct s3c2410_platform_i2c {
  */
 extern void s3c_i2c0_set_platdata(struct s3c2410_platform_i2c *i2c);
 extern void s3c_i2c1_set_platdata(struct s3c2410_platform_i2c *i2c);
-extern void s3c_i2c2_set_platdata(struct s3c2410_platform_i2c *i2c);
-extern void s3c_i2c3_set_platdata(struct s3c2410_platform_i2c *i2c);
-extern void s3c_i2c4_set_platdata(struct s3c2410_platform_i2c *i2c);
-extern void s3c_i2c5_set_platdata(struct s3c2410_platform_i2c *i2c);
-extern void s3c_i2c6_set_platdata(struct s3c2410_platform_i2c *i2c);
-extern void s3c_i2c7_set_platdata(struct s3c2410_platform_i2c *i2c);
-extern void s5p_i2c_hdmiphy_set_platdata(struct s3c2410_platform_i2c *i2c);
 
 /* defined by architecture to configure gpio */
 extern void s3c_i2c0_cfg_gpio(struct platform_device *dev);
 extern void s3c_i2c1_cfg_gpio(struct platform_device *dev);
-extern void s3c_i2c2_cfg_gpio(struct platform_device *dev);
-extern void s3c_i2c3_cfg_gpio(struct platform_device *dev);
-extern void s3c_i2c4_cfg_gpio(struct platform_device *dev);
-extern void s3c_i2c5_cfg_gpio(struct platform_device *dev);
-extern void s3c_i2c6_cfg_gpio(struct platform_device *dev);
-extern void s3c_i2c7_cfg_gpio(struct platform_device *dev);
 
 extern struct s3c2410_platform_i2c default_i2c_data;
 
-- 
2.34.1

