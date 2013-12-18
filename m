From: Daniel Drake <drake@endlessm.com>
Subject: Re: drm_do_probe_ddc_edid ENXIO check too aggressive?
Date: Wed, 18 Dec 2013 14:18:56 -0600
Message-ID: <CAD8Lp441qQT_gUrk-uns=65ZDd3FofOyiwwNHKnQL+JpURA0Pg@mail.gmail.com>
References: <CAD8Lp44qijfMGtYVcA1xjgzzusA4SaR_mtUqzJiT1rRk+DZVEw@mail.gmail.com>
	<CAKMK7uFtCYajeHnnbMOe8VaWypj8aKM5O7CVXkROVjxqbk5VzA@mail.gmail.com>
	<CAD8Lp47DvhV1tg4ntBSvvUefOv29cutcXt17h2Pvp6HjBRLVnA@mail.gmail.com>
	<CAKMK7uG3tp1qnEUBh4=UKT7s4JjBwS--4kaKGf+4e1yFXmCKYA@mail.gmail.com>
	<CAD8Lp46aXTRA8uOory2zMrHakcG6pUf9jSxgYjo=_q5mZP3U_A@mail.gmail.com>
	<CAGS+omANxzS99gWyDGud9M-QT7euOv0L9y0i_6W8czyaKuEp3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGS+omANxzS99gWyDGud9M-QT7euOv0L9y0i_6W8czyaKuEp3g@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, chris@hchris-wilson.co.uk, dri-devel <dri-devel@lists.freedesktop.org>, "Dodonov,
	Eugeni" <eugeni.dodonov@intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 18, 2013 at 1:58 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
> +seanpaul
>
> I think the problem is that the hdmi irq is really just an undebounced
> gpio interrupt, and thus, it is firing way too soon.
> The chromium kernel adds an excplicit 1.1 second timer to debounce hpd
> between the hdmi hpd-gpio irq and taking any action (ie reading the
> edid).  I believe this will eventually make its way upstream, but is
> still pending some other patches:
>
> http://git.chromium.org/gitweb/?p=chromiumos/third_party/kernel-next.git;a=blob;f=drivers/gpu/drm/exynos/exynos_hdmi.c;h=1258c67e87f360c846c64bb3f04436a68018b4fe;hb=refs/heads/chromeos-3.8#l2647

Yes, this looks very similar to the approach I tried earlier. I guess
the patch was written for the same reasons as well.
Sean, any objections to me taking your patch and sending it upstream?

http://git.chromium.org/gitweb/?p=chromiumos/third_party/kernel-next.git;a=commitdiff;h=77aed71acf4b84e722ead24c820d8ad059121e5b

Thanks
Daniel
