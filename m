From: "Suzuki K. Poulose" <Suzuki.Poulose@arm.com>
Subject: Re: Renaming ARM_CCI
Date: Mon, 23 Mar 2015 16:04:00 +0000
Message-ID: <55103970.2060907@arm.com>
References: <CAD3Xx4+ECHuri6nT7=gpM5EnAqZM2zW8TK4T0yjW+aMMz=pwdA@mail.gmail.com> <55102E82.1080404@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:41471 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752522AbbCWQEF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Mar 2015 12:04:05 -0400
In-Reply-To: <55102E82.1080404@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Valentin Rothberg <valentinrothberg@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>
Cc: Sudeep Holla <Sudeep.Holla@arm.com>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>, Punit Agrawal <Punit.Agrawal@arm.com>, Will Deacon <Will.Deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, Andreas Ruprecht <rupran@einserver.de>, hengelein Stefan <stefan.hengelein@fau.de>

On 23/03/15 15:17, Suzuki K. Poulose wrote:
> On 23/03/15 15:10, Valentin Rothberg wrote:
>> Hi Suzuki,
>>
>> your commit c9966c98697a ("arm-cci: Split the code for PMU vs driver
>> support") renames the Kconfig option ARM_CCI to ARM_CCI400_PORT_CTRL.
>> However, the commit does not rename all references on ARM_CCI:
>>
> It renames, but still, leaves the ARM_CCI to build the arm-cci.o, which
> is in the original commit.
>
>> drivers/bus/Kconfig:29: select ARM_CCI
>> drivers/bus/Makefile:6:obj-$(CONFIG_ARM_CCI)            += arm-cci.o
>> include/linux/arm-cci.h:31:#ifdef CONFIG_ARM_CCI
>>
>> Is this intentional or is there a patch scheduled somewhere to fix this issue?
> Yes, it is. This problem was introduced due to a conflict in the linux-next.
>
> See :
>    https://lkml.org/lkml/2015/3/22/240
Somehow, the link above doesn't link my response to the thread.
Please find it below.

	https://lkml.org/lkml/2015/3/23/484

Suzuki
