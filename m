From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v4 15/19] ARM: samsung: remove unused tick.h
Date: Thu, 03 Jan 2013 16:19:26 -0600
Message-ID: <50E603EE.9030504@gmail.com>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com> <1357235668-9450-16-git-send-email-robherring2@gmail.com> <201301032151.32337.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f170.google.com ([209.85.161.170]:46690 "EHLO
	mail-gg0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754275Ab3ACWTa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jan 2013 17:19:30 -0500
Received: by mail-gg0-f170.google.com with SMTP id l1so2463575ggn.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Jan 2013 14:19:30 -0800 (PST)
In-Reply-To: <201301032151.32337.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, thomas.petazzoni@free-electrons.com, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On 01/03/2013 03:51 PM, Arnd Bergmann wrote:
> On Thursday 03 January 2013, Rob Herring wrote:
>> From: Rob Herring <rob.herring@calxeda.com>
>>
>> Remove tick.h on s5p64x0 and s5pv210 as they are unused.
>>
>> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
>> Cc: Ben Dooks <ben-linux@fluff.org>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Cc: linux-samsung-soc@vger.kernel.org
>> ---
>>  arch/arm/mach-s5pv210/include/mach/tick.h |   26 --------------------------
>>  arch/arm/plat-samsung/s5p-irq-eint.c      |    1 +
>>  2 files changed, 1 insertion(+), 26 deletions(-)
>>  delete mode 100644 arch/arm/mach-s5pv210/include/mach/tick.h
> 
> The second half of the patch does not relate to the description,
> and the first half looks correct but out of place here.

The first half is relevant in that it eliminates an occurrence of VIC
defines, but could be applied separately. I'm not sure what happened
with mach-s5p64x0/include/mach/tick.h as that should be removed too.

The second half should be in patch 19.

Rob

> Did you accidentally fold another patch into the one you wanted,
> or am I just misreading the intention of the patch?
> 
> 	Arnd
> 
