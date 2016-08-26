From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/7] arm64: dts: exynos: Add dts file for
 Exynos5433-based TM2 board
Date: Fri, 26 Aug 2016 19:11:33 +0200
Message-ID: <20160826171133.GA18773@kozik-book>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-7-git-send-email-cw00.choi@samsung.com>
 <20160826163236.GC15511@kozik-book>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160826163236.GC15511@kozik-book>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanwoo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Aug 26, 2016 at 06:32:36PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 24, 2016 at 10:49:10PM +0900, Chanwoo Choi wrote:
> > This patch adds the Device Tree source for Exynos5433-based Samsung TM2 board.
> > This board fully support the all things for mobile target.
> > 
> > This patch supports the following devices:
> > 1. basic SoC
> > - Initial booting for Samsung Exynos5433 SoC
> > - DRAM LPDDR3 (3GB)
> > - eMMC (32GB)
> > - ARM architecture timer
> > 
> > 2. power management devices
> > - Sasmung S2MPS13 PMIC for the power supply
> > - CPUFREQ for big.LITTLE cores
> > - TMU for big.LITTLE cores and GPU
> > - ADC with thermistor to measure the temperature of AP/Battery/Charger
> > - Maxim MAX77843 Interface PMIC (MUIC/Haptic/Regulator)
> > 
> > 3. sound devices
> > - I2S for sound bus
> > - LPASS for sound power control
> > - Wolfson WM5110 for sound codec
> > - Maxim MAX98504 for speaker amplifier
> > - TM2 ASoC Machine device driver node
> > 
> > 3. display devices
> > - DECON, DSI and MIC for the panel output
> > 
> > 4. usb devices
> > - USB 3.0 DRD (Dual Role Device)
> > - USB 3.0 Host controller
> > 
> > 5. storage devices
> > - MSHC (Mobile Storae Host Controller) for eMMC device
> 
> Not fixed. Mobile Storage.
> 
> Everything else looks fine, so fix above only if you are going to resend
> everything. If there won't be resend, I can fix it when applying.

Ah, I saw the kbuild report. The patchset needs a resend fixing this -
spit the makefile change into two.


Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
