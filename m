From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add missing GPIO entries for sd_bus in
Date: Thu, 19 Dec 2013 17:09:22 +0530
Message-ID: <CAK9yfHw7jJCVQwzFCKqOKP9=gr6D91nqObE08D0OC3bo=m1DBA@mail.gmail.com>
References: <1382700168-12527-1-git-send-email-sachin.kamat@linaro.org>
	<085901cedf91$4b24d4c0$e16e7e40$@org>
	<CAL1wa8fnu-xUu3SZ+e1SMB0ci5n8wenDgbr4L9TGS+NH8qpS2w@mail.gmail.com>
	<CAK9yfHyRu3WSkQOZKYMgsaWKcvVfNySptQhd91kX2eAdd-A+2Q@mail.gmail.com>
	<CA+Ln22F9nA-NECJjmnPqw6x1rWzJW0Mff4_1z+7XLCBv0JGNvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+Ln22F9nA-NECJjmnPqw6x1rWzJW0Mff4_1z+7XLCBv0JGNvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Leela Krishna Amudala <leelakrishna.a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz, Leela,

On 19 December 2013 00:13, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Sachin,
>
> This is inconsistent:
> - for 1-bit bus you would have to specify just sdX_bus1,
> - for 4-bit just sdX_bus4, but
> - for 8-bit you need to specify both sdX_bus4 and sdX_bus8.
>
> The change Leela mentioned was about making this consistent,
> so you need to always specify all possible working widths on
> given board.
>
> Other Exynos SoCs should be changed to use the same
> convention as well.

With the above explanation, it makes more sense now to specify all possible
bus widths. I will drop this patch and change it in other places
(SoCs) to make it
consistent.

-- 
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
