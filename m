From: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroidxu3: add sound nodes
Date: Thu, 22 Jan 2015 10:01:30 +0900
Message-ID: <20150122100130.75c20e9b@songinha-Samsung-DeskTop-System>
References: <1421819923-27575-1-git-send-email-ideal.song@samsung.com>
 <54BF9083.5090708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <54BF9083.5090708-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Thanks for your comment.

On Wed, 21 Jan 2015 12:41:55 +0100
Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

> Hi,
> 
> On 21/01/15 06:58, Inha Song wrote:
> > Add MAX98090 audio codec, I2S interface and the sound nodes to support
> > audio on Odroid-XU3 board.
> > 
> > Signed-off-by: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 34 ++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> > index 7874da2..79493d1 100644
> > --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> > +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> > @@ -310,6 +310,40 @@
> >  	rtc@101E0000 {
> >  		status = "okay";
> >  	};
> > +
> > +	sound: sound {
> > +		compatible = "samsung,odroidu3-audio";
> 
> How about using simple-card instead ? I've been trying to switch
> Odroid X2/U3 to simple card. Here a corresponding dts patch:
> http://www.spinics.net/lists/linux-samsung-soc/msg41083.html
> For that recent patches for the I2S driver which area already in -next
> might be needed.

Oh, I missed your patchs.
I will rework this patch based on your patch.

Best Regards,
Inha Song.

> 
> > +		samsung,model = "Odroid-XU3";
> > +		samsung,i2s-controller = <&i2s0>;
> > +		samsung,audio-codec = <&max98090>;
> > +		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
> > +				  <&clock_audss EXYNOS_MOUT_I2S>;
> > +		assigned-clock-parents = <&clock CLK_FIN_PLL>,
> > +				<&clock_audss EXYNOS_MOUT_AUDSS>;
> > +		samsung,audio-routing =
> > +			"Headphone Jack", "HPL",
> > +			"Headphone Jack", "HPR",
> > +			"Headphone Jack", "MICBIAS",
> > +			"IN1", "Headphone Jack",
> > +			"Speakers", "SPKL",
> > +			"Speakers", "SPKR";
> > +	};
> > +};
> > +
> > +&hsi2c_5 {
> > +	status = "okay";
> > +	max98090: max98090@10 {
> > +		compatible = "maxim,max98090";
> > +		reg = <0x10>;
> > +		interrupt-parent = <&gpx3>;
> > +		interrupts = <2 0>;
> > +		clocks = <&clock_audss EXYNOS_DOUT_AUD_BUS>;
> > +		clock-names = "mclk";
> > +	};
> > +};
> 
> -- 
> Thanks,
> Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
