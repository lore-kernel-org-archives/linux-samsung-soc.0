Return-Path: <SRS0=sb5j=YW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12532CA9EC0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 01:18:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2CF221835
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 01:18:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eModlieS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfJ2BSn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 28 Oct 2019 21:18:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45199 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbfJ2BSn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 21:18:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id r1so8261981pgj.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Oct 2019 18:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=VriAZ/YGDpYOt3f+51YtTzjXIY0xNBsYsd8lEa3AsA8=;
        b=eModlieSF1RrYWqOTm3PZBdG5csBKpqcmuLQ8PPHM5rpIcnME98rknZI0CbTyLxFjv
         VEjYGJlevLEXLmdfotP+rvrT1NvvCHBMMa5EF+yfKEH9/XJN5L2Pqt3eBOBUkw/xz9YR
         yE+Iz4qIscxxEdlxUY3WWdBrJyL3NqwDlNMhonWR0yC+NENU8YoB21Q/XR2QBIdZWVzN
         66RpLeL4ul/rdZyawLdY7xSQGJCxdhkgWhrZyvC3EHvkobhaDboN9M+YWwytfkzMm/ed
         4LGDw+4ZRbjS059EzLMlXkTGcy1uPcwrziIsGKV0Tt0FMItCkssWSRmw9bnLbj/MBziM
         EfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VriAZ/YGDpYOt3f+51YtTzjXIY0xNBsYsd8lEa3AsA8=;
        b=WWawOP8ZdjGhQSWPNIMhDYUgPKZkzL/jwkSa2UrExXxy1+KKb4QqjbgwbiKl/XGytV
         U38I7Yv9z0JazknxLz8ZkQ8/JPcO4pSJrCf1Gjx7Kp3JFkUXCYo0jF0a+uu5Hux4Hiez
         lUB7kck8aU3rB45qcw289KgcuGBB4AEUIJ5YVqYWS1dtWI2VKw6Iz0jRJjzQasrBwNon
         4QcmvqqkRfaOizA2aQn1QBBQUtwC0+u1KoI+G008Q+HfZ7mJHOVO6PLkzNA+XhKl4N2L
         O6AbTLl4MT6ibUQxHriTslRfsut/1KNDZurzdHf+w55RLYyCf7g+AELRr3PSph/SRLeM
         RGBA==
X-Gm-Message-State: APjAAAVWbvvghRCFzkyeLUo85MsWIR+u5kJCh9+Oaripkk12/cYHRqce
        znLWIZiycozKCX+J18ONl6ELMiZ9
X-Google-Smtp-Source: APXvYqy9hhxfmjda8UBgZ8lBRBunthn72Q4aEiPq3u234wTbUtXIEOG+5sQZjpZN3NxrCa/AGod5ww==
X-Received: by 2002:a63:1a46:: with SMTP id a6mr23257260pgm.3.1572311922416;
        Mon, 28 Oct 2019 18:18:42 -0700 (PDT)
Received: from odroid.ad.adelaide.edu.au (staff-249-094.wireless.adelaide.edu.au. [129.127.249.94])
        by smtp.googlemail.com with ESMTPSA id e16sm11522655pgt.68.2019.10.28.18.18.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 18:18:41 -0700 (PDT)
From:   Marian Mihailescu <mihailescu2m@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH] media: s5p-mfc: copy timestamp and timecode in encoder output
Date:   Tue, 29 Oct 2019 11:48:35 +1030
Message-Id: <20191029011835.4733-1-mihailescu2m@gmail.com>
X-Mailer: git-send-email 2.14.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

When using the Samsung Multi-Format Codec (MFC) for hardware assisted encoding,
output buffers are missing timestamp and timecode information. This patch copies
the v4l2 timestamp and timecode fields to the MFC output buffer from the
corresponding input buffer.

Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
index 912fe0c5ab18..d48e7b57d96a 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
@@ -1208,6 +1208,7 @@ static int enc_post_frame_start(struct s5p_mfc_ctx *ctx)
 {
 	struct s5p_mfc_dev *dev = ctx->dev;
 	struct s5p_mfc_buf *mb_entry;
+	struct s5p_mfc_buf *dst_buf;
 	unsigned long enc_y_addr = 0, enc_c_addr = 0;
 	unsigned long mb_y_addr, mb_c_addr;
 	int slice_type;
@@ -1227,8 +1228,12 @@ static int enc_post_frame_start(struct s5p_mfc_ctx *ctx)
 					&mb_entry->b->vb2_buf, 0);
 			mb_c_addr = vb2_dma_contig_plane_dma_addr(
 					&mb_entry->b->vb2_buf, 1);
+			dst_buf = list_entry(ctx->dst_queue.next,
+					struct s5p_mfc_buf, list);
 			if ((enc_y_addr == mb_y_addr) &&
 						(enc_c_addr == mb_c_addr)) {
+				dst_buf->b->timecode = mb_entry->b->timecode;
+				dst_buf->b->vb2_buf.timestamp = mb_entry->b->vb2_buf.timestamp;
 				list_del(&mb_entry->list);
 				ctx->src_queue_cnt--;
 				vb2_buffer_done(&mb_entry->b->vb2_buf,
@@ -1241,8 +1246,12 @@ static int enc_post_frame_start(struct s5p_mfc_ctx *ctx)
 					&mb_entry->b->vb2_buf, 0);
 			mb_c_addr = vb2_dma_contig_plane_dma_addr(
 					&mb_entry->b->vb2_buf, 1);
+			dst_buf = list_entry(ctx->dst_queue.next,
+					struct s5p_mfc_buf, list);
 			if ((enc_y_addr == mb_y_addr) &&
 						(enc_c_addr == mb_c_addr)) {
+				dst_buf->b->timecode = mb_entry->b->timecode;
+				dst_buf->b->vb2_buf.timestamp = mb_entry->b->vb2_buf.timestamp;
 				list_del(&mb_entry->list);
 				ctx->ref_queue_cnt--;
 				vb2_buffer_done(&mb_entry->b->vb2_buf,
-- 
2.14.1

