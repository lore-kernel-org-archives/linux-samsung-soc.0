From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/4] mfd: Add Samsung Exynos Low Power Audio Subsystem
 driver
Date: Tue, 9 Aug 2016 21:50:31 +0100
Message-ID: <20160809205031.GD1581@dell>
References: <1467738804-31460-1-git-send-email-s.nawrocki@samsung.com>
 <20160809150502.GQ5243@dell>
 <61d700f7-ef66-8278-54ea-8e6e2f1a029e@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <61d700f7-ef66-8278-54ea-8e6e2f1a029e-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 09 Aug 2016, Sylwester Nawrocki wrote:

> On 08/09/2016 05:05 PM, Lee Jones wrote:
> >> +static SIMPLE_DEV_PM_OPS(lpass_pm_ops, exynos_lpass_suspend,
> >> > +					exynos_lpass_resume);
> > Put this up by the PM functions.
> 
> Sorry, I don't understand this comment, which PM functions do you
> mean exactly?

*_suspend and *_resume.  PM == Power Management.

You also need to place the functions in side some CONFIG_PM_SLEEP
guards.  Grep around, you'll see what I mean.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
