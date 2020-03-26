Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9F0C43331
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 21:11:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21EC420722
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 21:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgCZVLK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 17:11:10 -0400
Received: from sauhun.de ([88.99.104.3]:54564 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727967AbgCZVKQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 17:10:16 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 98E702C1F98;
        Thu, 26 Mar 2020 22:10:14 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/1] ARM: convert to use new I2C API
Date:   Thu, 26 Mar 2020 22:10:13 +0100
Message-Id: <20200326211014.13591-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

We are deprecating calls which return NULL in favor of new variants which
return an ERR_PTR. Only build tested.


Wolfram Sang (1):
  ARM: mach-s3c64xx: convert to use i2c_new_client_device()

 arch/arm/mach-s3c64xx/mach-crag6410-module.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.20.1

