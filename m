From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: SAMSUNG: Fix compiler warning in dma-ops.c file
Date: Mon, 25 Jun 2012 09:57:25 +0530
Message-ID: <1340598445-17379-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48669 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750743Ab2FYEjY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jun 2012 00:39:24 -0400
Received: by pbbrp8 with SMTP id rp8so6014236pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Jun 2012 21:39:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

=46ixes the following build warning:
arch/arm/plat-samsung/dma-ops.c:129:2: warning: initialization from inc=
ompatible pointer type [enabled by default]
arch/arm/plat-samsung/dma-ops.c:129:2: warning: (near initialization fo=
r =E2=80=98dmadev_ops.release=E2=80=99) [enabled by default]

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/dma-ops.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/dma-ops.c b/arch/arm/plat-samsung/dm=
a-ops.c
index f9eb353..24420e9 100644
--- a/arch/arm/plat-samsung/dma-ops.c
+++ b/arch/arm/plat-samsung/dma-ops.c
@@ -37,7 +37,7 @@ static unsigned samsung_dmadev_request(enum dma_ch dm=
a_ch,
 }
=20
 static int samsung_dmadev_release(unsigned ch,
-			struct s3c2410_dma_client *client)
+			void *param)
 {
 	dma_release_channel((struct dma_chan *)ch);
=20
--=20
1.7.4.1
