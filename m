From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: drm_do_probe_ddc_edid ENXIO check too aggressive?
Date: Thu, 19 Dec 2013 03:58:41 +0800
Message-ID: <CAGS+omANxzS99gWyDGud9M-QT7euOv0L9y0i_6W8czyaKuEp3g@mail.gmail.com>
References: <CAD8Lp44qijfMGtYVcA1xjgzzusA4SaR_mtUqzJiT1rRk+DZVEw@mail.gmail.com>
	<CAKMK7uFtCYajeHnnbMOe8VaWypj8aKM5O7CVXkROVjxqbk5VzA@mail.gmail.com>
	<CAD8Lp47DvhV1tg4ntBSvvUefOv29cutcXt17h2Pvp6HjBRLVnA@mail.gmail.com>
	<CAKMK7uG3tp1qnEUBh4=UKT7s4JjBwS--4kaKGf+4e1yFXmCKYA@mail.gmail.com>
	<CAD8Lp46aXTRA8uOory2zMrHakcG6pUf9jSxgYjo=_q5mZP3U_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD8Lp46aXTRA8uOory2zMrHakcG6pUf9jSxgYjo=_q5mZP3U_A@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Daniel Drake <drake@endlessm.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, chris@hchris-wilson.co.uk, dri-devel <dri-devel@lists.freedesktop.org>, "Dodonov,
	Eugeni" <eugeni.dodonov@intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Dec 17, 2013 at 11:12 PM, Daniel Drake <drake@endlessm.com> wrote:
>
> On Mon, Dec 16, 2013 at 5:40 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > Have a bit of logic in the exynos ->detect function to re-try a 2nd
> > round of edid probing after each hdp interrupt if the first one
> > returns an -ENXIO. Only tricky part is to be careful with edge
> > detection so that userspace gets all the hotplug events still.
> > Presuming you don't have any funkiness with reprobing causing yet
> > another hpd interrupt and stuff like that (seen it all), as long as
> > you're using the helpers in drm_crtc_helper.c it should all be working
> > correctly. So you want a work item which just grabs all modeset locks
> > and then calls drm_helper_probe_single_connector_modes or something on
> > the right connector.
>
> Thanks for the tips. Having trouble sticking to those details though.
> exynos_drm_connector_detect() is actually a long way away from EDID
> probing so it is hard to detect the ENXIO case there.
>
> What happens here is:
> exynos hdmi_irq_thread() calls drm_helper_hpd_irq_event()
> That then calls exynos_drm_connector_detect(), which returns a simple
> "yes, hpd detection says we are connected"
> Then it calls drm_kms_helper_hotplug_event() for which the call chain is:
>
> drm_kms_helper_hotplug_event
> exynos_drm_output_poll_changed
> drm_fb_helper_hotplug_event
> drm_fb_helper_probe_connector_mode
> exynos_drm_connector_fill_modes
> drm_helper_probe_single_connector_modes
> exynos_drm_connector_get_modes
> drm_get_edid
> drm_do_get_edid
> drm_do_probe_ddc_edid <-- ENXIO in here
>
> drm_do_probe_ddc_edid actually swallows the ENXIO code and just
> returns -1, so that particular error is indistinguishable from others.
>
> Trying to follow your suggestions, the closest would seem to be something like:
>
> 1. Modify exynos_drm_connector_detect to read and cache the EDID right
> away. If EDID read fails for any reason, report "no connection" and
> schedule a work item to retry the EDID read. If the later EDID read
> succeeds, call drm_kms_helper_hotplug_event()
>
> 2. Modify exynos_drm_connector_get_modes to return cached EDID
>
> Does that sound sensible?

+seanpaul

I think the problem is that the hdmi irq is really just an undebounced
gpio interrupt, and thus, it is firing way too soon.
The chromium kernel adds an excplicit 1.1 second timer to debounce hpd
between the hdmi hpd-gpio irq and taking any action (ie reading the
edid).  I believe this will eventually make its way upstream, but is
still pending some other patches:

http://git.chromium.org/gitweb/?p=chromiumos/third_party/kernel-next.git;a=blob;f=drivers/gpu/drm/exynos/exynos_hdmi.c;h=1258c67e87f360c846c64bb3f04436a68018b4fe;hb=refs/heads/chromeos-3.8#l2647

-Dan

>
> Thanks
> Daniel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
