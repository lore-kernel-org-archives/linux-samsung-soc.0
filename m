From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [RESEND][PATCHv2 0/3] Fix for buggy u-boot memory banks
Date: Tue, 29 Jul 2014 21:24:38 -0600
Message-ID: <20140730032438.948EAC408F6@trevor.secretlab.ca>
References: <1405443816-29917-1-git-send-email-lauraa@codeaurora.org>
	<CAL_JsqJv2_UHxHGFF=nFKQRiEwfFtH_7PhMPS=W=APyzc-yiTQ@mail.gmail.com>
	<53D69CEA.3060206@codeaurora.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:56787 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753918AbaG3DYl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 23:24:41 -0400
Received: by mail-pa0-f44.google.com with SMTP id eu11so726637pac.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jul 2014 20:24:41 -0700 (PDT)
In-Reply-To: <53D69CEA.3060206@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laura Abbott <lauraa@codeaurora.org>, Rob Herring <robherring2@gmail.com>
Cc: Tushar Behera <trblinux@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Andreas =?iso-8859-1?q?F=E4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Mon, 28 Jul 2014 11:56:42 -0700, Laura Abbott <lauraa@codeaurora.org> wrote:
> On 7/26/2014 2:20 PM, Rob Herring wrote:
> > On Tue, Jul 15, 2014 at 12:03 PM, Laura Abbott <lauraa@codeaurora.org> wrote:
> >> Hi,
> >>
> >> This is a resend of the series to fix the uboot bug exposed by the removal
> >> of meminfo. I haven't gotten any acks though.
> > 
> > Is the bug with ATAGs that get converted to DT in the decompressor or
> > u-boot puts the wrong info in DT directly?
> > 
> 
> I believe it's u-boot putting the wrong info in DT directly. See
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/266782.html

I've picked up this series with some very minor changes. I'll ask Linus
to pull it into v3.16 as a last minute fix.

g.
