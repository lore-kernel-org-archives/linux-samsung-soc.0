From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 0/2] These two patches to s3c_pm_arch_prepare_irqs() were
 part of the work
Date: Wed, 3 Apr 2013 10:20:56 -0700
Message-ID: <CAD=FV=XTMbs9q5FvsFUTmCDrFu7q-ngnS3F94cHNnCRmN3UNLg@mail.gmail.com>
References: <1363711900-25560-1-git-send-email-dianders@chromium.org>
	<24b401ce300f$5a767b40$0f6371c0$%kim@samsung.com>
	<24b501ce3011$454d3c70$cfe7b550$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:33010 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762765Ab3DCRU5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Apr 2013 13:20:57 -0400
Received: by mail-la0-f46.google.com with SMTP id fq12so1676701lab.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Apr 2013 10:20:56 -0700 (PDT)
In-Reply-To: <24b501ce3011$454d3c70$cfe7b550$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Jongpill Lee <boyko.lee@samsung.com>, Jaecheol Lee <jc.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Olof Johansson <olof@lixom.net>, Jonathan Kliegman <kliegs@chromium.org>, Michael Spang <spang@chromium.org>, linux-samsung-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Kukjin,

On Tue, Apr 2, 2013 at 7:16 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> Applied with 1st one, BTW, do you want to send this for stable tree?

I don't have any need for it to be in stable tree.  The ARM Chromebook
hasn't reached critical functionality on any released/upstram Linux
versions so it doesn't make much sense to backport fixes.  If someone
else wants it in stable (and can confirm that it helps them) then I
certainly wouldn't object!


> One more note, just now I discussed Jaecheol Lee about the bit,
> ENABLE_WAKEUP_SW, as the patch fixed, it should be cleared but used to be
> set s3c_irqwake_intmask. Let me check again, then if any updates I'll let
> you know.

OK, thanks.  If there is a reason that ENABLE_WAKEUP_SW needs to be
set then it would be good to understand that case.  :)

-Doug
