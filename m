From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: ASoC: samsung: MACH_SMDKC100
Date: Thu, 18 Sep 2014 11:55:22 +0200
Message-ID: <1411034122.2017.18.camel@x220>
References: <1404288063.12021.13.camel@x220> <1405673749.2155.5.camel@x220>
	 <53C96F67.7010108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews06.kpnxchange.com ([213.75.39.9]:51754 "EHLO
	cpsmtpb-ews06.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756545AbaIRJzY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Sep 2014 05:55:24 -0400
In-Reply-To: <53C96F67.7010108@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jason Cooper <jason@lakedaemon.net>, Ben Dooks <ben-linux@fluff.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org

Hi Kukjin,

On Sat, 2014-07-19 at 04:03 +0900, Kukjin Kim wrote:
> On 07/18/14 17:55, Paul Bolle wrote:
> > On Wed, 2014-07-02 at 10:01 +0200, Paul Bolle wrote:
> >> Your commit 52ad6582ceb2 ("ARM: S5PC100: no more support S5PC100 SoC"
> >> landed in next-20140702. It removed the Kconfig symbol MACH_SMDKC100
> >> (and a lot of other stuff).
> >>
> >> Is the trivial patch to also remove the last two references to
> >> MACH_SMDKC100 from sound/soc/samsung/Kconfig/ queued somewhere? I don't
> >> think it was part of the series that included the above commit.
> >
> > Have you had time to look at this? Those last two references to
> > MACH_SMDKC100 can still be seen in next-20140718.
> >
> Yeah you're right. The MACH_SMDKC100 is no more required...
> 
> I submitted its fixup to Mark and I think he will take it for v3.17.

What ever happened to that fixup? There are still (pointless) references
to MACH_SMDKC100 in v3.17-rc5 and in next-20140918.


Paul Bolle
