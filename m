From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH 03/13] tests/exynos: add fimg2d performance analysis
Date: Fri, 30 Oct 2015 15:51:26 +0900
Message-ID: <20151030155126.371b9bcc@hwh-ubuntu>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442937302-8211-4-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45116 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751926AbbJ3Gv2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 02:51:28 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NX001X78TPQBUB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Oct 2015 15:51:26 +0900 (KST)
In-reply-to: <1442937302-8211-4-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

On Tue, 22 Sep 2015 17:54:52 +0200
Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:

> Currently only fast solid color clear performance is measured.
> A large buffer is allocated and solid color clear operations
> are executed on it with randomly chosen properties (position
> and size of the region, clear color). Execution time is
> measured and output together with the amount of pixels
> processed.
> 
> The 'simple' variant only executes one G2D command buffer at
> a time, while the 'multi' variant executes multiple ones. This
> can be used to measure setup/exec overhead.
> 
> The test also serves a stability check. If clocks/voltages are
> too high or low respectively, the test quickly reveals this.
> 
> v2: Add GPLv2 header, argument handling and documentation.
>     Tool is only installed when requested.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  tests/exynos/Makefile.am          |  19 ++-
>  tests/exynos/exynos_fimg2d_perf.c | 320
> ++++++++++++++++++++++++++++++++++++++ 2 files changed, 337
> insertions(+), 2 deletions(-) create mode 100644
> tests/exynos/exynos_fimg2d_perf.c
> 
> diff --git a/tests/exynos/Makefile.am b/tests/exynos/Makefile.am
> index b21d016..e82d199 100644
> --- a/tests/exynos/Makefile.am
> +++ b/tests/exynos/Makefile.am
> @@ -5,16 +5,31 @@ AM_CFLAGS = \
>  	-I $(top_srcdir)/exynos \
>  	-I $(top_srcdir)
>  
> +bin_PROGRAMS =
> +noinst_PROGRAMS =
> +
>  if HAVE_LIBKMS
>  if HAVE_INSTALL_TESTS
> -bin_PROGRAMS = \
> +bin_PROGRAMS += \
>  	exynos_fimg2d_test
>  else
> -noinst_PROGRAMS = \
> +noinst_PROGRAMS += \
>  	exynos_fimg2d_test
>  endif
>  endif
>  
> +if HAVE_INSTALL_TESTS
> +bin_PROGRAMS += \
> +	exynos_fimg2d_perf
> +else
> +noinst_PROGRAMS += \
> +	exynos_fimg2d_perf
> +endif
> +
> +exynos_fimg2d_perf_LDADD = \
> +	$(top_builddir)/libdrm.la \
> +	$(top_builddir)/exynos/libdrm_exynos.la
> +
>  exynos_fimg2d_test_LDADD = \
>  	$(top_builddir)/libdrm.la \
>  	$(top_builddir)/libkms/libkms.la \
> diff --git a/tests/exynos/exynos_fimg2d_perf.c
> b/tests/exynos/exynos_fimg2d_perf.c new file mode 100644
> index 0000000..73d28ea
> --- /dev/null
> +++ b/tests/exynos/exynos_fimg2d_perf.c
> @@ -0,0 +1,320 @@
> +/*
> + * Copyright (C) 2015 - Tobias Jakobi
> + *
> + * This is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published
> + * by the Free Software Foundation, either version 2 of the License,
> + * or (at your option) any later version.
> + *
> + * It is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + * You should have received a copy of the GNU General Public License
> + * along with it. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <time.h>
> +#include <getopt.h>
> +
> +#include <xf86drm.h>
> +
> +#include "exynos_drm.h"
> +#include "exynos_drmif.h"
> +#include "exynos_fimg2d.h"
> +
> +static int output_mathematica = 0;
> +
> +static int fimg2d_perf_simple(struct exynos_bo *bo, struct
> g2d_context *ctx,
> +			unsigned buf_width, unsigned buf_height,
> unsigned iterations) +{
> +	struct timespec tspec = { 0 };
> +	struct g2d_image img = { 0 };
> +
> +	unsigned long long g2d_time;
> +	unsigned i;
> +	int ret = 0;
> +
> +	img.width = buf_width;
> +	img.height = buf_height;
> +	img.stride = buf_width * 4;
> +	img.color_mode = G2D_COLOR_FMT_ARGB8888 | G2D_ORDER_AXRGB;
> +	img.buf_type = G2D_IMGBUF_GEM;
> +	img.bo[0] = bo->handle;
> +
> +	srand(time(NULL));
> +
> +	printf("starting simple G2D performance test\n");
> +	printf("buffer width = %u, buffer height = %u, iterations =
> %u\n",
> +		buf_width, buf_height, iterations);
> +
> +	if (output_mathematica)
> +		putchar('{');
> +
> +	for (i = 0; i < iterations; ++i) {
> +		unsigned x, y, w, h;
> +
> +		x = rand() % buf_width;
> +		y = rand() % buf_height;
> +
> +		if (x == (buf_width - 1))
> +			x -= 1;
> +		if (y == (buf_height - 1))
> +			y -= 1;
> +
> +		w = rand() % (buf_width - x);
> +		h = rand() % (buf_height - y);
> +
> +		if (w == 0) w = 1;
> +		if (h == 0) h = 1;
> +
> +		img.color = rand();
> +
> +		ret = g2d_solid_fill(ctx, &img, x, y, w, h);
> +
> +		clock_gettime(CLOCK_MONOTONIC, &tspec);
> +
> +		if (ret == 0)
> +			ret = g2d_exec(ctx);
> +
> +		if (ret != 0) {
> +			fprintf(stderr, "error: iteration %u failed
> (x = %u, y = %u, w = %u, h = %u)\n",
> +				i, x, y, w, h);
> +			break;
> +		} else {
> +			struct timespec end = { 0 };
> +			clock_gettime(CLOCK_MONOTONIC, &end);
> +
> +			g2d_time = (end.tv_sec - tspec.tv_sec) *
> 1000000000ULL;
> +			g2d_time += (end.tv_nsec - tspec.tv_nsec);
> +
> +			if (output_mathematica) {
> +				if (i != 0) putchar(',');
> +				printf("{%u,%llu}", w * h, g2d_time);
> +			} else {
> +				printf("num_pixels = %u, usecs =
> %llu\n", w * h, g2d_time);
> +			}
> +		}
> +	}
> +
> +	if (output_mathematica)
> +		printf("}\n");
> +
> +	return ret;
> +}
> +
> +static int fimg2d_perf_multi(struct exynos_bo *bo, struct
> g2d_context *ctx,
> +			unsigned buf_width, unsigned buf_height,
> unsigned iterations, unsigned batch) +{
> +	struct timespec tspec = { 0 };
> +	struct g2d_image *images;
> +
> +	unsigned long long g2d_time;
> +	unsigned i, j;
> +	int ret = 0;
> +
> +	images = calloc(batch, sizeof(struct g2d_image));

I think that this should be freed at the end of this function.

Best regards,
Hyungwon Hwang

> +	for (i = 0; i < batch; ++i) {
> +		images[i].width = buf_width;
> +		images[i].height = buf_height;
> +		images[i].stride = buf_width * 4;
> +		images[i].color_mode = G2D_COLOR_FMT_ARGB8888 |
> G2D_ORDER_AXRGB;
> +		images[i].buf_type = G2D_IMGBUF_GEM;
> +		images[i].bo[0] = bo->handle;
> +	}
> +
> +	srand(time(NULL));
> +
> +	printf("starting multi G2D performance test (batch size =
> %u)\n", batch);
> +	printf("buffer width = %u, buffer height = %u, iterations =
> %u\n",
> +		buf_width, buf_height, iterations);
> +
> +	if (output_mathematica)
> +		putchar('{');
> +
> +	for (i = 0; i < iterations; ++i) {
> +		unsigned num_pixels = 0;
> +
> +		for (j = 0; j < batch; ++j) {
> +			unsigned x, y, w, h;
> +
> +			x = rand() % buf_width;
> +			y = rand() % buf_height;
> +
> +			if (x == (buf_width - 1))
> +				x -= 1;
> +			if (y == (buf_height - 1))
> +				y -= 1;
> +
> +			w = rand() % (buf_width - x);
> +			h = rand() % (buf_height - y);
> +
> +			if (w == 0) w = 1;
> +			if (h == 0) h = 1;
> +
> +			images[j].color = rand();
> +
> +			num_pixels += w * h;
> +
> +			ret = g2d_solid_fill(ctx, &images[j], x, y,
> w, h);
> +			if (ret != 0)
> +				break;
> +		}
> +
> +		clock_gettime(CLOCK_MONOTONIC, &tspec);
> +
> +		if (ret == 0)
> +			ret = g2d_exec(ctx);
> +
> +		if (ret != 0) {
> +			fprintf(stderr, "error: iteration %u failed
> (num_pixels = %u)\n", i, num_pixels);
> +			break;
> +			break;
> +		} else {
> +			struct timespec end = { 0 };
> +			clock_gettime(CLOCK_MONOTONIC, &end);
> +
> +			g2d_time = (end.tv_sec - tspec.tv_sec) *
> 1000000000ULL;
> +			g2d_time += (end.tv_nsec - tspec.tv_nsec);
> +
> +			if (output_mathematica) {
> +				if (i != 0) putchar(',');
> +				printf("{%u,%llu}", num_pixels,
> g2d_time);
> +			} else {
> +				printf("num_pixels = %u, usecs =
> %llu\n", num_pixels, g2d_time);
> +			}
> +		}
> +	}
> +
> +	if (output_mathematica)
> +		printf("}\n");
> +
> +	return ret;
> +}
> +
> +static void usage(const char *name)
> +{
> +	fprintf(stderr, "usage: %s [-ibwh]\n\n", name);
> +
> +	fprintf(stderr, "\t-i <number of iterations>\n");
> +	fprintf(stderr, "\t-b <size of a batch> (default = 3)\n\n");
> +
> +	fprintf(stderr, "\t-w <buffer width> (default = 4096)\n");
> +	fprintf(stderr, "\t-h <buffer height> (default = 4096)\n\n");
> +
> +	fprintf(stderr, "\t-M <enable Mathematica styled output>\n");
> +
> +	exit(0);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int fd, ret, c, parsefail;
> +
> +	struct exynos_device *dev;
> +	struct g2d_context *ctx;
> +	struct exynos_bo *bo;
> +
> +	unsigned int iters = 0, batch = 3;
> +	unsigned int bufw = 4096, bufh = 4096;
> +
> +	ret = 0;
> +	parsefail = 0;
> +
> +	while ((c = getopt(argc, argv, "i:b:w:h:M")) != -1) {
> +		switch (c) {
> +		case 'i':
> +			if (sscanf(optarg, "%u", &iters) != 1)
> +				parsefail = 1;
> +			break;
> +		case 'b':
> +			if (sscanf(optarg, "%u", &batch) != 1)
> +				parsefail = 1;
> +			break;
> +		case 'w':
> +			if (sscanf(optarg, "%u", &bufw) != 1)
> +				parsefail = 1;
> +			break;
> +		case 'h':
> +			if (sscanf(optarg, "%u", &bufh) != 1)
> +				parsefail = 1;
> +			break;
> +		case 'M':
> +			output_mathematica = 1;
> +			break;
> +		default:
> +			parsefail = 1;
> +			break;
> +		}
> +	}
> +
> +	if (parsefail || (argc == 1) || (iters == 0))
> +		usage(argv[0]);
> +
> +	if (bufw < 2 || bufw > 4096 || bufh < 2 || bufh > 4096) {
> +		fprintf(stderr, "error: buffer width/height should
> be in the range 2 to 4096.\n");
> +		ret = -1;
> +
> +		goto out;
> +	}
> +
> +	if (bufw == 0 || bufh == 0) {
> +		fprintf(stderr, "error: buffer width/height should
> be non-zero.\n");
> +		ret = -1;
> +
> +		goto out;
> +	}
> +
> +	fd = drmOpen("exynos", NULL);
> +	if (fd < 0) {
> +		fprintf(stderr, "error: failed to open drm\n");
> +		ret = -1;
> +
> +		goto out;
> +	}
> +
> +	dev = exynos_device_create(fd);
> +	if (dev == NULL) {
> +		fprintf(stderr, "error: failed to create device\n");
> +		ret = -2;
> +
> +		goto fail;
> +	}
> +
> +	ctx = g2d_init(fd);
> +	if (ctx == NULL) {
> +		fprintf(stderr, "error: failed to init G2D\n");
> +		ret = -3;
> +
> +		goto g2d_fail;
> +	}
> +
> +	bo = exynos_bo_create(dev, bufw * bufh * 4, 0);
> +	if (bo == NULL) {
> +		fprintf(stderr, "error: failed to create bo\n");
> +		ret = -4;
> +
> +		goto bo_fail;
> +	}
> +
> +	ret = fimg2d_perf_simple(bo, ctx, bufw, bufh, iters);
> +
> +	if (ret == 0)
> +		ret = fimg2d_perf_multi(bo, ctx, bufw, bufh, iters,
> batch); +
> +	exynos_bo_destroy(bo);
> +
> +bo_fail:
> +	g2d_fini(ctx);
> +
> +g2d_fail:
> +	exynos_device_destroy(dev);
> +
> +fail:
> +	drmClose(fd);
> +
> +out:
> +	return ret;
> +}
