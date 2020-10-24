Return-Path: <SRS0=oj0V=D7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C183EC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 24 Oct 2020 14:44:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F56222203
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 24 Oct 2020 14:44:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raiHnbuY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762093AbgJXOow (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 24 Oct 2020 10:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762092AbgJXOov (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 24 Oct 2020 10:44:51 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A36EC0613CE;
        Sat, 24 Oct 2020 07:44:50 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id a72so5454036wme.5;
        Sat, 24 Oct 2020 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PgkVxvJ0s336dC7TB70Wzfqbko+7EWqDu/F3TtxcrZQ=;
        b=raiHnbuYWS90jAqkT8bnATQo7ZzxfT6QUa51h1QeyF1gIpajE9yJrS7tuq3goImohT
         eh6kvkq55yH9wVKWi+gHUF+KuK7eJ+k8qIuqjL1Q3H/hofmGvqBTRimlMyr3h5rcSPgZ
         g5RFA5910n/GVyk6VgxDkeVJRxfVTjoWSf57oDd/Rgo6v7sZhB5GhrG227kxQhZb/34q
         liiUwljpq+CynwrxrLEdSniRG1+SXVeVJ0jKSqVnYXeu6vYhBI0Z2TzG0KihmKDXQd8m
         kYW9+Uj9dQu7v4/uUEhH0Msc6wBkSQfqgyckXNe3qjDMiEgceKu8+C9cprwaPot0CoPN
         Wg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PgkVxvJ0s336dC7TB70Wzfqbko+7EWqDu/F3TtxcrZQ=;
        b=Y3vrBiBp1yDdvzdnjK/MDczn1Nng4o2MkjWiyBYc8Ii4TSe1GtTWcUYzcI1N03F8fa
         5S55IMa/xOe2QROrs/xPKGc18Kv/U8PCxsdk41lohiPi4OvNDoExUDoCQbTjAjcuWkmf
         AaCV6/FgSKR4fVU6QMFlEjmHcwGLO7xOSgMDLUgGUw0BehpiBsN49rwzcOx02/Yd7xL1
         F1LEhyJiSwgCQvrGmK2i/nRr4YSSmi/0a1p+TFEAX2TJa8+pS+QFGAu/h5NekUHydnmd
         a2k1OzUUmapFCEhVw/zwKkzZqoNfjaG+fF1iTqLSXYkCn5631Yv8UgR3IVqCIuHKe5zm
         0z7A==
X-Gm-Message-State: AOAM530OgY4UUaCSX64VnA9Q325KEaHyVEXEMv7l06yByfK1IyIylOAu
        ZEdfyrLYF5IDvn4lV0pHCZ8=
X-Google-Smtp-Source: ABdhPJwwdNWTm8qYg7a9ss+D6Yus5UpFx6L0Le6lJ+RoUVImitWw7cDfLfIqiGlFVTBB6LuzqUYgew==
X-Received: by 2002:a7b:c3d3:: with SMTP id t19mr2476227wmj.139.1603550688664;
        Sat, 24 Oct 2020 07:44:48 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id n9sm12630891wrq.72.2020.10.24.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 07:44:48 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        martin.juecker@gmail.com
Subject: [PATCH 0/5] add exynos4412-based p4note device family support
Date:   Sat, 24 Oct 2020 16:44:16 +0200
Message-Id: <20201024144421.34435-1-martin.juecker@gmail.com>
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

Cheers
Martin


