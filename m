From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V5 2/2] ASoC: SAMSUNG: Add DT support for i2s
Date: Wed, 26 Dec 2012 16:21:58 +0530
Message-ID: <CAAgF-BdNwk=aB9PdOieb=t-WBmCvB5CWEYic44fc6WwhJUHGmw@mail.gmail.com>
References: <1355395373-22058-1-git-send-email-padma.v@samsung.com>
	<1355395373-22058-3-git-send-email-padma.v@samsung.com>
	<20121219132414.2CF653E0AD7@localhost>
	<20121219170937.GV4985@opensource.wolfsonmicro.com>
	<CAAgF-Bc3zSyhaMwSOy977PJ-PdtMfDXjFrTvpzETeHJAAQU3vQ@mail.gmail.com>
	<008401cddfad$ae2d19e0$0a874da0$@samsung.com>
	<CAAgF-BckOnct3gGgrxiG2W-D74sFmD=7HfBOqkj9HTc66ZPoiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:54169 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754026Ab2LZKwA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 05:52:00 -0500
Received: by mail-la0-f53.google.com with SMTP id w12so10374253lag.40
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Dec 2012 02:51:59 -0800 (PST)
In-Reply-To: <CAAgF-BckOnct3gGgrxiG2W-D74sFmD=7HfBOqkj9HTc66ZPoiQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, sbkim73@samsung.com, tiwai@suse.de, ben-linux@fluff.org, lrg@ti.com

Hi,

On Mon, Dec 24, 2012 at 9:33 AM, Padma Venkat <padma.kvr@gmail.com> wrote:
> Hi,
>
> On Sat, Dec 22, 2012 at 12:32 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> Padma Venkat wrote:
>>>
>>> Hi,
>>>
>>> On Wed, Dec 19, 2012 at 10:39 PM, Mark Brown
>>> <broonie@opensource.wolfsonmicro.com> wrote:
>>> > On Wed, Dec 19, 2012 at 01:24:14PM +0000, Grant Likely wrote:
>>> >> On Thu, 13 Dec 2012 16:12:53 +0530, Padmavathi Venna
>>> <padma.v@samsung.com> wrote:
>>> >
>>> >> > +- compatible : "samsung,samsung-i2s"
>>> >
>>> >> Isn't that kind of redundant?  :-)
>>> >
>>> >> The format of the compatible strings should be "<vendor>,<part-
>>> number>-i2s".
>>> >> Please be specific about the part number that you're doing the binding
>>> >> for. For example; use "samsung,exynos4210-i2s" instead of
>>> "samsung,exynos-i2s".
>>> >
>>> > There are actually versioned IPs here (where the versions are used
>>> > publically in a few places) but it's not clearly documented which is
>>> > which.  It would be reasonable to use the IP versions here I think.
>>>
>>> Samsung has three i2s drivers one for s3c24xx, one for s3c2412 and one
>>> for rest of the platforms. The above mentioned other platforms has
>>> Version 3/4/5 of i2s controllers. This dt binding is for for the i2s
>>
>> Where is the version defined such as 3, 4, 5? So, what is the
>> "sound/soc/Samsung/s3c-i2s-v2.[ch]"?
>
> Versions 3, 4, 5 are defined in dev-audio.c file of corresponding platforms.
> s3c-i2s-v2 is used in s3c2412 platform.
>
>>
>>> driver that has support for Version 3/4/5 of i2s controller. So
>>> "samsung,i2s-v5" is okay as compatible name? Please suggest me.
>>>
>> I agree with using version here but we need some consensus about that.

Any suggestions on i2s compatible name or "samsung,i2s-v5" is okay?

>>
>> - Kukjin
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> Thanks
> Padma

Thanks
Padma
