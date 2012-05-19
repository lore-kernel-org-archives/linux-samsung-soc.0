From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung devel-2 for v3.5
Date: Sat, 19 May 2012 16:12:40 -0700
Message-ID: <CAOesGMhFPQ1tP8e7mMn+j=n1APK0YYKrMXL=wJXOtRaX=T8=ew@mail.gmail.com>
References: <4FB8211E.6070905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36789 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754757Ab2ESXMl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 May 2012 19:12:41 -0400
Received: by obbtb18 with SMTP id tb18so5940566obb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 16:12:40 -0700 (PDT)
In-Reply-To: <4FB8211E.6070905@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sat, May 19, 2012 at 3:39 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Hi Arnd, Olof
>
> Here is second development of Samsung stuff for v3.5:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/devel-samsung-2
>
> It is adding support second irq set for s3c2416, suspend/resume for
> exynos5250 and none of interrupt combiner controller for exynos5250.
>
> Since above patches have dependencies with pm of exynos4412 is in
> next/devel-samsung and regarding dt update is in next/exynos5250-1 br=
anch,
> so I made this on top of them.
>
> If any problems, please kindly let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> The following changes since commit 2de05a57467c43f58802cdeaa547aee733=
96b6f3:
>
> =A0Merge branch 'next/devel-exynos5250-1' into next/devel-samsung-2
> (2012-05-20 03:04:59 +0900)
>
> are available in the git repository at:
>
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.=
git
> next/devel-samsung-2

Pulled into late/soc (see reply to cleanup-2).


Thanks,

-Olof
