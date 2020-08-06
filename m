Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF07C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 455A5221E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596739105;
	bh=AIpLTJlKFItG2jWXcrIaGnSQbfvgpjgzdq2hRWO00gM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=BMWTd+f93DEsAWRc9sXYc7htA20IS7BMe/TxueMam7y3Mj6ZvYPvjdj/LeAYTuLuk
	 5MXQCWDBhOe85t5Po9gba8amf86BFS2ZSmWyEaDwu4sztq25SN9o6MrT0DBT4d320W
	 UcR6zuZhFZYhO3LZUot5Mx8oFrYj/b/njtqeeen4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgHFSiX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728751AbgHFSem (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:42 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4ABC0619C4
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:32 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c80so9690105wme.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=ZCdhnoQHRbN4aZbjsHosjM5OSsvQx8d0VXq53nF8Krs=;
        b=HAFyFeFJrzYW2hGFbujCrVofZvmziFsgqDgPImaIh/6jhv93aCnPnUfLcNYa36HAO5
         FrNP4LFfBkZ3cHWsIQv1T1xexjJM1vvHdNx9KEuf0XGSl7DjC5BchPSv9l+8zoOt5111
         v9vDXiGnaW+tTbnEGc8/9I39M3aEe56+jQnY9adLyzKSmHnMNPBxsxOQB0xB9WQvIE5W
         /9OteE/r0aMkcbUy6f4kgiU1rxRxhvFqAmIrU3bdQ9H6zwkGClmNtLPYOJ8MzFL1LNPy
         MshpVcKEpJGp2mbcW+gal1W4TrJiJHaWatDB0BUDjsMMflKR9KAqoojVqNg8rgZphbVu
         Ir1w==
X-Gm-Message-State: AOAM53175BupPkf3IRmue64ZvlbNEn3sIgu0cSsJO7nOff20MY4kWjYt
        uracyfZUl3XOepM2rdJGiBJ2FvnHyGo=
X-Google-Smtp-Source: ABdhPJxw31RtJT/Zx/CyZ95jsBWddw6kPe1PUK6p2HQys/+MGp0BsY4SEAluZD+baZgjSdvTd9AHng==
X-Received: by 2002:a05:600c:210:: with SMTP id 16mr9492896wmi.165.1596738870920;
        Thu, 06 Aug 2020 11:34:30 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id o124sm7562099wmb.2.2020.08.06.11.34.30
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:30 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1541631lta;
        Thu, 6 Aug 2020 11:23:27 -0700 (PDT)
X-Received: by 2002:a17:90a:414d:: with SMTP id m13mr9433185pjg.163.1596738207021;
        Thu, 06 Aug 2020 11:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738207; cv=none;
        d=google.com; s=arc-20160816;
        b=ggfuG3zqGfc9BnBMRODHa+KtwHcQAOxMvSB7lxOvbxSj1iNP6DR/5o/3eoonandCG+
         MzPW7Q1b5zdXUpWZ2T2GaI94wVKYEjeAK8TOj2DEDPFO17taflgh9rLevTBbPTjFE8LR
         PLJ/lGFXG7WQwSquwJGrXysh9C4FoKxwTVJBzD1wMsNJkY0RzgdzkPeTFypAFIqvNk58
         +37qIKNzUkw/o7B2ntz0GMyEKIXpjrotepyn8duCNevySpJK04n4LEoLAx3/VOXxtO1G
         OGKkGZxsTEMRZw7cAtZq2b92McKLHSj1VpOeX0r7M+JlFyRcmOtzqIqcs97YORd7cdG5
         binw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=ZCdhnoQHRbN4aZbjsHosjM5OSsvQx8d0VXq53nF8Krs=;
        b=TO2mqd6PZYEVwZglEHuQzfoStxku+6ueCEeY7/+N7S0SVBTKTapetCXF0lKXx/yy9g
         zFgC6G81iKR0JLx3v8tFEJddtkW0dZTCy/+4S6owYtx8Q7Aa+apJRnlsihQtsUlO0BKG
         Gyr5TjBAZd+BZ0/avH9r/fRUDa4YhnmHRWHb+rptofdtcEETPi2RFCkCQDqFUhRNCc4p
         Zp5fQ0ZLQWTLeEemKDzkqlrBlwfBK1aDcK1LXnn4Bw/8sanhgsfrqE5q675rHdep8DjG
         KFTLgjDli5TEjI3KHhDF4mhN0Z5GQha9W6LHgAWpWK1w8heiQ/hFsMaTjJ8bBra0R/7d
         L8tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=2UrWbacc;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id j6si4013583pll.251.2020.08.06.11.23.26
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:23:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 147CB22DD3; Thu,  6 Aug 2020 18:23:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3098F22DCC;
        Thu,  6 Aug 2020 18:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738207;
        bh=AIpLTJlKFItG2jWXcrIaGnSQbfvgpjgzdq2hRWO00gM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2UrWbaccsVbgJ4PjuRufTVR4PiUR7F4mIKm0UOgmDP5hKj0u4JZl0JTQBhUXsyBDD
         cVfUeUlHld6rKFzcXSb1dtr4jmqFMEVQ4nNjsScLrUMqUwmlHN1WuBsjByqxxfDlTg
         RdRJ+wOC7pWeGOu85r1hKklai3x/43cWsukTya3k=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 27/41] ASoC: samsung: s3c2412-i2s: avoid hardcoded S3C2410_PA_IIS
