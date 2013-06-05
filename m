From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/7] ARM: s3c64xx: dma: Use clk_prepare_enable/clk_disable_unprepare
Date: Thu,  6 Jun 2013 01:57:28 +0200
Message-ID: <1370476651-6743-5-git-send-email-tomasz.figa@gmail.com>
References: <1370476651-6743-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370476651-6743-1-git-send-email-tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch modifies s3c64xx DMA driver to prepare and unprepare clocks
in addition to enableind and disabling, since it is required by common
clock framework.

Signed-off-by: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-s3c64xx/dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/dma.c b/arch/arm/mach-s3c64xx/dma.c
index 759846c..c511dfa 100644
--- a/arch/arm/mach-s3c64xx/dma.c
+++ b/arch/arm/mach-s3c64xx/dma.c
@@ -677,7 +677,7 @@ static int s3c64xx_dma_init1(int chno, enum dma_ch chbase,
 		goto err_map;
 	}
 
-	clk_enable(dmac->clk);
+	clk_prepare_enable(dmac->clk);
 
 	dmac->regs = regs;
 	dmac->chanbase = chbase;
@@ -711,7 +711,7 @@ static int s3c64xx_dma_init1(int chno, enum dma_ch chbase,
 	return 0;
 
 err_clk:
-	clk_disable(dmac->clk);
+	clk_disable_unprepare(dmac->clk);
 	clk_put(dmac->clk);
 err_map:
 	iounmap(regs);
-- 
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
