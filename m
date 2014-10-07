From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v9 2/2] ARM: exynos5: Add Suspend-to-RAM support for 5420
Date: Tue, 7 Oct 2014 14:34:08 +0200
Message-ID: <CABxcv=k5=F7Ln2XoFtNmogOuGupWex+7V2t-TVYadah-XA8Qtg@mail.gmail.com>
References: <1412673723-15551-1-git-send-email-vikas.sajjan@samsung.com>
	<1412673723-15551-3-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:52449 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751094AbaJGMeJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 08:34:09 -0400
Received: by mail-wi0-f171.google.com with SMTP id em10so7635778wid.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2014 05:34:08 -0700 (PDT)
In-Reply-To: <1412673723-15551-3-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>

Hello Vikas,

On Tue, Oct 7, 2014 at 11:22 AM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> Adds Suspend-to-RAM support for EXYNOS5420
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  arch/arm/mach-exynos/suspend.c |  151 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 149 insertions(+), 2 deletions(-)
>

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
