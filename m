From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH RESEND] serial: samsung: Fix serial config dependencies
 for exynos7
Date: Wed, 19 Nov 2014 16:28:22 +0900
Message-ID: <546C4696.70101@samsung.com>
References: <1416199491-4841-1-git-send-email-a.kesavan@samsung.com> <20141117185925.GB14558@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:64500 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754665AbaKSH23 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 02:28:29 -0500
In-Reply-To: <20141117185925.GB14558@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Abhilash Kesavan <a.kesavan@samsung.com>, jslaby@suse.cz, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 11/18/14 03:59, Greg KH wrote:
> On Mon, Nov 17, 2014 at 10:14:51AM +0530, Abhilash Kesavan wrote:
>> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>>
>> Exynos7 has a similar serial controller to that present in older Samsung
>> SoCs. To re-use the existing serial driver on Exynos7 we need to have
>> SERIAL_SAMSUNG_UARTS_4 and SERIAL_SAMSUNG_UARTS selected. This is not
>> possible because these symbols are dependent on PLAT_SAMSUNG which is
>> not present for the ARMv8 based exynos7.
>>
>> Change the dependency of these symbols from PLAT_SAMSUNG to the serial
>> driver thus making it available on exynos7. As the existing platform
>> specific code making use of these symbols is related to uart driver this
>> change in dependency should not cause any issues.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
Greg, thanks for your ack on this.

Abhilash,

I can't find the original patch in my mailbox, can you please re-send to
me with adding Greg's ack?

Thanks,
Kukjin
