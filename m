From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: ASoC: samsung: MACH_SMDK6450
Date: Thu, 03 Jul 2014 07:37:07 +0900
Message-ID: <53B48993.5020809@samsung.com>
References: <1404287238.12021.7.camel@x220> <20140702092347.GB410@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:39665 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751535AbaGBWha (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 18:37:30 -0400
Received: by mail-pa0-f48.google.com with SMTP id et14so13252431pad.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jul 2014 15:37:30 -0700 (PDT)
In-Reply-To: <20140702092347.GB410@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Paul Bolle <pebolle@tiscali.nl>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org

On 07/02/14 18:23, Mark Brown wrote:
> On Wed, Jul 02, 2014 at 09:47:18AM +0200, Paul Bolle wrote:
>
>> Your commit 0aeaa68cf509 ("ASoC: samsung: no more support for S5P6440
>> and S5P6450 SoCs") landed in next-20140702. It removed references to
>> MACH_SMDK6440 and MACH_SMDK6450 from sound/soc/samsung/.
>
Yeah, I missed the removing when I created the patch. Paul, thanks for 
your pointing out and I'm resending the updated patch.

> This also wasn't sent to me for review, please always send patches to
> maintainers.

Mark, I always send patches to regarding maintainers and in this case 
the patch missed the change. I'm resending new patch and if any 
problems, please let me know. Just note, I just wanted to check whether 
there is no problem with other maintainers' tree early in -next tree.

Thanks,
Kukjin
