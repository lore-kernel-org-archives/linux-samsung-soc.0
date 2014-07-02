From: Paul Bolle <pebolle@tiscali.nl>
Subject: ASoC: samsung: MACH_SMDK6450
Date: Wed, 02 Jul 2014 09:47:18 +0200
Message-ID: <1404287238.12021.7.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews06.kpnxchange.com ([213.75.39.9]:54996 "EHLO
	cpsmtpb-ews06.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750895AbaGBHrV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 03:47:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org

Kukjin,

Your commit 0aeaa68cf509 ("ASoC: samsung: no more support for S5P6440
and S5P6450 SoCs") landed in next-20140702. It removed references to
MACH_SMDK6440 and MACH_SMDK6450 from sound/soc/samsung/.

It seems to have missed one reference to MACH_SMDK6450 in
sound/soc/samsung/Kconfig (an optional dependency of
SND_SOC_SMDK_WM8580_PCM). Is the oneliner to remove that optional
dependency queued somewhere?


Paul Bolle
