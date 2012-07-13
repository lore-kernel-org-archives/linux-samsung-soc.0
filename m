From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: Convert S3C24XX I2S driver to gpiolib API
Date: Fri, 13 Jul 2012 17:11:32 +0200
Message-ID: <50003AA4.7070900@gmail.com>
References: <1341059876-29460-1-git-send-email-sylvester.nawrocki@gmail.com> <4FFED794.9050800@gmail.com> <20120712161933.GD7256@opensource.wolfsonmicro.com> <4FFF12C5.6030403@gmail.com> <20120713142853.GN4215@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:35353 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754473Ab2GMPLg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 11:11:36 -0400
Received: by eaak11 with SMTP id k11so1110893eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jul 2012 08:11:34 -0700 (PDT)
In-Reply-To: <20120713142853.GN4215@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, sbkim73@samsung.com, lrg@ti.com, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On 07/13/2012 04:28 PM, Mark Brown wrote:
> On Thu, Jul 12, 2012 at 08:09:09PM +0200, Sylwester Nawrocki wrote:
> 
>> Thanks, would that be Takashi Iwai and Jaroslav Kysela then ? I just
>> want to get it right this time...
>> Or perhaps could you take care of them ?
> 
> As with everything else look in MAINTAINERS, so me for ASoC.

Gah, how could I miss that.. especially having gone through the
WolfsonMicro ASoC website before. scripts/get_maintainer.pl must have
led me astray:

$ scripts/get_maintainer.pl -f sound/soc/samsung
Ben Dooks <ben-linux@fluff.org> (maintainer:ARM/SAMSUNG ARM A...)
Kukjin Kim <kgene.kim@samsung.com> (maintainer:ARM/SAMSUNG ARM A...)
Sangbeom Kim <sbkim73@samsung.com> (supporter:SAMSUNG AUDIO (AS...)
Liam Girdwood <lrg@ti.com> (supporter:SOUND - SOC LAYER...)
Mark Brown <broonie@opensource.wolfsonmicro.com> (supporter:SOUND - SOC LAYER...)
Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
Takashi Iwai <tiwai@suse.de> (maintainer:SOUND)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG ARM A...)
linux-samsung-soc@vger.kernel.org (moderated list:ARM/SAMSUNG ARM A...)
alsa-devel@alsa-project.org (moderated list:SAMSUNG AUDIO (AS...)
linux-kernel@vger.kernel.org (open list)

Looks like there is something that could be improved in the MAINTAINERS
file.
