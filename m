From: Daniel Drake <drake@endlessm.com>
Subject: mixer_check_mode drops Exynos5 display modes
Date: Tue, 8 Jul 2014 14:59:16 +0100
Message-ID: <CAD8Lp44L0mAAAoVfuXK7RrRe0VaxB0dx27JExpf2AOBKsqBT-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sean,

While looking at the following commit I noticed something:

commit f041b257a8997c8472a1013e9f252c3e2a1d879e
Author: Sean Paul <seanpaul@chromium.org>
Date:   Thu Jan 30 16:19:15 2014 -0500

    drm/exynos: Remove exynos_drm_hdmi shim


This commit changes how mixer_check_mode() is used. It used to just
exclude certain modes on old mixer versions, but now it seems to be
called unconditionally, for all mixer versions. I guess the effect
here is that some modes on exynos5 setups are dropped whereas they
weren't before. Is that intentional?

Thanks
Daniel
