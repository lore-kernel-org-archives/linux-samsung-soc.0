From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/4] Samsung devel-mmc for v3.4
Date: Sat, 10 Mar 2012 10:08:57 -0800
Message-ID: <CAOesGMgx-86rUuOfjTN8BeYZD+S=04oj+N9u-m9dr8JQA1Oxiw@mail.gmail.com>
References: <4F5B7C8D.5000805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:58989 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930Ab2CJSI6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 13:08:58 -0500
Received: by gghe5 with SMTP id e5so1623714ggh.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 10:08:57 -0800 (PST)
In-Reply-To: <4F5B7C8D.5000805@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Chris Ball <cjb@laptop.org>

Hi,

On Sat, Mar 10, 2012 at 8:08 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi Arnd, Olof
>
> This is regarding Samsung mmc for v3.4.
>
> As a note, v3.4-for-cjb branch is merged into mmc/mmc-next like following:
> http://git.kernel.org/?p=linux/kernel/git/cjb/mmc.git;a=commit;h=fcd9bdae386753531a9cb6b2577359a83f4e121c

Looking at this series, there's really only one patch that is not in
the mmc tree:

ARM: SAMSUNG: change the name from s3c-sdhci to exynos4-sdhci

And all it does is change the platform device string contents.

Since there are no build-time dependencies between this and the MMC
change, I suggest you send only this patch so that we avoid having
merge dependencies where not strictly needed.

Would that be OK with you? If so, please send a fresh pull request
with only the above change in it.



Thanks,

-Olof
