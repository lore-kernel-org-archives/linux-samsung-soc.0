From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Bugfix for of_match_node ordering
Date: Thu, 20 Feb 2014 17:22:51 -0800
Message-ID: <91d21c6c-a87a-46bf-8036-c8f769e32399@VA3EHSMHS018.ehs.local>
References: <1392819290-1044-1-git-send-email-grant.likely@linaro.org>
 <CAK9yfHwwmZkFMRvxsxjBAfUbVXU3V+iPFDZO=DwQsFvJ3NQyKA@mail.gmail.com>
 <CACxGe6sg7FpJqAUjkU5DkUpiV_mDbtSV3RETtiQdACUXhRtRrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6sg7FpJqAUjkU5DkUpiV_mDbtSV3RETtiQdACUXhRtRrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Grant,

On Thu, 2014-02-20 at 11:29AM +0000, Grant Likely wrote:
> On Thu, Feb 20, 2014 at 8:39 AM, Sachin Kamat <sachin.kamat-QSEj5FYQhm5QFI55V6+gNQ@public.gmane.org=
g> wrote:
> > Hi Grant,
> >
> > I observe the following boot failure with today's (next-20140220) l=
inux-next
> > tree on Exynos based boards with the default exynos_defconfig.
>=20
> Ugh, nested locking. that is not good. Kevin's patch looks correct an=
d
> I'll merge it in. I'm a little disturbed though that you're the only
> one who has reported problems. Looking at what it does I would expect
> pretty much every SMP platform for freak out about this, but I've
> heard nothing from the powerpc guys.
>=20
> I'll merge in the fix of course, but I'd like to know what I'm missin=
g.

=46WIW, I see a deadlock on Zynq (ARM) as well. The proposed patch
resolves it. Feel free to add my
Tested-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
