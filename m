From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 10/10] spi: s3c64xx: add device tree support
Date: Thu, 10 May 2012 01:19:31 +0800
Message-ID: <CAJuYYwTdLbgbU_a_LqdwKJbhh_Nppk5s14kX5C=RExjM3eXNTQ@mail.gmail.com>
References: <1336514694-22393-1-git-send-email-thomas.abraham@linaro.org>
	<1336514694-22393-11-git-send-email-thomas.abraham@linaro.org>
	<20120509090716.GC28702@sirena.org.uk>
	<CAJuYYwQF9Hh3wJpPTfXm_5iirvHzgwDu6imuSgH-ggenj=Vc8Q@mail.gmail.com>
	<20120509143159.GU3955@opensource.wolfsonmicro.com>
	<CAJuYYwT6SJth83tFSbvENa2h7-M182kGCoBidmw8DvECK0qUzA@mail.gmail.com>
	<20120509164706.GJ3955@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:52360 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755299Ab2EIRTc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 13:19:32 -0400
Received: by vbbff1 with SMTP id ff1so510492vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 May 2012 10:19:32 -0700 (PDT)
In-Reply-To: <20120509164706.GJ3955@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 10 May 2012 00:47, Mark Brown <broonie@opensource.wolfsonmicro.com> =
wrote:
> On Thu, May 10, 2012 at 12:39:29AM +0800, Thomas Abraham wrote:
>> On 9 May 2012 22:32, Mark Brown <broonie@opensource.wolfsonmicro.com=
> wrote:
>
>> > Yeah, I know. =A0I'm saying we should try to come up with a bindin=
g for
>> > this that can be used by new SPI contollers going forward so thing=
s are
>> > consistent.
>
>> Ok. For this patch series, I will continue with the samsung specific
>> binding for the nCS line.
>
> How about just renaming your binding to a generic one and documenting=
 it
> separately? =A0It looks like a sensible binding which other people sh=
ould
> be able to use so may as well have something there already.

Ok. I will replace the samsung specific binding with a generic binding
in the next version of this patch series.

Thanks,
Thomas.
