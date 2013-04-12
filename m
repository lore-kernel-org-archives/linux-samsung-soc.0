From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [alsa-devel] [PATCH 18/30] ASoC: samsung: move plat/ headers
 to local directory
Date: Fri, 12 Apr 2013 13:04:22 +0200
Message-ID: <5167EA36.5080505@metafoo.de>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de> <1365638712-1028578-19-git-send-email-arnd@arndb.de> <20130411164751.GK9243@opensource.wolfsonmicro.com> <201304111908.42532.arnd@arndb.de> <20130411171938.GS9243@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130411171938.GS9243@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/11/2013 07:19 PM, Mark Brown wrote:
> On Thu, Apr 11, 2013 at 07:08:42PM +0200, Arnd Bergmann wrote:
>> On Thursday 11 April 2013, Mark Brown wrote:
> 
>>> This doesn't apply to my topic/samsung branch, can you please regenerate
>>> it against that or let me know what to apply it against?
> 
>> This one should work. Unfortunately I now found during testing that the
>> s3c24xx sound support has a few build errors at the moment, but this
>> patch should not add any new ones:
> 
> Applied (after hand editing the commit message), thanks.
> 
>> make[5]: *** [sound/soc/samsung/i2s.o] Error 1
>> /git/arm-soc/sound/soc/samsung/neo1973_wm8753.c:25:24: fatal error: mach/gta02.h: No such file or directory
>>  #include <mach/gta02.h>
> 
> Hrm, someone killed GTA02 support?  That's sad...  if that's really the
> case we could kill the machine driver but not tonight as I'm running
> late...

I think the file was moved, we should pull over the audio relevant GPIO
definitions into the ASoC board driver.

- Lars
