From: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [BISECT] No audio after "ASoC: core: use component driver name as
 component name"
Date: Fri, 31 May 2019 18:20:03 +0800
Message-ID: <CA+Px+wXs1u9VjkzDerb-BVPQRLZNMnw8Rh5prkb+0mHAggwWgg@mail.gmail.com>
References: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, May 31, 2019 at 5:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The problem might be in component name. The driver->name and
> fmt_single_name(dev, &component->id) are:
> snd_dmaengine_pcm != 3830000.i2s
> snd_dmaengine_pcm != 3830000.i2s-sec
> samsung-i2s != 3830000.i2s
>
> This commit should not go in without fixing the users of old
> behavior... I could adjust the platform names for primary and
> secondary links... but now it looks like two components will have the
> same name.
That is because the two component drivers used the same name in
somehow.  But yes, we should not have the commit without fixing
potential errors for users depend on old behavior.

Could you send a patch to revert the commit b19671d6caf1?
