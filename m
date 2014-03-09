From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/6] Samsung PM updates for v3.15
Date: Sun, 9 Mar 2014 11:35:23 -0700
Message-ID: <20140309183523.GD22881@quad.lixom.net>
References: <8259832.260591393840570438.JavaMail.weblogic@epml16>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:36842 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751818AbaCISfR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Mar 2014 14:35:17 -0400
Received: by mail-pd0-f177.google.com with SMTP id g10so6100689pdj.22
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Mar 2014 11:35:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <8259832.260591393840570438.JavaMail.weblogic@epml16>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "khilman@linaro.org" <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, mturquette@linaro.org

On Mon, Mar 03, 2014 at 09:56:11AM +0000, Kukjin Kim wrote:
> The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:
> 
>   Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)
> 
> are available in the git repository at:
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git tags/samsung-pm-1
> 
> for you to fetch changes up to e11d919e4aa2009077e3e4f829ff991d37adca61:
> 
>   ARM: EXYNOS: Drop legacy Exynos4 clock suspend/resume code (2014-02-14 08:16:01 +0900)

Hi,

I don't see a single cc or acked-by line from Mike Turquette here. I'll hold
off until he's had a chance to take a look at these ones; I suspect they'll be
fine since it's mostly code refactoring though.


-Olof
