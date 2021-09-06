Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E230BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Sep 2021 13:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B75E160E8B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Sep 2021 13:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242478AbhIFNss (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Sep 2021 09:48:48 -0400
Received: from smtpbg126.qq.com ([106.55.201.22]:17264 "EHLO smtpbg587.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242330AbhIFNss (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 09:48:48 -0400
X-QQ-mid: bizesmtp32t1630936019t1xc7n3c
Received: from localhost.localdomain (unknown [171.223.98.107])
        by esmtp6.qq.com (ESMTP) with 
        id ; Mon, 06 Sep 2021 21:46:58 +0800 (CST)
X-QQ-SSF: 01000000004000C0D000B00A0000000
X-QQ-FEAT: 0VmwRkEgV1FWcRSAALeydNZuGmmRQOvfXre6MvYzyVi1tkDn5Cdgidi1shKhC
        Sknu6ZAyCKbDkD7bhCk4DUrSVQWEWwZ/1tMhR00TDwWO46mldUDlTSUNAgX9zJJwfBGTBkU
        sPy52KRAoeMhK+psazlvQl7L7gSG05rhgy40VmG0ySByUhWVgZaKxnUqI2/HITYeuggXlcY
        ehYW7X98Am2kPVE9HWoBXyB0ZURRZuZLJts5a1zb7r6FSEpu+qFAtTCBR90rAKgj8zgQdHN
        sRxfqxY7Y1PFGscAvyn5mQJi8zDlJNQlmV5glWW5j9lgTwiYgwuOmHdu90jmDCiMijwXmrX
        ANE6jGtwghATq3QHn2N/266Qki2DA==
X-QQ-GoodBg: 0
From:   Jason Wang <wangborong@cdjrlc.com>
To:     krzysztof.kozlowski@canonical.com
Cc:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] ARM: s3c: Use strscpy to replace strlcpy
Date:   Mon,  6 Sep 2021 21:46:56 +0800
Message-Id: <20210906134656.101088-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam2
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The strlcpy should not be used because it doesn't limit the source
length. As linus says, it's a completely useless function if you
can't implicitly trust the source string - but that is almost always
why people think they should use it! All in all the BSD function
will lead some potential bugs.

But the strscpy doesn't require reading memory from the src string
beyond the specified "count" bytes, and since the return value is
easier to error-check than strlcpy()'s. In addition, the implementation
is robust to the string changing out from underneath it, unlike the
current strlcpy() implementation.

Thus, We prefer using strscpy instead of strlcpy.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/arm/mach-s3c/mach-mini6410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/mach-mini6410.c b/arch/arm/mach-s3c/mach-mini6410.c
index 741fa1f09694..c14c2e27127b 100644
--- a/arch/arm/mach-s3c/mach-mini6410.c
+++ b/arch/arm/mach-s3c/mach-mini6410.c
@@ -262,7 +262,7 @@ static char mini6410_features_str[12] __initdata = "0";
 static int __init mini6410_features_setup(char *str)
 {
 	if (str)
-		strlcpy(mini6410_features_str, str,
+		strscpy(mini6410_features_str, str,
 			sizeof(mini6410_features_str));
 	return 1;
 }
-- 
2.33.0

