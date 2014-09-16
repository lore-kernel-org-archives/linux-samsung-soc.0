From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH RESEND] ARM: DTS: correct the capability string for mmc0
Date: Tue, 16 Sep 2014 08:58:16 -0700
Message-ID: <CAD=FV=U4rPsfGkTcSY3OYHPgCFOccaHTjG1qC6WAekOEV09Q7A@mail.gmail.com>
References: <1410857409-24767-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410857409-24767-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Vivek,

On Tue, Sep 16, 2014 at 1:50 AM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>
> MMC capability for HS200 is parsed in mmc/core/host.c as
> dts string "mmc-hs200-1_8v".
>
> This patch corrects the dts string for Exynos5420 based peach-pit
> and Exynos5800 based peach-pi boards.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>
> Hi Kukjin,
>
> As commented by Doug earlier for this patch, the two patches required
>   -- mmc: dw_mmc: Make sure we don't get stuck when we get an error
>   -- mmc: dw_mmc: change to use recommended reset procedure
> are now merged in upstream.
> So you can go ahead and pick this change.
>
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |    2 +-
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Doug Anderson <dianders@chromium.org>
