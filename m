From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 1/3] include: fb: Add definiton for window positioning
 structure
Date: Tue, 20 Sep 2011 20:08:59 +0300
Message-ID: <20110920170858.GA3827@tarshish>
References: <1316532641-2657-1-git-send-email-ajaykumar.rs@samsung.com>
 <1316532641-2657-2-git-send-email-ajaykumar.rs@samsung.com>
 <20110920112427.GB19695@sapphire.tkos.co.il>
 <CAEC9eQOpwfmRfcxHoiA00xX0a=dxXj1xJDpW14DozGXKXPJ3Xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from tango.tkos.co.il ([62.219.50.35]:56255 "EHLO tango.tkos.co.il"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750974Ab1ITRJl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 13:09:41 -0400
Content-Disposition: inline
In-Reply-To: <CAEC9eQOpwfmRfcxHoiA00xX0a=dxXj1xJDpW14DozGXKXPJ3Xg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, banajit.g@samsung.com, jg1.han@samsung.com, lethal@linux-sh.org, ben-linux@fluff.org, m.szyprowski@samsung.com

Hi Ajay,

On Tue, Sep 20, 2011 at 08:56:57PM +0530, Ajay kumar wrote:
> Hi Baruch,
> On Tue, Sep 20, 2011 at 4:54 PM, Baruch Siach <baruch@tkos.co.il> wro=
te:
> > Hi Ajay,
> >
> > On Tue, Sep 20, 2011 at 11:30:39AM -0400, Ajay Kumar wrote:
> >> This patch adds a data structure definiton to hold framebuffer win=
dows/planes.
> >> An ioctl number is also added to provide user access
> >> to change window position dynamically.
> >
> > [snip]
> >
> >> +/* Window overlaying */
> >> +struct fb_overlay_win_pos {
> >> + =A0 =A0 __u32 win_pos_x; =A0 =A0 =A0 =A0/* x-offset from LCD(0,0=
) where window starts */
> >> + =A0 =A0 __u32 win_pos_y; =A0 =A0 =A0 =A0/* y-offset from LCD(0,0=
) where window starts */
> >> +};
> >
> > Why not allow negative offsets where the left or upper part of the =
framebuffer
> > is hidden?
>=20
> Thanks for pointing it out. Are there drivers which place the overlay
> windows such that some part of the window is hidden from being
> displayed on the screen?

I don't know. However, since this is new userspace ABI which should sta=
y=20
compatible forever, we should make sure to do it right. Using __s32 ins=
tead of=20
__u32 won't limit us in the future.

baruch

--=20
                                                     ~. .~   Tk Open Sy=
stems
=3D}------------------------------------------------ooO--U--Ooo--------=
----{=3D
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
