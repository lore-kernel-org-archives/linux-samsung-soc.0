From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH -v2 10/14] drm/exynos: atomic phase 1: add
 atomic_begin()/atomic_flush()
Date: Mon, 9 Feb 2015 15:07:37 -0200
Message-ID: <20150209170737.GA1991@joana>
References: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
 <1423251478-17043-11-git-send-email-gustavo@padovan.org>
 <54D8C9DE.5040103@samsung.com>
 <CAPj87rM-Ahw59k9Sc_BnfQQPCyEEQkvV6xhsMyW1S=N4LQWfiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f47.google.com ([209.85.216.47]:40324 "EHLO
	mail-qa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933626AbbBIRHl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 12:07:41 -0500
Received: by mail-qa0-f47.google.com with SMTP id n8so22114854qaq.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Feb 2015 09:07:40 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAPj87rM-Ahw59k9Sc_BnfQQPCyEEQkvV6xhsMyW1S=N4LQWfiA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Stone <daniel@fooishbar.org>
Cc: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel <dri-devel@lists.freedesktop.org>

2015-02-09 Daniel Stone <daniel@fooishbar.org>:

> Hi Inki,
>=20
> On 9 February 2015 at 14:53, Inki Dae <inki.dae@samsung.com> wrote:
> > I'm merging this patch series but I found two issues. One is alread=
y
> > pointed out.
>=20
> Fantastic - thanks a lot for doing this!
>=20
> > On 2015=EB=85=84 02=EC=9B=94 07=EC=9D=BC 04:37, Gustavo Padovan wro=
te:
> >> @@ -628,20 +638,6 @@ static void fimd_win_commit(struct exynos_drm=
_crtc *crtc, unsigned int win)
> >>               return;
> >>       }
> >>
> >> -     /*
> >> -      * SHADOWCON/PRTCON register is used for enabling timing.
> >> -      *
> >> -      * for example, once only width value of a register is set,
> >> -      * if the dma is started then fimd hardware could malfunctio=
n so
> >> -      * with protect window setting, the register fields with pre=
fix '_F'
> >> -      * wouldn't be updated at vsync also but updated once unprot=
ect window
> >> -      * is set.
> >> -      */
> >> -
> >> -     /* protect windows */
> >> -     fimd_shadow_protect_win(ctx, win, true);
> >
> > You removed to protect shadow register updating at vsync so fimd
> > hardware could malfunction if setcrtc/page flip/setplane are reques=
ted
> > by userspace. Actually, when I run modetest repeatedly, I could see
> > overlay isn't rarely turned on.
> >
> > So how about calling win_protect/unprotect callbacks like below? If=
 you
> > are ok, I can modify it and merge it.
>=20
> I think you are missing some details about atomic and the helpers.
>=20
> The helpers wrap _all_ legacy codepaths, e.g. SetCrtc, SetPlane, etc.
> All of these operations are intercepted by the code in
> drm_atomic_helper.c / drm_plane_helper.c code, and the legacy
> operations are turned into atomic operations. For the driver - there
> are no legacy operations.
>=20
> The atomic helpers guarantee that atomic_begin() will be called befor=
e
> the state is committed, and atomic_flush() will be called after the
> state is committed. Thus this change is completely safe.

Exactly, when phase 3 is merged you won't see any of these issues. I ha=
ve
patches ready for most part of phase 3. Expect them soon in the mailing=
 list.

	Gustavo
