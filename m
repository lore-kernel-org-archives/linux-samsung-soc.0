From: Sean Paul <seanpaul@chromium.org>
Subject: Re: mixer_check_mode drops Exynos5 display modes
Date: Mon, 14 Jul 2014 09:42:46 -0400
Message-ID: <CAOw6vbKVKPJk4keH3UT+TLQSK4n72c3vCcsQOsEdtajJotqhgQ@mail.gmail.com>
References: <CAD8Lp44L0mAAAoVfuXK7RrRe0VaxB0dx27JExpf2AOBKsqBT-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD8Lp44L0mAAAoVfuXK7RrRe0VaxB0dx27JExpf2AOBKsqBT-A@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Drake <drake@endlessm.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jul 8, 2014 at 9:59 AM, Daniel Drake <drake@endlessm.com> wrote:
> Hi Sean,
>

Hi Daniel,
Sorry for the delay in response.

> While looking at the following commit I noticed something:
>
> commit f041b257a8997c8472a1013e9f252c3e2a1d879e
> Author: Sean Paul <seanpaul@chromium.org>
> Date:   Thu Jan 30 16:19:15 2014 -0500
>
>     drm/exynos: Remove exynos_drm_hdmi shim
>
>
> This commit changes how mixer_check_mode() is used. It used to just
> exclude certain modes on old mixer versions, but now it seems to be
> called unconditionally, for all mixer versions. I guess the effect
> here is that some modes on exynos5 setups are dropped whereas they
> weren't before. Is that intentional?
>

In a sense, yes. The reason the version check was dropped was b/c we
have to call mixer_check_mode from the hdmi driver which does not know
the mixer version (so there's no way to check it).

It would probably be prudent to add it back since we have different
restrictions on the various mixer versions. We've done this in the
chromium tree, however it looks quite a bit different from upstream
since we removed all of the abstraction layers and just implement
mixer as a drm_crtc and hdmi as drm_encoder. You can check it out
here: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-3.8/drivers/gpu/drm/exynos/exynos_mixer.c

Upstreaming our delta is on my TODO stack, unfortunately I have to pop
a few items off first.

Sean



> Thanks
> Daniel
