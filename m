From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Tue, 24 May 2016 17:06:43 +0200
Message-ID: <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
References: <20160521144308.GA13960@sesse.net>
	<20160523134737.GA21683@sesse.net>
	<20160523144047.GA36908@sesse.net>
	<20160523162455.GW8206@sirena.org.uk>
	<20160523170617.GA8997@sesse.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:32776 "EHLO
	mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932713AbcEXPGo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 11:06:44 -0400
Received: by mail-oi0-f68.google.com with SMTP id m198so4610386oig.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 May 2016 08:06:44 -0700 (PDT)
In-Reply-To: <20160523170617.GA8997@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Cc: Mark Brown <broonie@debian.org>, linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org

On Mon, May 23, 2016 at 7:06 PM, Steinar H. Gunderson
<sgunderson@bigfoot.com> wrote:
> On Mon, May 23, 2016 at 05:24:55PM +0100, Mark Brown wrote:
>>>> Cc-ing Mark in case he has any insights (I hope I have the right email
>>>> address).
>> But nobody who works on probe deferral or made any of the suggestions I
>> mentioned in the message you linked to, nor anyone who works on the
>> driver you've identified a bug in...  :(
>
> As for the former, I have no idea who they would be, sorry. For the latter,
> isn't linux-samsung-soc@ the right place? MAINTAINERS said it was.

I looked quickly through the thread and I am not sure what is exactly
your problem. I understood that the Exynos dwc3 driver is leaking the
PHY. That is a good catch but your patch is not sufficient. You should
clean up starting from devm_clk_get() error. Unless you are fixing
this for different kernel version.

Please send an appropriate separate patch for fixing this. Your email
did not reach people, I think. Just make a patch, test it,
scripts/checkpatch and scripts/get_maintainers. It is a fix so also a
candidate for this release cycle. if you do not plan to send a patch,
I can prepare on my own with your "Reported-by" tag but actually this
is your finding so credits (and effort) should go to you. :)

What other problems exactly do you have? Late binding of S2MPS11
regulator driver? That does not look like a problem. If it is built as
a module then it should be loaded, probably from initramfs because
these are regulators.

Best regards,
Krzysztof
