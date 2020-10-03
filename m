Return-Path: <SRS0=/9gS=DK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A2AC4363D
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Oct 2020 09:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1970F206CA
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Oct 2020 09:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hDibXoHA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgJCJqD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 3 Oct 2020 05:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgJCJqD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 3 Oct 2020 05:46:03 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EEE7C0613E8
        for <linux-samsung-soc@vger.kernel.org>; Sat,  3 Oct 2020 02:46:03 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id s66so3859509otb.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 03 Oct 2020 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WmsHZ3xTqss6S86de6F2+GmRY4pwh6QmzDJN/bVYlUo=;
        b=hDibXoHAY2NY8DYQlETzpK27wX4ATsoMa5kzy1M2/palInn8ZKnTsfX9OAvCBMHLJ7
         UTXJhzhKn4fSMh0ypNeHIZ7V603V9nGrHtFMY58a+YAo7uy+FISml44C4EG7POAXsSK5
         tta54lMbGSCYR/621NNEVOBJzs4fvGGa04aCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WmsHZ3xTqss6S86de6F2+GmRY4pwh6QmzDJN/bVYlUo=;
        b=UjZ6w/V/upFt8qlaLeLYszT8m+iZhHoZAfTcma+SAhYwe37Eq2I+bwR6AiHberzY8h
         fbtztyL7eWQLB7Q0a9lDsYvezqduYc1QdrULkYkD+p0Hf5SWTe/zaUyBbrTgMWOa3II1
         hX492BxuHwBnWPz9TBbsuueerM8wLjCreybYepjsgJKqwVf6rJfbLCrzd+hCc0jlGjJq
         ElphDJNyUiWqoSF8C5OesRDgMyLfgY+Rtpd0HkDESsfQ/DgEr97Dy2sZniPPn3pfcxeV
         cekj8uH0v799fAyj4HP6VE7mlaLi2/yLGnO6woD7cIQRZP5wOOTMvdGWWL1COjjNFk+s
         WY7w==
X-Gm-Message-State: AOAM531J8uYqMVR3ytbijb9vjlaC63uy82Vksp4pPbxIZ6hzOhDxexE2
        bdPu891KhlZpdUJACc6cVtXmAH7p1KBLijs7TRwQTw==
X-Google-Smtp-Source: ABdhPJx7DZsiJzsUZCobrpWxpW+51JFbUQoJiBR48TvpUyFl0hMBEePfLwnrqOzsuokwHF8YWn4ObJWhXDnnLDo1YzY=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr5004991otf.281.1601718362705;
 Sat, 03 Oct 2020 02:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
In-Reply-To: <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Sat, 3 Oct 2020 11:45:51 +0200
Message-ID: <CAKMK7uGzZ2dBe040vP1BJmQ7cuhj_OQHL0ncyz5XyUcb=bPjmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Oct 3, 2020 at 12:39 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 10/2/20 10:53 AM, Daniel Vetter wrote:
> > For $reasons I've stumbled over this code and I'm not sure the change
> > to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> > convert get_user_pages() --> pin_user_pages()") was entirely correct.
> >
> > This here is used for long term buffers (not just quick I/O) like
> > RDMA, and John notes this in his patch. But I thought the rule for
> > these is that they need to add FOLL_LONGTERM, which John's patch
> > didn't do.
>
> Yep. The earlier gup --> pup conversion patches were intended to not
> have any noticeable behavior changes, and FOLL_LONGTERM, with it's
> special cases and such, added some risk that I wasn't ready to take
> on yet. Also, FOLL_LONGTERM rules are only *recently* getting firmed
> up. So there was some doubt at least in my mind, about which sites
> should have it.
>
> But now that we're here, I think it's really good that you've brought
> this up. It's definitely time to add FOLL_LONGTERM wherever it's missing.

So should I keep this patch, or will it collide with a series you're workin=
g on?

Also with the firmed up rules, correct that I can also drop the
vma_is_fsdax check when the FOLL_LONGTERM flag is set?

Thanks, Daniel

>
> thanks,
> --
> John Hubbard
> NVIDIA
>
> >
> > There is already a dax specific check (added in b7f0554a56f2 ("mm:
> > fail get_vaddr_frames() for filesystem-dax mappings")), so this seems
> > like the prudent thing to do.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > ---
> > Hi all,
> >
> > I stumbled over this and figured typing this patch can't hurt. Really
> > just to maybe learn a few things about how gup/pup is supposed to be
> > used (we have a bit of that in drivers/gpu), this here isn't really
> > ralated to anything I'm doing.
> >
> > I'm also wondering whether the explicit dax check should be removed,
> > since FOLL_LONGTERM should take care of that already.
> > -Daniel
> > ---
> >   mm/frame_vector.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> > index 5d34c9047e9c..3507e09cb3ff 100644
> > --- a/mm/frame_vector.c
> > +++ b/mm/frame_vector.c
> > @@ -35,7 +35,7 @@ int get_vaddr_frames(unsigned long start, unsigned in=
t nr_frames,
> >   {
> >       struct mm_struct *mm =3D current->mm;
> >       struct vm_area_struct *vma;
> > -     unsigned int gup_flags =3D FOLL_WRITE | FOLL_FORCE;
> > +     unsigned int gup_flags =3D FOLL_WRITE | FOLL_FORCE | FOLL_LONGTER=
M;
> >       int ret =3D 0;
> >       int err;
> >       int locked;
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
