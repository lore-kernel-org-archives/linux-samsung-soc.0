Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67D9C43460
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Apr 2021 18:16:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF594613B1
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Apr 2021 18:16:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234736AbhDESQR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Apr 2021 14:16:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33092 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbhDESQQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Apr 2021 14:16:16 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lTTlh-0004sn-7x
        for linux-samsung-soc@vger.kernel.org; Mon, 05 Apr 2021 18:16:09 +0000
Received: by mail-wr1-f69.google.com with SMTP id r11so3906628wrp.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Apr 2021 11:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M+LRPj/fCq0SEo4/VKey3X9K9DoRxq2h/ltKuYY7g0o=;
        b=maLCl9KMyIEa/FlMbzK+IvIdjqhe81x2mvOPEe8fmOPsdj5u3TeuR49PClJHUaIOrF
         qUdLpEiAPx6QyHOUlgWjhy3xixTz6ieuVbr+qKnehKNrORZVu/usAKkteIdskAuSEKM3
         7mWQ4RD5eYuMGXjXE2ngxJaV2eRDjBKtR5JXPhGN28nHmcCq8jLvvdK5lBs1bn8qDxu3
         nR3jRKd2V6PV4KPX60LXiUKV1iX9kxuRGazIyv5iDefKiozylO4x0hfp3ggpblUkzAbQ
         RND+aYA5XXwnJKef3ZYiM6MmKCtM+lKQbQMzuJKqCcoYyJp8O8Iiqdfb6POVBpZD85ce
         FByg==
X-Gm-Message-State: AOAM533KAjLttIVx1Nau6mWDBHaidkBQzvc6472CY8I58b9UgbuDtdV6
        7oRAw8XKTdrazbtWs8W8rWf33du7DtyABDj65fp1xeFbBHdGWu13dwi5vNy6r2Djt/cjnJPxevs
        vjNTbGWDnJc80fwUiqIlW1I0WfZMyS+iRnV2u6DO1CD8WCdHI
X-Received: by 2002:a05:6000:18cd:: with SMTP id w13mr30280781wrq.20.1617646569010;
        Mon, 05 Apr 2021 11:16:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKpeiK1vbwLjGL7whf06oPDq1IhygALHGmwF/FSN5Xa9HdtC0t5zWYCtOzZ5sXaQ8ZEOcVbw==
X-Received: by 2002:a05:6000:18cd:: with SMTP id w13mr30280765wrq.20.1617646568854;
        Mon, 05 Apr 2021 11:16:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id b15sm28930075wrx.73.2021.04.05.11.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 11:16:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: exynos: correct kernel doc in platsmp
Date:   Mon,  5 Apr 2021 20:16:05 +0200
Message-Id: <20210405181605.52612-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Correct few kerneldoc issues, including W=1 compile warning:

  arch/arm/mach-exynos/platsmp.c:89: warning:
    expecting prototype for exynos_core_power_down(). Prototype was for exynos_cpu_power_down() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/mach-exynos/platsmp.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index ea0be59f469a..fb4a394ece3a 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -78,12 +78,11 @@ static inline void platform_do_lowpower(unsigned int cpu, int *spurious)
 #endif /* CONFIG_HOTPLUG_CPU */
 
 /**
- * exynos_core_power_down : power down the specified cpu
- * @cpu : the cpu to power down
+ * exynos_cpu_power_down() - power down the specified cpu
+ * @cpu: the cpu to power down
  *
  * Power down the specified cpu. The sequence must be finished by a
  * call to cpu_do_idle()
- *
  */
 void exynos_cpu_power_down(int cpu)
 {
@@ -107,8 +106,8 @@ void exynos_cpu_power_down(int cpu)
 }
 
 /**
- * exynos_cpu_power_up : power up the specified cpu
- * @cpu : the cpu to power up
+ * exynos_cpu_power_up() - power up the specified cpu
+ * @cpu: the cpu to power up
  *
  * Power up the specified cpu
  */
@@ -124,9 +123,8 @@ void exynos_cpu_power_up(int cpu)
 }
 
 /**
- * exynos_cpu_power_state : returns the power state of the cpu
- * @cpu : the cpu to retrieve the power state from
- *
+ * exynos_cpu_power_state() - returns the power state of the cpu
+ * @cpu: the cpu to retrieve the power state from
  */
 int exynos_cpu_power_state(int cpu)
 {
@@ -135,8 +133,8 @@ int exynos_cpu_power_state(int cpu)
 }
 
 /**
- * exynos_cluster_power_down : power down the specified cluster
- * @cluster : the cluster to power down
+ * exynos_cluster_power_down() - power down the specified cluster
+ * @cluster: the cluster to power down
  */
 void exynos_cluster_power_down(int cluster)
 {
@@ -144,8 +142,8 @@ void exynos_cluster_power_down(int cluster)
 }
 
 /**
- * exynos_cluster_power_up : power up the specified cluster
- * @cluster : the cluster to power up
+ * exynos_cluster_power_up() - power up the specified cluster
+ * @cluster: the cluster to power up
  */
 void exynos_cluster_power_up(int cluster)
 {
@@ -154,8 +152,8 @@ void exynos_cluster_power_up(int cluster)
 }
 
 /**
- * exynos_cluster_power_state : returns the power state of the cluster
- * @cluster : the cluster to retrieve the power state from
+ * exynos_cluster_power_state() - returns the power state of the cluster
+ * @cluster: the cluster to retrieve the power state from
  *
  */
 int exynos_cluster_power_state(int cluster)
@@ -165,7 +163,7 @@ int exynos_cluster_power_state(int cluster)
 }
 
 /**
- * exynos_scu_enable : enables SCU for Cortex-A9 based system
+ * exynos_scu_enable() - enables SCU for Cortex-A9 based system
  */
 void exynos_scu_enable(void)
 {
-- 
2.25.1

