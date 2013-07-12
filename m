From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ASoC: Samsung: Set RFS and BFS in slave mode
Date: Fri, 12 Jul 2013 10:12:12 +0530
Message-ID: <CAAgF-BedX9G80Pjp5+oOZRCekzDzORUJj2Wvr_Lqpz=O3qg4tA@mail.gmail.com>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
	<1373526505-27115-2-git-send-email-padma.v@samsung.com>
	<20130711111144.GL24508@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:64329 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856Ab3GLEmM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jul 2013 00:42:12 -0400
Received: by mail-oa0-f51.google.com with SMTP id i4so12098482oah.38
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2013 21:42:12 -0700 (PDT)
In-Reply-To: <20130711111144.GL24508@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org

Hi,

On Thu, Jul 11, 2013 at 4:41 PM, Mark Brown <broonie@kernel.org> wrote:
> On Thu, Jul 11, 2013 at 12:38:25PM +0530, Padmavathi Venna wrote:
>> As per the User Manual, the RFS and BFS should be set in slave mode
>> for correct operation.
>
> Applied, thanks.  Since this is a fix it should have been the first
> patch in the series - this allows fixes to be sent to
>
>> Reviewed-on: https://gerrit-int.chromium.org/37841
>
> Including things like this isn't terribly helpful - this is the Chromium
> internal system and nobody in the community can view the review.  A link
> to a public system might be useful but a private one should be omitted.

I thought it was link to the public gerrit review system. Will remove next time.

Thanks
Padma
