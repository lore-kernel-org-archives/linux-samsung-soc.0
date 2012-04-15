From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-2 for v3.4
Date: Sat, 14 Apr 2012 18:04:47 -0700
Message-ID: <CAOesGMhp48Kh+tJ1534G=ze0CEcVBpaPQxVKs8A31difVw9h9Q@mail.gmail.com>
References: <4F89A0A5.5030806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:48561 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756555Ab2DOBEt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Apr 2012 21:04:49 -0400
Received: by wgbdr13 with SMTP id dr13so4110398wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Apr 2012 18:04:47 -0700 (PDT)
In-Reply-To: <4F89A0A5.5030806@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

On Sat, Apr 14, 2012 at 9:07 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Hi Arnd, Olof,
>
> Please pull samsung fixes-2 for v3.4 from following:
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.=
git
> v3.4-samsung-fixes-2

Pulled, thanks.

> Most are for fix of build failure :( and warnings.
> If any problems, please let me know.
>
> Note that according to changing the device name for sdhci controllers=
 and
> removing clk_type from sdhci platform_data after v3.4-rc1, need to up=
date
> regarding stuff in samsung arch part so I'm preparing its fix in
> samsung-fixes-3. I will send it next turn.

Looking at your current fixes-3 branch, it's unclear at a quick glance
why the clk_type patch is a bugfix, and especially why it is a
regression fix -- it looks like a cleanup. We're very close to 3.4-rc3
now, so we should only be merging fixes (and ideally only regressions
since 3.3).

So, if you do need it to go into 3.4 please motivate it when you send
the pull request.


Thanks,

-Olof
