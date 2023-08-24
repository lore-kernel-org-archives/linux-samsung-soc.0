Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3766CC27C40
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 24 Aug 2023 09:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjHXJIX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 24 Aug 2023 05:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240480AbjHXJIM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 05:08:12 -0400
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3527F1986;
        Thu, 24 Aug 2023 02:08:05 -0700 (PDT)
Received: from lvc-arm12.ispras.local (unknown [83.149.199.126])
        by mail.ispras.ru (Postfix) with ESMTPSA id 2597C40737CA;
        Thu, 24 Aug 2023 09:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2597C40737CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
        s=default; t=1692868083;
        bh=N5XlzFD3k304KFtxa7uCO2r9TkozkPaaQCH42q5I3xM=;
        h=From:To:Cc:Subject:Date:From;
        b=T6FZae99E62YsU3dODYMieXJSIX781qxj33KxFJlFuoRGxwC2ixI9FPkCvvqblU32
         8bwtg+/a+wfoisq+G153i13m+TGgTUNZhZAKKoeczFbTeXnhwm7HO534IFBt3Qg6Gq
         ky1pP9pzfscU9Ttomz4oTAgRLx+7ep+EfRUp9BYg=
From:   Katya Orlova <e.orlova@ispras.ru>
To:     Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc:     Katya Orlova <e.orlova@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH] media: s3c-camif: Avoid inappropriate kfree()
Date:   Thu, 24 Aug 2023 12:07:25 +0300
Message-Id: <20230824090725.28148-1-e.orlova@ispras.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

s3c_camif_register_video_node() works with video_device structure stored
as a field of camif_vp,
so it should not be kfreed. But there is video_device_release() on error
path that do it.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Katya Orlova <e.orlova@ispras.ru>
---
 drivers/media/platform/samsung/s3c-camif/camif-capture.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index 76634d242b10..79c8ee845c38 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -1172,7 +1172,6 @@ int s3c_camif_register_video_node(struct camif_dev *camif, int idx)
 err_me_cleanup:
 	media_entity_cleanup(&vfd->entity);
 err_vd_rel:
-	video_device_release(vfd);
 	return ret;
 }
 
-- 
2.30.2

