From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [GIT PULL 5/6] Samsung PM updates for v3.15
Date: Mon, 10 Mar 2014 00:32:56 +0100
Message-ID: <531CFA28.9020600@gmail.com>
References: <8259832.260591393840570438.JavaMail.weblogic@epml16> <20140309183523.GD22881@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:58605 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751606AbaCIXdA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Mar 2014 19:33:00 -0400
Received: by mail-ea0-f172.google.com with SMTP id l9so3417023eaj.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Mar 2014 16:32:59 -0700 (PDT)
In-Reply-To: <20140309183523.GD22881@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, mturquette@linaro.org, "arm@kernel.org" <arm@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "khilman@linaro.org" <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 09.03.2014 19:35, Olof Johansson wrote:
> On Mon, Mar 03, 2014 at 09:56:11AM +0000, Kukjin Kim wrote:
>> The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:
>>
>>    Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)
>>
>> are available in the git repository at:
>>
>>    http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git tags/samsung-pm-1
>>
>> for you to fetch changes up to e11d919e4aa2009077e3e4f829ff991d37adca61:
>>
>>    ARM: EXYNOS: Drop legacy Exynos4 clock suspend/resume code (2014-02-14 08:16:01 +0900)
>
> Hi,
>
> I don't see a single cc or acked-by line from Mike Turquette here. I'll hold
> off until he's had a chance to take a look at these ones; I suspect they'll be
> fine since it's mostly code refactoring though.

I guess I should have ACKed them too, but it felt kind of strange to ACK 
my own patches. ;)

Anyway, for all samsung-clk patches:

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
