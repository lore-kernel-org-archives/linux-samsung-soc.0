From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver
 for S/PDIF PCM audio
Date: Sat, 9 Oct 2010 10:52:26 +0900
Message-ID: <AANLkTindvBBOyWwkbwUo+oG31r8xSgCLbjuDNgvTNY_Q@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286194583-19937-1-git-send-email-sw.youn@samsung.com>
	<20101004224159.GA4972@opensource.wolfsonmicro.com>
	<AANLkTi=FHGw+qzL507K546vr8zEZgXBP3Mk=O__Rpd4H@mail.gmail.com>
	<AANLkTincwL_nQAmu7Dcmht0FV43BiN7OoecE_60QJhS2@mail.gmail.com>
	<20101005044304.GA26509@opensource.wolfsonmicro.com>
	<AANLkTi=x_fi5HTBBmMUv8YTxSdbgcnJ=ZbacJQj6rcgf@mail.gmail.com>
	<20101005055937.GA19989@opensource.wolfsonmicro.com>
	<AANLkTimi1t5S2XWdUFzaPttD4Hywm0SLt5CvR1YnVOjj@mail.gmail.com>
	<AANLkTin4skx+aiL2FXwWO1ekKqT2YWDd3SM1H5WnGkhC@mail.gmail.com>
	<00c401cb6520$9484ef90$bd8eceb0$%kim@samsung.com>
	<AANLkTikf4CAWm49Q_AfcfiQDBQUVcE_BC-a_4F7d8xOz@mail.gmail.com>
	<AANLkTinPXcjHcaM1puzz00Sfhob9Y-X4HGDDVGMTqhH5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <AANLkTinPXcjHcaM1puzz00Sfhob9Y-X4HGDDVGMTqhH5@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Seungwhan Youn <claude.youn@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jassi.brar@samsung.com, Mark Brown <broonie@opensource.wolfsonmicro.com>, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, lrg@slimlogic.co.uk, linux-arm-kernel@lists.infradead.org, Seungwhan Youn <sw.youn@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 8, 2010 at 6:07 PM, Seungwhan Youn <claude.youn@gmail.com> wrote:
> Dear Mr. Mark and Mr. Jassi,
>
> Now, I'm almost finished 2nd patch for submit except this audio clock
> setting. For now, I can only think that remove audio clock setting
> from this machine code, and add audio clock settings in arch later(may
> be after arch/arm/plat-samsung get EPLL policy as Mr. Kukjin said).
>
> Is this okay?
IMO neither of the method is much better than the other.

If neither of the maintainers relent, maybe drop the clock setting altogether
and mark the machine driver 'BROKEN' until the EPLL management is fixed?
