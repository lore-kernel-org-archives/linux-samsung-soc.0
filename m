From: Doug Anderson <dianders@chromium.org>
Subject: Re: Crash during S2R on Arndale if CONFIG_SAMSUNG_PM_CHECK enabled
Date: Thu, 12 Jun 2014 08:20:09 -0700
Message-ID: <CAD=FV=WKP=_u_UDaFvOgETkAMAoEjJv3dJev8PEvMGWUro0yUA@mail.gmail.com>
References: <CAGm_ybgakzE3MbQQduBZZ6WFkFm_bFFSyHDzJUXm5ajgQqKFRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35421 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756057AbaFLPUK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 11:20:10 -0400
Received: by mail-ob0-f179.google.com with SMTP id uz6so1454699obc.38
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2014 08:20:09 -0700 (PDT)
In-Reply-To: <CAGm_ybgakzE3MbQQduBZZ6WFkFm_bFFSyHDzJUXm5ajgQqKFRA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Olof Johansson <olof@lixom.net>, Abhilash Kesavan <a.kesavan@samsung.com>

Vikas,

On Fri, May 23, 2014 at 5:14 AM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> Hi,
>
> I notice that if CONFIG_SAMSUNG_PM_CHECK is enabled, we get a crash in
> function "crc32_le(), as below.

PM_CHECK is nowhere near working in upstream.  ...or at least it
wasn't when I last checked in 3.8 and I can't imagine that someone has
fixed everything needed to make it work.

My best guess (without digging in detail) as to your particular crash
would be missing kmap_atomic calls.  The old code would just assume
that all physical memory was accessible and cram though it.  On modern
systems this just isn't true.  Note that assuming you're on a 2GB
system you may be able to hack around this particular crash
temporarily by using a 1G/3G split (VMSPLIT_1G).

If you are serious about getting pm_check working upstream you should
check out the version in ChromeOS 3.8, clean it up, and land it.  A
few notes about that, though:

1. In order to get PM_CHECK working on today's modern kernels, you'll
need to introduce "suspend volatile" like we did in Chrome OS.  This
is used to mark areas of memory that shouldn't be checked (because
they change between the two calls pm check).  These markings need to
go in generic (non-samsung) code.

2. In order to have any chance of getting upstream to accept all of
the suspend volatile markings, you'll probably need to make pm_check a
generic kernel feature and not one specific to Samsung.

3. You can ignore the "bitfix" stuff in the ChromeOS tree.  There's
pretty much zero chance upstream would want this IMHO.  If they want
it it could always be tacked on later.


I'm happy to answer more questions about pm check, so just let me know.

-Doug
