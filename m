From: Sean Paul <seanpaul@chromium.org>
Subject: Re: drm_do_probe_ddc_edid ENXIO check too aggressive?
Date: Mon, 6 Jan 2014 10:17:35 -0500
Message-ID: <CAOw6vbLBqLaqugOPuthqpCkHeH51emvkT9XFZxP+FMWekLwW6w@mail.gmail.com>
References: <CAD8Lp44qijfMGtYVcA1xjgzzusA4SaR_mtUqzJiT1rRk+DZVEw@mail.gmail.com>
	<CAKMK7uFtCYajeHnnbMOe8VaWypj8aKM5O7CVXkROVjxqbk5VzA@mail.gmail.com>
	<CAD8Lp47DvhV1tg4ntBSvvUefOv29cutcXt17h2Pvp6HjBRLVnA@mail.gmail.com>
	<CAKMK7uG3tp1qnEUBh4=UKT7s4JjBwS--4kaKGf+4e1yFXmCKYA@mail.gmail.com>
	<CAD8Lp46aXTRA8uOory2zMrHakcG6pUf9jSxgYjo=_q5mZP3U_A@mail.gmail.com>
	<CAGS+omANxzS99gWyDGud9M-QT7euOv0L9y0i_6W8czyaKuEp3g@mail.gmail.com>
	<CAD8Lp441qQT_gUrk-uns=65ZDd3FofOyiwwNHKnQL+JpURA0Pg@mail.gmail.com>
	<CAD8Lp44kyHzKs67vc9ksfhHYmdbpaXMi_Dn_6KEV92o8tmuODQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD8Lp44kyHzKs67vc9ksfhHYmdbpaXMi_Dn_6KEV92o8tmuODQ@mail.gmail.com>
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

On Wed, Dec 18, 2013 at 5:07 PM, Daniel Drake <drake@endlessm.com> wrote:
> On Wed, Dec 18, 2013 at 2:18 PM, Daniel Drake <drake@endlessm.com> wrote:
>> Yes, this looks very similar to the approach I tried earlier. I guess
>> the patch was written for the same reasons as well.
>> Sean, any objections to me taking your patch and sending it upstream?
>>
>> http://git.chromium.org/gitweb/?p=chromiumos/third_party/kernel-next.git;a=commitdiff;h=77aed71acf4b84e722ead24c820d8ad059121e5b
>
> Seems easier said than done. The patch looks innocent but it touches
> on other stuff that has changed a lot.
>
> For example, it adds cancel_delayed_work_sync() in the hdmi_poweroff()
> path. With my naive backport to vanilla-3.8, hdmi_poweroff() gets
> called within the context of that work item, and a work item trying to
> cancel_delayed_work_sync() on itself hangs. Reproduced just by
> unplugging the display once.
>
> I see that things have changed substantially in the ChromiumOS tree,
> for example this patch probably has some effect:
>
> commit 29ae0c6096395a96a597453271946fc7d8442b6e
> Author: Sean Paul <seanpaul@chromium.org>
> Date:   Thu Jun 20 17:24:12 2013 -0400
>
>     drm/exynos: Consolidate suspend/resume in drm_drv
>
>
> As this job seems bigger than anticipated and I don't have any Exynos
> hardware that can boot mainline, I think I might have to stop here,
> and hope that ChromiumOS guys upstream all this soon?
>

Hey Daniel,
The set is posted, but I still owe a new version to Tomasz. It's on my
TODO list, I'm hoping to get to it soon.

Sean



> Daniel
