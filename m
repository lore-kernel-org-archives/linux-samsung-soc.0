From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v2] drm/exynos: switch to universal plane API
Date: Fri, 19 Sep 2014 17:52:24 -0600
Message-ID: <CAD8Lp47N7L2jeMpjTGDBbkzXN=SPMnX3OcdyV3XqNR6iG2yGbg@mail.gmail.com>
References: <1411131533-15494-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411131533-15494-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 19, 2014 at 6:58 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> The patch replaces legacy functions
> drm_plane_init() / drm_crtc_init() with
> drm_universal_plane_init() and drm_crtc_init_with_planes().
> It allows to replace fake primary plane with the real one.
> Additionally the patch leaves cleanup of crtcs to core,
> this way planes and crtcs are cleaned in correct order.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Thanks Andrzej! With your patch the crashes I was seeing are gone.

Daniel
