From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v9 1/2] ARM: exynos5: Add PMU support for 5420
Date: Tue, 7 Oct 2014 14:32:53 +0200
Message-ID: <CABxcv==38sEFnpXaWoL6pvzyF7XH+DA55cP2MDPgfY=zBwxVUQ@mail.gmail.com>
References: <1412673723-15551-1-git-send-email-vikas.sajjan@samsung.com>
	<1412673723-15551-2-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:55677 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216AbaJGMcz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 08:32:55 -0400
Received: by mail-wi0-f177.google.com with SMTP id fb4so7713520wid.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2014 05:32:54 -0700 (PDT)
In-Reply-To: <1412673723-15551-2-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>

Hellos Vikas,

On Tue, Oct 7, 2014 at 11:22 AM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> From: Abhilash Kesavan <a.kesavan@samsung.com>
>
> Adds intial PMU settings for exynos5420. This is required for
> future S2R and Switching support.
>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> ---
>  arch/arm/mach-exynos/pmu.c      |  287 +++++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/regs-pmu.h |  227 +++++++++++++++++++++++++++++++
>  2 files changed, 514 insertions(+)

S2R is working on my Exynos5420 Peach Pit Chromebook with your series:

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
