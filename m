From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v1 4/9] ASoC: wm8994: Add support for MCLKn clock gating
Date: Thu, 19 Sep 2019 14:33:01 +0000
Message-ID: <20190919143301.GM10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104700eucas1p1ef0775632f5c7259fb54cab8efc96c50@eucas1p1.samsung.com>
 <20190918104634.15216-5-s.nawrocki@samsung.com>
 <20190918143157.GH10204@ediswmail.ad.cirrus.com>
 <717b3f94-1a24-a407-398f-6a476cf7ff69@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <717b3f94-1a24-a407-398f-6a476cf7ff69@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 01:58:35PM +0200, Sylwester Nawrocki wrote:
> On 9/18/19 16:31, Charles Keepax wrote:
> >> @@ -2315,6 +2396,8 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
> >>  
> >>  			active_dereference(component);
> >>  		}
> >> +		if (mclk)
> >> +			clk_disable_unprepare(mclk);
> >
> > I don't think this works in the case of changing active FLLs.
> > The driver looks like it allows changing the FLL configuration
> > whilst the FLL is already active in which case it you would have
> > two wm8994_set_fll calls enabling the FLL but only a single one
> > disabling it. Resulting in the FLL being off but the MCLK being
> > left enabled.
> 
> Indeed I missed this scenario, or rather assumed it won't be used.
> But since the driver allows reconfiguring active FLLs we should make
> sure such use case remains properly supported.
> 
> What I came up so far as a fix is reading current FLL refclk source and 
> if FLL was enabled with that source disabling refclk, before we change FLL 
> configuration to new one.  So we have clk_disable_unprepare(MCLK) more 
> closely following FLL enable bit changes.  I have tested it and it seems 
> to work - something like below. Do you think it makes sense?
> 

Yeah I think that looks good, it is very similar to what we did
on Arizona and I haven't found any problems with that yet :-)

Thanks,
Charles
