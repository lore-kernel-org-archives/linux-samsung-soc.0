Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED43C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 10:23:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E18F823A3B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 10:23:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbhANKXE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jan 2021 05:23:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbhANKXD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 05:23:03 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3DFC061575
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jan 2021 02:22:24 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id r4so4168236wmh.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jan 2021 02:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TDBOHLIzbUobbB/H8vBPt1OXjZemmTv6BVFzaBtUnnA=;
        b=vkadCAqk5+2FVW0RSnQ2RReuN+Ncfp0p3LHyEsMIxgG1AG6L38MculRERwD8h1JBXq
         x4bL1kIScSX0vyT8Slp72d2Up1UezdewatH4h5bYtmii6h1FIJR0RwgNjm27m2EK/JC+
         QsiMYxXBYsv6QEgjr2vdw0ffmjkm6eWNU5Aksn7Kv9bLQChG3/RfphR3ygJr8+1ovFiC
         nFPpOTyZY7u755QXnvn8FlX3GwDnvZ1Q5YnJisOcPF4l2FceSPNabB/7JK9lSJrjj+aC
         cLFBlp86yVyvSY2v3s9cjKpj/vkPe96/Tw198/KM2CLax+6ICjmFL3fJ3LX8sEd9BRE2
         ba6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TDBOHLIzbUobbB/H8vBPt1OXjZemmTv6BVFzaBtUnnA=;
        b=Uu+TDnQukZ8z4/r7zpqgvJUlZQDF5Nd2x5c7yzTy3X3Ut/oHeo8IWgf190Akibwnaw
         ooIeYCXSP0ylyTZJohiSvcNiwKxfskZvDKvvm0/+RsezHYZajG/BKUpbxPEPMJStnxsx
         7uUcdMDoxV+5JLnJ9Bn0mACR+gTiRRay2N004Znkn4Q5Hmb2bMmRwgIBan1uO9/mebm0
         pEd59IefQg553NjoGICOF6hNvUCq2ADwuOk/ZeVNyJXVP1GHNHHBXmQOAn2WV4k2t7l8
         OkS/DmJ3xlgB7Jm9pSuEZmPnDjCw3Vz48wOboe9mD0wRWDiH2/Wj5QM4BJ+46Ni5KZZZ
         HNDw==
X-Gm-Message-State: AOAM5325jPb79aNLU46xeo9DCEfxulLHVngEetneDT68BzziQepqlIpu
        qGsj8UwXfZ2vSU0K+BjRC+zDGg==
X-Google-Smtp-Source: ABdhPJz/Us+lTCzL6I6kTkiPk48eVv4ZkplclXvz1XWx01j9qMAig1MBrV4LTxMJ0NefnEK47i24QQ==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr3152510wml.160.1610619742692;
        Thu, 14 Jan 2021 02:22:22 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l7sm2468467wmg.41.2021.01.14.02.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 02:22:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 0/3] rtc: s5m: driver improvements
Date:   Thu, 14 Jan 2021 11:22:16 +0100
Message-Id: <20210114102219.23682-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is a set of improvements for the rtc-s5m driver. The first patch
is new in v4: I noticed the I2C regmap is not selected by this driver's
Kconfig. Two subsequent patches were already submitted separately.

v1 -> v2:
- remove the remove() callback

v2 -> v3:
- fix an error pointed out by the build robot

v3 -> v4:
- add patch 1/3: ("rtc: s5m: select REGMAP_I2C")
- fix issues raised by the kernel bot

v4 -> v5:
- change the order of the patches to keep them bisectable

Bartosz Golaszewski (3):
  rtc: s5m: select REGMAP_I2C
  rtc: s5m: use devm_i2c_new_dummy_device()
  rtc: s5m: check the return value of s5m8767_rtc_init_reg()

 drivers/rtc/Kconfig   |  1 +
 drivers/rtc/rtc-s5m.c | 33 +++++++++------------------------
 2 files changed, 10 insertions(+), 24 deletions(-)

-- 
2.29.1

