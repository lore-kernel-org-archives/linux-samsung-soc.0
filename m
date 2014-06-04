From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH v2 2/2] s5p-mfc: Adding MFC v7 and v8 firmwares
Date: Wed, 4 Jun 2014 11:01:51 +0530
Message-ID: <CALt3h7-D1VA5WfyaZDpuOe0L6V2ZhiOsb-wDFx48Nk3-mxBAPA@mail.gmail.com>
References: <1400676064-17819-1-git-send-email-arun.kk@samsung.com>
	<1400676064-17819-2-git-send-email-arun.kk@samsung.com>
	<1401824047.2412.7.camel@deadeye.wl.decadent.org.uk>
	<1401837995.2412.45.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:54808 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751937AbaFDFbw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jun 2014 01:31:52 -0400
Received: by mail-ve0-f169.google.com with SMTP id jx11so8292114veb.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Jun 2014 22:31:51 -0700 (PDT)
In-Reply-To: <1401837995.2412.45.camel@deadeye.wl.decadent.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-firmware@kernel.org

Hi Ben,

On Wed, Jun 4, 2014 at 4:56 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Tue, 2014-06-03 at 20:34 +0100, Ben Hutchings wrote:
>> On Wed, 2014-05-21 at 18:11 +0530, Arun Kumar K wrote:
>> > Adding the following firmware files for MFC
>> > s5p-mfc-v7.fw: Used in exynos 5420
>> > s5p-mfc-v8.fw: Used in exynos 5800
>> >
>> > Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> > ---
>> > Changes from v1
>> > - None
>> > ---
>> >  WHENCE                |    2 ++
>> >  s5p-mfc/s5p-mfc-v7.fw |  Bin 0 -> 382724 bytes
>> >  s5p-mfc/s5p-mfc-v8.fw |  Bin 0 -> 360576 bytes
>> >  3 files changed, 2 insertions(+)
>> >  create mode 100644 s5p-mfc/s5p-mfc-v7.fw
>> >  create mode 100644 s5p-mfc/s5p-mfc-v8.fw
>> [...]
>>
>> Applied, thanks.
>
> Just noticed a problem with all the s5p-mfc firmware: you are putting it
> in the s5p-mfc subdirectory, so distribution packages will install them
> in /lib/firmware/s5p-mfc.  However, unless I'm mistaken your driver
> requests it with a bare filename (e.g. "s5p-mfc-v7.fw") so it won't be
> found.
>

Yes this issue is there.
Kamil, are you ok with changing the fw load path to s5p-mfc/s5p-mfc*.fw
in the driver?

Regards
Arun

> Ben.
>
> --
> Ben Hutchings
> Experience is what causes a person to make new mistakes instead of old ones.
