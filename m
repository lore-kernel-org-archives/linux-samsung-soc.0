From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH CRITICAL] ARM: s3c64xx: dt: Fix boot failure due to double
 clock initialization
Date: Tue, 17 Dec 2013 11:12:21 -0800
Message-ID: <CAOesGMiUyOTLMi56cMN9V8Ft0w2X_g0_HzA+cfuYnZyf2=iiMA@mail.gmail.com>
References: <1386964779-29457-1-git-send-email-tomasz.figa@gmail.com>
	<CAOesGMifjnTDUcsweOwsw9fFgsE7b4q3wsASfP8YL-uMH5KiPA@mail.gmail.com>
	<CAPTRvHn7yTt6mC1fjEn5Ra9yx=GZ1DyNQtGWvHsDd_LkuiM_wA@mail.gmail.com>
	<1500417.9RFCmzklxv@flatron>
	<20131216210915.GD3185@sirena.org.uk>
	<20131217151424.GB11138@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:57232 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751016Ab3LQTMX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Dec 2013 14:12:23 -0500
Received: by mail-qc0-f169.google.com with SMTP id r5so5425134qcx.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2013 11:12:23 -0800 (PST)
In-Reply-To: <20131217151424.GB11138@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, hua dillon <dillonhua@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben.dooks@codethink.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

On Tue, Dec 17, 2013 at 7:14 AM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:
> On Mon, Dec 16, 2013 at 09:09:15PM +0000, Mark Brown wrote:
>> On Sat, Dec 14, 2013 at 04:41:06AM -0800, Tomasz Figa wrote:
>>
>> >  - Wolfson Cragganmore 6410 - Mark Brown (copied) is using it for some
>> >    testing of audio codec AFAIK, but I'm not sure if you can get that
>> >    anywhere.
>>
>> Essentially no, though you could try asking nicely.  It's not suitable
>> for a test farm anyway without a SD mux as the only bootloader supported
>> is Qi which only boots from flash.
>
> Yeah, we don't have that many spare at the moment and whilst we
> do use them fairly regularly we are not produce new boards
> anymore.

Yeah, sounds unlikely to be a good fit.

Something like the tiny6410's would be useful. They seem to mostly be
available with LCD panels though, which ups the price a bit. I'll keep
an eye out for one.


-Olof
