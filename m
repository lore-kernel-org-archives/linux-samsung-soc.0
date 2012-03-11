From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL 1/4] Samsung devel for v3.4
Date: Sun, 11 Mar 2012 00:47:20 -0800
Message-ID: <4F5C6698.2030904@samsung.com>
References: <4F5B7C71.2090303@samsung.com> <CAOesGMgec=KVBQJjVs3p3B2GGj9q9mwC2XCdxLNvvJL61u+f8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:49583 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751615Ab2CKIr0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Mar 2012 04:47:26 -0400
Received: by iagz16 with SMTP id z16so5020736iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Mar 2012 00:47:25 -0800 (PST)
In-Reply-To: <CAOesGMgec=KVBQJjVs3p3B2GGj9q9mwC2XCdxLNvvJL61u+f8g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 03/10/12 10:20, Olof Johansson wrote:
> On Sat, Mar 10, 2012 at 8:08 AM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>> Hi Arnd, Olof,
>>
>> This is various develop regarding Samsung stuff for v3.4.
>> Please pull following:
>>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> next/devel-samsung
>>
>> I think, you can pull this cleanly without any conflicts.
>> If any problems, please kindly let me know.
>
>
> Thanks, pulled into next/soc.
>
Olof, thanks.

And as a note, will happen merge conflict between this and 
cleanup-exynos-clock. Here is resolution.

diff --git a/arch/arm/mach-exynos/clock-exynos4.c 
b/arch/arm/mach-exynos/clock-exynos4.c
index 31b59e6..060dde7 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -471,6 +471,11 @@ static struct clk exynos4_init_clocks_off[] = {
  		.enable		= exynos4_clk_ip_cam_ctrl,
  		.ctrlbit	= (1 << 5),
  	}, {
+		.name		= "jpeg",
+		.id		= 0,
+		.enable		= exynos4_clk_ip_cam_ctrl,
+		.ctrlbit	= (1 << 6),
+	}, {
  		.name		= "fimc",
  		.devname	= "exynos4-fimc.0",
  		.enable		= exynos4_clk_ip_cam_ctrl,


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
