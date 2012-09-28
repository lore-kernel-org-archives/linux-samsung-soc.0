From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V2] ASoC: SAMSUNG: Add DT support for i2s
Date: Fri, 28 Sep 2012 14:17:58 +0530
Message-ID: <CAAgF-Bem9BxyreQzFk=hTZNQGC-Py-RH_adqdo2v2h7QyhCK9w@mail.gmail.com>
References: <1348741532-29412-1-git-send-email-padma.v@samsung.com>
	<000d01cd9d42$9fbd7b50$df3871f0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:52840 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753727Ab2I1IsA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Sep 2012 04:48:00 -0400
Received: by lagh6 with SMTP id h6so919435lag.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Sep 2012 01:47:58 -0700 (PDT)
In-Reply-To: <000d01cd9d42$9fbd7b50$df3871f0$@com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sangsu4u.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hi,

On Fri, Sep 28, 2012 at 11:59 AM, Sangbeom Kim <sbkim73@samsung.com> wrote:
> Hi!
> On Thu, Sep 27, 2012 at 07:26 PM, Padmavathi Venna wrote:
>
>> Subject: [PATCH V2] ASoC: SAMSUNG: Add DT support for i2s
>>
>> Add support for device based discovery.
>>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>
> Please describe the difference between v1 and v2.
There are no major comments in V1.
I just addressed some of the comments given by kukjin kim(regarding
clocks) ,Sachin(regarding I2S base addresses).
As I deleted the variable which holds the names of the RCLK src clocks
in the driver in the first patch set, this breaks the older platforms.
 So I reworked on older platforms and added I2S clkdev support and
tested on s3c64xx series and deleted that variable from samsung-i2s
structure.
Added NULL in place of cdclk of sclk_audio0 src list because adding
rate of that clk is a question to me because this is machine dependent
and I am also not using this as parent clk.

In my next version of patchset I will mention the difference clearly.
>
> Thanks,
> Sangbeom.
Thanks
Padma
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
