From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RESEND][PATCHv2 0/3] Fix for buggy u-boot memory banks
Date: Sat, 26 Jul 2014 16:20:03 -0500
Message-ID: <CAL_JsqJv2_UHxHGFF=nFKQRiEwfFtH_7PhMPS=W=APyzc-yiTQ@mail.gmail.com>
References: <1405443816-29917-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:38760 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752247AbaGZVUX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Jul 2014 17:20:23 -0400
In-Reply-To: <1405443816-29917-1-git-send-email-lauraa@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laura Abbott <lauraa@codeaurora.org>
Cc: Tushar Behera <trblinux@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Tue, Jul 15, 2014 at 12:03 PM, Laura Abbott <lauraa@codeaurora.org> wrote:
> Hi,
>
> This is a resend of the series to fix the uboot bug exposed by the removal
> of meminfo. I haven't gotten any acks though.

Is the bug with ATAGs that get converted to DT in the decompressor or
u-boot puts the wrong info in DT directly?

Rob

>
> Please help with review/acks. Grant/Rob, I'd still like this to go through
> the devicetree tree if possible.
>
> Thanks,
> Laura
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
>
