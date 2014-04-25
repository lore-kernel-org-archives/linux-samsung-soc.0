From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 4/5] iio: exynos_adc: do a soft reset in case of timeout
Date: Fri, 25 Apr 2014 09:29:02 -0700
Message-ID: <CAD=FV=Vt2kLx3UvnS11mONDYp2QMCxXYaGu+XfvN_HdeFOQ0HA@mail.gmail.com>
References: <1398420888-5506-1-git-send-email-ch.naveen@samsung.com>
	<1398420888-5506-5-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398420888-5506-5-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, "cpgs ." <cpgs@samsung.com>, Grant Grundler <grundler@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

Naveen,

On Fri, Apr 25, 2014 at 3:14 AM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> Do a soft reset software if a timeout happens.
> This is applicable only for ADC_V2.
>
> Change-Id: I939eaa06254e0b246dd636df9470f2eb392c2be1
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
> This change is a part of the patch reviewed at https://lkml.org/lkml/2013/11/5/92
>
>  drivers/iio/adc/exynos_adc.c |   50 ++++++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 24 deletions(-)

Reviewed-by: Doug Anderson <dianders@chromium.org>
