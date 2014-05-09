From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2 1/9] drm/exynos: dp: support hotplug detection via GPIO
Date: Fri, 09 May 2014 09:57:45 +0900
Message-ID: <003f01cf6b21$b03d64a0$10b82de0$%han@samsung.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-2-git-send-email-ajaykumar.rs@samsung.com>
 <001901cf5dfa$6bcda480$4368ed80$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <001901cf5dfa$6bcda480$4368ed80$%han@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Inki Dae' <inki.dae@samsung.com>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, 'Andrew Bresticker' <abrestic@chromium.org>, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com, 'Rahul Sharma' <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday, April 22, 2014 4:14 PM, Jingoo Han wrote:
> On Tuesday, April 22, 2014 7:39 AM, Ajay Kumar wrote:
> >
> > From: Andrew Bresticker <abrestic@chromium.org>
> >
> > Certain bridge chips use a GPIO to indicate the cable status instead
> > of the I_DP_HPD pin.  This adds an optional device-tree property,
> > "samsung,hpd-gpio", to the exynos-dp controller which indicates that
> > the specified GPIO should be used for hotplug detection.
> > The GPIO is then set up as an edge-triggered interrupt where the
> > rising edge indicates hotplug-in and the falling edge indicates hotplug-out.
> >
> > Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> > Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> 
> Acked-by: Jingoo Han <jg1.han@samsung.com>

Hi Inki Dae,

Actually, this patch is NOT related to other patches for
bridge chip support. So, would you apply this patch into
your exynos drm git with my Acked-by?

Best regards,
Jingoo Han


> 
> > ---
> > Changes since V1:
> > 	Address reiew comments from Jingoo Han
> >
> >  .../devicetree/bindings/video/exynos_dp.txt        |    4 ++
> >  drivers/gpu/drm/exynos/exynos_dp_core.c            |   32 ++++++++++++--
> >  drivers/gpu/drm/exynos/exynos_dp_core.h            |    1 +
> >  drivers/gpu/drm/exynos/exynos_dp_reg.c             |   44 ++++++++++++++------
> >  4 files changed, 66 insertions(+), 15 deletions(-)
> 
> [.....]
