From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V6 07/10] ASoC: SMDK: WM8994: Add device tree support for
 machine file
Date: Tue, 29 Jan 2013 15:09:06 +0530
Message-ID: <CAAgF-Be_E8Hxmo08OH-zzGrqP_4BmX2dAYMnh2zxvXSMTM2jEg@mail.gmail.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
	<1358509629-20471-8-git-send-email-padma.v@samsung.com>
	<20130129071231.GG6878@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:35229 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751210Ab3A2JjH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 04:39:07 -0500
Received: by mail-ie0-f176.google.com with SMTP id 13so142166iea.35
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 01:39:06 -0800 (PST)
In-Reply-To: <20130129071231.GG6878@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, tiwai@suse.de, ben-linux@fluff.org

On Tue, Jan 29, 2013 at 12:42 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Jan 18, 2013 at 05:17:06PM +0530, Padmavathi Venna wrote:
>
>> +Samsung SMDK audio complex
>
> This is just for SMDKs with WM8994.  I'll apply but please send a
> followup patch to clarify this - it'll be a different binding for others
> like the older boards using WM8580 and WM9713.

OK. I will send.

>
>> +             samsung,i2s-controller = <&i2s0>;
>> +             samsung,audio-codec = <&wm8994>;
>
> I was thinking this should really point at the DAI but since it's
> specific to the SMDKs I don't think it particularly matters - they all
> use AIF1 anyway.

Thanks
Padma
