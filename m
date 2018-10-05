From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 5/5] ARM: spectre-v2: per-CPU vtables to work around
 big.Little systems
Date: Fri, 5 Oct 2018 10:46:19 +0100
Message-ID: <20181005094618.GG30658@n2100.armlinux.org.uk>
References: <20180919094802.GH30658@n2100.armlinux.org.uk>
 <CGME20180919095028epcas3p3e1a927bb7e88c6891d43abfdc51603e7@epcas3p3.samsung.com>
 <E1g2Z6e-0003es-CI@rmk-PC.armlinux.org.uk>
 <20181005090941eucas1p14031cd38d78e9d561975925bf977727d~aq0-OFZeE1866318663eucas1p1b@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181005090941eucas1p14031cd38d78e9d561975925bf977727d~aq0-OFZeE1866318663eucas1p1b@eucas1p1.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>, Julien Thierry <julien.thierry@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Morten Rasmussen <Morten.Rasmussen@arm.com>, linux-arm-kernel@lists.infradead.org, Qais Yousef <Qais.Yousef@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 05, 2018 at 11:09:40AM +0200, Marek Szyprowski wrote:
> This patch causes lots of kernel 'BUG' messages on all Samsung Exynos
> boards.=A0 It started to appear since it has been merged to linux-next
> on 20181002.=A0 I wonder if this issue is Exynos specific or there are
> some patches missing in linux-next, which should fix those 'BUGS'.
> If this is Exynos specific, please let us know what should be changed
> in Exynos platform code to avoid this issue.

Thanks for the report.

It looks like my solution for big.Little isn't possible... back to
the drawing board, and big.Little will have to remain vulnerable to
Spectre for another release cycle.

-- =

RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up
