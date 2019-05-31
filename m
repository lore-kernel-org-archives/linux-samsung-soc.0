From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [BISECT] No audio after
 "ASoC: core: use component driver name as component name"
Date: Fri, 31 May 2019 15:44:04 +0200
Message-ID: <f0e6753d-6eb4-b56e-d4f4-0d483a685b41@samsung.com>
References: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
        <CGME20190531102017epcas1p3b5522b9a133bf50659d9d306ed9d6d52@epcas1p3.samsung.com>
        <CA+Px+wXs1u9VjkzDerb-BVPQRLZNMnw8Rh5prkb+0mHAggwWgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+Px+wXs1u9VjkzDerb-BVPQRLZNMnw8Rh5prkb+0mHAggwWgg@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Tzung-Bi Shih <tzungbi@google.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 5/31/19 12:20, Tzung-Bi Shih wrote:
> On Fri, May 31, 2019 at 5:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> The problem might be in component name. The driver->name and
>> fmt_single_name(dev, &component->id) are:
>> snd_dmaengine_pcm != 3830000.i2s
>> snd_dmaengine_pcm != 3830000.i2s-sec
>> samsung-i2s != 3830000.i2s
>>
>> This commit should not go in without fixing the users of old
>> behavior... I could adjust the platform names for primary and
>> secondary links... but now it looks like two components will have the
>> same name.
>
> That is because the two component drivers used the same name in
> somehow.  But yes, we should not have the commit without fixing
> potential errors for users depend on old behavior.

There are 2 platform devices (3830000.i2s, 3830000.i2s-sec), for each
a platform/DMA component is created. For 3830000.i2s there is also
a component with 2 CPU DAIs registered. 

If we derive the platform/DMA component name from the component's driver
name then we end up with non unique Platform component names 
(snd_dmaengine_pcm) and subsequently we fail to assign Platform component 
to DAI links.

Here is list of components before the patch:

# cat /sys/kernel/debug/asoc/components 
3830000.i2s
3830000.i2s-sec
3830000.i2s
hdmi-audio-codec.3.auto
max98090.5-0010
snd-soc-dummy
snd-soc-dummy

And after the patch:

root@target:~# cat /sys/kernel/debug/asoc/components 
samsung-i2s
snd_dmaengine_pcm
snd_dmaengine_pcm
hdmi-audio-codec.3.auto
max98090.5-0010
snd-soc-dummy
snd-soc-dummy
