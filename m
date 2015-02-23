From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 04/15] tests/exynos: disable the G2D userptr/blend
 test
Date: Mon, 23 Feb 2015 11:21:45 +0000
Message-ID: <54EB0D49.9070300@gmail.com>
References: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de> <1424094405-6314-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:40866 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861AbbBWLVm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Feb 2015 06:21:42 -0500
Received: by wesx3 with SMTP id x3so17272694wes.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Feb 2015 03:21:41 -0800 (PST)
In-Reply-To: <1424094405-6314-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, robclark@freedesktop.org, m.szyprowski@samsung.com

On 16/02/15 13:46, Tobias Jakobi wrote:
> v2: Move the commit description into the patch itself.
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  tests/exynos/exynos_fimg2d_test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
> index aa140e5..55d2970 100644
> --- a/tests/exynos/exynos_fimg2d_test.c
> +++ b/tests/exynos/exynos_fimg2d_test.c
> @@ -788,11 +788,19 @@ int main(int argc, char **argv)
>  
>  	getchar();
>  
> +  /* The blend test uses the userptr functionality of exynos-drm, which     *
> +   * is currently not safe to use. If the kernel hasn't been build with     *
> +   * exynos-iommu support, then the blend test is going to produce (kernel) *
> +   * memory corruption, eventually leading to a system crash.               *
> +   *                                                                        *
> +   * Disable the test for now, until the kernel code has been sanitized.    */
> +#if 0
I cannot see a part of libdrm that uses this commenting format. Perhaps
use the more common:

/*
 * Some comment
 */

Cheers,
Emil
