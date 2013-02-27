From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH] usb: phy: samsung: let it be built as a module
Date: Wed, 27 Feb 2013 17:47:29 +0530
Message-ID: <CAFp+6iG18xWLY3Z77LUfCBrGhNMm5iHFE7xMCjo-TeJxhoT6jg@mail.gmail.com>
References: <CAFp+6iEfVSbyGVNhDFc2wW7w=ZMGwVpcc28GAGOgHffCWQRLMQ@mail.gmail.com>
	<1361962133-21296-1-git-send-email-balbi@ti.com>
	<CAFp+6iHx0-UX4g3BVwFM1V=4JuJHe0VRE=CTLmEY5qEt1YqNjg@mail.gmail.com>
	<20130227121334.GF8016@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f43.google.com ([209.85.214.43]:62445 "EHLO
	mail-bk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521Ab3B0MRa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 07:17:30 -0500
In-Reply-To: <20130227121334.GF8016@arwen.pp.htv.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, kgene@kernel.org, linux-samsung-soc@vger.kernel.org

On Wed, Feb 27, 2013 at 5:43 PM, Felipe Balbi <balbi@ti.com> wrote:
> Hi,
>
> On Wed, Feb 27, 2013 at 05:31:53PM +0530, Vivek Gautam wrote:
>> Hi Felipe,
>>
>>
>> On Wed, Feb 27, 2013 at 4:18 PM, Felipe Balbi <balbi@ti.com> wrote:
>> > There's no reason not to allow samsung PHY
>> > drivers be built as modules. This patch changes
>> > Kconfig to allow that.
>> >
>> > Signed-off-by: Felipe Balbi <balbi@ti.com>
>> > ---
>> >
>> > Hi,
>> >
>> > I will take your patches but I'm planning to add this on top
>> > as there is no reason not to allow these drivers being built
>> > as modules.
>> >
>>
>> aargh !! my bad :-(
>> actually missed exporting the symbols in drivers/usb/phy/samsung-usbphy.c
>> Getting compile errors.
>> Shall i just update the patch [PATCH v5 0/2] Adding USB 3.0 DRD-phy
>> support for exynos5250
>> or send a separate patch on top so that you can squash this change
>> along with. ;-)
>
> there's still time to update the original. I'll drop all 3 patches for
> now (both of yours and mine).
>

Alright, i shall update the original patches and resend them after
adding this change for
EXPORT_SYMBOL_GPL() and also squashing your change for "modules".


-- 
Thanks & Regards
Vivek
