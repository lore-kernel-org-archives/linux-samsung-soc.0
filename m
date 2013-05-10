From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: EXYNOS: Update defconfig for Arndale and Origen board
Date: Fri, 10 May 2013 08:31:05 -0700
Message-ID: <CAD=FV=UUaZZj0=B7335pReyeQp3V2UvckH-jy-k4SqAop7C2gw@mail.gmail.com>
References: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Patch Tracking <patches@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Tushar,

On Thu, May 9, 2013 at 11:49 PM, Tushar Behera <tushar.behera@linaro.org> wrote:
> It updates following drivers for EXYNOS based DT platform.
>
> * S5M8767 driver
> * MAX8997 driver
> * MMC SDHCI driver
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>
> This patch is based on Olof's following patch.
> "[PATCH] ARM: exynos: defconfig update"
> https://lkml.org/lkml/2013/5/9/455
>
>  arch/arm/configs/exynos_defconfig |    6 ++++++
>  1 file changed, 6 insertions(+)

Your changes also look good to me.

Reviewed-by: Doug Anderson <dianders@chromium.org>
