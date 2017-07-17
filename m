From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 4/4] drm/sun4i: make sure we don't have a commit pending
Date: Mon, 17 Jul 2017 14:57:19 +0800
Message-ID: <CAGb2v676F2ye7fDUSFwzWMxd8rF7_5YAxn+u+MNG-U2PuaDDoQ@mail.gmail.com>
References: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
 <a6dfec7ea3598c64f6653e9b8b5febac79172341.1499956639.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64KnB_zU0yk7MsGr9WRK1wpWq1xOj_cNuQ4mSQJeAGarw@mail.gmail.com> <20170717065504.xnahsboer3fh4k3i@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:35584 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751259AbdGQG5s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 02:57:48 -0400
In-Reply-To: <20170717065504.xnahsboer3fh4k3i@flea>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.o>

On Mon, Jul 17, 2017 at 2:55 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Fri, Jul 14, 2017 at 04:56:01PM +0800, Chen-Yu Tsai wrote:
>> Hi,
>>
>> On Thu, Jul 13, 2017 at 10:41 PM, Maxime Ripard
>> <maxime.ripard@free-electrons.com> wrote:
>> > In the earlier display engine designs, any register access while a commit
>> > is pending is forbidden.
>> >
>> > One of the symptoms is that reading a register will return another, random,
>> > register value which can lead to register corruptions if we ever do a
>> > read/modify/write cycle.
>>
>> Alternatively, if changes to the backend (layers) are guaranteed to happen
>> while the CRTC is disabled (which seems to be the case after looking at
>> drm_atomic_helper_commit_planes and drm_atomic_helper_commit_tail), we
>> could just turn on register auto-commit all the time and not deal with
>> this.
>
> As far as I understand, it will only be the case if we need a new
> modeset or we changed the active CRTC or connectors. But if you change
> only the format, buffers or properties it won't be the case, and we'll
> need to commit.

So in other words, if someone were to use it for actual compositing and
moved the upper composited layer around, we would need commit support to be
safe.

Sounds more or less like something a video player would do.

Thanks
ChenYu
