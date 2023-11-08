Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EE8C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Nov 2023 08:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjKHI4n (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Nov 2023 03:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjKHI4m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Nov 2023 03:56:42 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D7C98
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Nov 2023 00:56:40 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6856721886;
        Wed,  8 Nov 2023 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1699433798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=o+0gZ22tWV+3gdmDkK2U8JvPfuGvhvJfbreELYOCZPA=;
        b=KhOCP7ZmYLsjhx+2FEegjSwyoWIdbZgpKOxigCB5YYRELdlQU4V17svXwhb6pnRa0Bcc2U
        UoSMfOyE75qLSW2wunJwpXlqepZcrf8R12gyB9O3cShlFCGJ/PIweV6PASVyJnxGcV/gZu
        i6mgFlFLtkSlRSmWCL4rdJvyqugsy8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1699433798;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=o+0gZ22tWV+3gdmDkK2U8JvPfuGvhvJfbreELYOCZPA=;
        b=zaMKLckJ5Og7alSA6oMBjEZDepmD43P16ajFaqZAl8+QVtr3bZG2wvl+3WF55FtI/Vf82/
        lH+cq0AHA8WDfTDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36A4A138F2;
        Wed,  8 Nov 2023 08:56:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id pMaGC0ZNS2WWQgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Wed, 08 Nov 2023 08:56:38 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 1/1] MAINTAINERS: Remove snawrocki's git tree
Date:   Wed,  8 Nov 2023 09:56:30 +0100
Message-ID: <20231108085630.7767-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is already krzk/linux.git listed, which is currently used.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

maintainers, feel free to reject this. I just see no point for people to
check also inactive git tree.

Kind regards,
Petr

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 978bb58d7d07..1b86797f87b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19219,7 +19219,6 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
 F:	Documentation/devicetree/bindings/clock/samsung,*.yaml
 F:	Documentation/devicetree/bindings/clock/samsung,s3c*
 F:	drivers/clk/samsung/
-- 
2.42.0

