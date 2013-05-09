From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Late Exynos stuff for v3.10
Date: Thu, 9 May 2013 16:47:54 -0700
Message-ID: <CAOesGMjA5_XUXMcCL3roZiLC1S=ypMoVHn2tF7bzUuKr+eLw2A@mail.gmail.com>
References: <5176B499.1000208@samsung.com>
	<51770697.7080504@samsung.com>
	<20130424000638.GA9067@quad.lixom.net>
	<51794E10.1010205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:49410 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754820Ab3EIXrz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 May 2013 19:47:55 -0400
Received: by mail-wi0-f173.google.com with SMTP id ey16so83338wid.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 May 2013 16:47:54 -0700 (PDT)
In-Reply-To: <51794E10.1010205@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Kukjin,

On Thu, Apr 25, 2013 at 8:38 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:

>> It doesn't have to be something super-elaborate, but I'd like it to be
>> sort of
>> self-documenting in a way that I don't have to look through the series of
>> patches to get an overview of what's in the branch. Of course we'll also
>> do
>> that to review the code, but having the description there makes things
>> easier
>> for us to tell if we should even be looking at it, etc.
>>
>>
> OK, I see. Let me do it more carefully.
>
> And let me send pull-request again for fix and late dt branch with separated
> branches in a couple of hours not including usb stuff...

Refresh my memory here, what was the reason for dropping the USB DTS
updates? (Yes, I am aware it might because I asked you not to send
them in but I don't remember :-).

Also, when you drop stuff, please, please don't keep it in your own
for-next branch. The end result is that we'll keep testing something
on linux-next with the anticipation that it will work when it lands in
the merge window, when that's not the truth if you're not going to
send the pull requests up.

So, if you decide to keep code like this out of the merge window (or
if we push back at it and say no to it), then remove it from your
for-next branch as well.

In particular, the usb phy node for usb2 would ber very good to get in
for 3.10, since it's a critical piece to get usb2 working on the
Chromebook.

-Olof
