From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/3] add mie driver for exynos
Date: Mon, 17 Dec 2012 21:07:31 +0100
Message-ID: <CAKMK7uE=fr3fNwzUiW056EPq9K=N9wgvU2n9xigRqfLw2i0yVQ@mail.gmail.com>
References: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
	<CAAQKjZM278TfT=dcVJoKRPqWpdChaJv2N6v4O_D-xsxJOLKeRQ@mail.gmail.com>
	<CACP_E+JdiVxD05k0F57bmXWw1WKiS_NNviXOXYUVegwi5MnrsQ@mail.gmail.com>
	<CAAQKjZOVVU0fjj5VruQ-m8pgPoBATpXuzKsZv2F+Ux-aLtcLHw@mail.gmail.com>
	<CACP_E++D=_akHO5tLw-XQKj8BPbhoy3SE9AUJGd5i-pvA2qsfw@mail.gmail.com>
	<CAAQKjZPkfAs9Ff6_odxY95zT0Obw0x8SvkuMjB41O+HG2cVefA@mail.gmail.com>
	<CACP_E++aObqEoO7wYDd=5xUkZ9Fo=hz5V5nQpNk_dVeOHmeizQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:62974 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752714Ab2LQUHd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Dec 2012 15:07:33 -0500
Received: by mail-we0-f174.google.com with SMTP id x10so2948211wey.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Dec 2012 12:07:32 -0800 (PST)
In-Reply-To: <CACP_E++aObqEoO7wYDd=5xUkZ9Fo=hz5V5nQpNk_dVeOHmeizQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?St=E9phane_Marchesin?= <stephane.marchesin@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, kgene.kim@samsung.com, "R. Chandrasekar" <rcsekar@samsung.com>, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, rcsekar.samsung@gmail.com

On Mon, Dec 17, 2012 at 7:59 PM, St=E9phane Marchesin
<stephane.marchesin@gmail.com> wrote:
>
>> And
>> fimd, as display controller, could be controlled by linux framebuffe=
r or drm
>> framework.
>>
>
> I don't think it's a valid point. If the framebuffer is properly done
> on top of the DRM, you don't need all of that at all.

Imo for hw with full-fledge drm kms drivers the sanest option for
traditional fbdev support is to pimp the fb helpers a bit. Pretty much
the only thing left that a real fbdev driver can do afaics is fb
reallocation - it shouldn't be too hard to (optionally) implement this
in the helpers ...
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
