Return-Path: <SRS0=vFf2=EG=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D762FC388F9
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Oct 2020 17:59:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73513206E3
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Oct 2020 17:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3R5GoIZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgJaR7P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Oct 2020 13:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgJaR7P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Oct 2020 13:59:15 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B61C0617A6;
        Sat, 31 Oct 2020 10:59:15 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id s9so9874515wro.8;
        Sat, 31 Oct 2020 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XuTCe1Ga7B/KAhhJYgdOU12EeqWH5EWDhu4LYbG296k=;
        b=p3R5GoIZnRY7IMYfE46w/s5zrehdhY1Dk84vycn6zwYIamjBis0mDWwLgnxU8gljtA
         qDiGhhoUrYHi8sLZ7t/mU2iZK9AWwdv2Qro7ZZp6SatLrN3t6MHWxJOUMk3WoV8EAfDF
         YNJ3QN/m/ICngijeRhDUNrUA6g5U2/QzBbG4WgtlaharTc4ZC4e+LT5uwEgxW/SiC51D
         7BlXmj+oSJA9QfT2KHyV702DtaHw49CrnanyeaIqqNYp/fjRCbSv7kqdBxbddRDCbYC0
         kx+Z/AqapWhioQdhIi5Ffh7H6mXgEIfO0cp4wHWzUJxSMBebTeX836n7cOt3mOg86aq8
         +LCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XuTCe1Ga7B/KAhhJYgdOU12EeqWH5EWDhu4LYbG296k=;
        b=kbOwJdPUAIbUY7O7abuLbkFLqFghVV/wDQ8eqWLmK34BDeONLftzxwMIBaxzJOseLr
         4Z20wyzIEJGAgDGtPsW/KBfcSe7Rt03ehnleuv2ekmCqFS/eqfTtQGKuKjZEKfGCzn1U
         HQklqXY5L9AOwOjAEGr949jFmPfFN/hbPhyMQceJ1zpTHfT7dyVEyrB58UurxGabN5B8
         2rPzVDD/13dxPVqsysoGJZ4hvuq6DzPH5ENc935S/mR7KCDmpMV3xNVo9k8QZvf1XluK
         kFxinKRO2YVExpteirlNDCQicAjPjy9yksTFKmZ6kM2ahcMgKmE3zn/IOtdm7xlbbRPs
         etSQ==
X-Gm-Message-State: AOAM532tiEyBZrN1gsMeDOeldeWNuZCXZpUq0eglIiajGRjXevoOAlqL
        phfP50Dsv3hzHjEg0XPdT7Y=
X-Google-Smtp-Source: ABdhPJxyZRwzLh2ljnuEEqy+pjAmqTudm7BJkSkPEQHoPL0xdiniPrtpc9uSCr3wiH/cDZeB7fsSAQ==
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr10485961wrv.36.1604167153599;
        Sat, 31 Oct 2020 10:59:13 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id l26sm9068456wmi.41.2020.10.31.10.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 10:59:12 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/5] add exynos4412-based p4note device family support
Date:   Sat, 31 Oct 2020 18:58:32 +0100
Message-Id: <20201031175836.47745-1-martin.juecker@gmail.com>
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

v1: https://lore.kernel.org/linux-samsung-soc/20201024144421.34435-1-martin.juecker@gmail.com/

Changes in v2 (proposed by Marek and Krzysztof)
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



