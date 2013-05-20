From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] iio: exynos_adc: fix wrong structure extration in suspend
 and resume
Date: Mon, 20 May 2013 10:09:55 -0700
Message-ID: <CAD=FV=Xppyb+Y0atygnwA8oBHmGHDx7Bit2fN12GX5Tt-Y9H1A@mail.gmail.com>
References: <1369031689-23189-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369031689-23189-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-iio <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-samsung-soc@vger.kernel.org

Naveen,

On Sun, May 19, 2013 at 11:34 PM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> The exynos_adc device structure was wrongly extracted from the dev*
> correcting the same.
>
> Using the regular conversion of
> struct device* -> struct platform_device* -> struct exynos_adc* seems wrong.
> Instead we should be doing
> struct device* -> struct iio_dev* -> struct exynos_adc*
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  drivers/iio/adc/exynos_adc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Doug Anderson <dianders@chromium.org>
