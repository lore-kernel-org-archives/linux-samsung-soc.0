Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9C0C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Aug 2021 20:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2151161107
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Aug 2021 20:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbhHRUpO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Aug 2021 16:45:14 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:55050
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233628AbhHRUpO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Aug 2021 16:45:14 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 46035412EC
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Aug 2021 20:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629319478;
        bh=w/RbWNVq+6eK1IK1LMIbc97kV5SfHCBYyyVBgM9fYUc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=qNLWBLXlYXs6NOwRt7SAuypw46XqdPYepDPl/6NcT0sTvhnCBeRRJZl6ypFewI8I4
         VvU4lc/81nIgs7A79GEyAj1J8O9ofMyZHYSEOgQNByEGsP52Xaz2hn2kJ81+e3foWe
         CLsc/kGgA+9F7FdCdp1BPLTMuENy30gSdhgwlcTwzz62ctEQNafd9r2Dlzv+EYCo9p
         3vkEtsHyeSP7WL3npvqo20+Q9spMEoCunABbslRwIKo8yblvsP5QOuE2+r/fzQ1nqL
         wqG4LQZZ0Rvm9dWiQVOGgWHpWKD6C7tBSVlZ3q0fzn6Xcs9NrsJ8XLnv1IjwNDNFTs
         XwPD7HdHPQKQw==
Received: by mail-ed1-f71.google.com with SMTP id n4-20020aa7c6840000b02903be94ce771fso1681440edq.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Aug 2021 13:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w/RbWNVq+6eK1IK1LMIbc97kV5SfHCBYyyVBgM9fYUc=;
        b=JIu/LYQ3CPLM9vM+sy5JW65tQ8XTC+TKXWOby3J1Q2emvAxFI8y0cgVa11+60kLZc6
         xXIVRViJc3rmAstP+cmafQwRhM6ieZNoiuB1ARnVYfRTYB1v1HYYLIUNbsqJZJCNiJiJ
         tRxBU7ILRYGiSJck/jK0AOjNzjyIXlLqg1FaQ3kHu1XYXk8I7upr4QIW1Ymp+m4Wa00q
         0tgfeJWqVsK7ZSGckgB4/zNk5e/xasbRFCdW0EfbT3hEL1wAJ6DvVBJO05DyG9aSNxyw
         HlAdhL/ujcfgMKV97AQ0wjBeKFzf5gwKYf1LASCu8Oh3VSL2hrkui+7YGs1v0bPJBox3
         MqFA==
X-Gm-Message-State: AOAM531YmYkGnaZeoV9bJGR+PAfFnOPFA7RxF1XnoEQJwdbnqwKEmHMp
        dkO39tnVunSA3l4EIUDLFZ8iCkKW0KoHaHXHHOJbdcq3+RXxMLSWNQD8qvZsixIIlVClbLlCBxI
        Db0KQfGrLaDp9F/oztsqB73ZGYjdPhb8VC5/lmngoV7dwYCvz
X-Received: by 2002:a50:d749:: with SMTP id i9mr12432942edj.248.1629319477835;
        Wed, 18 Aug 2021 13:44:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjqxRCuuOtlEqf7OA30Ywtxe0S0ibN48o7NzGEO8v0ICIqx5eRtOtCcHicPX3MQxUZo4bEDw==
X-Received: by 2002:a50:d749:: with SMTP id i9mr12432928edj.248.1629319477667;
        Wed, 18 Aug 2021 13:44:37 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id j11sm341372ejy.112.2021.08.18.13.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 13:44:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Jason Wang <wangborong@cdjrlc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH][PULL/direct] ARM: s3c: delete unneed local variable "delay"
Date:   Wed, 18 Aug 2021 22:44:22 +0200
Message-Id: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Jason Wang <wangborong@cdjrlc.com>

"delay" variable on line 79 can be deleted by returning "0" on line 88.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
Link: https://lore.kernel.org/r/20210624055627.22295-1-wangborong@cdjrlc.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---

Hi Arnd and Olof,

I have just one patch for Samsung ARM mach/soc, so sending this
directly.

Best regards,
Krzysztof


 arch/arm/mach-s3c/mach-gta02.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-gta02.c b/arch/arm/mach-s3c/mach-gta02.c
index aec8b451c016..418939ce0fc3 100644
--- a/arch/arm/mach-s3c/mach-gta02.c
+++ b/arch/arm/mach-s3c/mach-gta02.c
@@ -79,13 +79,12 @@ static struct pcf50633 *gta02_pcf;
 
 static long gta02_panic_blink(int state)
 {
-	long delay = 0;
 	char led;
 
 	led = (state) ? 1 : 0;
 	gpio_direction_output(GTA02_GPIO_AUX_LED, led);
 
-	return delay;
+	return 0;
 }
 
 
-- 
2.30.2

