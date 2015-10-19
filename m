From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: exynos5422-odroidxu3: Added UHS-I bus speed support
Date: Mon, 19 Oct 2015 08:11:06 -0700
Message-ID: <CAD=FV=WaD6BuJbSJKTCy4MoG125EMYvnBqYKRTixXL7Gz=YnvA@mail.gmail.com>
References: <1444578364-1384-1-git-send-email-linux.amoon@gmail.com>
	<1444578364-1384-3-git-send-email-linux.amoon@gmail.com>
	<561B48B7.1040201@samsung.com>
	<CANAwSgSLFviT4ZNXTYwxYs2pbrr9ozJmPMauhgRPO0556Rsr_g@mail.gmail.com>
	<561C4CEE.3050905@samsung.com>
	<CANAwSgRJ+5O-x61K9E_AxTZWQy3jJrKF5MiLtWRdUU29CCfa-Q@mail.gmail.com>
	<561C7DF1.6000609@samsung.com>
	<CANAwSgRBzFqHB98wSQnQu-ggGqRT2H6wC415wULXVhPg0uw_3A@mail.gmail.com>
	<561D9ACE.6050103@samsung.com>
	<CAGOxZ51uPkdGmCAs2Tc8_=YvkORJKdivN47vo1ZxkGQ-MY=-oQ@mail.gmail.com>
	<CAD=FV=Voh6Xh_naWQTaRPP8YUS2xJh7jfA+zYbH9QdVhmyZz9A@mail.gmail.com>
	<CANAwSgSd8sHDcmGmck=Em2H5WJzVWM28cbvs9z6CFgpuTY_Juw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANAwSgSd8sHDcmGmck=Em2H5WJzVWM28cbvs9z6CFgpuTY_Juw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alim Akhtar <alim.akhtar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Mon, Oct 19, 2015 at 3:11 AM, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 1 Drop the cd-gpios changes. pinctrl-0 changes.

Right.


> 2 Fix the regulator changes for vmmc/vqmmc with disable of regulator-always-on;

I'm not totally sure I understand.  You should need to keep vmmc and
vqmmc always on because otherwise you can't do card detection (unless
you poll for card detect).


> 3 Drop this UHS-I changes as if now.

Sounds right.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
