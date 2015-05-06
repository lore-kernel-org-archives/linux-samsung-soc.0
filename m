From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/1] ARM: dts: Add keep-power-in-suspend to WiFi SDIO node
 for Snow
Date: Wed, 6 May 2015 09:36:21 -0700
Message-ID: <CAD=FV=XJXHjXxirjwPfrJ3=xOj46GTqdSxxFstzjTVJ9HP1Q=w@mail.gmail.com>
References: <1430929979-18119-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430929979-18119-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Javier,

On Wed, May 6, 2015 at 9:32 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> The Marvell mwifiex driver prevents the system to enter into a suspend
> state if the card power is not preserved during a suspend/resume cycle.
>
> So Suspend-to-RAM and Suspend-to-idle are failing on Exynos5250 Snow.
>
> Add the keep-power-in-suspend Power Management property to the SDIO/MMC
> node so the mwifiex suspend handler doesn't fail and the system is able
> to enter into a suspend state.
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>
> Kukjin and Krzysztof,
>
> I didn't notice that Snow was also missing this property when I did the
> same change for Peach Pit and and Pi Chromebooks [0], sorry about that.
>
> Best regards,
> Javier
>
> [0]: https://lkml.org/lkml/2015/4/7/377
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Doug Anderson <dianders@chromium.org>
