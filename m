Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFA2C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Apr 2021 06:49:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33FC061057
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Apr 2021 06:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbhDIGts (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Apr 2021 02:49:48 -0400
Received: from mail-m17635.qiye.163.com ([59.111.176.35]:22742 "EHLO
        mail-m17635.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233423AbhDIGtr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 02:49:47 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 6748B4003FC;
        Fri,  9 Apr 2021 14:49:28 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] arm: mach-s3c: Remove unnecessary break
Date:   Fri,  9 Apr 2021 14:49:20 +0800
Message-Id: <20210409064920.1096367-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQ0lKHlYaGk1MSktMTx5LTkNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kww6PAw*Ej8TFhoaPTg0IzxC
        DRYaCglVSlVKTUpMQk5LQk1DQkpKVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKTkNKNwY+
X-HM-Tid: 0a78b5648ae4d991kuws6748b4003fc
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is a return above the break.
The break here is unnecessary. Remove it.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 arch/arm/mach-s3c/mach-rx1950.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-s3c/mach-rx1950.c b/arch/arm/mach-s3c/mach-rx1950.c
index 6e19add158a9..9da94686001a 100644
--- a/arch/arm/mach-s3c/mach-rx1950.c
+++ b/arch/arm/mach-s3c/mach-rx1950.c
@@ -271,7 +271,6 @@ static int rx1950_led_blink_set(struct gpio_desc *desc, int state,
 		break;
 	default:
 		return -EINVAL;
-		break;
 	}
 
 	if (delay_on && delay_off && !*delay_on && !*delay_off)
-- 
2.25.1

