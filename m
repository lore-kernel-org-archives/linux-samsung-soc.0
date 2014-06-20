From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: Enable audio support for Peach-pi board
Date: Fri, 20 Jun 2014 13:10:04 -0700
Message-ID: <CAD=FV=Xkk55CBOd4B=4ikY0_Qt0u=pcu-p9TyMc9MrqqXHJaCQ@mail.gmail.com>
References: <1403252419-28352-1-git-send-email-tushar.b@samsung.com>
	<1403252419-28352-2-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:37231 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753833AbaFTUKF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 16:10:05 -0400
Received: by mail-vc0-f169.google.com with SMTP id la4so3882493vcb.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2014 13:10:04 -0700 (PDT)
In-Reply-To: <1403252419-28352-2-git-send-email-tushar.b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.b@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, Tushar Behera <trblinux@gmail.com>

Tushar,

On Fri, Jun 20, 2014 at 1:20 AM, Tushar Behera <tushar.b@samsung.com> wrote:
> Peach-pi board has MAX98091 audio codec connected on HSI2C-7 bus.
>
> Signed-off-by: Tushar Behera <tushar.b@samsung.com>
> ---
> Changes for v2:
> * Replaced max98090 with max98091.
>
>  arch/arm/boot/dts/exynos5800-peach-pi.dts |   31 +++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Doug Anderson <dianders@chromium.org>
