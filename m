From: Subash Patel <subashrp@gmail.com>
Subject: enabling FIMC from default config
Date: Mon, 10 Oct 2011 12:20:53 +0530
Message-ID: <4E9295CD.7020304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:62052 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750980Ab1JJGu6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 02:50:58 -0400
Received: by ggnv2 with SMTP id v2so4198449ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Oct 2011 23:50:58 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org

Hi Sylwester,

In the file arch/arm/plat-s5p/Kconfig, why dont we change the below

config S5P_DEV_FIMC0/1/2/3
         bool
         help
           Compile in platform device definitions for FIMC controller 
0/1/2/3

as

config S5P_DEV_FIMC0/1/2/3
         bool
         depends on VIDEO_SAMSUNG_S5P_FIMC
         default y
         help
           Compile in platform device definitions for FIMC controller 
0/1/2/3

I find that every time I need to use FIMC, I need to make some 
un-necessary hacks into Kconfig, even though I choose the menu item 
"Samsung S5P and EXYNOS4 camera host interface driver"

Regards,
Subash
