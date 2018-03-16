From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/5] ASoC: samsung: odroid: Fix 32000
	sample rate handling
Date: Fri, 16 Mar 2018 08:29:35 +0100
Message-ID: <CAJKOXPem69c9L1pYqpV-WsYrHRMSp4=q=6KJQ3O12=xuO6+cvQ@mail.gmail.com>
References: <CGME20180314164131epcas2p426aa34f4503ff12fa041a817cdd3eed9@epcas2p4.samsung.com>
 <20180314164115.22736-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180314164115.22736-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 14, 2018 at 5:41 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> In case of sample rates lower than 44100 currently there is too low MCLK
> frequency set for the CODEC. Playback fails with following errors:
>
> $ speaker-test -c2 -t sine -f 1500 -l2 -r 32000
>
> Sine wave rate is 1500.0000Hz
> Rate set to 32000Hz (requested 32000Hz)
> Buffer size range from 128 to 131072
> Period size range from 64 to 65536
> Using max buffer size 131072
> Periods = 4
> Unable to set hw params for playback: Invalid argument
> Setting of hwparams failed: Invalid argument
>
> [  497.883700] max98090 1-0010: Invalid master clock frequency
>
> To fix this the I2S root clock's frequency is increased, depending
> on sampling rate.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/odroid.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
