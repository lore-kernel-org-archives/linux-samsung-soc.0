From: Jaechul Lee <jcsing.lee@samsung.com>
Subject: [PATCH v2 0/3] Fix capture devices functionality on TM2
Date: Wed, 06 Sep 2017 10:04:12 +0900
Message-ID: <20170906010415.26952-1-jcsing.lee@samsung.com>
References: <CGME20170906010417epcas2p2ba8d740d4d071b6479a05b31f81c8b46@epcas2p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, galaxyra@gmail.com, Jaechul Lee <jcsing.lee@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,                                                                         
                                                                               
This patchset makes capture functionality working on TM2.                      
                                                                               
Capture devices can't be detected because I2S doesn't have appropriate dai     
name. Therefore, TM2 will select unexpected cpu dai which is named             
"i2s-samsung-sec" that doesn't have a capture functionality.                   
                                                                               
In samsung I2S driver, it tries to register two components without             
specific name. The driver finally has components having same name: dai         
name as well. As a result, dai_link doesn't have enough information to         
select cpu_dai properly.

Changes in v2:
 - defined SAMSUNG_I2S_DAI_* in i2s.h and removed duplicated code
 - modified commit message about invalid parameter that Krzystof mentioned
 - rebased code because of conflicts in i2s.c

Jaechul Lee (3):
  ASoC: samsung: i2s: Use specific name for i2s dais
  ASoC: samsung: Use 'samsung-i2s' cpu_dai for dai_links
  ASoC: samsung: Fix invalid argument when devm_gpiod_get is called

 sound/soc/samsung/i2s.c        | 4 ++++
 sound/soc/samsung/i2s.h        | 3 +++
 sound/soc/samsung/tm2_wm5110.c | 7 ++++---
 3 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.14.1
