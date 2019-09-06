From: Colin King <colin.king@canonical.com>
Subject: [PATCH] media: s3c-camif: make array 'registers' static const, makes object smaller
Date: Fri,  6 Sep 2019 09:11:33 +0100
Message-ID: <20190906081133.22543-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array 'registers' on the stack but instead make it
static const. Makes the object code smaller by 45 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  17364	   5000	      0	  22364	   575c	platform/s3c-camif/camif-regs.o

After:
   text	   data	    bss	    dec	    hex	filename
  17255	   5064	      0	  22319	   572f	platform/s3c-camif/camif-regs.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/s3c-camif/camif-regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-regs.c b/drivers/media/platform/s3c-camif/camif-regs.c
index 1a65532dc36d..e80204f5720c 100644
--- a/drivers/media/platform/s3c-camif/camif-regs.c
+++ b/drivers/media/platform/s3c-camif/camif-regs.c
@@ -553,7 +553,7 @@ void camif_hw_disable_capture(struct camif_vp *vp)
 
 void camif_hw_dump_regs(struct camif_dev *camif, const char *label)
 {
-	struct {
+	static const struct {
 		u32 offset;
 		const char * const name;
 	} registers[] = {
-- 
2.20.1
