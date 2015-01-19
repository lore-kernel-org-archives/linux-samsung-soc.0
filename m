From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH 0/4] ASoC: samsung: clean up references to outdated Kconfig
 symbols
Date: Mon, 19 Jan 2015 11:41:07 +0100
Message-ID: <1421664067.9655.51.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews03.kpnxchange.com ([213.75.39.6]:61496 "EHLO
	cpsmtpb-ews03.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751772AbbASKlK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 05:41:10 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

A few series of ARM cleanups regarding S5PC100 and S5PV210 were included
in v3.17. These series removed these five Kconfig symbols:
    MACH_AQUILA
    MACH_GONI
    MACH_SMDKC100
    MACH_SMDKC110
    MACH_SMDKV210

This series, done on top of next-20150119, removes the remaining
references to those five symbols. (The first two patches are actually
resends.)

Paul Bolle (4):
  ASoC: samsung: Remove goni or aquila with the WM8994
  ASoC: samsung: Remove PCM support for WM8580 on SMDK
  ASoC: samsung: MACH_SMDKC100 isn't supported anymore
  ASoC: samsung: remove outdated Kconfig references

 sound/soc/samsung/Kconfig          |  24 +--
 sound/soc/samsung/Makefile         |   4 -
 sound/soc/samsung/goni_wm8994.c    | 289 -------------------------------------
 sound/soc/samsung/smdk_wm8580pcm.c | 176 ----------------------
 4 files changed, 2 insertions(+), 491 deletions(-)
 delete mode 100644 sound/soc/samsung/goni_wm8994.c
 delete mode 100644 sound/soc/samsung/smdk_wm8580pcm.c

-- 
1.9.3
