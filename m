From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v2 0/3] drm/exynos: enable support for exynos5420 hdmi
Date: Tue, 6 May 2014 18:54:33 +0530
Message-ID: <CAPdUM4MQ68fHcXyjstkt=KbF6WFSC6ekiLAUvCpwwp1jD9zcgA@mail.gmail.com>
References: <1397989425-29641-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1397989425-29641-1-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: sunil joshi <joshi@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Everybody,

Gentle ping.

Please have a look at the patches in this series?

There are few more in pipeline. Please consider these as well.
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/30501
http://www.spinics.net/lists/linux-samsung-soc/msg28083.html

Warm Regards,
Rahul Sharma

On 20 April 2014 15:53, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> V2:
> 1) Rebased on Tomasz Stanislawski's Simple phy driver patches
> at https://lkml.org/lkml/2014/4/8/226.
>
> Adds apb mapped phy support for exynos5420 hdmi. Replace
> dummy hdmiphy clock with regmap calls.
>
> Based on Inki Dae's exynos-drm-next branch.
>
> Rahul Sharma (3):
>   drm/exynos: remove unnecessary read for phy configuration values
>   drm/exynos: add support for apb mapped phys in hdmi driver
>   drm/exynos: enable support for exynos5420 hdmi device
>
>  .../devicetree/bindings/video/exynos_hdmi.txt      |    1 +
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |  317 ++++++++++++++++----
>  drivers/gpu/drm/exynos/regs-hdmi.h                 |    7 +
>  3 files changed, 262 insertions(+), 63 deletions(-)
>
> --
> 1.7.9.5
>
