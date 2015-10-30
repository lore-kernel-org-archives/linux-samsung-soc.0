From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 06/13] tests/exynos: add fimg2d event test
Date: Fri, 30 Oct 2015 12:16:47 +0100
Message-ID: <5633519F.60607@math.uni-bielefeld.de>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442937302-8211-7-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20151030155043.35acb278@hwh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57606 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1030667AbbJ3LQu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 07:16:50 -0400
In-Reply-To: <20151030155043.35acb278@hwh-ubuntu>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hello Hyungwon,

first of all thanks for reviewing the series!



Hyungwon Hwang wrote:
> On Tue, 22 Sep 2015 17:54:55 +0200
> Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> 
>> This tests async processing of G2D jobs. A separate thread is spawned
>> to monitor the DRM fd for events and check whether a G2D job was
>> completed.
>>
>> v2: Add GPLv2 header, argument handling and documentation.
>>     Test is only installed when requested.
>> v3: Allocate G2D jobs with calloc which fixes 'busy' being
>>     potentially uninitialized. Also enable timeout for poll()
>>     in the monitor thread. This fixes pthread_join() not working
>>     because of poll() not returning.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  tests/exynos/Makefile.am           |  11 +-
>>  tests/exynos/exynos_fimg2d_event.c | 326
>> +++++++++++++++++++++++++++++++++++++ 2 files changed, 335
>> insertions(+), 2 deletions(-) create mode 100644
>> tests/exynos/exynos_fimg2d_event.c
>>
>> diff --git a/tests/exynos/Makefile.am b/tests/exynos/Makefile.am
>> index e82d199..357d6b8 100644
>> --- a/tests/exynos/Makefile.am
>> +++ b/tests/exynos/Makefile.am
>> @@ -20,16 +20,23 @@ endif
>>  
>>  if HAVE_INSTALL_TESTS
>>  bin_PROGRAMS += \
>> -	exynos_fimg2d_perf
>> +	exynos_fimg2d_perf \
>> +	exynos_fimg2d_event
>>  else
>>  noinst_PROGRAMS += \
>> -	exynos_fimg2d_perf
>> +	exynos_fimg2d_perf \
>> +	exynos_fimg2d_event
>>  endif
>>  
>>  exynos_fimg2d_perf_LDADD = \
>>  	$(top_builddir)/libdrm.la \
>>  	$(top_builddir)/exynos/libdrm_exynos.la
>>  
>> +exynos_fimg2d_event_LDADD = \
>> +	$(top_builddir)/libdrm.la \
>> +	$(top_builddir)/exynos/libdrm_exynos.la \
>> +	-lpthread
>> +
>>  exynos_fimg2d_test_LDADD = \
>>  	$(top_builddir)/libdrm.la \
>>  	$(top_builddir)/libkms/libkms.la \
>> diff --git a/tests/exynos/exynos_fimg2d_event.c
>> b/tests/exynos/exynos_fimg2d_event.c new file mode 100644
>> index 0000000..c03dcff
>> --- /dev/null
>> +++ b/tests/exynos/exynos_fimg2d_event.c
>> @@ -0,0 +1,326 @@
>> +/*
>> + * Copyright (C) 2015 - Tobias Jakobi
>> + *
>> + * This is free software: you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published
>> + * by the Free Software Foundation, either version 2 of the License,
>> + * or (at your option) any later version.
>> + *
>> + * It is distributed in the hope that it will be useful, but
>> + * WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + * You should have received a copy of the GNU General Public License
>> + * along with it. If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <unistd.h>
>> +#include <poll.h>
>> +
>> +#include <stdlib.h>
>> +#include <stdio.h>
>> +#include <time.h>
>> +#include <getopt.h>
>> +
>> +#include <pthread.h>
>> +
>> +#include <xf86drm.h>
>> +
>> +#include "exynos_drm.h"
>> +#include "exynos_drmif.h"
>> +#include "exynos_fimg2d.h"
>> +
>> +struct g2d_job {
>> +	unsigned int id;
>> +	unsigned int busy;
>> +};
>> +
>> +struct exynos_evhandler {
>> +	struct pollfd fds;
>> +	struct exynos_event_context evctx;
>> +};
>> +
>> +struct threaddata {
>> +	unsigned int stop;
>> +	struct exynos_device *dev;
>> +	struct exynos_evhandler evhandler;
>> +};
>> +
>> +static void g2d_event_handler(int fd, unsigned int cmdlist_no,
>> unsigned int tv_sec,
>> +							unsigned int
>> tv_usec, void *user_data) +{
>> +	struct g2d_job *job = user_data;
>> +
>> +	fprintf(stderr, "info: g2d job (id = %u, cmdlist number =
>> %u) finished!\n",
>> +			job->id, cmdlist_no);
>> +
>> +	job->busy = 0;
>> +}
>> +
>> +static void setup_g2d_event_handler(struct exynos_evhandler
>> *evhandler, int fd) +{
>> +	evhandler->fds.fd = fd;
>> +	evhandler->fds.events = POLLIN;
>> +	evhandler->evctx.base.version = DRM_EVENT_CONTEXT_VERSION;
>> +	evhandler->evctx.version = EXYNOS_EVENT_CONTEXT_VERSION;
> 
> The versions must be set not using XXX_EVENT_CONTEXT_VERSION. After the
> versions are bumped, the event will contains wrong version info.
Hmm, I don't see how this is true. Both DRM_EVENT_CONTEXT_VERSION and
EXYNOS_EVENT_CONTEXT_VERSION come from the public libdrm header. If the
version in the public header is bumped, then it's also bumped here. So I
don't see the issue.


> Also, I think the type of event must be set here.
What do you mean by 'type of event' here? I don't see a type field in
the event context structures.


With best wishes,
Tobias


> 
> Best regards,
> Hyungwon Hwang
> 
>> +	evhandler->evctx.g2d_event_handler = g2d_event_handler;
>> +}
>> +
>> +static void* threadfunc(void *arg) {
>> +	const int timeout = 0;
>> +	struct threaddata *data;
>> +
>> +	data = arg;
>> +
>> +	while (1) {
>> +		if (data->stop) break;
>> +
>> +		usleep(500);
>> +
>> +		data->evhandler.fds.revents = 0;
>> +
>> +		if (poll(&data->evhandler.fds, 1, timeout) < 0)
>> +			continue;
>> +
>> +		if (data->evhandler.fds.revents & (POLLHUP |
>> POLLERR))
>> +			continue;
>> +
>> +		if (data->evhandler.fds.revents & POLLIN)
>> +			exynos_handle_event(data->dev,
>> &data->evhandler.evctx);
>> +	}
>> +
>> +	pthread_exit(0);
>> +}
>> +
>> +/*
>> + * We need to wait until all G2D jobs are finished, otherwise we
>> + * potentially remove a BO which the engine still operates on.
>> + * This results in the following kernel message:
>> + * [drm:exynos_drm_gem_put_dma_addr] *ERROR* failed to lookup gem
>> object.
>> + * Also any subsequent BO allocations fail then with:
>> + * [drm:exynos_drm_alloc_buf] *ERROR* failed to allocate buffer.
>> + */
>> +static void wait_all_jobs(struct g2d_job* jobs, unsigned num_jobs)
>> +{
>> +	unsigned i;
>> +
>> +	for (i = 0; i < num_jobs; ++i) {
>> +		while (jobs[i].busy)
>> +			usleep(500);
>> +	}
>> +
>> +}
>> +
>> +static struct g2d_job* free_job(struct g2d_job* jobs, unsigned
>> num_jobs) +{
>> +	unsigned i;
>> +
>> +	for (i = 0; i < num_jobs; ++i) {
>> +		if (jobs[i].busy == 0)
>> +			return &jobs[i];
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int g2d_work(struct g2d_context *ctx, struct g2d_image *img,
>> +					unsigned num_jobs, unsigned
>> iterations) +{
>> +	struct g2d_job *jobs = calloc(num_jobs, sizeof(struct
>> g2d_job));
>> +	int ret;
>> +	unsigned i;
>> +
>> +	/* setup job ids */
>> +	for (i = 0; i < num_jobs; ++i)
>> +		jobs[i].id = i;
>> +
>> +	for (i = 0; i < iterations; ++i) {
>> +		unsigned x, y, w, h;
>> +
>> +		struct g2d_job *j = NULL;
>> +
>> +		while (1) {
>> +			j = free_job(jobs, num_jobs);
>> +
>> +			if (j)
>> +				break;
>> +			else
>> +				usleep(500);
>> +		}
>> +
>> +		x = rand() % img->width;
>> +		y = rand() % img->height;
>> +
>> +		if (x == (img->width - 1))
>> +			x -= 1;
>> +		if (y == (img->height - 1))
>> +			y -= 1;
>> +
>> +		w = rand() % (img->width - x);
>> +		h = rand() % (img->height - y);
>> +
>> +		if (w == 0) w = 1;
>> +		if (h == 0) h = 1;
>> +
>> +		img->color = rand();
>> +
>> +		j->busy = 1;
>> +		g2d_config_event(ctx, j);
>> +
>> +		ret = g2d_solid_fill(ctx, img, x, y, w, h);
>> +
>> +		if (ret == 0)
>> +			g2d_exec2(ctx, G2D_EXEC_FLAG_ASYNC);
>> +
>> +		if (ret != 0) {
>> +			fprintf(stderr, "error: iteration %u (x =
>> %u, x = %u, x = %u, x = %u) failed\n",
>> +					i, x, y, w, h);
>> +			break;
>> +		}
>> +	}
>> +
>> +	wait_all_jobs(jobs, num_jobs);
>> +	free(jobs);
>> +
>> +	return 0;
>> +}
>> +
>> +static void usage(const char *name)
>> +{
>> +	fprintf(stderr, "usage: %s [-ijwh]\n\n", name);
>> +
>> +	fprintf(stderr, "\t-i <number of iterations>\n");
>> +	fprintf(stderr, "\t-j <number of G2D jobs> (default =
>> 4)\n\n"); +
>> +	fprintf(stderr, "\t-w <buffer width> (default = 4096)\n");
>> +	fprintf(stderr, "\t-h <buffer height> (default = 4096)\n");
>> +
>> +	exit(0);
>> +}
>> +
>> +int main(int argc, char **argv)
>> +{
>> +	int fd, ret, c, parsefail;
>> +
>> +	pthread_t event_thread;
>> +	struct threaddata event_data = {0};
>> +
>> +	struct exynos_device *dev;
>> +	struct g2d_context *ctx;
>> +	struct exynos_bo *bo;
>> +
>> +	struct g2d_image img = {0};
>> +
>> +	unsigned int iters = 0, njobs = 4;
>> +	unsigned int bufw = 4096, bufh = 4096;
>> +
>> +	ret = 0;
>> +	parsefail = 0;
>> +
>> +	while ((c = getopt(argc, argv, "i:j:w:h:")) != -1) {
>> +		switch (c) {
>> +		case 'i':
>> +			if (sscanf(optarg, "%u", &iters) != 1)
>> +				parsefail = 1;
>> +			break;
>> +		case 'j':
>> +			if (sscanf(optarg, "%u", &njobs) != 1)
>> +				parsefail = 1;
>> +			break;
>> +		case 'w':
>> +			if (sscanf(optarg, "%u", &bufw) != 1)
>> +				parsefail = 1;
>> +			break;
>> +		case 'h':
>> +			if (sscanf(optarg, "%u", &bufh) != 1)
>> +				parsefail = 1;
>> +			break;
>> +		default:
>> +			parsefail = 1;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (parsefail || (argc == 1) || (iters == 0))
>> +		usage(argv[0]);
>> +
>> +	if (bufw > 4096 || bufh > 4096) {
>> +		fprintf(stderr, "error: buffer width/height should
>> be less than 4096.\n");
>> +		ret = -1;
>> +
>> +		goto out;
>> +	}
>> +
>> +	if (bufw == 0 || bufh == 0) {
>> +		fprintf(stderr, "error: buffer width/height should
>> be non-zero.\n");
>> +		ret = -1;
>> +
>> +		goto out;
>> +	}
>> +
>> +	fd = drmOpen("exynos", NULL);
>> +	if (fd < 0) {
>> +		fprintf(stderr, "error: failed to open drm\n");
>> +		ret = -1;
>> +
>> +		goto out;
>> +	}
>> +
>> +	dev = exynos_device_create(fd);
>> +	if (dev == NULL) {
>> +		fprintf(stderr, "error: failed to create device\n");
>> +		ret = -2;
>> +
>> +		goto fail;
>> +	}
>> +
>> +	ctx = g2d_init(fd);
>> +	if (ctx == NULL) {
>> +		fprintf(stderr, "error: failed to init G2D\n");
>> +		ret = -3;
>> +
>> +		goto g2d_fail;
>> +	}
>> +
>> +	bo = exynos_bo_create(dev, bufw * bufh * 4, 0);
>> +	if (bo == NULL) {
>> +		fprintf(stderr, "error: failed to create bo\n");
>> +		ret = -4;
>> +
>> +		goto bo_fail;
>> +	}
>> +
>> +	/* setup g2d image object */
>> +	img.width = bufw;
>> +	img.height = bufh;
>> +	img.stride = bufw * 4;
>> +	img.color_mode = G2D_COLOR_FMT_ARGB8888 | G2D_ORDER_AXRGB;
>> +	img.buf_type = G2D_IMGBUF_GEM;
>> +	img.bo[0] = bo->handle;
>> +
>> +	event_data.dev = dev;
>> +	setup_g2d_event_handler(&event_data.evhandler, fd);
>> +
>> +	pthread_create(&event_thread, NULL, threadfunc, &event_data);
>> +
>> +	ret = g2d_work(ctx, &img, njobs, iters);
>> +	if (ret != 0)
>> +		fprintf(stderr, "error: g2d_work failed\n");
>> +
>> +	event_data.stop = 1;
>> +	pthread_join(event_thread, NULL);
>> +
>> +	exynos_bo_destroy(bo);
>> +
>> +bo_fail:
>> +	g2d_fini(ctx);
>> +
>> +g2d_fail:
>> +	exynos_device_destroy(dev);
>> +
>> +fail:
>> +	drmClose(fd);
>> +
>> +out:
>> +	return ret;
>> +}
> 
