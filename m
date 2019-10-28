Return-Path: <SRS0=EJN4=YV=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B873CA9EC0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 28 Oct 2019 12:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC580214D9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 28 Oct 2019 12:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIBMP/II"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729648AbfJ1Mej (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 28 Oct 2019 08:34:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34961 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbfJ1Mej (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 08:34:39 -0400
Received: by mail-pg1-f196.google.com with SMTP id c8so6800876pgb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Oct 2019 05:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+QFIjkm2Qhd2yMaRyycj1Wp3bAUqh+YRfecnygC6mNI=;
        b=qIBMP/IIpuieM1XBz8PBGX7WAS6+nFzGcXBzEK8+0lh9orV9ox2skQ9hePA4OeC6e7
         1rOTtOfqd0pCyTrDJHjzFG8/H+gbxaRT1rXleJqRBABb3yc5m+hOxEQRLbZ9iJLf+0WF
         02BIlQNgMOYZy15wFYKB+DHNtm1VYAS0YGc9RV4sj+VqDOZLZH12iF67iG7YZkQaTYLm
         29DtLh+ADKyp0d09juEbUzRP5CwC4OEo9yARB98oE+FqnFUQCuAwFWZsY5F1rwPYqgsl
         zIJc9YCEaC8kxrPyuKMWBHVy7fg7uHj8XiKb/OQ0zJQJLkm4PJRUpLp3APc+vZfDFkbi
         Cqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+QFIjkm2Qhd2yMaRyycj1Wp3bAUqh+YRfecnygC6mNI=;
        b=jFQoEL9XF3pogUmqPwW/L07IWJGkvgt0eKpWdTloguvyvOumbVguQcR/Dp+Zeecv58
         3DOgvXE/x/HADUE3FWgmAlfvQCu04dGfU4riGU5IuINk9UIKmT5Lm0qUJEr67G6vpUU1
         HqR+0Fd+pzUCotLtvP6DWp3XjoQkoWSFJotKjt5i1qVxvIyBa295vYpppJrytTXllUYY
         bRBwafpa67yOADqFziK4Ie8bwI0ogCZCywycbube7gTsBXrzZo4FNyM6HxWierQxqiU8
         UQ22Vh/4+eB7l9l15Pl0nYqoOfTlE9VxrOI81vzkmVv7gn7oaqeNNnhlMaiYAf00skfz
         zszw==
X-Gm-Message-State: APjAAAXr/TeIqUzH9VjFzeyFafN797Zv0zsjQrTsEbfqagxg0370tICR
        KZd4Sp1mJW36pwyvasgNM03V/vc/HCU=
X-Google-Smtp-Source: APXvYqzKitfYVtN7MD1eOpJXKawvyUvdD8GUCOJ8QcYwVD8iqf3/nkiVCngZ2+OROidOyS5jt/QDOA==
X-Received: by 2002:a65:554e:: with SMTP id t14mr18370559pgr.370.1572266078225;
        Mon, 28 Oct 2019 05:34:38 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id 127sm11404868pfw.6.2019.10.28.05.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:34:37 -0700 (PDT)
From:   Inki Dae <daeinki@gmail.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date:   Mon, 28 Oct 2019 21:34:34 +0900
Message-Id: <20191028123434.30034-1-daeinki@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just one build warning fixup.

   Please kindly let me know if there is any problem.


Thanks,
Inki Dae

The following changes since commit 3275a71e76fac5bc276f0d60e027b18c2e8d7a5b:

  Merge tag 'drm-next-5.5-2019-10-09' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-10-26 05:56:57 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.5

for you to fetch changes up to 5a884be5478990ed013c2b160d90615426848c61:

  drm/exynos: Move static keyword to the front of declaration (2019-10-28 21:12:27 +0900)

----------------------------------------------------------------
Fix a build warning at mixer driver
- it fixes a build warning message, 'static' is not at beginning
  of declaration [-Wold-style-declaration], by moving static keyword.

----------------------------------------------------------------
Krzysztof Wilczynski (1):
      drm/exynos: Move static keyword to the front of declaration

 drivers/gpu/drm/exynos/exynos_mixer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
