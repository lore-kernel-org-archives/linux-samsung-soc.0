From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: dapm: Check for NULL widget in
 dapm_update_dai_unlocked
Date: Wed, 06 Feb 2019 16:47:22 +0100
Message-ID: <b61f2293-6f48-45f3-ad0b-42bc2a214a76@samsung.com>
References: <CGME20190205211638epcas3p409823d4acac8073473153d745151ea5f@epcas3p4.samsung.com>
        <20190205211622.GA5891@kozik-lap>
        <844c3f34-f7db-6b26-169a-994922367c78@samsung.com>
        <20190206100549.GO3837@imbe.wolfsonmicro.main>
        <CAJKOXPejBO_9iBHg1R8M2=tcuTck72DjxTYEUyQOp8cPV-0xTg@mail.gmail.com>
        <20190206105955.GP3837@imbe.wolfsonmicro.main>
        <CAJKOXPcQfsNnuns1BprEPy4=ggW7fU+_-O_VksrWuT4GPPgAwg@mail.gmail.com>
        <20190206114545.GR3837@imbe.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190206114545.GR3837@imbe.wolfsonmicro.main>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 2/6/19 12:45, Charles Keepax wrote:
> Looking through I think this is an unrelated issue. Assuming the
> driver in question is (sound/soc/samsung/i2s.c). Inside
> i2s_trigger, there is a call to config_setup(i2s), which in turn
> will call clk_get_rate if i2s->quirks contains the flag
> QUIRK_NO_MUXPSR.
> 
> The trigger callback can be made from an atomic context and
> clk_get_rate will take the prepare lock of the clock. The clock
> prepare lock is always a mutex which shouldn't be locked from an
> atomic context. So it seems like this will fail whenever that
> QUIRK_NO_MUXPSR flag is set, no idea what causes that to be set.
> 
> It looks like this bug was introduced by this change:
> 
> 647d04f8e07a ("ASoC: samsung: i2s: Ensure the RCLK rate is properly determined")

Thanks or having a look at this. I somehow overlooked it before, there 
are multiple issues with that clk_get_rate() call.  Apart of the problem 
described above config_setup() is already called with the i2s->lock 
spinlock held, exactly same spinlock that is passed to the clock API 
when registering a clock of which we try to get rate. :/ Presumably 
it works due to clk rate caching.

Whether QUIRK_NO_MUXPSR flag is set or not depends on the HW type, 
it is not set for modern SoCs so most of the time we will hit the
problem in I2S master configurations.

As we are not using set_sysclk() of the CPU DAI I'm thinking about 
moving the clk_get_rate() call to the CPU DAI's hw_params() callback. 
The clock rate may be changed in hw_params() of an ASoC machine driver, 
and the CPU DAI needs to adjust to those changes.

It feels like locking in that driver might need revisiting, there is
quite a lot happening while holding a spinlock.

-- 
Thanks,
Sylwester
