From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [alsa-devel] [PATCH] Fix for possible null pointer dereference
 in dma.c
Date: Tue, 20 May 2014 21:31:57 +0200
Message-ID: <537BADAD.5070904@gmail.com>
References: <1400191076-28279-1-git-send-email-rickard_strandqvist@spectrumdigital.se> <5379E284.7030700@gmail.com> <CAFo99gZ3kVGn04we5OtRtbkceYRs6SiHXRyoX1Gb-SknJH=z=w@mail.gmail.com> <537BAA2B.9090906@gmail.com> <20140520192958.GE6639@foghorn.codeweavers.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:52546 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766AbaETTcH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 15:32:07 -0400
In-Reply-To: <20140520192958.GE6639@foghorn.codeweavers.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrew Eikum <aeikum@codeweavers.com>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org



On 20.05.2014 21:29, Andrew Eikum wrote:
> On Tue, May 20, 2014 at 09:16:59PM +0200, Tomasz Figa wrote:
>> To me having NULL as either data argument of buffer done callback or
>> private_data would be a serious driver bug and IMHO it's better to let
>> it crash with a NULL pointer dereference to let someone notice than mask
>> it by adding a condition.
>>
> 
> Please, no.  Regardless of who is at fault, crashes in library code
> are insanely frustrating to application developers.  Error codes can
> be handled nicely and expressed to the user as an error message.
> Crashes are hideous for end users and usually end up being support
> nightmares for developers.

How is the related code a library?

Best regards,
Tomasz
