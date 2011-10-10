From: Subash Patel <subashrp@gmail.com>
Subject: Re: enabling FIMC from default config
Date: Mon, 10 Oct 2011 12:35:50 +0530
Message-ID: <4E92994E.10601@gmail.com>
References: <4E9295CD.7020304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:49984 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751884Ab1JJHFy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 03:05:54 -0400
Received: by pzk1 with SMTP id 1so15633201pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Oct 2011 00:05:54 -0700 (PDT)
In-Reply-To: <4E9295CD.7020304@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org

I forgot to add:

instead of choosing them through config MACH_**** in 
arch/arm/mach-exynos4/Kconfig

Regards,
Subash

On 10/10/2011 12:20 PM, Subash Patel wrote:
> Hi Sylwester,
>
> In the file arch/arm/plat-s5p/Kconfig, why dont we change the below
>
> config S5P_DEV_FIMC0/1/2/3
> bool
> help
> Compile in platform device definitions for FIMC controller 0/1/2/3
>
> as
>
> config S5P_DEV_FIMC0/1/2/3
> bool
> depends on VIDEO_SAMSUNG_S5P_FIMC
> default y
> help
> Compile in platform device definitions for FIMC controller 0/1/2/3
>
> I find that every time I need to use FIMC, I need to make some
> un-necessary hacks into Kconfig, even though I choose the menu item
> "Samsung S5P and EXYNOS4 camera host interface driver"
>
> Regards,
> Subash
>
>
