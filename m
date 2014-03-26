From: Sean Paul <seanpaul@chromium.org>
Subject: Re: exynos-drm HDMI PHY configuration values
Date: Wed, 26 Mar 2014 07:40:36 -0700
Message-ID: <CAOw6vb+Fkjc6VBujnXtH_vOwhXmtRc0F0t+hwTyadYaG7QbHWQ@mail.gmail.com>
References: <CAD8Lp45XgvjebHn2qNBqftONpO_Y4-iWuB31FoO9Qb7jTmT2ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD8Lp45XgvjebHn2qNBqftONpO_Y4-iWuB31FoO9Qb7jTmT2ng@mail.gmail.com>
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

On Tue, Mar 25, 2014 at 2:52 PM, Daniel Drake <drake@endlessm.com> wrote:
> Hi Sean,
>
> In your commit "drm/exynos: hdmi: support extra resolutions using
> drm_display_mode timings"  you added several more HDMI PHY configs to
> exynos-drm. Thanks for that.
>
> Can you explain where these magic numbers came from?
>

Hi Daniel,
They come from Samsung. Unfortunately, I don't have any insight into
how they are generated.

Sean

> I'm interested in adding 85.5MHz for 1366x768 support.
>
> Thanks,
> Daniel
