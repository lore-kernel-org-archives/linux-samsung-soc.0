From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2nd 3/5] Samsung defconfig update for v3.14
Date: Tue, 31 Dec 2013 10:02:28 -0800
Message-ID: <CAOesGMhEVQi7kw9WW+nV3MB=7rz0TK==wccAKFePrm-Ub=H=Bw@mail.gmail.com>
References: <52B5DCAB.204@samsung.com>
	<20131228231531.GB22753@quad.lixom.net>
	<CAOesGMj38JPgFic+ByShH3nHXWe0j=rzcdQzEiTGJ18OKfR6zw@mail.gmail.com>
	<CAOesGMh-ptLF_fvJ2X_7_WZVnB3oUkO2QUPxPENb4e+aDUb6iQ@mail.gmail.com>
	<20131231161743.GH31886@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:50447 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755555Ab3LaSC3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Dec 2013 13:02:29 -0500
Received: by mail-qc0-f172.google.com with SMTP id e16so12236461qcx.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2013 10:02:28 -0800 (PST)
In-Reply-To: <20131231161743.GH31886@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Tue, Dec 31, 2013 at 8:17 AM, Mark Brown <broonie@kernel.org> wrote:
> On Sat, Dec 28, 2013 at 07:48:26PM -0800, Olof Johansson wrote:
>> On Sat, Dec 28, 2013 at 7:44 PM, Olof Johansson <olof@lixom.net> wrote:
>
>> > The regulator driver causes build breaks. Really, nobody checks these
>> > things before sending patches or merge requests?
>
>> > Having exynos_defconfig broken in arm-soc isn't an alternative. So I
>> > dropped this branch again. If the regulator driver gets fixed in -rc
>> > then we can probably merge it before the merge window, otherwise we'll
>> > have to merge the defconfig change after the regulator fix goes in for
>> > the 3.14 merge window.
>
>> Ah, I guess the fix went in after -rc4, which is the latest -rc that
>> we have in for-next today. I'll bring for-next forward and merge this
>> in.
>
>> Still, it's odd that you were able to test your branch before sending it in.
>
> The build breakage was only introduced in -rc4 - a MFD/RTC change went
> in via Andrew's tree so it got no exposure in -next before it showed up
> in Linus' tree which wasn't good.  The fix was in by -rc5, looking at
> the date on the pull request I expect that any testing against -next (as
> opposed to arm-soc) would've been OK and since the branch is based on
> -rc1 it'd have tested out by itself as well.


Ah, yeah, that explains it. Thanks for the clarification.


-Olof
