Return-Path: <SRS0=wHux=CT=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E64C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Sep 2020 18:46:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BB892087C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Sep 2020 18:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599763560;
	bh=zplVVIgMQojsbwVzaG1n4QTE3TMlBcAZb0xfKeub8eE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=sw6zNtZWxAdROQ7mN3yvg7Y0Fa0G+KqXcs98K+iW1SkweV919iOxIdHwQlgEIojUr
	 tsDm0mL+sDKKhrQWV/tpkiCU7DrmnawNl3r7hOZFDMIPuDmthfls2KOt2qHqepYzbq
	 KQcrKCx3a4npoBmikZN5k+nWRTzq6H+Wn2MHRrCk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgIJSom (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Sep 2020 14:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:59816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgIJQNa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 12:13:30 -0400
Received: from localhost.localdomain (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8744221D90;
        Thu, 10 Sep 2020 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599754364;
        bh=zplVVIgMQojsbwVzaG1n4QTE3TMlBcAZb0xfKeub8eE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=p9Aps4ONeROFriwJ9u8H2cjA/DUEGWRKzoNnFEhQRzm20lKlg1F4hg8ZODe4lfyvA
         hSobjF/nxCveprXcdjdJCZMp/51Xv7pRgUjZPxTwi0ZFYXc7udvs3NWsCssjExJ0pB
         KFQLwO9iAu60t1Y4VrlazrSz2f2NIfyXSgQxCeM8=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-nfc@lists.01.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 4/8] nfc: s3fwrn5: Remove unneeded 'ret' variable
Date:   Thu, 10 Sep 2020 18:12:15 +0200
Message-Id: <20200910161219.6237-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910161219.6237-1-krzk@kernel.org>
References: <20200910161219.6237-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The local variable 'ret' can be removed:

  drivers/nfc/s3fwrn5/i2c.c:167:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/nfc/s3fwrn5/i2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 557279492503..dc995286be84 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -164,7 +164,6 @@ static int s3fwrn5_i2c_read(struct s3fwrn5_i2c_phy *phy)
 static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
 {
 	struct s3fwrn5_i2c_phy *phy = phy_id;
-	int ret = 0;
 
 	if (!phy || !phy->ndev) {
 		WARN_ON_ONCE(1);
@@ -179,10 +178,9 @@ static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
 	switch (phy->mode) {
 	case S3FWRN5_MODE_NCI:
 	case S3FWRN5_MODE_FW:
-		ret = s3fwrn5_i2c_read(phy);
+		s3fwrn5_i2c_read(phy);
 		break;
 	case S3FWRN5_MODE_COLD:
-		ret = -EREMOTEIO;
 		break;
 	}
 
-- 
2.17.1

