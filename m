Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E65C63699
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 21:32:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B699D2224F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 21:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZh7KoKS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgKMVcT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Nov 2020 16:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgKMVbt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 16:31:49 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B36C061A53;
        Fri, 13 Nov 2020 13:26:02 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id f23so15779053ejk.2;
        Fri, 13 Nov 2020 13:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ca9jI3WBHA+/Ty95XDYoEtrO0wget0Oxdf5ElgxLhug=;
        b=fZh7KoKS2atoIFT0y2rd4MnnMI13enyasI10QqACQokr98ijcqfgqEM5edQzmjbtrX
         gJpySCE2Pkr5eCffkZsrcQUqhpGISkGNBe6UH1nsFMIyXjpGjQaVep38L8swuL+BaJTH
         PxWROEENn/eHOp/UwiVOCQ9AfFuGhahAqGj5QHYsOXH9z8dG/7O+g3B5MJ60+v3FvvAU
         NOPjLhVpQcTvMA2Edza93VxMoTSAp1AQwC3sRIy2lKU73mfBmGPQejOSQbbxSNB6JpV+
         FHF9t+Jj6QYs7NEdGKhy87omRc3OMNVTEfeYS9TqTGHNR94wh+zq+CDNxM8Nc3LZTNDC
         C3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ca9jI3WBHA+/Ty95XDYoEtrO0wget0Oxdf5ElgxLhug=;
        b=pBCBPPCl0LA4Q5yW5B/b10IvOt5pV0lJ8Os0REnpwnoQZkK5NEMN3CI50PHqP1OgXQ
         1/1lS2fOcNA9I9IYpJBE2mZp7xRaofiIIOM6qhgJPnwgBURCoeJbrD9C2xmlL27Bkl5k
         rqwtg7RF5+TfhrI78BW4jG53wk02cFY3XoMczmHWLkKwbugqmqt9quhU3vLNEhzI+EhQ
         eQfE8/nCCXXRMVMMjioKVVCaSS+wTbpxHVk6yiwoKTbpiG2/gcYGY7jxlvlZ11/S51rx
         7/nN3HWzQMQ4ByFOvSoivRNiGGDp5/chN1+4KqoLk3KDx6W6hdEBhgsBbOsnDQuDShhj
         2x5A==
X-Gm-Message-State: AOAM533OJ9o3gsp4sKt+1pjko3PSfYR8ft4lWElvCdDYZu5/haEXuiJ7
        2HiI8zAmICCKyeGFPwcBQYU=
X-Google-Smtp-Source: ABdhPJy256G87YyI19iLZjFO6fnuv4W3i4Cn0dtml90jNPUFVUY2p+VFQWnllYCUNK5OPIwt9PNEEA==
X-Received: by 2002:a17:907:4302:: with SMTP id nh2mr3778126ejb.451.1605302761549;
        Fri, 13 Nov 2020 13:26:01 -0800 (PST)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id j7sm4678200ejk.14.2020.11.13.13.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 13:26:00 -0800 (PST)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/5] add exynos4412-based p4note device family support
Date:   Fri, 13 Nov 2020 22:25:21 +0100
Message-Id: <20201113212525.13455-1-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello,

after lots of research and trial and error, this is my first
contribution to the linux kernel.

These patches lay the foundation for supporting the Samsung Galaxy
Note 10.1 device family. To the best of my knowledge there are around
16 devices which use almost identical hardware inside with exceptions
being the modem and one of the sensors. The first instance which I'm
currently testing on is the N8010 which is the wifi only version that
is identical to the N8013. There are some missing components still,
but it's a start.

v1:
https://lore.kernel.org/linux-samsung-soc/20201024144421.34435-1-martin.juecker@gmail.com/

v2:
https://lore.kernel.org/linux-samsung-soc/20201031175836.47745-1-martin.juecker@gmail.com/

Changes in v3:
- copyright changed
- indentation fix

Changes in v2:
- lots of label adjustments, some removed
- unused ehci node removed
- unused serials removed
- compatible string is now samsung,n8010 instead of samsung,n801x
- removed unused imports
- voltage regulator name for TSP changed to match vendor kernel
- i2c numbering starting from 1 now
- two missing gpio configurations added
- added vdd supply to adc node
- added all regulators to max77686 node
- pinctrl configs sorted by pin name


Cheers
Martin


