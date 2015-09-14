From: Riku Voipio <riku.voipio@linaro.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: enable usb3503
Date: Mon, 14 Sep 2015 11:35:56 +0300
Message-ID: <CAAqcGHmaWXFAVairN+2pw6adDG8AMc-MTMKp4g5aUP9Kw+8i7A@mail.gmail.com>
References: <1426254866-24772-1-git-send-email-riku.voipio@linaro.org>
	<556FF260.5060006@collabora.co.uk>
	<7hd21b2wo4.fsf@deeprootsystems.com>
	<4414616.t6CSY5FxHU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:35888 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752223AbbINIf5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Sep 2015 04:35:57 -0400
Received: by wicgb1 with SMTP id gb1so131009359wic.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2015 01:35:56 -0700 (PDT)
In-Reply-To: <4414616.t6CSY5FxHU@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Tyler Baker <tyler.baker@linaro.org>

On 5 June 2015 at 15:45, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 04 June 2015 10:47:07 Kevin Hilman wrote:
>>
>> > But I wonder why is not working, shouldn't the driver defer and
>> > be probed again once the PHY driver probe succeeds?
>>
>> Yeah, I'm not sure why that isn't working, and didn't look into it.
>>
>> FWIW, the same problem happens when both are modules.  If you modprobe
>> usb3503 first, then the phy, it doesn't work.  You have to load the phy
>> before the usb3503.

> The driver does not try to get a reference to the phy, and it does
> not return -EPROBE_DEFER in any circumstance, so I assume it just
> runs into an error condition on the first probe and does not
> try again.

> I don't really understand why the driver registers both an i2c_driver
> and a platform_driver, or if that is required, but it may also
> complicate getting deferred probing to work here.

Is someone looking into fixing it? Having to load this as module would
be an inconvenience for me, as I like to boot arndale with nfsroot.
Yet I understand that eventually I'll need to use an initrd - so not a
blocker, just grumpy work.

Riku
