From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver
 for S/PDIF PCM audio
Date: Tue, 5 Oct 2010 10:10:55 +0900
Message-ID: <AANLkTi=FHGw+qzL507K546vr8zEZgXBP3Mk=O__Rpd4H@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286194583-19937-1-git-send-email-sw.youn@samsung.com>
	<20101004224159.GA4972@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20101004224159.GA4972@opensource.wolfsonmicro.com>
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jassi.brar@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk, linux-arm-kernel@lists.infradead.org, Seungwhan Youn <sw.youn@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 5, 2010 at 7:42 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Oct 04, 2010 at 09:16:23PM +0900, Seungwhan Youn wrote:
>
>> +/* Audio clock settings are belonged to board specific part. Every
>> + * board can set audio source clock setting which is matched with H/W
>> + * like this function-'set_audio_clock_heirachy'.
>> + */
>> +static int set_audio_clock_heirachy(struct platform_device *pdev)
>> +{
>
> I'd expect this to be with the other clock configuration code under
> arch/arm, especially as it's involving the EPLL which can have fairly
> wide usage - it seems better to make sure people working with other,
> non-audio, bits of the system are aware of the EPLL usage.

Please let me explain on Claude's behalf.
That is the first option that crossed my mind as well.
But that would have made us have EPLL manipulation in two places -
one in arch/arm/mach/board-init and other in ASoC Machine driver because
we would need to change the source clock's rate in runtime(using
callback pointers
for the purpose seemed too over the top).
If ASoC doesn't change EPLL, it doesn't matter to other devices, if it
does there
is currently no means for other drivers to know about it. So, we might just
as well move the EPLL related code to ASoC machine driver.
