From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/1] ARM: dts: Add keep-power-in-suspend to WiFi SDIO node
 for Peach Boards
Date: Tue, 7 Apr 2015 08:09:16 -0700
Message-ID: <CAD=FV=WhwEFWqZW8ByQrH3N43X7djMve-23ckqUCZ4EevZC7vw@mail.gmail.com>
References: <1428411814-21098-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428411814-21098-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Javier,

On Tue, Apr 7, 2015 at 6:03 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> The Marvell mwifiex driver prevents the system to enter into a suspend
> state if the card power is not preserved during a suspend/resume cycle.
>
> So Suspend-to-RAM and Suspend-to-idle is failing on Exynos5800 Peach Pi
> and Exynos5420 Peach Pit Chromebooks.
>
> Add the keep-power-in-suspend Power Management property to the SDIO/MMC
> node so the mwifiex suspend handler doesn't fail and the system is able
> to enter into a suspend state.
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 1 +
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Doug Anderson <dianders@chromium.org>
