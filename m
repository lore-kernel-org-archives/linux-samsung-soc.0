From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/2] pinctrl: exynos: Add BUS1 pin controller for exynos7
Date: Wed, 3 Dec 2014 14:41:25 +0100
Message-ID: <CACRpkdYxh36szo5UEaJOERtgT_FcYPp+7iagXG2XZ6Aeui6PWQ@mail.gmail.com>
References: <CAFp+6iF-N63YSsdv2a6=MYp_mD=eQY_Oi8=9JVNU5dG0BA7YGQ@mail.gmail.com>
	<1416834177-11170-1-git-send-email-gautam.vivek@samsung.com>
	<CAGOxZ51P30BY2sOhUeMRK64CGF1fNcc-63RCXiAqZ6Rgpv3K7Q@mail.gmail.com>
	<CAFp+6iFcMGTBQDcdK0cbcu0s9a3022nogaUvbPA2ZsCN80hRSA@mail.gmail.com>
	<CAFp+6iFaf_RMprLCLXK=o=KGSTQuVL3geKx5yfevTuvFdjYLNg@mail.gmail.com>
	<CACRpkdY8sEJMr-cxzrUEW1sqP3bGLH=Q2hDP1NBQ5m9A+RhP5Q@mail.gmail.com>
	<CAFp+6iHiC9mouT-v_yGHm5adDerCpT-s7EeWwwwYi-NzdLBnrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFp+6iHiC9mouT-v_yGHm5adDerCpT-s7EeWwwwYi-NzdLBnrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alim Akhtar <alim.akhtar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kgene <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Dec 1, 2014 at 3:21 PM, Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Nov 28, 2014 at 9:15 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>> Apart from that, there are *again* a lot of Exynos patches flying around and
>> I start to loose track of them. If they do not apply together and start to
>> conflict I will just ask Tomasz to stack them and provide a pull request
>> again.
>
> True, this merge cycle has surely got number of exynos7 related
> patches in flight,
> which are difficult to keep track of.
> Thanks for asking Tomasz.

I will probably not take any more Exynos patches for this merge cycle and
ask Tomasz to queue the Exynos pinctrl patches for v3.20 after v3.19
merge cycle is complete, so make sure to include Tomasz on reviews.

Tomasz: OK?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
