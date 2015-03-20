From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 5/5] tests/exynos: add fimg2d event test
Date: Fri, 20 Mar 2015 23:51:00 +0100
Message-ID: <1426891860-13103-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1426891860-13103-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:53651 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751378AbbCTWv3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Mar 2015 18:51:29 -0400
In-Reply-To: <1426891860-13103-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This tests async processing of G2D jobs. A separate thread is spawned
to monitor the DRM fd for events and check whether a G2D job was
completed.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/Makefile.am           |   7 +-
 tests/exynos/exynos_fimg2d_event.c | 248 +++++++++++++++++++++++++++++++++++++
 2 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 tests/exynos/exynos_fimg2d_event.c

diff --git a/tests/exynos/Makefile.am b/tests/exynos/Makefile.am
index 243f957..3abf428 100644
--- a/tests/exynos/Makefile.am
+++ b/tests/exynos/Makefile.am
@@ -5,7 +5,7 @@ AM_CFLAGS = \
 	-I $(top_srcdir)/exynos \
 	-I $(top_srcdir)
 
-bin_PROGRAMS = exynos_fimg2d_perf
+bin_PROGRAMS = exynos_fimg2d_perf exynos_fimg2d_event
 
 if HAVE_LIBKMS
 if HAVE_INSTALL_TESTS
@@ -21,6 +21,11 @@ exynos_fimg2d_perf_LDADD = \
 	$(top_builddir)/libdrm.la \
 	$(top_builddir)/exynos/libdrm_exynos.la
 
+exynos_fimg2d_event_LDADD = \
+	$(top_builddir)/libdrm.la \
+	$(top_builddir)/exynos/libdrm_exynos.la \
+  -lpthread
+
 exynos_fimg2d_test_LDADD = \
 	$(top_builddir)/libdrm.la \
 	$(top_builddir)/libkms/libkms.la \
