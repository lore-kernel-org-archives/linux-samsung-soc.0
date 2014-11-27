From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v6 1/2] i2c: s3c2410: add Sysreg phandle to i2c device nodes
Date: Thu, 27 Nov 2014 08:19:11 +0530
Message-ID: <54769127.3020102@samsung.com>
References: <1416818867-29156-1-git-send-email-pankaj.dubey@samsung.com>
 <1416818867-29156-2-git-send-email-pankaj.dubey@samsung.com>
 <54761F38.4030102@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24738 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753072AbaK0CtT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 21:49:19 -0500
In-reply-to: <54761F38.4030102@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, thomas.ab@samsung.com, Rob Herring <robh+dt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org

On Thursday 27 November 2014 12:13 AM, Kukjin Kim wrote:
> On 11/24/14 17:47, Pankaj Dubey wrote:
>> This patch adds syscon based phandle to i2c device nodes of exynos5250
>> and exynos5420. These phandles will be used to save restore i2c sysreg
>> configuration register during s2r from i2c driver.
>>
>> CC: Rob Herring <robh+dt@kernel.org>
>> CC: Randy Dunlap <rdunlap@infradead.org>
>> CC: Russell King <linux@arm.linux.org.uk>
>> CC: devicetree@vger.kernel.org
>> CC: linux-doc@vger.kernel.org
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>
> Applied with change the subject 'ARM: dts: add sysreg phandle to...'
>

Thanks for correcting subject message.

> BTW I'm holding on 2nd because conflicts between pm update and cleanup
> branches in my tree...

Please let me know if anything to be done from my end.

Thanks,
Pankaj Dubey
>
> - Kukjin
