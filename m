From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 2/4] usb: phy: samsung: Add host phy support to
 samsung-phy driver
Date: Mon, 14 Jan 2013 15:45:30 -0800
Message-ID: <CAD=FV=Vxo8D+W_=m1+ODEarMXgCgcT0cSs3KekTkGyvVVANyMA@mail.gmail.com>
References: <1355841786-13307-1-git-send-email-gautam.vivek@samsung.com>
 <1355841786-13307-3-git-send-email-gautam.vivek@samsung.com>
 <CAD=FV=WMjqszsTQja82_uZc4Ue50TfTmSNO2yOhSMCX1w1L5Dg@mail.gmail.com>
 <CAFp+6iHYRRS3uSWnmdqBvfOgUDKKJUzMvqoj1HP2uXS=Fdaifg@mail.gmail.com>
 <CAD=FV=XhMbWjCR5r=R3+zE1524NuUUvFDf2HZuCrXPmsei4BNA@mail.gmail.com>
 <CAFp+6iHFw2orVOxxzb+daQJsA46zUk2ZOA=h6QwGAme18JngXw@mail.gmail.com>
 <CAFp+6iF4Q2uUzJKf8d-jMZoxBcVzxBAxLyKDqF4B8=p+_JYuCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAFp+6iF4Q2uUzJKf8d-jMZoxBcVzxBAxLyKDqF4B8=p+_JYuCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Vivek,


On Mon, Jan 14, 2013 at 12:06 AM, Vivek Gautam
<gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Is it fine if we don't use macro for SHIFT, earlier code also doesn't use it.
>> Can we just do like this ..
>> #define HOST_CTRL0_FSEL_MASK                       (0x7 << 16)
>> #define HOST_CTRL0_FSEL_CLKSEL_50M            (0x7 << 16)
>> #define HOST_CTRL0_FSEL_CLKSEL_24M            (0x5 << 16)
>> #define HOST_CTRL0_FSEL_CLKSEL_20M            (0x4 << 16)
>> #define HOST_CTRL0_FSEL_CLKSEL_19200K       (0x3 << 16)
>> #define HOST_CTRL0_FSEL_CLKSEL_12M            (0x2 << 16)
>> #define HOST_CTRL0_FSEL_CLKSEL_10M            (0x1 << 16)
>> #define HOST_CTRL0_FSEL_CLKSEL_9600K         (0x0 << 16)

I don't have a problem with just putting the << 16 there...

> Actually missed one thing here, this "HOST_CTRL0_FSEL_CLKSEL_XX" is
> being used by
> HOST/OTG blocks to prepare reference clock, that's the reason we kept
>             #define HOST_CTRL0_FSEL(_x)                  ((_x) << 16)
> and       #define OTG_SYS_FSEL(_x)                       ((_x) << 4)
> where (_x) is the reference clock returned from
> samsung_usbphy_get_refclk_freq().

I feel like samsung_usbphy_get_refclk_freq() is supposed to be
returning an already shifted value.  ...at least that's how it appears
to work with existing code.  Why does it feel like that?  ...because
with existing code we have:

#define PHYCLK_CLKSEL_MASK (0x3 << 0)
#define PHYCLK_CLKSEL_48M (0x0 << 0)
#define PHYCLK_CLKSEL_12M (0x2 << 0)
#define PHYCLK_CLKSEL_24M (0x3 << 0)

Those #defines are what are returned by
samsung_usbphy_get_refclk_freq().  The fact that the "<< 0" is there
implies (to me) that the existing function would return shifted values
if it were applicable.

For exynos you are having the same function return things like:

#define FSEL_CLKSEL_50M (0x7)
#define FSEL_CLKSEL_24M (0x5)
#define FSEL_CLKSEL_20M (0x4)

...to me that means that the exynos code is returning unshifted values.


If you say that samsung_usbphy_get_refclk_freq() is in charge of
returning shifted values then you no longer need the HOST_CTRL0_FSEL()
macro.


In any case, I will defer to whatever Felipe thinks is best here (if
he has an opinion on it).  I am only pointing out that the exynos code
and existing code seem to be specifying things differently.  That's
weird to me.


> so we can change this to something like
>
>                            case 10 * MHZ:
>                                      refclk_freq = FSEL_CLKSEL_10M;
>                                      break;
> and so on.
> will this be fine ?

Seems good to me.


-Doug
