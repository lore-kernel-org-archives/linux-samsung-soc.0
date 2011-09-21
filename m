From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 1/3] include: fb: Add definiton for window positioning structure
Date: Wed, 21 Sep 2011 12:48:27 +0530
Message-ID: <CAEC9eQOYx0ysA=f7hN1h+3Ydg_Mt_PwoDkiKGehKC10GWDhDsg@mail.gmail.com>
References: <1316532641-2657-1-git-send-email-ajaykumar.rs@samsung.com>
	<1316532641-2657-2-git-send-email-ajaykumar.rs@samsung.com>
	<20110920112427.GB19695@sapphire.tkos.co.il>
	<CAEC9eQOpwfmRfcxHoiA00xX0a=dxXj1xJDpW14DozGXKXPJ3Xg@mail.gmail.com>
	<20110920170858.GA3827@tarshish>
	<1316586336.1949.14.camel@deskari>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:65003 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752379Ab1IUHSf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 03:18:35 -0400
In-Reply-To: <1316586336.1949.14.camel@deskari>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Baruch Siach <baruch@tkos.co.il>, FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, banajit.g@samsung.com, jg1.han@samsung.com, lethal@linux-sh.org, ben-linux@fluff.org, m.szyprowski@samsung.com

On Wed, Sep 21, 2011 at 11:55 AM, Tomi Valkeinen <tomi.valkeinen@ti.com=
> wrote:
> On Tue, 2011-09-20 at 20:08 +0300, Baruch Siach wrote:
>> Hi Ajay,
>>
>> On Tue, Sep 20, 2011 at 08:56:57PM +0530, Ajay kumar wrote:
>> > Hi Baruch,
>> > On Tue, Sep 20, 2011 at 4:54 PM, Baruch Siach <baruch@tkos.co.il> =
wrote:
>> > > Hi Ajay,
>> > >
>> > > On Tue, Sep 20, 2011 at 11:30:39AM -0400, Ajay Kumar wrote:
>> > >> This patch adds a data structure definiton to hold framebuffer =
windows/planes.
>> > >> An ioctl number is also added to provide user access
>> > >> to change window position dynamically.
>> > >
>> > > [snip]
>> > >
>> > >> +/* Window overlaying */
>> > >> +struct fb_overlay_win_pos {
>> > >> + =A0 =A0 __u32 win_pos_x; =A0 =A0 =A0 =A0/* x-offset from LCD(=
0,0) where window starts */
>> > >> + =A0 =A0 __u32 win_pos_y; =A0 =A0 =A0 =A0/* y-offset from LCD(=
0,0) where window starts */
>> > >> +};
>> > >
>> > > Why not allow negative offsets where the left or upper part of t=
he framebuffer
>> > > is hidden?
>> >
>> > Thanks for pointing it out. Are there drivers which place the over=
lay
>> > windows such that some part of the window is hidden from being
>> > displayed on the screen?
>>
>> I don't know. However, since this is new userspace ABI which should =
stay
>> compatible forever, we should make sure to do it right. Using __s32 =
instead of
>> __u32 won't limit us in the future.
>
> OMAP HW doesn't allow "funny" things like overlay being outside the
> visible area, i.e. negative position or size larger than the display.
> And my guess is that hardware rarely allow things like that, as it wo=
uld
> just complicate the hardware without any gain.
>
> Out-of-display-overlays can of course be emulated by the software. Bu=
t
> I'm not sure if it's good to add the complexity in the driver layer, =
as
> it could as well be handled in the userspace.
>
> Then again, a signed value would be future safer ("just in case"), an=
d
> if the driver can just reject values it doesn't want to support, ther=
e's
> no real harm there either.

OK. I will consider this and modify it in the next version of patches.

Ajay
