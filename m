From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung SoC EXYNOS5250 arch for v3.4
Date: Fri, 16 Mar 2012 13:30:22 -0700
Message-ID: <4F63A2DE.7070705@samsung.com>
References: <4F61FA0D.1050007@samsung.com> <201203161250.11353.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:53025 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030320Ab2CPUaZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Mar 2012 16:30:25 -0400
Received: by dajr28 with SMTP id r28so6593601daj.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Mar 2012 13:30:25 -0700 (PDT)
In-Reply-To: <201203161250.11353.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Olof Johansson' <olof@lixom.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Arnd Bergmann wrote:

[...]

>
> As you may have noticed from Stephen's notification about the merge
> conflict, I have put this into the next/soc2 branch now.
>
Yes, thanks.

> I'm not too happy with the resolution of my comments, but in the

Hmm, sorry about that.

> end I think it's better to have it in the tree than not have it.
> While you did reply with explanations for why some of the patches
> were necessary, you did not actually put the explanations into
> the changeset descriptions but only sent a reply to my emails.

Oh, I see. If similar case will happen next time, let me expand its 
descritpions.

>
> I don't think that the merge conflict is problematic, especially
> since Linus won't see the same thing that Stephen did, but as I
> wrote in the other mail, please check that my resolution was correct.
>
Yes, as I replied, I think your resolution and Stehpehn's one, both are 
correct to me and just different postion of 'int ret'. As a note, I just 
fixed it up with yours.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
