From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 0/3] mfd: ChromeOS EC Kconfig dependency cleanup
Date: Mon, 10 Aug 2015 18:45:22 +0200
Message-ID: <CABxcv==HJSYLRF3Si+HmXXiNtxW3B97ZbEHQ4-NsyLSpJLGCBA@mail.gmail.com>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
	<CABxcv=kG=pSprUdoscAFgCF=S5CccvHO0mP+tjnumNeEjsVckg@mail.gmail.com>
	<20150810161009.GG12631@x1>
	<20150810161301.GA13253@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:33651 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753826AbbHJQpX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Aug 2015 12:45:23 -0400
Received: by ykaz130 with SMTP id z130so36885055yka.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Aug 2015 09:45:23 -0700 (PDT)
In-Reply-To: <20150810161301.GA13253@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>

Hello Lee,

On Mon, Aug 10, 2015 at 6:13 PM, Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 10 Aug 2015, Lee Jones wrote:
>> On Fri, 07 Aug 2015, Javier Martinez Canillas wrote:

[snip]

>> >
>> > Do you know what happened with this patches? I see 3/3 in linux-next
>> > but no 1/3 and 2/3.
>>
>> No idea why you're not seeing them.  They are in my -fixes branch,
>> which is pulled into -next.  I have _just_ sent them to Linus for
>> inclusion into v4.2.
>
> Okay, scrap that.  It likes like MFD -fixes isn't pulled into -next.
> I'll see what I can do about that.
>

Ok, that explains it. Thanks a lot for the heads up.

Best regards,
Javier
