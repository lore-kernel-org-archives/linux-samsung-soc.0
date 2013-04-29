From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 4/4] ARM: EXYNOS: remove parent device for hdmiphy clock
Date: Mon, 29 Apr 2013 13:04:41 -0400
Message-ID: <CAOw6vbJQwSqGfoThkyp4gY6vE3dh98ETfk7B7jVM6LH0hPb5sg@mail.gmail.com>
References: <1367247053-17105-1-git-send-email-rahul.sharma@samsung.com> <1367247053-17105-5-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:63519 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757236Ab3D2RFF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Apr 2013 13:05:05 -0400
Received: by mail-lb0-f171.google.com with SMTP id r11so1531325lbv.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2013 10:05:04 -0700 (PDT)
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com [209.85.217.179])
        by mx.google.com with ESMTPSA id r9sm6492017lbr.3.2013.04.29.10.05.03
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Mon, 29 Apr 2013 10:05:03 -0700 (PDT)
Received: by mail-lb0-f179.google.com with SMTP id t10so629870lbi.24
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2013 10:05:02 -0700 (PDT)
In-Reply-To: <1367247053-17105-5-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, InKi Dae <inki.dae@samsung.com>, "r.sh.open" <r.sh.open@gmail.com>, "sw0312.kim" <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>

On Mon, Apr 29, 2013 at 10:50 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Hdmiphy clock flows from hdmiphy hw to hdmi ip and mixer. It is commonly
> accessed among hdmi and hdmiphy driver. During power cycle, each of these
> driver decrements the ref-count and ensures that last user disables the
> clock. Setting parrent device to none ensure that both the drivers gets
> access to the clock.
>

This seems like the wrong solution. I think you should be trying to
isolate its usage to one driver, instead of removing devname.

Sean



> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos4.c |    1 -
>  arch/arm/mach-exynos/clock-exynos5.c |    1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
> index 8a8468d..a43afcd 100644
> --- a/arch/arm/mach-exynos/clock-exynos4.c
> +++ b/arch/arm/mach-exynos/clock-exynos4.c
> @@ -562,7 +562,6 @@ static struct clk exynos4_init_clocks_off[] = {
>                 .ctrlbit        = (1 << 3),
>         }, {
>                 .name           = "hdmiphy",
> -               .devname        = "exynos4-hdmi",
>                 .enable         = exynos4_clk_hdmiphy_ctrl,
>                 .ctrlbit        = (1 << 0),
>         }, {
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index b0ea31f..4f39027 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -690,7 +690,6 @@ static struct clk exynos5_init_clocks_off[] = {
>                 .ctrlbit        = (1 << 6),
>         }, {
>                 .name           = "hdmiphy",
> -               .devname        = "exynos5-hdmi",
>                 .enable         = exynos5_clk_hdmiphy_ctrl,
>                 .ctrlbit        = (1 << 0),
>         }, {
> --
> 1.7.10.4
>
