From: Sachin Kamat <spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] Documentation: dt-bindings: move exynos-adc.txt to
 more iio/adc/
Date: Fri, 11 Jul 2014 14:47:19 +0530
Message-ID: <CAK5sBcFvPo38LtWAhee0xO=KONM5V-UEDzgjCc=uEXtG32NowA@mail.gmail.com>
References: <1405069589-10388-1-git-send-email-ch.naveen@samsung.com>
	<1405069589-10388-3-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405069589-10388-3-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Naveen,

On Fri, Jul 11, 2014 at 2:36 PM, Naveen Krishna Chatradhi
<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> The DT bindings in exynos-adc.txt applies to the ADC
> driver (exynos-adc.c) developed based on IIO framework.
>
> The bindings are more appropriate to be under
> Documentation/devicetree/bindings/iio/adc/
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../devicetree/bindings/arm/samsung/exynos-adc.txt |   82 --------------------
>  .../devicetree/bindings/iio/adc/exynos-adc.txt     |   82 ++++++++++++++++++++
>  2 files changed, 82 insertions(+), 82 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/exynos-adc.txt
>

Tip: For only a file move or rename please use "-M" with git
format-patch. That will make the
patch concise.

-- 
Regards,
Sachin.
