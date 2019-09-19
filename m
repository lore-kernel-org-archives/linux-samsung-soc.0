From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Date: Thu, 19 Sep 2019 14:31:16 +0000
Message-ID: <20190919143116.GL10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
 <20190919075924.GB13195@pi3> <20190919125020.GJ3642@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190919125020.GJ3642@sirena.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 01:50:20PM +0100, Mark Brown wrote:
> On Thu, Sep 19, 2019 at 09:59:24AM +0200, Krzysztof Kozlowski wrote:
> > On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
> > > The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> > > clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> > > part of the wm8994 driver so they can be further handled in the audio
> > > CODEC part.
> 
> > I think these are needed only for the codec so how about getting them in
> > codec's probe?
> 
> Yeah.  IIRC when these were added a machine driver was grabbing them.  I
> don't think that machine driver ever made it's way upstream though.

If you mean for the Arizona stuff, the machine driver using that
was sound/soc/samsung/tm2_wm5110.c. Sylwester upstreamed it along
with the patches.

I think on wm8994 the clocks probably are only needed by the
audio part of the driver, so probably can be moved in there,
although as a disclaimer I have done a lot less with parts
of that era. However on Arizona the clocking is needed from
various parts of the driver so couldn't be moved exclusively
to the codec driver.

Thanks,
Charles