Date:   Thu,  6 Aug 2020 20:20:44 +0200
Message-Id: <20200806182059.2431-27-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: nxLGzuYYKVKs
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The constant requires indirectly including a machine header file,
but it's not actually used any more since commit 87b132bc0315 ("ASoC:
samsung: s3c24{xx,12}-i2s: port to use generic dmaengine API"), so
remove it completely.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/s3c-i2s-v2.c  | 3 +--
 sound/soc/samsung/s3c-i2s-v2.h  | 3 +--
 sound/soc/samsung/s3c2412-i2s.c | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index ed21786104a1..e9481187a08c 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -616,8 +616,7 @@ int s3c_i2sv2_iis_calc_rate(struct s3c_i2sv2_rate_calc *info,
 EXPORT_SYMBOL_GPL(s3c_i2sv2_iis_calc_rate);
 
 int s3c_i2sv2_probe(struct snd_soc_dai *dai,
-		    struct s3c_i2sv2_info *i2s,
-		    unsigned long base)
+		    struct s3c_i2sv2_info *i2s)
 {
 	struct device *dev = dai->dev;
 	unsigned int iismod;
diff --git a/sound/soc/samsung/s3c-i2s-v2.h b/sound/soc/samsung/s3c-i2s-v2.h
index fe42b77999fd..8c6fc0d3d77e 100644
--- a/sound/soc/samsung/s3c-i2s-v2.h
+++ b/sound/soc/samsung/s3c-i2s-v2.h
@@ -83,8 +83,7 @@ extern int s3c_i2sv2_iis_calc_rate(struct s3c_i2sv2_rate_calc *info,
  * @base: The base address for the registers.
  */
 extern int s3c_i2sv2_probe(struct snd_soc_dai *dai,
-			   struct s3c_i2sv2_info *i2s,
-			   unsigned long base);
+			   struct s3c_i2sv2_info *i2s);
 
 /**
  * s3c_i2sv2_cleanup - cleanup resources allocated in s3c_i2sv2_probe
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index b35d828c1cfe..edfa9d11d2e5 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -49,7 +49,7 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
 	snd_soc_dai_init_dma_data(dai, &s3c2412_i2s_pcm_stereo_out,
 					&s3c2412_i2s_pcm_stereo_in);
 
-	ret = s3c_i2sv2_probe(dai, &s3c2412_i2s, S3C2410_PA_IIS);
+	ret = s3c_i2sv2_probe(dai, &s3c2412_i2s);
 	if (ret)
 		return ret;
 
-- 
2.17.1

