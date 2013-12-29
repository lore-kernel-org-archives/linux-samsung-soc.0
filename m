From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2nd 3/5] Samsung defconfig update for v3.14
Date: Sat, 28 Dec 2013 19:44:33 -0800
Message-ID: <CAOesGMj38JPgFic+ByShH3nHXWe0j=rzcdQzEiTGJ18OKfR6zw@mail.gmail.com>
References: <52B5DCAB.204@samsung.com>
	<20131228231531.GB22753@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f50.google.com ([209.85.128.50]:47875 "EHLO
	mail-qe0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751334Ab3L2Doe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Dec 2013 22:44:34 -0500
Received: by mail-qe0-f50.google.com with SMTP id 1so10301726qec.37
        for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Dec 2013 19:44:33 -0800 (PST)
In-Reply-To: <20131228231531.GB22753@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sat, Dec 28, 2013 at 3:15 PM, Olof Johansson <olof@lixom.net> wrote:
> On Sun, Dec 22, 2013 at 03:23:39AM +0900, Kukjin Kim wrote:
>> The following changes since commit 54b56e62d20ac0de6e8e12b7efdaf3a1b9b6541c:
>>
>>   ARM: exynos_defconfig: increase CONFIG_NR_CPUS value to 8
>> (2013-12-02 07:33:38 +0900)
>>
>> are available in the git repository at:
>>
>
>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> tags/samsung-defconfig-2
>>
>> for you to fetch changes up to 7c7be272ae6413d1dd298e68752f5e34bc9b3eba:
>>
>>   ARM: exynos_defconfig: Enable S2MPS11 voltage regulator
>> (2013-12-21 06:27:47 +0900)
>
> Pulled into next/boards. Thanks!

The regulator driver causes build breaks. Really, nobody checks these
things before sending patches or merge requests?

Having exynos_defconfig broken in arm-soc isn't an alternative. So I
dropped this branch again. If the regulator driver gets fixed in -rc
then we can probably merge it before the merge window, otherwise we'll
have to merge the defconfig change after the regulator fix goes in for
the 3.14 merge window.


-Olof
