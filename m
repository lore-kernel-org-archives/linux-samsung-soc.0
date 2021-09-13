Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF0EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Sep 2021 04:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F12B160F6F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Sep 2021 04:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhIME3G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Sep 2021 00:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbhIME3F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 00:29:05 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0AB4C061574
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Sep 2021 21:27:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id jg16so18046791ejc.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Sep 2021 21:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :cc:to;
        bh=KEdnfdVtALg1+RmjiE9eLbEo8mfRabZqYOY5/3C2Occ=;
        b=Ds46SE9W2W/X8g+enHbiZHBC0mdzASAvjR+I6uz5vh3NTLksmpPUQ9tV8FzpCHYP70
         wkHOMlvxWsaKSe3iVFJIQrUhm4diMRgUe+wOKgOm+vqX/LhFotiNzmQ5IRLy5WSobsAZ
         cEd6U0DsNOD3w3JW89v6kbiubafv/pDJY8eBBeLe+o6zjQ8nUKhSPDq0c8jmy+3VjGgb
         pINQc4J+zB/HtdJ16Uz4JPKoEq8wqEqcIruEvT5p93bZREpvU7tFTn1+zXzW4oGcqtds
         R+7QT93u9Dwkf4sm32HSJRnswbZDtbJooKgS2oJho9/V1bjZgQieOxyVGpCYoI294L30
         qbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:cc:to;
        bh=KEdnfdVtALg1+RmjiE9eLbEo8mfRabZqYOY5/3C2Occ=;
        b=n2DRUlKPoh+TGcUhL5nfi51F9rgD01zXn0v8fYNZUlAhTJD31kusXCCrBfqjWUGv0T
         lccjH47aG6/bOvf4x4VFQvCYgytLYjPIe/9EcUJ5UMhVrK8aiYI6soOBGEQdTICefrXb
         Vg4mZpZWKKmr5BwuTyu6p81tXZw3qVB/hhcKrNIvumZp3iqCAckNFCtQx43uk/LCU7GK
         sXa1Hq2eFQaLzHrJjp7F+hUCqD/8di0hID0r+YaCCsmdarJNdEbvmLoPt11ZOhOlwHeh
         /a8cqJ9xKVXdynIuxoNRFCYr6xH72PhdNBOHTWpcjbA/YLYgv6pDTxBq2l4zCCbIS0+4
         QB9A==
X-Gm-Message-State: AOAM530w276VpmKn/tKvePB8rt9s2vOQrgD/nSAr6MhrL0+wFjiHgTR4
        +Vz+sXdkQQm4nOIInG8+uwt3ALbLxEs=
X-Google-Smtp-Source: ABdhPJzVNN88XA5T5Vfjym0UWqRx7dRCTPc3QY+G+pC8sPQKn9DDDJtr/svUtxRUwc+I84H0MuhmcA==
X-Received: by 2002:a17:906:138a:: with SMTP id f10mr10419553ejc.89.1631507268080;
        Sun, 12 Sep 2021 21:27:48 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id qx18sm2780406ejb.75.2021.09.12.21.27.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Sep 2021 21:27:47 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: BUG: Cannot boot Odroid XU4 from eMMC without this patch
Message-Id: <89888711-56BF-4E6C-92EE-2053E773B077@gmail.com>
Date:   Mon, 13 Sep 2021 08:27:46 +0400
Cc:     Marian Mihailescu <mihailescu2m@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

h=
ttps://github.com/chewitt/linux/commit/8a4ebfb43a394e5dc5e9fafc92a50d5e81a=
4f258

If I boot any recent kernel without the above patch, the emmc module on =
the XU4 is not detected, see:

Without:

[    3.227837] mmc0: tuning execution failed: -5
[    3.231229] mmc0: error -5 whilst initialising MMC card
[    3.536450] mmc0: tuning execution failed: -5
[    3.539680] mmc0: error -5 whilst initialising MMC card
[    3.794056] mmc0: tuning execution failed: -5
[    3.794212] mmc0: error -5 whilst initialising MMC card
[    4.111097] mmc0: tuning execution failed: -5
[    4.115356] mmc0: error -5 whilst initialising MMC card
[    4.426164] mmc0: tuning execution failed: -5
[    4.429678] mmc0: error -5 whilst initialising MMC card
[    4.756226] mmc0: tuning execution failed: -5
[    4.760641] mmc0: error -5 whilst initialising MMC card

With:

[    3.305461] mmc0: new HS400 MMC card at address 0001
[    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
[    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
[    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
[    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev (246:0)
[    3.315963]  mmcblk0: p1 p2

The patch is sourced from a Linux 5.4 patchset used by several retro =
gaming distros for XU4 images shared in the HardKernel forums. I would =
be happy to submit it, but the original patch has no description in the =
commit message. Not being a coding developer myself I cannot explain =
whether it is correct or what it=E2=80=99s doing to add one. All I can =
do is confirm that it works, and is needed. SD card boot is not an =
issue.

I=E2=80=99ve CC=E2=80=99d the original author (Marian) in case he =
remembers the patch and can comment. It would be good to get this =
upstream.=20

Christian=
