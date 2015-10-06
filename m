From: Alexey Klimov <klimov.linux@gmail.com>
Subject: Re: [PATCH 0/2] ARM: EXYNOS: Allow to use architected timer
Date: Tue, 6 Oct 2015 11:51:50 +0300
Message-ID: <CALW4P+LfwHY=+0b8jZ4RH03D5cthW-sy-+-xFGPPY-dMCJWvDQ@mail.gmail.com>
References: <cover.1444119342.git.p.fedin@samsung.com>
	<6613638.q5qyQZxXy7@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:33011 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340AbbJFIvw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 04:51:52 -0400
Received: by wiclk2 with SMTP id lk2so156264326wic.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Oct 2015 01:51:50 -0700 (PDT)
In-Reply-To: <6613638.q5qyQZxXy7@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

(add linux-samsung-soc mail list to cc)

On Tue, Oct 6, 2015 at 11:37 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 06 October 2015 11:23:58 Pavel Fedin wrote:
>> Exynos platform officially uses "multi-core timer" AKA MCT. However, it
>> also has a possibility to access the same timer using CP15 (AKA
>> architected timer) registers.
>>
>> In order to be able to use KVM, we need CP15 timer support. In its turn,
>> MCT needs to be turned on before any accesses will work. This patchset
>> allows to specify "CP15 compatibility mode" for the MCT by inserting
>> armv7-timer node as a child for MCT device. In this case MCT driver will
>> only enable the timer, leaving the rest for architected timer driver.
>
> IIRC the use of the CP15 timer is not reliable on this platform.
> I don't have a link ready, but this has come up a few times.
>
> Kukjin Kim probably knows the details.

Please take a look: http://www.gossamer-threads.com/lists/linux/kernel/2225900
for some details. I don't know if it's related to 5410.

Best regards,
Alexey Klimov
