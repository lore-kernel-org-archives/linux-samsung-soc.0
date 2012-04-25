From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung fixes-2 for v3.4
Date: Tue, 24 Apr 2012 17:32:37 -0700
Message-ID: <4F974625.1030607@samsung.com>
References: <4F89A0A5.5030806@samsung.com> <CAOesGMhp48Kh+tJ1534G=ze0CEcVBpaPQxVKs8A31difVw9h9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:47000 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752744Ab2DYAcl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Apr 2012 20:32:41 -0400
Received: by pbbro12 with SMTP id ro12so747603pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 17:32:41 -0700 (PDT)
In-Reply-To: <CAOesGMhp48Kh+tJ1534G=ze0CEcVBpaPQxVKs8A31difVw9h9Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Olof Johansson wrote:
> Hi,

[...]

(Cc'ed Marek Szyprowsk)

> Looking at your current fixes-3 branch, it's unclear at a quick glance
> why the clk_type patch is a bugfix, and especially why it is a
> regression fix -- it looks like a cleanup. We're very close to 3.4-rc3

I agree that the removing clk_type member in sdhci platform data should 
be included in cleanup stuff, it is useless in current mainline though.

Marek, is this ok to you?

> now, so we should only be merging fixes (and ideally only regressions
> since 3.3).
>
> So, if you do need it to go into 3.4 please motivate it when you send
> the pull request.
>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
