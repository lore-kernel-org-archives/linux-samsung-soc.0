From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 5/5] iio: exynos_adc: do a reinit_completion before the conversion
Date: Fri, 25 Apr 2014 09:32:23 -0700
Message-ID: <CAD=FV=Uv7NdY8vw0atu1Szyz5-VoFbqeM6rc2Jk_LBBzBxGkuw@mail.gmail.com>
References: <1398420888-5506-1-git-send-email-ch.naveen@samsung.com>
	<1398420888-5506-6-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398420888-5506-6-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, "cpgs ." <cpgs@samsung.com>, Grant Grundler <grundler@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

Naveen

On Fri, Apr 25, 2014 at 3:14 AM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> Add reinit_completion() before the wait_for_completion_timeout in
> raw_read() call.
>
> Change-Id: I70fa00841bc49eba838a5bd6779015844297dfdb

Again, remove Change-Id (in the previous patch, too).

> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  drivers/iio/adc/exynos_adc.c |    1 +
>  1 file changed, 1 insertion(+)

Seems reasonable.

Reviewed-by: Doug Anderson <dianders@chromium.org>
