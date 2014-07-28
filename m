From: Laura Abbott <lauraa@codeaurora.org>
Subject: Re: [RESEND][PATCHv2 0/3] Fix for buggy u-boot memory banks
Date: Mon, 28 Jul 2014 11:56:42 -0700
Message-ID: <53D69CEA.3060206@codeaurora.org>
References: <1405443816-29917-1-git-send-email-lauraa@codeaurora.org> <CAL_JsqJv2_UHxHGFF=nFKQRiEwfFtH_7PhMPS=W=APyzc-yiTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:47909 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960AbaG1S4o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 14:56:44 -0400
In-Reply-To: <CAL_JsqJv2_UHxHGFF=nFKQRiEwfFtH_7PhMPS=W=APyzc-yiTQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Tushar Behera <trblinux@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On 7/26/2014 2:20 PM, Rob Herring wrote:
> On Tue, Jul 15, 2014 at 12:03 PM, Laura Abbott <lauraa@codeaurora.org> wrote:
>> Hi,
>>
>> This is a resend of the series to fix the uboot bug exposed by the removal
>> of meminfo. I haven't gotten any acks though.
> 
> Is the bug with ATAGs that get converted to DT in the decompressor or
> u-boot puts the wrong info in DT directly?
> 

I believe it's u-boot putting the wrong info in DT directly. See
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/266782.html

Thanks,
Laura

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
