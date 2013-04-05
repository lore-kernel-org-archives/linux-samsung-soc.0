From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 00/14] ARM: samsung-time: Prepare for multiplatform
 support
Date: Fri, 05 Apr 2013 12:33:12 +0200
Message-ID: <2744467.M5ElrZXicK@amdc1227>
References: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
 <201304050115.03879.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <201304050115.03879.heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: mark.rutland@arm.com, tomasz.figa@gmail.com, buserror@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, christer@weinigel.se, sylvester.nawrocki@gmail.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, sameo@linux.intel.com, kwangwoo.lee@gmail.com, mcuelenaere@gmail.com, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, john.stultz@linaro.org, ghcstop@gmail.com, linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org, broonie@opensource.wolfsonmicro.com, jekhor@gmail.com, kyungmin.park@samsung.com, tglx@linutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

Hi Heiko,

On Friday 05 of April 2013 01:15:02 Heiko St=FCbner wrote:
> Am Donnerstag, 4. April 2013, 18:36:57 schrieb Tomasz Figa:
> > This series is an attempt to make the samsung-time clocksource driver
> > ready
> > for multiplatform kernels. It moves the driver to drivers/clocksource,
> > cleans it up from uses of static platform-specific definitions, simplif=
ies
> > timer interrupt handling and adds Device Tree support.
> > =

> > Only samsung-time driver is reworked to use the master driver at this
> > time,
> > since the PWM driver can be already considered broken at the moment and
> > needs separate series of several patches to fix and clean it up, which
> > I am already working on.
> > =

> > Tested on Universal C210 board with Device Tree. Not tested without
> > Device Tree, since it has been already broken before this series.
> > Compile tested for other related SoCs.
> =

> Looks nice.
> =

> On a non-DT S3C2416 board:
> Tested-by: Heiko Stuebner <heiko@sntech.de>

Thanks for testing.

> And just so I don't search myself silly, am I right in thinking that the
> driver does not use the generic clocksource registration yet and dt machi=
nes
> must still use samsung_timer_init at this point?

Yes. Because of the build failures it caused recently I have decided not to =

use it yet. It can be added with a small patch later, though.

Best regards,
-- =

Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
