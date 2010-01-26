From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] ARM: SMDK64XX: Enable AC97 device
Date: Tue, 26 Jan 2010 10:59:01 +0000
Message-ID: <20100126105901.GH15759@rakim.wolfsonmicro.main>
References: <1264485101-13782-1-git-send-email-jassisinghbrar@gmail.com>
	<1264485101-13782-2-git-send-email-jassisinghbrar@gmail.com>
	<1264485101-13782-3-git-send-email-jassisinghbrar@gmail.com>
	<20100126101921.GE15759@rakim.wolfsonmicro.main>
	<1b68c6791001260252t7f43cb97n710381508040f7d4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1b68c6791001260252t7f43cb97n710381508040f7d4@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 26, 2010 at 07:52:45PM +0900, jassi brar wrote:
> On Tue, Jan 26, 2010 at 7:19 PM, Mark Brown

> > This one needs a bit more explanation - why are you changing the AC97
> > slot? =A0Is this a general problem with the S3C AC97 controller? =A0It'd
> > also be better to use the symbolic register name rather than a number.

> It is no problem.
> wm9713 can be configured to place data in one of four possible pair of sl=
ots
> 3-4 or 6-9 or 7-8 or 10-11. This call ensures the selected pair is 3-4(st=
andard
> and compatible with Samsung AC97 controllers). Though we don't need to
> explicitly set this if we drop mic dai_link.

Ah, OK.  In this case dropping the second DAI link is the better option
- the CODEC only presents a single stereo ADC pair on the AC97 bus with
selectable inputs rather than having separate ADC(s) for microphone(s).
This means you can't run both DAIs in parallel anyway.
