From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung board stuff for v3.4
Date: Sat, 10 Mar 2012 09:45:08 -0800
Message-ID: <CAOesGMjiYDFhkjS=2e+3YdPJHExupt3Wm_NS3x1XW-17eEZM=A@mail.gmail.com>
References: <4F5B748B.6050404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:63131 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751331Ab2CJRpI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 12:45:08 -0500
Received: by yenl12 with SMTP id l12so1617091yen.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 09:45:08 -0800 (PST)
In-Reply-To: <4F5B748B.6050404@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

On Sat, Mar 10, 2012 at 7:34 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi Arnd, Olof,
>
> Please pull regarding Samsung board patches for v3.4.
>
> Most are enabling some features(IPs) on each board and
> one is adding new board file, Samsung Mobile's TRATS board.

Given that exynos has started conversion to device tree, there should
not be any  additions of non-devicetree-probed board files being
added.

At the very least, you should move over to using DT_MACHINE instead of
MACHINE for the new board, and probe using device tree. Even better
would be if you added support for this board through mach-exynos4-dt.c
instead of adding a brand new board file.

I also see a large number of the same additions of devices, done to a
number of board files. I don't think you need to rework those patches
now, but please consider how you can make it less "churny" to add a
device on the SoC in the future without touching all board files.


If you rebase without the board file addition I can take the rest of
the branch while that part is being reworked. Please send a new pull
request with the rebased tree.


Thanks,

-Olof
