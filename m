From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 7/8] ARM: dts: exynos: Topic branch with Odroid XU for
 v4.8
Date: Tue, 14 Jun 2016 21:44:04 +0200
Message-ID: <20160614194404.GA5581@kozik-lap>
References: <1465215933-22709-1-git-send-email-k.kozlowski@samsung.com>
 <1465215933-22709-8-git-send-email-k.kozlowski@samsung.com>
 <20160613215339.GE20845@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160613215339.GE20845@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 13, 2016 at 02:53:39PM -0700, Olof Johansson wrote:
> On Mon, Jun 06, 2016 at 02:25:32PM +0200, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > This topic branch pulls external clk dependency (provided by Sylwester
> > Nawrocki).
> > 
> > Expected annoying conflict with DT changes here (please see the email 0/8).
> > 
> > 
> > Best regards,
> > Krzysztof
> > 
> > 
> > The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> > 
> >   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-odroid-xu-4.8
> > 
> > for you to fetch changes up to b8bd7e23bb0be762c39510497c931066dc62e62f:
> > 
> >   ARM: dts: exynos: Add watchdog and Security SubSystem to Exynos5410 (2016-06-06 13:20:57 +0200)
> > 
> > ----------------------------------------------------------------
> > Topic branch for adding Exynos 5410 Odroid XU board for v4.8.
> > 
> > This brings support for Hardkernel's Odroid XU board.  It was the first
> > design with big.LITTLE SoC from Samsung: Exynos5410.  The board is not
> > very popular.  Newer XU3 and XU4 got more attention.
> > 
> > Board details:
> > 1. Exynos5410 octa-core (A15+A7, however as of now only one cluster is
> >    enabled),
> > 2. 2 GB DDR3 RAM,
> > 3. PowerVR SGX544MP3 GPU (not enabled in DTS),
> > 4. USB 3.0 Host x 1, USB 3.0 OTG x 1, USB 2.0 Host x 4,
> > 5. HDMI 1.4a, MIPI DSI and Display Port (Display Port not on all of
> >    revisions though),
> > 6. eMMC 4.5 and microSD slots.
> 
> Merged. Please double-check conflict resolution but it seemed trivial
> (reapplied "ARM: dts: exynos: Add async-bridge clock to MFC power domain
> for Exynos5420" to the new context).

Looks correct, thanks!

Best regards,
Krzysztof
