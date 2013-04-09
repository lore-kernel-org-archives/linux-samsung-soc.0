From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
Date: Wed, 10 Apr 2013 00:07:36 +0900
Message-ID: <51642EB8.8050107@samsung.com>
References: <2f3001ce3515$9a9ae1b0$cfd0a510$%kim@samsung.com> <2f3701ce3516$c29aca80$47d05f80$%kim@samsung.com> <201304091348.14887.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:35418 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934641Ab3DIPHl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 11:07:41 -0400
Received: by mail-pa0-f47.google.com with SMTP id bj3so3858820pad.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 08:07:41 -0700 (PDT)
In-Reply-To: <201304091348.14887.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>, kyungmin.park@samsung.com, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 04/09/13 20:48, Arnd Bergmann wrote:
> On Tuesday 09 April 2013, Kukjin Kim wrote:
>> One more, as you know, we cannot support all features non-DT did only with
>> DT exynos. But I think, if required, some of them can be kept in samsung
>> tree temporarily.
>
> Which are the features that are going to be missing? Is it possible to
> add the ones that people are likely to miss using auxdata?
>
AFAIK, some of them such as sata, usb phy is on-going and...

>> Note, original patch couldn't submitted to linux arm kernel ml due to size.
>> And please ignore useless line wrapped due to e-mail client problem :-(
>
> You might be able to send it when you create the patch using 'git format-patch
> -M -D', which will leave out deleted files.
>
Thanks, I did as per your suggestion.

- Kukjin
