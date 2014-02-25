From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/1] ARM: Exynos: Add generic compatible string
Date: Tue, 25 Feb 2014 12:42:30 +0100
Message-ID: <201402251242.30654.arnd@arndb.de>
References: <1392809645-631-1-git-send-email-sachin.kamat@linaro.org> <CAK9yfHxXTbNmgTYqFH1Mm-X_sN2GpfLPp0MKixU=g2bKxz8e=g@mail.gmail.com> <CAOesGMiZXKRbrbmvKs4pF7HiXM1hsGjzbFUQmJ-n5-nar5uMBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.130]:56419 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848AbaBYLnL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Feb 2014 06:43:11 -0500
In-Reply-To: <CAOesGMiZXKRbrbmvKs4pF7HiXM1hsGjzbFUQmJ-n5-nar5uMBw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Tuesday 25 February 2014, Olof Johansson wrote:
> I disagree. I don't know what Samsung has in mind, but the revision of
> the CPU doesn't have all that much to do with the rest of the SoC.
> It's quite likely that some vendors (maybe not Samsung, but the same
> concept applies) will ship 64-bit SoCs that are very similar to their
> preceding 32-bit ones, same IP, similar busses, etc. I'm pretty sure
> at least some vendors will do very close to that.

Right.

> So, if EXYNOS4 and EXYNOS5 can share a compatible value when they use
> different CPUs, then there's no reason that whatever future 64-bit
> ones can also share it.

How about putting both 'samsung,exynos' and 'samsung,exynos4' in DT then
and having the platform code match exynos4 and exynos5 but not exynos?

That way, I think we are consistent and future-proof. Any code that needs
to know if it's running on some exynos version can just check for the
'samsung,exynos' compatible value and that will work on both arm32 and
arm64. Also, if we ever decide we want to run a 32-bit kernel on a 64-bit
exynos, we can just add 'samsung,exynos6' (or whatever number that will
be) to the list.

My usual disclaimer for this: You should never ever consider actually
running a 32-bit kernel on a 64-bit CPU, but at the same time there
shouldn't be any reason why it won't work either, given that we require
arm64 based systems to have all SoC specific code in drivers and we
can use the same drivers on arm32.

	Arnd
