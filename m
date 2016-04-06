From: Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/9] iio: accel: mma7455: use regmap to retrieve struct device
Date: Tue, 5 Apr 2016 22:18:44 -0700
Message-ID: <acaeee6c3c1f99900614baf99ab31e6e5b515970.1459918214.git.amsfield22@gmail.com>
References: <cover.1459918214.git.amsfield22@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1459918214.git.amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Driver includes struct regmap and struct device in its global data.
Remove the struct device and use regmap API to retrieve device info.

Patch created using Coccinelle plus manual edits.

Signed-off-by: Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iio/accel/mma7455_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/accel/mma7455_core.c b/drivers/iio/accel/mma7455_core.c
index c633cc2..c902f54 100644
--- a/drivers/iio/accel/mma7455_core.c
+++ b/drivers/iio/accel/mma7455_core.c
@@ -55,11 +55,11 @@
 
 struct mma7455_data {
 	struct regmap *regmap;
-	struct device *dev;
 };
 
 static int mma7455_drdy(struct mma7455_data *mma7455)
 {
+	struct device *dev = regmap_get_device(mma7455->regmap);
 	unsigned int reg;
 	int tries = 3;
 	int ret;
@@ -75,7 +75,7 @@ static int mma7455_drdy(struct mma7455_data *mma7455)
 		msleep(20);
 	}
 
-	dev_warn(mma7455->dev, "data not ready\n");
+	dev_warn(dev, "data not ready\n");
 
 	return -EIO;
 }
@@ -260,7 +260,6 @@ int mma7455_core_probe(struct device *dev, struct regmap *regmap,
 	dev_set_drvdata(dev, indio_dev);
 	mma7455 = iio_priv(indio_dev);
 	mma7455->regmap = regmap;
-	mma7455->dev = dev;
 
 	indio_dev->info = &mma7455_info;
 	indio_dev->name = name;
-- 
2.1.4
