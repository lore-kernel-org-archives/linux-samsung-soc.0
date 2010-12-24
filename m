From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH 0/4] Modify configures to support Samsung
 ASoC dependancyless
Date: Fri, 24 Dec 2010 16:56:44 +0900
Message-ID: <AANLkTim18YJH=FgCLruJKbyNeRM-zWFBBB6BaOoL-ajp@mail.gmail.com>
References: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:59773 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784Ab0LXH4q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Dec 2010 02:56:46 -0500
Received: by bwz15 with SMTP id 15so8023324bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Dec 2010 23:56:44 -0800 (PST)
In-Reply-To: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwhan Youn <sw.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, jassi.brar@samsung.com, broonie@opensource.wolfsonmicro.com, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Fri, Dec 24, 2010 at 3:26 PM, Seungwhan Youn <sw.youn@samsung.com> w=
rote:
> Hi,
>
> These patches modify configuration to make audio support configuratio=
ns on
> platform(or arch) from sound/soc/samsung. This prevents that audio co=
nfig
> consider which board(or arch) can(or should) support ASoC audio drive=
r, and
> also prevents audio config dependancy on future Samsung SoCs.
>
>
> These patches are modify below features:-
> =C2=A0o Add audio configurations on plat(or arch).
> =C2=A0o Modify audio configuration depends on plat(or arch) selection=
 on ASoC.
>
> This patch-set is based on two different branches that :-
> =C2=A0o ARM patches are based on Kukjin Kim's git branch 'for-next'
> =C2=A0 (commit id - 30fb9a94ec22435add3d2ea2d1b01c1a5ad6164c)
> =C2=A0o ASoC patches are based on Mark Brown's git branch 'for-next'
> =C2=A0 (commit id - 722bc28384accb67c0bfbbe1914fd82d4d0c996a)
>
> This patch-set contains followings :-
> =C2=A0o To Kukjin Kim, Ben Dooks and Russell King,
> =C2=A0- [PATCH 1/4] ARM: Kconfig: Add audio support dependency
> =C2=A0- [PATCH 2/4] ARM: SAMSUNG: Add SMDK audio configuration
> =C2=A0o To Jassi Brar, Mark Brown and Liam Girdwood,
> =C2=A0- [PATCH 3/4] ASoC: SAMSUNG: Modify to indepedant depends on co=
nfiguration
> =C2=A0- [PATCH 4/4] ASoC: SAMSUNG: Apply modifications for SMDK audio=
 configuations

All,
Acked-by : Jassi Brar <jassi.brar@samsung.com>
