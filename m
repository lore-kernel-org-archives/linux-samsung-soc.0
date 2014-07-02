From: Paul Bolle <pebolle@tiscali.nl>
Subject: ASoC: samsung: MACH_SMDKC100
Date: Wed, 02 Jul 2014 10:01:03 +0200
Message-ID: <1404288063.12021.13.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews02.kpnxchange.com ([213.75.39.5]:55779 "EHLO
	cpsmtpb-ews02.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750895AbaGBIBG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 04:01:06 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Ben Dooks <ben-linux@fluff.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org

Kukjin,

Your commit 52ad6582ceb2 ("ARM: S5PC100: no more support S5PC100 SoC"
landed in next-20140702. It removed the Kconfig symbol MACH_SMDKC100
(and a lot of other stuff).

Is the trivial patch to also remove the last two references to
MACH_SMDKC100 from sound/soc/samsung/Kconfig/ queued somewhere? I don't
think it was part of the series that included the above commit.


Paul Bolle
