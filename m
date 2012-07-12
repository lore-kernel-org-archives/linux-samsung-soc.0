From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: Convert S3C24XX I2S driver to gpiolib API
Date: Thu, 12 Jul 2012 20:09:09 +0200
Message-ID: <4FFF12C5.6030403@gmail.com>
References: <1341059876-29460-1-git-send-email-sylvester.nawrocki@gmail.com> <4FFED794.9050800@gmail.com> <20120712161933.GD7256@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:35261 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755233Ab2GLSJO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 14:09:14 -0400
Received: by bkwj10 with SMTP id j10so2466521bkw.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jul 2012 11:09:13 -0700 (PDT)
In-Reply-To: <20120712161933.GD7256@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, alsa-devel@alsa-project.org, sbkim73@samsung.com, lrg@ti.com, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On 07/12/2012 06:19 PM, Mark Brown wrote:
> On Thu, Jul 12, 2012 at 03:56:36PM +0200, Sylwester Nawrocki wrote:
>
>> These are the only two patches (out of 15) that are now needed to remove
>> some obsolete s3c2410_gpio_* API. 1/2 was tested on Micro2440 board
>> and 2/2 is an identical change which wasn't tested on a real H/W since
>> I don't have any s3c2412 based board. I'm a bit lost through which tree
>> should these be merged. Could someone please pick these patches up ?
>
> If you send them to the relevant maintainers that'd probably help...

Thanks, would that be Takashi Iwai and Jaroslav Kysela then ? I just
want to get it right this time...
Or perhaps could you take care of them ?
