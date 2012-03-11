From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung Cleanup EXYNOS clock for v3.4
Date: Sun, 11 Mar 2012 00:00:39 -0800
Message-ID: <4F5C5BA7.8050904@samsung.com>
References: <4F589474.8050609@samsung.com> <CAOesGMiWOChuMjLQTK1pGys+oXCc4A=HO-2_=37rh3M6pgUP_g@mail.gmail.com> <4F5A22AD.1070907@samsung.com> <4F5B74C1.3080200@samsung.com> <20120310173526.GB5972@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:39167 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751040Ab2CKIAr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Mar 2012 04:00:47 -0400
Received: by iagz16 with SMTP id z16so4972538iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Mar 2012 00:00:47 -0800 (PST)
In-Reply-To: <20120310173526.GB5972@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>

On 03/10/12 09:35, Olof Johansson wrote:

[...]

>
> The contents of the branch itself looks good, but now you have introduced
> a modified/delete conflict with yourself.
>
> You modify arch/arm/mach-exynos/clock.c in your cleanup-use-static branch, and
> then you move it here. That means that when I merge in this branch, git throws
> a conflict and I have to do manual edits to make the contents match.
>
> It's better if you base this branch on your cleanup-use-static branch, so that
> the move includes those edits. That way there is no conflict resolution to do
> at our end either.
>
> Can you please do that rebase and send a fresh pull request? I'll continue
> looking at your other requests meanwhile.
>
Hi Olof,

Sorry for late response. OK I see and your suggestion sounds good to me. 
Let me send a new pull request after that.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