diff --git a/tests/exynos/exynos_fimg2d_event.c b/tests/exynos/exynos_fimg2d_event.c
new file mode 100644
index 0000000..63ae61f
--- /dev/null
+++ b/tests/exynos/exynos_fimg2d_event.c
@@ -0,0 +1,248 @@
+#include <unistd.h>
+#include <poll.h>
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <time.h>
+
+#include <pthread.h>
+
+#include <xf86drm.h>
+
+#include "exynos_drm.h"
+#include "exynos_drmif.h"
+#include "exynos_fimg2d.h"
+
+struct g2d_job {
+	unsigned int id;
+	unsigned int busy;
+};
+
+struct exynos_evhandler {
+	struct pollfd fds;
+	drmEventContext evctx;
+};
+
+struct threaddata {
+	unsigned int stop;
+	struct exynos_evhandler evhandler;
+};
+
+static void g2d_event_handler(int fd, unsigned int cmdlist_no, unsigned int tv_sec,
+							unsigned int tv_usec, void *user_data)
+{
+	struct g2d_job *job = user_data;
+
+	fprintf(stderr, "info: g2d job (id = %u, cmdlist number = %u) finished!\n",
+			job->id, cmdlist_no);
+
+	job->busy = 0;
+}
+
+static void setup_g2d_event_handler(struct exynos_evhandler *evhandler, int fd)
+{
+	evhandler->fds.fd = fd;
+	evhandler->fds.events = POLLIN;
+	evhandler->evctx.version = DRM_EVENT_CONTEXT_VERSION;
+	evhandler->evctx.g2d_event_handler = g2d_event_handler;
+}
+
+static void* threadfunc(void *arg) {
+	const int timeout = -1;
+	struct threaddata *data;
+
+	data = arg;
+
+	while (1) {
+		if (data->stop) break;
+
+		data->evhandler.fds.revents = 0;
+
+		if (poll(&data->evhandler.fds, 1, timeout) < 0)
+			continue;
+
+		if (data->evhandler.fds.revents & (POLLHUP | POLLERR))
+			continue;
+
+		if (data->evhandler.fds.revents & POLLIN)
+			drmHandleEvent(data->evhandler.fds.fd, &data->evhandler.evctx);
+
+		usleep(500);
+	}
+
+	pthread_exit(0);
+}
+
+/*
+ * We need to wait until all G2D jobs are finished, otherwise we
+ * potentially remove a BO which the engine still operates on.
+ * This results in the following kernel message:
+ * [drm:exynos_drm_gem_put_dma_addr] *ERROR* failed to lookup gem object.
+ * Also any subsequent BO allocations fail then with:
+ * [drm:exynos_drm_alloc_buf] *ERROR* failed to allocate buffer.
+ */
+static void wait_all_jobs(struct g2d_job* jobs, unsigned num_jobs)
+{
+	unsigned i;
+
+	for (i = 0; i < num_jobs; ++i) {
+		while (jobs[i].busy)
+			usleep(500);
+	}
+
+}
+
+static struct g2d_job* free_job(struct g2d_job* jobs, unsigned num_jobs)
+{
+	unsigned i;
+
+	for (i = 0; i < num_jobs; ++i) {
+		if (jobs[i].busy == 0)
+			return &jobs[i];
+	}
+
+	return NULL;
+}
+
+static int g2d_work(struct g2d_context *ctx, struct g2d_image *img,
+					unsigned num_jobs, unsigned iterations)
+{
+	struct g2d_job *jobs = malloc(num_jobs * sizeof(struct g2d_job));
+	int ret;
+	unsigned i;
+
+	/* setup job ids */
+	for (i = 0; i < num_jobs; ++i)
+		jobs[i].id = i;
+
+	for (i = i; i < iterations; ++i) {
+		unsigned x, y, w, h;
+
+		struct g2d_job *j = NULL;
+
+		while (1) {
+			j = free_job(jobs, num_jobs);
+
+			if (j)
+				break;
+			else
+				usleep(500);
+		}
+
+		x = rand() % img->width;
+		y = rand() % img->height;
+
+		if (x == (img->width - 1))
+			x -= 1;
+		if (y == (img->height - 1))
+			y -= 1;
+
+		w = rand() % (img->width - x);
+		h = rand() % (img->height - y);
+
+		if (w == 0) w = 1;
+		if (h == 0) h = 1;
+
+		img->color = rand();
+
+		j->busy = 1;
+		g2d_config_event(ctx, j);
+
+		ret = g2d_solid_fill(ctx, img, x, y, w, h);
+
+		if (ret == 0)
+			g2d_exec2(ctx, G2D_EXEC_FLAG_ASYNC);
+
+		if (ret != 0) {
+			fprintf(stderr, "error: iteration %u (x = %u, x = %u, x = %u, x = %u) failed\n",
+					i, x, y, w, h);
+			break;
+		}
+	}
+
+	wait_all_jobs(jobs, num_jobs);
+	free(jobs);
+
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	int fd, ret;
+
+	pthread_t event_thread;
+	struct threaddata event_data = {0};
+
+	struct exynos_device *dev;
+	struct g2d_context *ctx;
+	struct exynos_bo *bo;
+
+	struct g2d_image img = {0};
+
+	ret = 0;
+
+	fd = drmOpen("exynos", NULL);
+	if (fd < 0) {
+		fprintf(stderr, "error: failed to open drm\n");
+		ret = -1;
+
+		goto out;
+	}
+
+	dev = exynos_device_create(fd);
+	if (dev == NULL) {
+		fprintf(stderr, "error: failed to create device\n");
+		ret = -2;
+
+		goto fail;
+	}
+
+	ctx = g2d_init(fd);
+	if (ctx == NULL) {
+		fprintf(stderr, "error: failed to init G2D\n");
+		ret = -3;
+
+		goto g2d_fail;
+	}
+
+	bo = exynos_bo_create(dev, 4096 * 4096 * 4, 0);
+	if (bo == NULL) {
+		fprintf(stderr, "error: failed to create bo\n");
+		ret = -4;
+
+		goto bo_fail;
+	}
+
+	/* setup g2d image object */
+	img.width = 4096;
+	img.height = 4096;
+	img.stride = 4096 * 4;
+	img.color_mode = G2D_COLOR_FMT_ARGB8888 | G2D_ORDER_AXRGB;
+	img.buf_type = G2D_IMGBUF_GEM;
+	img.bo[0] = bo->handle;
+
+	setup_g2d_event_handler(&event_data.evhandler, fd);
+
+	pthread_create(&event_thread, NULL, threadfunc, &event_data);
+
+	ret = g2d_work(ctx, &img, 4, 256);
+	if (ret != 0)
+		fprintf(stderr, "error: g2d_work failed\n");
+
+	event_data.stop = 1;
+	pthread_join(event_thread, NULL);
+
+	exynos_bo_destroy(bo);
+
+bo_fail:
+	g2d_fini(ctx);
+
+g2d_fail:
+	exynos_device_destroy(dev);
+
+fail:
+	drmClose(fd);
+
+out:
+	return ret;
+}
-- 
2.0.5
