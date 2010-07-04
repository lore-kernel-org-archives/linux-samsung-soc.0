From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 2/3] ASoC: Add SmartQ sound driver
Date: Sun, 04 Jul 2010 11:19:37 +0200
Message-ID: <4C305229.30409@gmail.com>
References: <4c2e8856.487e0e0a.3bb5.3ec0@mx.google.com>
	<20100704090549.GD16825@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20100704090549.GD16825@opensource.wolfsonmicro.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, Liam Girdwood <lrg@slimlogic.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

 Op 04-07-10 11:05, Mark Brown schreef:
> On Sat, Jul 03, 2010 at 02:46:12AM +0200, Maurus Cuelenaere wrote:
>> This adds sound support for the SmartQ board.
>>
>> The hardware consists of a S3C6410 coupled with a WM8987 over I=B2S. The=
 WM8750
>> driver is used for driving the WM8987, as they are register compatible.
> I've applied this, but...
>
>> +static struct snd_soc_jack_pin smartq_jack_pins[] =3D {
>> +	/* Disable speaker when headphone is plugged in */
>> +	{
>> +		.pin	=3D "Internal Speaker",
>> +		.mask	=3D SND_JACK_HEADPHONE,
>> +		.invert	=3D true,
>> +	},
>> +};
> ...it probably also make sense to disable the headphone output when the
> headphone is not plugged in to save power?

I don't see what power there is to save? The speaker and headphone jack are=
 connected to the same physical pins, so when disabling the pins for one of=
 them, the other is also disabled.

The only way to disable the speaker is to shutdown its amplifier (using tha=
t GPIO pin).

-- =

Maurus Cuelenaere
