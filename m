From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [BISECT] No audio after "ASoC: core: use component driver name as
 component name"
Date: Fri, 31 May 2019 11:27:42 +0200
Message-ID: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Bisect points to commit b19671d6caf1ac393681864d5d85dda9fa99a448
Author: Tzung-Bi Shih <tzungbi@google.com>
Date:   Wed May 29 14:22:14 2019 +0800
    ASoC: core: use component driver name as component name

as a reason of failure of missing Audio card on Odroid XU3 board
(ARMv7, Exynos5422,
max98090 codec). Full kernel log:
https://krzk.eu/#/builders/1/builds/3349/steps/14/logs/serial0

The problem might be in component name. The driver->name and
fmt_single_name(dev, &component->id) are:
snd_dmaengine_pcm != 3830000.i2s
snd_dmaengine_pcm != 3830000.i2s-sec
samsung-i2s != 3830000.i2s

This commit should not go in without fixing the users of old
behavior... I could adjust the platform names for primary and
secondary links... but now it looks like two components will have the
same name.

Best regards,
Krzysztof
